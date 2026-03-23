unit UnitPrincipal;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Controls, System.StrUtils, Vcl.FileCtrl, Math,
  Winapi.ShellAPI,System.RegularExpressions;

type
  // Definición del Hilo
  TProcesoThread = class(TThread)
  private
    FCarpeta: string;
    FPathApp: string;
    FTextoAMostrar: string;
    procedure MostrarEnMemo;
  protected
    procedure Execute; override;
  public
    constructor Create(const ACarpeta, APathApp: string);
  end;

  TForm1 = class(TForm)
    btnProcesarCedulon: TButton;
    mResultado: TMemo;
    OpenDialog1: TOpenDialog;
    procedure btnProcesarCedulonClick(Sender: TObject);
  private
    procedure IdentificarEnte(const RutaTXT: string);
    function EjecutarInvisible(const EXE, Parametros: string): Boolean;
    procedure FiltrarSoloCodigosLargos(const RutaTXT: string);
    function ClasificarDocumento(const RutaPDF: string): string;
    procedure ProcesarSoloNumeros(const RutaTXT: string; const Ente: string);
    function ObtenerUnidadConPDFToText(const RutaPDF: string): string;
    function ExtraerCodigosBarrasFiel(const RutaPDF: string): TStringList;
    function ExtraerNomenclaturaMuniFiel(const RutaPDF: string): string;
    function LimpiarSoloNumeros(const S: string): string;
    procedure ExtraerBarrasMunicipales(const RutaPDF: string; var Barra32, Barra99: string);
    function ExtraerCuentaRentas(const RutaPDF: string): string;
    procedure ExtraerBarrasRapido(const RutaPDF: string; out Barra1, Barra2: string);
    function VerificarZBarListo: Boolean;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TProcesoThread }

constructor TProcesoThread.Create(const ACarpeta, APathApp: string);
begin
  inherited Create(False);
  FCarpeta := ACarpeta;
  FPathApp := APathApp;
  FreeOnTerminate := True;
end;

procedure TProcesoThread.MostrarEnMemo;
begin
  Form1.mResultado.Lines.Add(FTextoAMostrar);
end;

procedure TProcesoThread.Execute;
var
  SR: TSearchRec;
  PathPDF, NomBase, PathIMG, PathTXT: string;
  EnteDetectado: string;
  UnidadFact: string;
  CodigosBarras: TStringList;
  Codigos: TStringList;
  I, K: Integer;
  vBarraLarga, vBarraInterna: string;
begin
  FTextoAMostrar := '--- INICIANDO PROCESO POR LOTES ---';
  Synchronize(MostrarEnMemo);

  if FindFirst(FCarpeta + '*.pdf', faAnyFile, SR) = 0 then
  begin
    try
      repeat
        if Terminated then Break;

        PathPDF := FCarpeta + SR.Name;
        NomBase := 'session_' + FormatDateTime('hhmmsszzz', Now);
        PathIMG := FPathApp + NomBase + '.png';
        PathTXT := FPathApp + NomBase;

        FTextoAMostrar := '---------------------------------------';
        Synchronize(MostrarEnMemo);
        FTextoAMostrar := 'Procesando: ' + SR.Name;
        Synchronize(MostrarEnMemo);

        // 1. Generar Imagen
//        if Form1.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
//           '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
        begin
          Sleep(300);

          EnteDetectado := Form1.ClasificarDocumento(PathPDF);
          FTextoAMostrar := 'Documento detectado: ' + EnteDetectado;
          Synchronize(MostrarEnMemo);

          if EnteDetectado = 'AGUAS' then
          begin
            UnidadFact := Form1.ObtenerUnidadConPDFToText(PathPdf);
            FTextoAMostrar := 'Unidad de Facturación: ' + UnidadFact;
            Synchronize(MostrarEnMemo);

            CodigosBarras := Form1.ExtraerCodigosBarrasFiel(PathPDF);
            try
              if CodigosBarras.Count > 0 then
              begin
                for i := 0 to CodigosBarras.Count - 1 do
                begin
                  FTextoAMostrar := Format('Código de Barras (Fiel) %d: %s', [i + 1, CodigosBarras[i]]);
                  Synchronize(MostrarEnMemo);
                end;
              end
              else
              begin
                // 2. SI FALLA EL MÉTODO FIEL, RECURRIMOS AL OCR (Tu proceso actual)
                FTextoAMostrar := 'Aviso: No se halló texto digital, usando OCR para barras...';
                Synchronize(MostrarEnMemo);

                // Aquí ejecutas tu pdftocairo + tesseract actual
              end;
            finally
              CodigosBarras.Free;
            end;
          end;

          if EnteDetectado = 'MUNICIPALIDAD' then
          begin
            UnidadFact := Form1.ExtraerNomenclaturaMuniFiel(PathPdf);
            FTextoAMostrar := 'Unidad Funcional: ' + UnidadFact;
            Synchronize(MostrarEnMemo);

            Form1.ExtraerBarrasMunicipales(PathPDF, vBarraLarga, vBarraInterna);

            if vBarraLarga <> '' then
            begin
              FTextoAMostrar := 'Barra Cobro: ' + vBarraLarga;
              Synchronize(MostrarEnMemo);
            end;

            if vBarraInterna <> '' then
            begin
              FTextoAMostrar := 'Barra Interna: ' + vBarraInterna;
              Synchronize(MostrarEnMemo);
            end;
          end;

          if EnteDetectado = 'RENTAS' then
          begin
            UnidadFact := Form1.ExtraerCuentaRentas(PathPdf);
            FTextoAMostrar := 'Identificacion: ' + UnidadFact;
            Synchronize(MostrarEnMemo);

//            Form1.VerificarZBarListo;
//
//            Form1.ExtraerBarrasRapido(PathPdf, vBarraLarga, vBarraInterna);
//            FTextoAMostrar := 'Codigo 1: ' + vBarraLarga;
//            Synchronize(MostrarEnMemo);
//            FTextoAMostrar := 'Codigo 2: ' + vBarraInterna;
//
//            Form1.VerificarZBarListo;

            if Form1.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
               '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
            begin
              Sleep(300);

              Form1.EjecutarInvisible(FPathApp + 'tesseract.exe',
                 '"' + PathIMG + '" "' + PathTXT + '" --psm 6 --oem 3 --tessdata-dir "' + FPathApp + 'tessdata" -c tessedit_char_whitelist=0123456789');

              // Procesar y limpiar (dentro de ProcesarSoloNumeros se debe usar Synchronize si escribe al memo)
              Form1.ProcesarSoloNumeros(PathTXT + '.txt', EnteDetectado);
            end;
          end;
        end;

        if FileExists(PathIMG) then DeleteFile(PChar(PathIMG));
        if FileExists(PathTXT + '.txt') then DeleteFile(PChar(PathTXT + '.txt'));

      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;

  FTextoAMostrar := '---------------------------------------';
  Synchronize(MostrarEnMemo);
  FTextoAMostrar := '--- PROCESO DE CARPETA FINALIZADO ---';
  Synchronize(MostrarEnMemo);

  // Reactivar botón al finalizar
  TThread.Synchronize(nil, procedure begin Form1.btnProcesarCedulon.Enabled := True; end);
end;

{ TForm1 }

procedure TForm1.btnProcesarCedulonClick(Sender: TObject);
var
  PathApp, Carpeta: string;
begin
  PathApp := ExtractFilePath(Application.ExeName);

  // Usamos SelectDirectory para elegir la carpeta
  if SelectDirectory('Seleccione la carpeta con los PDFs', '', Carpeta) then
  begin
    Carpeta := IncludeTrailingPathDelimiter(Carpeta);
    mResultado.Lines.Clear;
    btnProcesarCedulon.Enabled := False; // Bloquear botón para evitar hilos múltiples

    // Lanzar el Hilo
    TProcesoThread.Create(Carpeta, PathApp);
  end;
end;

procedure TForm1.ProcesarSoloNumeros(const RutaTXT: string; const Ente: string);
var
  SL, CodigosFinales: TStringList;
  S, SoloNum, CodigoFinal: string;
  i, j, pos99: Integer;
begin
  SL := TStringList.Create;
  CodigosFinales := TStringList.Create;
  try
    if not FileExists(RutaTXT) then Exit;
    SL.LoadFromFile(RutaTXT);

    for i := 0 to SL.Count - 1 do
    begin
      S := SL[i];
      SoloNum := '';
      for j := 1 to Length(S) do
        if S[j] in ['0'..'9'] then SoloNum := SoloNum + S[j];

      if (Ente = 'MUNICIPALIDAD') then
      begin
        if Pos('3210', SoloNum) > 0 then
        begin
          CodigoFinal := Copy(SoloNum, Pos('3210', SoloNum), 30);
          if CodigosFinales.IndexOf(CodigoFinal) = -1 then CodigosFinales.Add(CodigoFinal);
          pos99 := PosEx('99', SoloNum, Pos('3210', SoloNum) + 25);
          if pos99 > 0 then
          begin
            CodigoFinal := Copy(SoloNum, pos99, 12);
            if CodigosFinales.IndexOf(CodigoFinal) = -1 then CodigosFinales.Add(CodigoFinal);
          end;
        end
        else if (Pos('99', SoloNum) = 1) and (Length(SoloNum) >= 10) then
        begin
          if CodigosFinales.IndexOf(SoloNum) = -1 then CodigosFinales.Add(SoloNum);
        end;
      end
      else if (Ente = 'RENTAS') then
      begin
        if Length(SoloNum) >= 42 then
          CodigoFinal := Copy(SoloNum, Length(SoloNum) - 41, 42)
        else Continue;

        if (Pos('0300', CodigoFinal) = 0) and (Pos('0000', CodigoFinal) = 0) then Continue;

        if (CodigosFinales.Count = 0) or (CodigosFinales[CodigosFinales.Count - 1] <> CodigoFinal) then
          CodigosFinales.Add(CodigoFinal);
      end
      else if (Ente = 'AGUAS') then
      begin
        if (Length(SoloNum) >= 50) then
        begin
          CodigoFinal := Copy(SoloNum, Length(SoloNum) - 51, 52);
          if CodigosFinales.Count = 0 then
            if CodigosFinales.IndexOf(CodigoFinal) = -1 then
              CodigosFinales.Add(CodigoFinal);
        end;
      end;
    end;

    // Sincronizar con el Memo desde el Hilo
    TThread.Synchronize(TThread.CurrentThread, procedure
    var k: Integer;
    begin
      for k := 0 to CodigosFinales.Count - 1 do
        mResultado.Lines.Add(Format('Código %d: %s', [k + 1, CodigosFinales[k]]));
    end);

  finally
    SL.Free;
    CodigosFinales.Free;
  end;
end;

// Los demás métodos (EjecutarInvisible, ClasificarDocumento, etc.) se mantienen igual...
// (Debes copiar IdentificarEnte, FiltrarSoloCodigosLargos y EjecutarInvisible de tu código original)

function TForm1.EjecutarInvisible(const EXE, Parametros: string): Boolean;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  Comando: string;
begin
  Comando := '"' + EXE + '" ' + Parametros;
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_HIDE;
  Result := CreateProcess(nil, PChar(Comando), nil, nil, False, 0, nil, nil, SI, PI);
  if Result then
  begin
    WaitForSingleObject(PI.hProcess, 60000);
    CloseHandle(PI.hProcess);
    CloseHandle(PI.hThread);
  end;
end;

function TForm1.ClasificarDocumento(const RutaPDF: string): string;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros, TextoBruto: string;
  SL: TStringList;
begin
  Result := 'DESCONOCIDO';
  RutaExe := ExtractFilePath(ParamStr(0)) + 'pdftotext.exe';
  RutaTXT := ChangeFileExt(RutaPDF, '_class.txt');

  // Extraemos en modo -raw para obtener las palabras clave rápidamente
  Parametros := Format('"%s" -raw -nopgbrk "%s" "%s"', [RutaExe, RutaPDF, RutaTXT]);

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  if CreateProcess(nil, PChar(Parametros), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 5000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      SL := TStringList.Create;
      try
        SL.LoadFromFile(RutaTXT);
        TextoBruto := UpperCase(SL.Text);

        // Lógica de detección por palabras clave digitales
        if (Pos('CORDOBESAS', TextoBruto) > 0) or (Pos('AGUAS', TextoBruto) > 0) then
          Result := 'AGUAS'
        else if (Pos('RENTAS', TextoBruto) > 0) or (Pos('CONSOLIDADA', TextoBruto) > 0) then
          Result := 'RENTAS'
        else if (Pos('MUNICIPAL', TextoBruto) > 0) or (Pos('3210', TextoBruto) > 0) then
          Result := 'MUNICIPALIDAD';
      finally
        SL.Free;
        if FileExists(RutaTXT) then DeleteFile(RutaTXT);
      end;
    end;
  end;
end;
procedure TForm1.IdentificarEnte(const RutaTXT: string);
var
  Contenido: TStringList;
  TextoBruto, S, SoloNumeros, CodigoFinal: string;
  i, j: Integer;
  CodigosFinales: TStringList;
  EnteIdentificado: string;
begin
  if not FileExists(RutaTXT) then Exit;

  Contenido := TStringList.Create;
  CodigosFinales := TStringList.Create;
  EnteIdentificado := 'DESCONOCIDO';
  try
    Contenido.LoadFromFile(RutaTXT);
    TextoBruto := UpperCase(Contenido.Text);

    // 1. PRIMER INTENTO: Identificar por palabras clave
    if Pos('RENTAS', TextoBruto) > 0 then EnteIdentificado := 'RENTAS DE CÓRDOBA'
    else if (Pos('MUNICIPAL', TextoBruto) > 0) or (Pos('INMUEBLE', TextoBruto) > 0) then EnteIdentificado := 'MUNICIPALIDAD DE CÓRDOBA'
    else if (Pos('AGUAS', TextoBruto) > 0) or (Pos('CORDOBESAS', TextoBruto) > 0) then EnteIdentificado := 'AGUAS CORDOBESAS';

    // 2. PROCESAMIENTO DE LÍNEAS
    for i := 0 to Contenido.Count - 1 do
    begin
      S := Contenido[i];
      SoloNumeros := '';
      for j := 1 to Length(S) do
        if S[j] in ['0'..'9'] then SoloNumeros := SoloNumeros + S[j];

      // Si la cadena es larga (posible código de barras)
      if Length(SoloNumeros) >= 30 then
      begin
        // --- LÓGICA RENTAS (Busca el 0300 o 0000) ---
        if (Pos('0300', SoloNumeros) > 0) or (Pos('0000', SoloNumeros) > 0) then
        begin
          if EnteIdentificado = 'DESCONOCIDO' then EnteIdentificado := 'RENTAS DE CÓRDOBA';
          // Limpiamos el CUIT: tomamos desde el primer '0' que forme el prefijo
          j := Pos('0', SoloNumeros);
          CodigoFinal := Copy(SoloNumeros, j, 42);
          if Length(CodigoFinal) >= 40 then CodigosFinales.Add(CodigoFinal);
        end

        // --- LÓGICA MUNICIPALIDAD (Busca el 3210) ---
        else if Pos('3210', SoloNumeros) > 0 then
        begin
          EnteIdentificado := 'MUNICIPALIDAD DE CÓRDOBA';
          j := Pos('3210', SoloNumeros);
          CodigoFinal := Copy(SoloNumeros, j, 42);
          if Length(CodigoFinal) >= 40 then CodigosFinales.Add(CodigoFinal);
        end

        // --- LÓGICA AGUAS (Cadenas largas que no son Rentas ni Muni) ---
        else if Length(SoloNumeros) >= 30 then
        begin
          if EnteIdentificado = 'DESCONOCIDO' then EnteIdentificado := 'AGUAS CORDOBESAS / OTROS';
          CodigosFinales.Add(SoloNumeros);
        end;
      end;
    end;

    // 3. MOSTRAR RESULTADOS FINALES
    mResultado.Lines.Add('======================================');
    mResultado.Lines.Add('ENTE: ' + EnteIdentificado);
    mResultado.Lines.Add('======================================');

    if CodigosFinales.Count > 0 then
    begin
      mResultado.Lines.Add('CÓDIGOS DETECTADOS (LIMPIOS):');
      for i := 0 to CodigosFinales.Count - 1 do
        mResultado.Lines.Add(Format('%d) %s', [i + 1, CodigosFinales[i]]));
    end
    else
      mResultado.Lines.Add('No se detectaron códigos válidos.');

  finally
    Contenido.Free;
    CodigosFinales.Free;
  end;
end;

procedure TForm1.FiltrarSoloCodigosLargos(const RutaTXT: string);
var
  Lineas: TStringList;
  i, j: Integer;
  S, SoloNumeros: string;
  CodigosEncontrados: TStringList;
begin
  Lineas := TStringList.Create;
  CodigosEncontrados := TStringList.Create;
  try
    Lineas.LoadFromFile(RutaTXT);
    CodigosEncontrados.Sorted := True;
    CodigosEncontrados.Duplicates := dupIgnore; // Evitamos duplicados

    for i := 0 to Lineas.Count - 1 do
    begin
      S := Lineas[i];

      // 1. Limpiamos: dejamos solo números
      SoloNumeros := '';
      for j := 1 to Length(S) do
        if S[j] in ['0'..'9'] then SoloNumeros := SoloNumeros + S[j];

      // 2. Lógica de búsqueda:
      // Si la cadena tiene 40 o más caracteres, contiene un código de barras.
      // Los códigos de Rentas tienen 42. Si hay más de 42, tomamos los ÚLTIMOS 42
      // porque el OCR suele pegar el CUIT o importes al PRINCIPIO de la cadena.

      if Length(SoloNumeros) >= 40 then
      begin
        // Extraemos los 42 dígitos que forman el código real
        // Si tiene justo 42, toma los 42. Si tiene 48, corta los 6 del inicio.
        if Length(SoloNumeros) >= 42 then
        begin
          CodigosEncontrados.Add(Copy(SoloNumeros, Length(SoloNumeros) - 41, 42));
        end;
      end;
    end;

    // 3. Mostramos los resultados encontrados
    mResultado.Lines.Add('--- DETECCIÓN DE CÓDIGOS DUALES ---');
    if CodigosEncontrados.Count > 0 then
    begin
      for i := 0 to CodigosEncontrados.Count - 1 do
      begin
        mResultado.Lines.Add(Format('Código %d: %s', [i + 1, CodigosEncontrados[i]]));
      end;

      if CodigosEncontrados.Count < 2 then
        mResultado.Lines.Add('Nota: Solo se detectó 1 código. Revise la parte inferior del PDF.');
    end
    else
      mResultado.Lines.Add('No se encontraron códigos de barras.');

  finally
    Lineas.Free;
    CodigosEncontrados.Free;
  end;
end;

function TForm1.ObtenerUnidadConPDFToText(const RutaPDF: string): string;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros: string;
  Lineas: TStringList;
  i, j, k: Integer;
  SoloNum: string;
begin
  Result := 'No encontrada';
  RutaExe := ExtractFilePath(ParamStr(0)) + 'pdftotext.exe';
  RutaTXT := ChangeFileExt(RutaPDF, '.txt');

  // CAMBIO CLAVE: Usamos -raw para extraer datos que el layout no ve
  Parametros := Format('"%s" -raw -nopgbrk "%s" "%s"', [RutaExe, RutaPDF, RutaTXT]);

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  if CreateProcess(nil, PChar(Parametros), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 5000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      Lineas := TStringList.Create;
      try
        Lineas.LoadFromFile(RutaTXT);

        for i := 0 to Lineas.Count - 1 do
        begin
          // Buscamos la etiqueta "UNIDAD" [cite: 4, 80, 87, 151, 158, 243, 249]
          if Pos('UNIDAD', UpperCase(Lineas[i])) > 0 then
          begin
            // En modo -raw, el número suele estar en las siguientes líneas del flujo
            for j := 1 to 5 do
            begin
              if i + j < Lineas.Count then
              begin
                SoloNum := '';
                for k := 1 to Length(Lineas[i + j]) do
                  if Lineas[i + j][k] in ['0'..'9'] then SoloNum := SoloNum + Lineas[i + j][k];

                // Verificamos si es uno de los números que buscamos (6 dígitos)
                // Ejemplos: 556279 [cite: 5, 80, 88, 90], 738829 [cite: 98, 151, 159, 161], 222750 [cite: 169, 244, 250, 254]
                if Length(SoloNum) = 6 then
                begin
                  Result := SoloNum;
                  Exit;
                end;
              end;
            end;
          end;
        end;
      finally
        Lineas.Free;
        if FileExists(RutaTXT) then DeleteFile(RutaTXT);
      end;
    end;
  end;
end;

function TForm1.ExtraerCodigosBarrasFiel(const RutaPDF: string): TStringList;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros: string;
  Lineas: TStringList;
  i, k: Integer;
  SoloNum: string;
begin
  Result := TStringList.Create;
  // Estos dos parámetros evitan que se agreguen strings idénticos
  Result.Sorted := True;
  Result.Duplicates := dupIgnore;

  RutaExe := ExtractFilePath(ParamStr(0)) + 'pdftotext.exe';
  RutaTXT := ChangeFileExt(RutaPDF, '_barras.txt');

  Parametros := Format('"%s" -raw -nopgbrk "%s" "%s"', [RutaExe, RutaPDF, RutaTXT]);

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  if CreateProcess(nil, PChar(Parametros), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 5000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      Lineas := TStringList.Create;
      try
        Lineas.LoadFromFile(RutaTXT);

        for i := 0 to Lineas.Count - 1 do
        begin
          SoloNum := '';
          for k := 1 to Length(Lineas[i]) do
            if Lineas[i][k] in ['0'..'9'] then SoloNum := SoloNum + Lineas[i][k];

          {
            FILTRO DE PRECISIÓN:
            1. Longitud: Los códigos de Aguas tienen 52 dígitos.
            2. Prefijo: Deben empezar con '320015' (según tus documentos).
          }
          if (Length(SoloNum) = 52) and (Copy(SoloNum, 1, 6) = '320015') then
          begin
            Result.Add(SoloNum); // dupIgnore evitará que el segundo '320015...' entre
          end;
        end;
      finally
        Lineas.Free;
        if FileExists(RutaTXT) then DeleteFile(RutaTXT);
      end;
    end;
  end;
end;

function TForm1.ExtraerNomenclaturaMuniFiel(const RutaPDF: string): string;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros: string;
  Lineas: TStringList;
  i, k: Integer;
  LineaActual, SoloNum, Fragmento: string;
begin
  Result := 'No encontrada';

  // Configuración de rutas
  RutaExe := ExtractFilePath(ParamStr(0)) + 'pdftotext.exe';
  RutaTXT := ChangeFileExt(RutaPDF, '.txt');

  // IMPORTANTE: Usamos -layout para mantener la estructura de tabla del cedulón
  Parametros := Format('"%s" -layout -nopgbrk "%s" "%s"', [RutaExe, RutaPDF, RutaTXT]);

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE; // Ejecución invisible

  if CreateProcess(nil, PChar(Parametros), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 5000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      Lineas := TStringList.Create;
      try
        Lineas.LoadFromFile(RutaTXT);
        for i := 0 to Lineas.Count - 1 do
        begin
          LineaActual := UpperCase(Lineas[i]);

          // 1. Buscamos la etiqueta "NC:"
          if Pos('NC:', LineaActual) > 0 then
          begin
            // 2. Intentamos extraer de la misma línea (después de 'NC:')
            Fragmento := Copy(LineaActual, Pos('NC:', LineaActual) + 3, Length(LineaActual));
            SoloNum := LimpiarSoloNumeros(Fragmento);

            // 3. Si no hay 15 dígitos, buscamos en la línea de abajo (Caso Boleta 10)
            if (Length(SoloNum) < 15) and (i + 1 < Lineas.Count) then
              SoloNum := LimpiarSoloNumeros(Lineas[i + 1]);

            // 4. Si encontramos los 15 dígitos, devolvemos el código
            if Length(SoloNum) >= 15 then
            begin
              Result := Copy(SoloNum, 1, 15);
              // Opcional: Result := FormatearNC(Copy(SoloNum, 1, 15));
              Exit;
            end;
          end;
        end;
      finally
        Lineas.Free;
        DeleteFile(RutaTXT); // Limpieza
      end;
    end;
  end;
end;

// Función auxiliar para limpiar caracteres no numéricos
function TForm1.LimpiarSoloNumeros(const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
    if S[i] in ['0'..'9'] then Result := Result + S[i];
end;

procedure TForm1.ExtraerBarrasMunicipales(const RutaPDF: string; var Barra32, Barra99: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros: string;
  Lineas: TStringList;
  i, k: Integer;
  SoloNum, LineaActual: string;
begin
  Barra32 := '';
  Barra99 := '';

  RutaExe := ExtractFilePath(ParamStr(0)) + 'pdftotext.exe';
  // Usamos la carpeta TEMP para evitar problemas de permisos de escritura
  RutaTXT := GetEnvironmentVariable('TEMP') + '\' + ChangeFileExt(ExtractFileName(RutaPDF), '.txt');

  // -raw es el mejor modo para códigos de barras porque ignora el posicionamiento visual
  Parametros := Format('"%s" -raw -q -upw "" -nopgbrk "%s" "%s"', [RutaExe, RutaPDF, RutaTXT]);

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  if CreateProcess(nil, PChar(Parametros), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 5000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      Lineas := TStringList.Create;
      try
        Lineas.LoadFromFile(RutaTXT);
        for i := 0 to Lineas.Count - 1 do
        begin
          LineaActual := Lineas[i];
          SoloNum := '';

          // Limpiamos la línea para procesar solo los números
          for k := 1 to Length(LineaActual) do
            if LineaActual[k] in ['0'..'9'] then SoloNum := SoloNum + LineaActual[k];

          if SoloNum = '' then
            Continue;

          // 1. Identificar la Barra de Cobro (42 dígitos, empieza con 32)
          if (Length(SoloNum) >= 42) and (Copy(SoloNum, 1, 2) = '32') then
          begin
            Barra32 := Copy(SoloNum, 1, 30);
            Barra99 := Copy(SoloNum, 31, 12);
          end;

          // 2. Identificar la Barra Interna (Aprox 18 dígitos, empieza con 99)
          if (Length(SoloNum) >= 15) and (Length(SoloNum) < 30) and (Copy(SoloNum, 1, 2) = '99') then
          begin
            Barra99 := SoloNum;
          end;

          // Si ya encontramos ambos, salimos del bucle
          if (Barra32 <> '') and (Barra99 <> '') then Break;
        end;
      finally
        Lineas.Free;
        if FileExists(RutaTXT) then DeleteFile(RutaTXT);
      end;
    end;
  end;
end;

function TForm1.ExtraerCuentaRentas(const RutaPDF: string): string;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros, TextoBruto, SoloNum: string;
  SL: TStringList;
  i: Integer;
begin
  Result := '';
  RutaExe := ExtractFilePath(ParamStr(0)) + 'pdftotext.exe';
  // Usamos un sufijo diferente para no chocar con otros procesos
  RutaTXT := ChangeFileExt(RutaPDF, '_cuenta.txt');

  // Usamos -raw porque ya comprobamos que con este método sí detecta el Ente
  Parametros := Format('"%s" -raw -nopgbrk "%s" "%s"', [RutaExe, RutaPDF, RutaTXT]);

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := SW_HIDE;

  if CreateProcess(nil, PChar(Parametros), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 5000);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      SL := TStringList.Create;
      try
        SL.LoadFromFile(RutaTXT);
        TextoBruto := SL.Text;

        // 1. Limpiamos el texto para dejar solo números
        // Esto es vital en Rentas porque la cuenta suele tener espacios o puntos
        SoloNum := '';
        for i := 1 to Length(TextoBruto) do
          if TextoBruto[i] in ['0'..'9'] then
            SoloNum := SoloNum + TextoBruto[i];

        // 2. Buscamos la secuencia de 12 dígitos que empieza con 1101
        // (Patrón detectado en todos tus archivos de Rentas)
        i := Pos('1101', SoloNum);
        if (i > 0) and (Length(SoloNum) >= i + 11) then
        begin
          Result := Copy(SoloNum, i, 12);
        end;

      finally
        SL.Free;
        if FileExists(RutaTXT) then DeleteFile(RutaTXT);
      end;
    end;
  end;
end;

procedure TForm1.ExtraerBarrasRapido(const RutaPDF: string; out Barra1, Barra2: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  RutaExe, RutaTXT, Parametros: string;
  SL: TStringList;
  i: Integer;
begin
  Barra1 := ''; Barra2 := '';
  RutaExe := ExtractFilePath(ParamStr(0)) + 'zbarimg.exe';
  RutaTXT := ChangeFileExt(RutaPDF, '_zbar.txt');

  // --raw: devuelve solo el número sin el tipo de código (EAN128, etc)
  // -q: modo silencioso
  // > redirect: enviamos la salida a un archivo para leerlo como en tu modelo
  Parametros := Format('"%s" --raw -q > "%s"', [RutaPDF, RutaTXT]);

  // Ejecutamos usando CMD para poder redireccionar la salida al TXT
  if CreateProcess(nil, PChar('cmd.exe /c "' + RutaExe + '" ' + Parametros),
                   nil, nil, True, CREATE_NO_WINDOW, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject(ProcessInfo.hProcess, 3000); // Máximo 3 segundos, es muy rápido
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    if FileExists(RutaTXT) then
    begin
      SL := TStringList.Create;
      try
        SL.LoadFromFile(RutaTXT);
        // ZBar devuelve una línea por cada código encontrado
        for i := 0 to SL.Count - 1 do
        begin
          if Length(Trim(SL[i])) = 42 then
          begin
            if Barra1 = '' then Barra1 := Trim(SL[i])
            else if Barra2 = '' then Barra2 := Trim(SL[i]);
          end;
        end;
      finally
        SL.Free;
        DeleteFile(RutaTXT);
      end;
    end;
  end;
end;

function TForm1.VerificarZBarListo: Boolean;
var
  RutaApp: string;
  ArchivosNecesarios: TStringList;
  i: Integer;
  Faltantes: string;
begin
  Result := True;
  RutaApp := ExtractFilePath(ParamStr(0));
  ArchivosNecesarios := TStringList.Create;
  try
    // Lista de archivos mínimos para que zbarimg funcione
    ArchivosNecesarios.Add('zbarimg.exe');
    ArchivosNecesarios.Add('libzbar-0.dll');
    ArchivosNecesarios.Add('libiconv-2.dll');
    ArchivosNecesarios.Add('libmagickwand-6.q16-2.dll'); // Depende de la versión descargada

    Faltantes := '';
    for i := 0 to ArchivosNecesarios.Count - 1 do
    begin
      if not FileExists(RutaApp + ArchivosNecesarios[i]) then
      begin
        Result := False;
        Faltantes := Faltantes + #13 + ArchivosNecesarios[i];
      end;
    end;

    if not Result then
      ShowMessage('Error: Faltan dependencias de ZBar para procesar códigos de barras:' + Faltantes);

  finally
    ArchivosNecesarios.Free;
  end;
end;

end.

