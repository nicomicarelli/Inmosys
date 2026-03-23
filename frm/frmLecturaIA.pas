unit frmLecturaIA;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Controls, System.StrUtils, Vcl.FileCtrl, Math,
  Winapi.ShellAPI,System.RegularExpressions, System.Types,System.IOUtils,
  FxConnection, fxQuery, Funciones, Vcl.ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.ExtCtrls, Graphics;

type
  // Definición del Hilo
  TProcesoThread = class(TThread)
  private
    FCarpeta: string;
    FPathApp: string;
    FTextoAMostrar: string;
    FColumna: Integer;
    FFila: Integer;
    FEmpresa: Integer;
    FEnProceso: Boolean;
    Conn: TFXConnection; // Si usas FireDAC
    Query: TFXQuery;

    FDatoFijo: String;
    FidDesde, FidHasta, FFechaDesde, FFechaHasta, FImporteDesde, FImporteHasta, FCantCodigos: Integer;
    FPorcentajeRecargo: Double;
    FFecha: string;
    FImporte: string;
    FID: string;

    FCodigoBarras1: string;
    FCodigoBarras2: string;
    FEnteDetectado: string;

    procedure MostrarEnMemo;
    procedure MostrarEnGrilla;
    procedure AgregarFila;
    procedure ActualizarProgreso;
  protected
    procedure Execute; override;
    function ConectarBD(RutaBD:string): Boolean;
    procedure prObtenerParametrosCodigoBarras;
    procedure prTraducirCodigoBarras(niFila: Integer);
    procedure prInterpretarCodigoBarras(ATexto: String; pCodigoBarras: Integer);
    procedure ProcesarSoloNumeros(const RutaTXT: string; const Ente: string);
    function DetectarPaginaBarras(const RutaPDF: string): Integer;
  public
    function EstaEnProceso: Boolean;
    constructor Create(const ACarpeta, APathApp: string);
  end;

  TfLecturaIA = class(TForm)
    mResultado: TMemo;
    OpenDialog1: TOpenDialog;
    gDetalle: TAdvStringGrid;
    Panel1: TPanel;
    Progreso: TProgressBar;
    btnProcesarCedulon: TAdvGlowButton;
    procedure btnProcesarCedulonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure IdentificarEnte(const RutaTXT: string);
    function EjecutarInvisible(const EXE, Parametros: string): Boolean;
    procedure FiltrarSoloCodigosLargos(const RutaTXT: string);
    function ClasificarDocumento(const RutaPDF: string): string;
    function ObtenerUnidadConPDFToText(const RutaPDF: string): string;
    function ExtraerCodigosBarrasFiel(const RutaPDF: string): TStringList;
    function ExtraerNomenclaturaMuniFiel(const RutaPDF: string): string;
    function LimpiarSoloNumeros(const S: string): string;
    procedure ExtraerBarrasMunicipales(const RutaPDF: string; var Barra32, Barra99: string);
    procedure ExtraerBarrasRentas(const RutaPDF: string; var Barra32, Barra99: string);
    function ExtraerCuentaRentas(const RutaPDF: string): string;
    procedure ExtraerBarrasRapido(const RutaPDF: string; out Barra1, Barra2: string);
    function VerificarZBarListo: Boolean;
  public
    EstaEnProceso: Boolean;
    Empresa: Integer;
  end;

var
  fLecturaIA: TfLecturaIA;

implementation

{$R *.dfm}

uses frmNuevoCedulon, frmprincipal;

{ TProcesoThread }



procedure TProcesoThread.AgregarFila;
begin
  fLecturaIA.gDetalle.RowCount := fLecturaIA.gDetalle.RowCount + 1;
end;

function TProcesoThread.ConectarBD(RutaBD:string): Boolean;
begin
  with Conn do
  begin
    Connected := False;
    Params.Clear;
    Params.Add('DriverName=Firebird');
    Params.Add('Database=' + RutaBD);
    Params.Add('DriverID=FB');
    Params.Add('RoleName=RoleName');
    Params.Add('User_Name=sysdba');
    Params.Add('Password=masterkey');
    Params.Add('ServerCharSet=');
    Params.Add('SQLDialect=3');
    Params.Add('ErrorResourceFile=');
    Params.Add('LocaleCode=0000');
    Params.Add('BlobSize=-1');
    Params.Add('CommitRetain=False');
    Params.Add('WaitOnLocks=True');
    Params.Add('IsolationLevel=ReadCommitted');
    Params.Add('Trim Char=False');
    Params.Add('VendorLib=FBClient.dll');
    Connected := True;
  end;
  Result := Conn.Connected;
end;

constructor TProcesoThread.Create(const ACarpeta, APathApp: string);
begin
  inherited Create(False);
  FCarpeta := ACarpeta;
  FPathApp := APathApp;
  FreeOnTerminate := True;
end;

function TProcesoThread.DetectarPaginaBarras(const RutaPDF: string): Integer;
var
  RutaExe, RutaTXT, Parametros: string;
  SL: TStringList;
  i: Integer;
  ContadorPaginas: Integer;
begin
  Result := 1;
  RutaExe := FPathApp + 'pdftotext.exe';
  // Forzamos una ruta simple para el temporal si es necesario
  RutaTXT := TPath.GetTempFileName;

  // IMPORTANTE: Comillas dobles en cada ruta dentro del Format
  Parametros := Format(' -l 2 "%s" "%s"', [RutaPDF, RutaTXT]);

  if fLecturaIA.EjecutarInvisible(RutaExe, Parametros) then
  begin
    // Agregamos una pequeña espera o verificamos existencia
    if FileExists(RutaTXT) then
    begin
      SL := TStringList.Create;
      try
        SL.LoadFromFile(RutaTXT);
        ContadorPaginas := 1;

        for i := 0 to SL.Count - 1 do
        begin
          // Detectar el salto de página (Form Feed #12)
          if Pos(#12, SL[i]) > 0 then
            Inc(ContadorPaginas);

          // Buscar palabras clave según el cedulón de Rentas [cite: 64, 72]
          if (Pos('LIQUIDACIÓN DE DEUDA', UpperCase(SL[i])) > 0) or
             (Pos('TOTAL A PAGAR', UpperCase(SL[i])) > 0) then
          begin
            Result := ContadorPaginas;
            Break;
          end;
        end;
      finally
        SL.Free;
        if FileExists(RutaTXT) then DeleteFile(RutaTXT);
      end;
    end;
  end;
end;

procedure TProcesoThread.MostrarEnGrilla;
begin
  FLecturaIA.gDetalle.Cells[FColumna, FFila] := FTextoAMostrar;
  if FColumna <> 5 then
    Exit;

  if FTextoAmostrar = 'ACTUALIZO' then
    FLecturaIA.gDetalle.FontColors[FColumna, FFila] := clGreen
  else
    FLecturaIA.gDetalle.FontColors[FColumna, FFila] := clRed;


end;

procedure TProcesoThread.MostrarEnMemo;
begin
  fLecturaIA.mResultado.Lines.Add(FTextoAMostrar);
end;

procedure TProcesoThread.prObtenerParametrosCodigoBarras;
var
  Ruta: string;
begin
  Query.Close;
  Query.Sql.Text :=
    ' Select E.* from EmpresasImpuestos E' +
    ' where Codigo = :Codigo';
  Query.ParambyName('Codigo').AsInteger := FEmpresa;
  Query.Open;

  FPorcentajeRecargo := Query.FieldbyName('PorcentajeRecargo').AsFloat;
  FDatoFijo := Query.FieldbyName('Identificacion').AsString;
  FidDesde := Query.FieldbyName('IdentificacionDesde').AsInteger;
  FidHasta := Query.FieldbyName('IdentificacionHasta').AsInteger;
  FFechaDesde := Query.FieldbyName('FechaDesde').AsInteger;
  FFechaHasta := Query.FieldbyName('FechaHasta').AsInteger;
  FImporteDesde := Query.FieldbyName('ImporteDesde').AsInteger;
  FImporteHasta := Query.FieldbyName('ImporteHasta').AsInteger;
  FCantCodigos := Query.FieldbyName('CantCodigos').AsInteger;
end;

procedure TProcesoThread.prInterpretarCodigoBarras(ATexto: String; pCodigoBarras: Integer);
begin
    if (FFechaDesde = 0) or (FFechaHasta = 0) then
      FFecha := '01/01/1900'
    else
      FFecha := Copy(Copy(FCodigoBarras2, FFechaDesde, FFechaHasta - FFechaDesde+1),1,2) + '/' +
        Copy(Copy(ATexto, FFechaDesde, FFechaHasta - FFechaDesde+1),3,2) + '/' +
        Copy(Copy(ATexto, FFechaDesde, FFechaHasta - FFechaDesde+1),5,4);

    if FEnteDetectado = 'RENTAS' then
      FImporte := FormatFloat('0.00', Funciones.ToFloat(Copy(FCodigoBarras2, FImporteDesde, FImporteHasta - FImporteDesde+1))/100)
    else
      FImporte := FormatFloat('0.00', Funciones.ToFloat(Copy(FCodigoBarras1, FImporteDesde, FImporteHasta - FImporteDesde+1))/100);
end;


procedure TProcesoThread.prTraducirCodigoBarras(niFila: Integer);
var
  ndRedondeado, ndImporteRedondeo: Double;
begin
    if Assigned(fAsignacionBoletas) then
    begin
      if FEnteDetectado = 'RENTAS' then
        FID := Copy(FCodigoBarras1, FIDDesde, FIDHasta)
      else
        FID := FCodigoBarras2;

      fAsignacionBoletas.gDetalle.Cells[2, niFila] := FID;
      if FEnteDetectado = 'RENTAS' then
        prInterpretarCodigoBarras( FCodigoBarras2, 2)
      ELSE
        prInterpretarCodigoBarras( FCodigoBarras1, 2);
      fAsignacionBoletas.gDetalle.Cells[3, niFila] := FFecha;
      fAsignacionBoletas.gDetalle.Cells[4, niFila] := FImporte;

      ndRedondeado := ToFloat(fAsignacionBoletas.gDetalle.Cells[4, niFila]);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[4, niFila] := FormatFloat('0.00', ndRedondeado);

      fAsignacionBoletas.gDetalle.Cells[7, niFila] := FormatFloat('0.00', (ToFloat(FImporte) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[5,niFila],',','.'))/100));
      ndRedondeado := ToFloat(fAsignacionBoletas.gDetalle.Cells[7, niFila]);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[7, niFila] := FormatFloat('0.00', ndRedondeado);

      fAsignacionBoletas.gDetalle.Cells[8, niFila] := FormatFloat('0.00', (ToFloat(FImporte) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[6,niFila],',','.'))/100));
      ndRedondeado := ToFloat(fAsignacionBoletas.gDetalle.Cells[8, niFila]);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[8, niFila] := FormatFloat('0.00', ndRedondeado);

//      ndRedondeado := fxRedondearImporte(ToFloat(fAsignacionBoletas.gDetalle.Cells[7, FFila]), ndImporteredondeo);
(*      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', ndRedondeado);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', ndRedondeado);
      ndRedondeado := fxRedondearImporte(ToFloat(fAsignacionBoletas.gDetalle.Cells[8, Fila]), ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', ndRedondeado);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', ndRedondeado);
*)
//      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', (ToFloat(Importe) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[5,FFila],',','.'))/100));
//      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', (ToFloat(Importe) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[6,FFila],',','.'))/100));


//      if (FFila + 1 <= fAsignacionBoletas.gDetalle.RowCount - 1) and (fAsignacionBoletas.gDetalle.Col = 2) then
//        fAsignacionBoletas.gDetalle.EditCell(2, FFila + 1);
  end;
end;


procedure TProcesoThread.ActualizarProgreso;
begin
  fLecturaIA.Progreso.Position := fLecturaIA.Progreso.Position + 1;
end;

function TProcesoThread.EstaEnProceso: Boolean;
begin
  Result := FEnProceso;
end;

procedure TProcesoThread.Execute;
var
  SR: TSearchRec;
  PathPDF, NomBase, PathIMG, PathTXT: string;
  UnidadFact: string;
  CodigosBarras: TStringList;
  Codigos: TStringList;
  I, J, K: Integer;
  vBarraLarga, vBarraInterna: string;
  Ruta: String;
  Key: char;
  PaginaObjetivo: INteger;
begin
  FFila:= 1;
  Key := #13;
  // --- 1. CONFIGURACIÓN INICIAL DE BASE DE DATOS ---
  // Al iniciar, marcamos que el proceso está activo
  TThread.Synchronize(nil, procedure
  begin
    fLecturaIA.EstaEnProceso := True;
    FAsignacionBoletas.HiloEnProceso := True;
    FAsignacionBoletas.prControlarBotones(False);
    FEmpresa := fLecturaIA.Empresa;
    case FEmpresa of
      2: Synchronize(procedure begin
        FLecturaIA.gDetalle.Cells[2, 0] := 'U. Funcional';
       end);
    end;
  end);

  Conn := TFxConnection.Create(nil);
  Query := TFxQuery.Create(nil);
  Ruta := ObtenerRutaBD;
  try
    try
      if ConectarBD(Ruta) then
        Query.Connection := Conn;
    except
      on E: Exception do
      begin
        FTextoAMostrar := 'Error de DB: ' + E.Message;
        Synchronize(MostrarEnMemo);
        Exit; // Si no hay DB, no podemos seguir con la lógica de cruce
      end;
    end;

    case FEmpresa of
      1,3: prObtenerParametrosCodigoBarras;
      2: Synchronize(procedure begin
        FLecturaIA.gDetalle.Cells[2, 0] := 'U. Funcional';
       end);
    end;


    if FindFirst(FCarpeta + '*.pdf', faAnyFile, SR) = 0 then
    begin
      FTextoAMostrar := 'Procesando: por favor espere.';
      Synchronize(MostrarEnMemo);
      try
        repeat
          if Terminated then Break;

          PathPDF := FCarpeta + SR.Name;
          NomBase := 'session_' + FormatDateTime('hhmmsszzz', Now);
          PathIMG := FPathApp + NomBase + '.png';
          PathTXT := FPathApp + NomBase;

         // 1. Generar Imagen
  //        if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
  //           '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
          begin
            Sleep(300);

            FEnteDetectado := fLecturaIA.ClasificarDocumento(PathPDF);
            FTextoAMostrar := FEnteDetectado;
            FColumna := 1;
            Synchronize(MostrarEnGrilla);
            if FEnteDetectado = 'AGUAS' then
            begin
              if FEmpresa <> 2 then
              begin
                FTextoAMostrar := 'CEDULON INCORRECTO';
                FColumna := 2;
                Synchronize(MostrarEnGrilla);
                Synchronize(ActualizarProgreso);
                Continue;
              end;

              UnidadFact := fLecturaIA.ObtenerUnidadConPDFToText(PathPdf);
              FTextoAMostrar := UnidadFact;
              FColumna := 2;
              Synchronize(MostrarEnGrilla);

              Query.Close;
              Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE UNIDADFUNCIONAL = :unidad';
              Query.ParamByName('unidad').AsString := UnidadFact;
              Query.Open;

              if not Query.IsEmpty then
              begin
                FTextoAMostrar := Query.FieldByName('Codinq').AsString;
                FColumna := 0;
                Synchronize(MostrarEnGrilla);
                FTextoAMostrar := 'ENCONTRADO';
                FColumna := 5;
                Synchronize(MostrarEnGrilla);
              end
              else
              begin
                FTextoAMostrar := '';
                FColumna := 0;
                Synchronize(MostrarEnGrilla);
                FTextoAMostrar := 'NO ENCONTRADO';
                FColumna := 5;
                Synchronize(MostrarEnGrilla);
              end;

              CodigosBarras := fLecturaIA.ExtraerCodigosBarrasFiel(PathPDF);
              try
                if CodigosBarras.Count > 0 then
                begin
                  for i := 0 to CodigosBarras.Count - 1 do
                  begin
                    FTextoAMostrar := CodigosBarras[i];
                    FColumna := 3;
                    Synchronize(MostrarEnGrilla);
                    TThread.Synchronize(nil,
                      procedure
                      var J: Integer;
                      begin
                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
                        begin
                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
                          begin
                            FAsignacionBoletas.gDetalle.Cells[2, J] := CodigosBarras[0];
                            FAsignacionBoletas.gDetalle.Col := 2;
                            FAsignacionBoletas.gDetalle.Row := j;
                            FAsignacionBoletas.gDetalleKeyPress(nil, Key);
                            FTextoAMostrar := 'ACTUALIZO';
                            FColumna := 5;
                            Synchronize(MostrarEnGrilla);

                          end
                        end;
                      end);
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
                Inc(FFila);
                Synchronize(AgregarFila);
              end;
            end;

            if FEnteDetectado = 'MUNICIPALIDAD' then
            begin
              try
                if FEmpresa <> 3 then
                begin
                  FTextoAMostrar := 'CEDULON INCORRECTO';
                  FColumna := 2;
                  Synchronize(MostrarEnGrilla);
                  Synchronize(ActualizarProgreso);
                  Continue;
                end;

                FCodigoBarras1 := '';
                FCodigoBarras2 := '';

                UnidadFact := fLecturaIA.ExtraerNomenclaturaMuniFiel(PathPdf);
                FTextoAMostrar := UnidadFact;
                FColumna := 2;
                Synchronize(MostrarEnGrilla);

                Query.Close;
                Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE NOMENCLATURACATASTRAL = :unidad';
                Query.ParamByName('unidad').AsString := UnidadFact;
                Query.Open;

                if not Query.IsEmpty then
                begin
                  FTextoAMostrar := Query.FieldByName('Codinq').AsString;
                  FColumna := 0;
                  Synchronize(MostrarEnGrilla);
                  FTextoAMostrar := 'ENCONTRADO';
                  FColumna := 5;
                  Synchronize(MostrarEnGrilla);
                end
                else
                begin
                  FTextoAMostrar := '';
                  FColumna := 0;
                  Synchronize(MostrarEnGrilla);
                  FTextoAMostrar := 'NO ENCONTRADO';
                  FColumna := 5;
                  Synchronize(MostrarEnGrilla);
                end;

                fLecturaIA.ExtraerBarrasMunicipales(PathPDF, vBarraLarga, vBarraInterna);

                if vBarraLarga <> '' then
                begin
                  FTextoAMostrar := vBarraLarga;
                  FColumna := 3;
                  Synchronize(MostrarEnGrilla);
                end;

                if vBarraInterna <> '' then
                begin
                  FTextoAMostrar := vBarraInterna;
                  FColumna := 4;
                  Synchronize(MostrarEnGrilla);
                end;

                if (Trim(vBarraLarga) <> '') and (Trim(vBarraInterna) <> '') then
                begin
                  FCodigoBarras1 := vBarraLarga;
                  FCodigoBarras2 := vBarraInterna;
                  try
                    TThread.Synchronize(nil,
                      procedure
                      var J: Integer;
                      begin
                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
                        begin
                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
                          begin
                            prTraducirCodigoBarras(J);
                            FTextoAMostrar := 'ACTUALIZO';
                            FColumna := 5;
                            Synchronize(MostrarEnGrilla);
                            Break;
                          end
                        end;
                      end);
                  finally
                    CodigosBarras.Free;
                  end;
                end;
              finally
                Inc(FFila);
                Synchronize(AgregarFila);
              end;
            end;

            if FEnteDetectado = 'RENTAS' then
            begin
              if FEmpresa <> 1 then
              begin
                FTextoAMostrar := 'CEDULON INCORRECTO';
                FColumna := 2;
                Synchronize(MostrarEnGrilla);
                Synchronize(ActualizarProgreso);
                Continue;
              end;

              UnidadFact := fLecturaIA.ExtraerCuentaRentas(PathPdf);
              FTextoAMostrar := UnidadFact;
              FColumna := 2;
              Synchronize(MostrarEnGrilla);

              PaginaObjetivo := DetectarPaginaBarras(PathPDF);

              if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
                 Format('-png -singlefile -f %d -l %d -r 300 -y 2000 "%s" "%s"',
                 [PaginaObjetivo, PaginaObjetivo, PathPDF, FPathApp + NomBase])) then
//              if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
//                 '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
              begin
                Sleep(10);

                fLecturaIA.EjecutarInvisible(FPathApp + 'tesseract.exe',
                   '"' + PathIMG + '" "' + PathTXT + '" --psm 6 --oem 1 --tessdata-dir "' + FPathApp + 'tessdata" -c tessedit_char_whitelist=0123456789');
                Query.Close;
                Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE NUMEROCUENTA = :unidad';
                Query.ParamByName('unidad').AsString := UnidadFact;
                Query.Open;

                if not Query.IsEmpty then
                begin
                  FTextoAMostrar := Query.FieldByName('Codinq').AsString;
                  FColumna := 0;
                  Synchronize(MostrarEnGrilla);
                  FTextoAMostrar := 'ENCONTRADO';
                  FColumna := 5;
                  Synchronize(MostrarEnGrilla);
                end
                else
                begin
                  FTextoAMostrar := '';
                  FColumna := 0;
                  Synchronize(MostrarEnGrilla);
                  FTextoAMostrar := 'NO ENCONTRADO';
                  FColumna := 5;
                  Synchronize(MostrarEnGrilla);
                end;

                FCodigoBarras1 := '';
                FCodigoBarras2 := '';
                // Procesar y limpiar (dentro de ProcesarSoloNumeros se debe usar Synchronize si escribe al memo)
                ProcesarSoloNumeros(PathTXT + '.txt', FEnteDetectado);
                FColumna := 3;
                FTextoAMostrar := FCodigoBarras1;
                Synchronize(MostrarEnGrilla);
                FColumna := 4;
                FTextoAMostrar := FCodigoBarras2;
                Synchronize(MostrarEnGrilla);

                if (Trim(FCodigoBarras1) <> '') and (Trim(FCodigoBarras2) <> '') then
                begin
                  try
                    TThread.Synchronize(nil,
                      procedure
                      var J: Integer;
                      begin
                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
                        begin
                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
                          begin
                            prTraducirCodigoBarras(J);
                            FTextoAMostrar := 'ACTUALIZO';
                            FColumna := 5;
                            Synchronize(MostrarEnGrilla);
                            Break;
                          end
                        end;
                      end);
                  finally
                    CodigosBarras.Free;
                  end;
                end;
                Inc(FFila);
                Synchronize(AgregarFila);
              end;
            end;

//            if FEnteDetectado = 'RENTAS' then
//            begin
//              if FEmpresa <> 1 then
//              begin
//                FTextoAMostrar := 'CEDULON INCORRECTO';
//                FColumna := 2;
//                Synchronize(MostrarEnGrilla);
//                Synchronize(ActualizarProgreso);
//                Continue;
//              end;
//
//              UnidadFact := fLecturaIA.ExtraerCuentaRentas(PathPdf);
//              FTextoAMostrar := UnidadFact;
//              FColumna := 2;
//              Synchronize(MostrarEnGrilla);
//
//              PaginaObjetivo := DetectarPaginaBarras(PathPDF);
//
//              if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
//                 Format('-png -singlefile -f %d -l %d -r 800 "%s" "%s"',
//                 [PaginaObjetivo, PaginaObjetivo, PathPDF, FPathApp + NomBase])) then
////              if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
////                 '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
//              begin
//                Sleep(100);
//
//                fLecturaIA.EjecutarInvisible(FPathApp + 'tesseract.exe',
//                   '"' + PathIMG + '" "' + PathTXT + '" --psm 6 --oem 3 --tessdata-dir "' + FPathApp + 'tessdata" -c tessedit_char_whitelist=0123456789');
//                Query.Close;
//                Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE NUMEROCUENTA = :unidad';
//                Query.ParamByName('unidad').AsString := UnidadFact;
//                Query.Open;
//
//                if not Query.IsEmpty then
//                begin
//                  FTextoAMostrar := Query.FieldByName('Codinq').AsString;
//                  FColumna := 0;
//                  Synchronize(MostrarEnGrilla);
//                  FTextoAMostrar := 'ENCONTRADO';
//                  FColumna := 5;
//                  Synchronize(MostrarEnGrilla);
//                end
//                else
//                begin
//                  FTextoAMostrar := '';
//                  FColumna := 0;
//                  Synchronize(MostrarEnGrilla);
//                  FTextoAMostrar := 'NO ENCONTRADO';
//                  FColumna := 5;
//                  Synchronize(MostrarEnGrilla);
//                end;
//
//                FCodigoBarras1 := '';
//                FCodigoBarras2 := '';
//                // Procesar y limpiar (dentro de ProcesarSoloNumeros se debe usar Synchronize si escribe al memo)
//                ProcesarSoloNumeros(PathTXT + '.txt', FEnteDetectado);
//                FColumna := 3;
//                FTextoAMostrar := FCodigoBarras1;
//                Synchronize(MostrarEnGrilla);
//                FColumna := 4;
//                FTextoAMostrar := FCodigoBarras2;
//                Synchronize(MostrarEnGrilla);
//
//                if (Trim(FCodigoBarras1) <> '') and (Trim(FCodigoBarras2) <> '') then
//                begin
//                  try
//                    TThread.Synchronize(nil,
//                      procedure
//                      var J: Integer;
//                      begin
//                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
//                        begin
//                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
//                          begin
//                            prTraducirCodigoBarras(J);
//                            FTextoAMostrar := 'ACTUALIZO';
//                            FColumna := 5;
//                            Synchronize(MostrarEnGrilla);
//                            Break;
//                          end
//                        end;
//                      end);
//                  finally
//                    CodigosBarras.Free;
//                  end;
//                end;
//                Inc(FFila);
//                Synchronize(AgregarFila);
//              end;
//            end;
          end;

          if FileExists(PathIMG) then DeleteFile(PChar(PathIMG));
          if FileExists(PathTXT + '.txt') then DeleteFile(PChar(PathTXT + '.txt'));
          Synchronize(ActualizarProgreso);
        until FindNext(SR) <> 0;
      finally
        FindClose(SR);
      end;
    end;

    FTextoAMostrar := '--- PROCESO DE CARPETA FINALIZADO ---';
    Synchronize(MostrarEnMemo);

    // Reactivar botón al finalizar
    TThread.Synchronize(nil, procedure begin fLecturaIA.btnProcesarCedulon.Enabled := True; end);
  finally
    Query.Free;
    Conn.Connected := False;
    Conn.Free;
    TThread.Synchronize(nil, procedure begin fLecturaIA.EstaEnProceso := False;
     FAsignacionBoletas.HiloEnProceso := False;
     FAsignacionBoletas.prControlarBotones(True);
     MostrarDialogoAceptar('Proceso Terminado');
     end);

  end;
end;

{ TfLecturaIA }
function ContarPDFs(const RutaCarpeta: string): Integer;
var
  Archivos: TStringDynArray;
begin
  Result := 0;

  // Verificamos que la carpeta exista para evitar errores
  if TDirectory.Exists(RutaCarpeta) then
  begin
    {
      TDirectory.GetFiles devuelve un arreglo con los nombres de archivos.
      El segundo parámetro es la máscara de búsqueda (*.pdf).
    }
    Archivos := TDirectory.GetFiles(RutaCarpeta, '*.pdf');
    Result := Length(Archivos);
  end
  else
    raise Exception.Create('La carpeta especificada no existe.');
end;    // Lanzar el Hilo


procedure TfLecturaIA.btnProcesarCedulonClick(Sender: TObject);
var
  PathApp, Carpeta: string;
begin
  Progreso.Min := 0;

  PathApp := ExtractFilePath(Application.ExeName);

  // Usamos SelectDirectory para elegir la carpeta
  if SelectDirectory('Seleccione la carpeta con los PDFs', '', Carpeta) then
  begin
    Carpeta := IncludeTrailingPathDelimiter(Carpeta);
    Progreso.Max := ContarPDFs(Carpeta);
    Progreso.Position := 0;
    mResultado.Lines.Clear;
    btnProcesarCedulon.Enabled := False; // Bloquear botón para evitar hilos múltiples

    TProcesoThread.Create(Carpeta, PathApp);
  end;
end;

//procedure TProcesoThread.ProcesarSoloNumeros(const RutaTXT: string; const Ente: string);
//var
//  SL, CodigosFinales: TStringList;
//  S, SoloNum, CodigoFinal: string;
//  i, j, pos99: Integer;
//begin
//  SL := TStringList.Create;
//  CodigosFinales := TStringList.Create;
//  try
//    if not FileExists(RutaTXT) then Exit;
//    SL.LoadFromFile(RutaTXT);
//
//    for i := 0 to SL.Count - 1 do
//    begin
//      S := SL[i];
//      SoloNum := '';
//      for j := 1 to Length(S) do
//        if S[j] in ['0'..'9'] then SoloNum := SoloNum + S[j];
//
//      if (Ente = 'MUNICIPALIDAD') then
//      begin
//        if Pos('3210', SoloNum) > 0 then
//        begin
//          CodigoFinal := Copy(SoloNum, Pos('3210', SoloNum), 30);
//          if CodigosFinales.IndexOf(CodigoFinal) = -1 then CodigosFinales.Add(CodigoFinal);
//          pos99 := PosEx('99', SoloNum, Pos('3210', SoloNum) + 25);
//          if pos99 > 0 then
//          begin
//            CodigoFinal := Copy(SoloNum, pos99, 12);
//            if CodigosFinales.IndexOf(CodigoFinal) = -1 then CodigosFinales.Add(CodigoFinal);
//          end;
//        end
//        else if (Pos('99', SoloNum) = 1) and (Length(SoloNum) >= 10) then
//        begin
//          if CodigosFinales.IndexOf(SoloNum) = -1 then CodigosFinales.Add(SoloNum);
//        end;
//      end
//      else if (Ente = 'RENTAS') then
//      begin
//        if Length(SoloNum) >= 42 then
//          CodigoFinal := Copy(SoloNum, Length(SoloNum) - 41, 42)
//        else Continue;
//
//        if (Pos('0300', CodigoFinal) = 0) and (Pos('0000', CodigoFinal) = 0) then Continue;
//
//        if (CodigosFinales.Count = 0) or (CodigosFinales[CodigosFinales.Count - 1] <> CodigoFinal) then
//          CodigosFinales.Add(CodigoFinal);
//      end
//      else if (Ente = 'AGUAS') then
//      begin
//        if (Length(SoloNum) >= 50) then
//        begin
//          CodigoFinal := Copy(SoloNum, Length(SoloNum) - 51, 52);
//          if CodigosFinales.Count = 0 then
//            if CodigosFinales.IndexOf(CodigoFinal) = -1 then
//              CodigosFinales.Add(CodigoFinal);
//        end;
//      end;
//    end;
//    if (Ente = 'RENTAS') then
//    begin
//      FCodigoBarras1 := CodigosFinales.Strings[0];
//      FCodigoBarras2 := CodigosFinales.Strings[1];
//    end;
//  finally
//    SL.Free;
//    CodigosFinales.Free;
//  end;
//end;

procedure TProcesoThread.ProcesarSoloNumeros(const RutaTXT: string; const Ente: string);
var
  SL, CodigosFinales: TStringList;
  S, SoloNum, CodigoFinal: string;
  i, j, pos99, jPtr: Integer;
begin
  if not FileExists(RutaTXT) then Exit;

  SL := TStringList.Create;
  CodigosFinales := TStringList.Create;
  try
    SL.LoadFromFile(RutaTXT);
    if SL.Count = 0 then Exit;

    for i := 0 to SL.Count - 1 do
    begin
      S := SL[i];
      if S = '' then Continue;

      // OPTIMIZACIÓN 1: Extraer números de forma eficiente
      SetLength(SoloNum, Length(S));
      jPtr := 0;
      for j := 1 to Length(S) do
      begin
        if S[j] in ['0'..'9'] then
        begin
          Inc(jPtr);
          SoloNum[jPtr] := S[j];
        end;
      end;
      SetLength(SoloNum, jPtr);

      if SoloNum = '' then Continue;

      // OPTIMIZACIÓN 2: Lógica por Ente
      if Ente = 'MUNICIPALIDAD' then
      begin
        pos99 := Pos('3210', SoloNum);
        if pos99 > 0 then
        begin
          CodigoFinal := Copy(SoloNum, pos99, 30);
          if CodigosFinales.IndexOf(CodigoFinal) = -1 then
            CodigosFinales.Add(CodigoFinal);

          pos99 := PosEx('99', SoloNum, pos99 + 25);
          if pos99 > 0 then
          begin
            CodigoFinal := Copy(SoloNum, pos99, 12);
            if CodigosFinales.IndexOf(CodigoFinal) = -1 then
              CodigosFinales.Add(CodigoFinal);
          end;
        end
        else if (Pos('99', SoloNum) = 1) and (Length(SoloNum) >= 10) then
        begin
          if CodigosFinales.IndexOf(SoloNum) = -1 then
            CodigosFinales.Add(SoloNum);
        end;
      end
      else if Ente = 'RENTAS' then
      begin
        // El código de Rentas tiene exactamente 42 dígitos
        if Length(SoloNum) >= 42 then
        begin
          CodigoFinal := Copy(SoloNum, Length(SoloNum) - 41, 42);
          // Validar prefijos conocidos de Rentas
          if (Pos('0300', CodigoFinal) = 1) or (Pos('0000', CodigoFinal) = 1) then
          begin
            if (CodigosFinales.IndexOf(CodigoFinal) = -1) then
              CodigosFinales.Add(CodigoFinal);
          end;
        end;
      end
      else if Ente = 'AGUAS' then
      begin
        if Length(SoloNum) >= 50 then
        begin
          CodigoFinal := Copy(SoloNum, Length(SoloNum) - 51, 52);
          if CodigosFinales.Count = 0 then
            CodigosFinales.Add(CodigoFinal);
        end;
      end;
    end;

    // OPTIMIZACIÓN 3: Asignación segura de resultados
    FCodigoBarras1 := '';
    FCodigoBarras2 := '';

    if CodigosFinales.Count > 0 then
      FCodigoBarras1 := CodigosFinales[0];

    if (Ente = 'RENTAS') and (CodigosFinales.Count > 1) then
      FCodigoBarras2 := CodigosFinales[1];

  finally
    SL.Free;
    CodigosFinales.Free;
  end;
end;


function TfLecturaIA.EjecutarInvisible(const EXE, Parametros: string): Boolean;
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
    WaitForSingleObject(PI.hProcess, 10000);
    CloseHandle(PI.hProcess);
    CloseHandle(PI.hThread);
  end;
end;

function TfLecturaIA.ClasificarDocumento(const RutaPDF: string): string;
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
        else if (Pos('RENTAS', TextoBruto) > 0) or (Pos('MERO DE CUENTA', TextoBruto) > 0) or (Pos('INMOBILIARIO URBANO', TextoBruto) > 0)or (Pos('CONSOLIDADA', TextoBruto) > 0) then
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

procedure TfLecturaIA.IdentificarEnte(const RutaTXT: string);
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

procedure TfLecturaIA.FiltrarSoloCodigosLargos(const RutaTXT: string);
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

procedure TfLecturaIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  FLecturaIA := nil;
end;

procedure TfLecturaIA.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not EstaEnProceso;
end;

procedure TfLecturaIA.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TfLecturaIA.ObtenerUnidadConPDFToText(const RutaPDF: string): string;
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

function TfLecturaIA.ExtraerCodigosBarrasFiel(const RutaPDF: string): TStringList;
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

function TfLecturaIA.ExtraerNomenclaturaMuniFiel(const RutaPDF: string): string;
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
          if Pos('LINK:', LineaActual) > 0 then
          begin
            // 2. Intentamos extraer de la misma línea (después de 'NC:')
            Fragmento := Copy(LineaActual, Pos('LINK:', LineaActual) + 5, Length(LineaActual)-1);
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
function TfLecturaIA.LimpiarSoloNumeros(const S: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
    if S[i] in ['0'..'9'] then Result := Result + S[i];
end;

procedure TfLecturaIA.ExtraerBarrasMunicipales(const RutaPDF: string; var Barra32, Barra99: string);
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

procedure TfLecturaIA.ExtraerBarrasRentas(const RutaPDF: string; var Barra32, Barra99: string);
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

function TfLecturaIA.ExtraerCuentaRentas(const RutaPDF: string): string;
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

procedure TfLecturaIA.ExtraerBarrasRapido(const RutaPDF: string; out Barra1, Barra2: string);
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

function TfLecturaIA.VerificarZBarListo: Boolean;
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

