unit Funciones;

interface

uses frmDatos, Variants, OleServer, ComObj, ActiveX, Windows, Messages, SysUtils,
     Declaraciones, Dialogs, Inifiles, Forms, Controls, Buttons, stdCtrls,
     ppReport, ppTypes, ppRegion, ppDBJit, AliGrid, ContNrs, voEHandler,  strUtils,
     Ribbon, ActnMan, ActnList, dbClient, AdvGrid,Classes, Registry, voDispositivos,
     FXQuery, Data.DB, mAPI.sENDmAIL, jclMapi;

  function CrearQuery: TFXQuery;
  function ToFloat(Valor: string; Defecto:  Double = 0): Double;
  function ToInt(Valor: string; Defecto:  Integer = 0): Integer;
  procedure ImprimirReporte(var Reporte: TppReport; Pipeline : TppJITPipeline = nil; Grilla : TStringAlignGrid = nil;
            Value: String = '0'; SucursalManual: Boolean = false; sEMail : String = ''; ListaReportes : TObjectList = nil;
            sNombreDocumento: String = ''; p_stNombrePlantilla:String = ''); overload;
  procedure ImprimirReporte(var Reporte: TppReport; objMail: TMail; Pipeline : TppJITPipeline = nil; Grilla : TStringAlignGrid = nil;
  Value: String = '0'; SucursalManual: Boolean = false; sEMail : String = ''; ListaReportes : TObjectList = nil;
  sNombreDocumento: String = ''; p_stNombrePlantilla:String = ''); overload;
  procedure ImprimirReporte(boModal: Boolean; var Reporte: TppReport; objMail: TMail; Pipeline : TppJITPipeline = nil; Grilla : TStringAlignGrid = nil;
  Value: String = '0'; SucursalManual: Boolean = false; sEMail : String = ''; ListaReportes : TObjectList = nil;
  sNombreDocumento: String = ''; p_stNombrePlantilla:String = ''); overload;

  procedure SeleccionarDispositivo(var Reporte: TppReport; Value: String; SucursalManual : Boolean; sEMail : String = '';
                                   ListaReportes : TObjectList = nil; sNombreDocumento: String = '';  p_stNombrePlantilla:String = ''); overload;
  procedure SeleccionarDispositivo(var Reporte: TppReport; objMail: TMail; SucursalManual : Boolean; sEMail : String = '';
                                   ListaReportes : TObjectList = nil; sNombreDocumento: String = '';  p_stNombrePlantilla:String = ''); overload;
  procedure SeleccionarDispositivo(BoModal: Boolean; var Reporte: TppReport; objMail: TMail; SucursalManual : Boolean; sEMail : String = '';
                                   ListaReportes : TObjectList = nil; sNombreDocumento: String = '';  p_stNombrePlantilla:String = ''); overload;
  function GrillaVacia(Grilla : TStringAlignGrid) : Boolean;
  function ConvertToBoolean(pValor : String) : Boolean;
  function ConvertToDouble(pValor : String; pDefault : Double = 0) : Double;
  function ConvertToInteger(pValor : String; pDefault : Integer = 0) : Integer;
  function ConvertToDate(pValor : String; pDefault : TDate = 0) : TDate;
  function ConvertToTime(pValor : String; pDefault : TTime = 0) : TTime;
  function ConvertToDateTime(pValor : String; pDefault : TDateTime = 0) : TDateTime;
  function EnviarMail(const Subject, Body, FileName, SenderName, SenderEMail, RecepientName, RecepientEMail: String) : Boolean;
  function fxCargarLibreria(pNombreLibreria : String) : THandle;
  procedure SetearImageIndex(Item : TActionClientItem);
  procedure EliminarRecibo(Codinq, Tipo, Letra, numero: string);
  function ObtenerRutaBD: string;
  function fxGenerarBackup:Boolean;
  function ObtenerRealizaBackup: Integer;
  function BoolToInt(Value: Boolean):Integer;
  function fxDepurarBase: Boolean;

  function ValidarNumero(var ANumero: string): string;
  function FechaAlReves(AFecha: string): string;
  function TransformaFecha(AFecha: string): string;
  function FechaAmericana(AFecha: string): string;
  function MesExpensas(var AMes: string): string;
  function DaMes(AMes: string): string;
  function AgregarPunto(var ASinPunto: string): string;
  function FechaConBarras(AFecha: string): string;
  function LargoCodigo(var ACodigo: string): string;
  function DevuelveMes(AMes: Integer): string; overload;
  function DevuelveMes(AMes: String): Integer; overload;

  function ValidarDatoFijo(var AFecha, ANumero: string): Boolean;
  function importeenletras(var Importe: string):string; overload;
  function importeenletras(var Valor: Currency):string; overload;
  function AgregarPunto2(var ASinPunto: string): string;
  function Sumar(var AUno, ADos: string): string;
  function Restar(var AUno, ADos: string): string;
  function TransformarFecha(var AFecha: string): string;
  function Conversion(var AValor: string): string;
  function FechaEnLetras(var AFecha: string): string;
  function FechaCorrecta(var AFecha: string): string;
  function DiasHabiles(ADias: Integer): string;
  function ObtenerRutaExcel: string;
  function ObtenerServername: string;

  function ObtenerCeldaInicial(AHoja: string): Integer;
  procedure MostrarDialogoAceptar(Titulo:string;Mensaje:string;TipoDialogo:TMsgDlgType);overload;
  procedure MostrarDialogoAceptar(Mensaje:string;TipoDialogo:TMsgDlgType);overload;
  procedure MostrarDialogoAceptar(Mensaje:string);overload;
  function MostrarDialogoSiNo(Titulo: string; Mensaje: string; TipoDialogo:TMsgDlgType; BotonDefecto: TMsgDlgBtn = mbNo):boolean;overload;
  function MostrarDialogoSiNo(Mensaje: string; TipoDialogo:TMsgDlgType; BotonDefecto: TMsgDlgBtn = mbYes):boolean;overload;
  function MostrarDialogoSiNo(Mensaje: String; BotonDefecto: TMsgDlgBtn = mbYes) : Boolean; overload;
  function MostrarDialogoSiNo(Titulo, Mensaje: String; BotonDefecto: TMsgDlgBtn = mbYes) : Boolean; overload;
  function InsertarItemautom(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; pboValidaExistencia: Boolean = False): Integer;
  procedure InsertarMasItem(MasItems: TClientDataSet; Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string; IDMovimiento: Integer);
  procedure InsertarMasItemA(MasItemsA: TClientDataSet; Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string);
  procedure InsertarMasItemR(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string; Orden: Integer; PrioridadFecha: Integer);
  procedure InsertarLiqinOrig(LiqinOrig: TClientDataset; Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras, Coditem, dniPropietario, Propietario: string; IDMovimiento: Integer);
  procedure InsertarLiqPrOrig(LiqPrOrig: TClientDataSet; Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; Orden, PrioridadFecha: Integer);
  procedure InsertarLiqPrOrigBase(Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; Orden, PrioridadFecha, Registro: Integer);
  procedure InsertarMasItemP(MasItemsp: TClientDataSet; Codinq, uBICACION, Importe: sTRING);
  procedure InsertarMasItemBase(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string; Orden: Integer; PrioridadFecha: Integer);
  procedure InsertarRepProp(Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; ItemEntero, Propietario:string);
  procedure InsertarRepProp2(Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; ItemEntero, Propietario:string);
  procedure InsertarCaja(IDTransaccion: Integer; Fecha, Codinq, Tipo, Letra, numero: string);
  procedure InsertarCajaDetalles(IDTransaccion: Integer; Codinq, Coditem, Fecha, Linea, Item, periodo, Entra, Sale: string; IDMovimiento: Integer);
  procedure InsertarCabezaRecibo(Codinq, Fecha, Tipo, Letra, numero, Pendiente: string; PendienteRetirar, UsoClave: Integer);
  procedure InsertarCabezaVale(CODIGO: Integer; DESCRIPCION:string; CODIGOCATEGORIA: Integer; MONTO, PENDIENTE:Double; Mes: Integer; Anio, CodigoEmpresa: Integer);
  procedure InsertarCuerpoVale(CODIGO, Linea: Integer; Codinq, CodigoItem, DESCRIPCION:string; Fecha: TDatetime; Entra, Sale:Double; CodigoInterno: String; EsManual, PasadoACaja: Integer);
  procedure InsertarAnomalia(Codinq, Fecha, Tipo, Letra, numero, Anomalia: string);

  procedure InsertarCuerpoRecibo(Codinq, Fecha, tIPO, Letra, Numero, Linea,
    Inquilino, direccion, iva, Item, Periodo, Importe, Total, Letras, Coditem, dniPropietario, Propietario: string; IDMovimiento: Integer);
  procedure InsertarImpuestos(Codinq, Fecha, tIPO, Letra, Numero,
    Item, Periodo, Importe: string; IDMovimiento: Integer);
  function fxObtenerCodigo(pstTabla: string; pstCampo: string = 'CODIGO'): Integer;
  function cuotadgr(Mes,Anio:string; pnicuotas: Integer):string;
  function periodoimpuestos(Mes, Anio: string):string;
  function fxObtenerProximoNumero(pCodinq: Double; Letra: String; Tipo: string): Double;
  function fxBuscarCedulon(ID, Fecha, Importe, pMes, pAnio:string; pCuota: boolean; pgrilla: TADVStringGrid;
    var pniIndice, niColID, niColImporte: Integer; niFila: Integer = 1; boBuscaEnBD: Boolean = True): Boolean;
  procedure prTraducirCodigoBarras(ATexto: string; var pID:string; var pFecha: String;var pImporte: string; pidDesde, pIDHasta,
    pFechaDesde, pFechaHasta, pImporteDesde, pImporteHasta: Integer; fPorcentajeRecargo: Double);
  function fxRedondearImporte(pndImporte, pndRedondeo:Double):Double;
  function ValidarEmail(var Value: string): string;
  procedure MostrarDialogoError(pstMensaje : String);overload;
  procedure MostrarDialogoError(pstMensaje, pstMensajeGenerico: String; erException : Exception);overload;
  function fxObtenerMail(sCodigoABuscar:String; boEsPropietario: Boolean):String;
  function Strip( s: string; Modo: byte = 0): string;
  function periodoalquiler(Mes, Anio:string):string;
  function ObtenerID(pGenerador: string): LongInt;
  procedure MultiSort(a: TStringAlignGrid; C: array of Integer; T: array of String);

implementation
uses
  frmPrincipal;

CONST
  CR = #13;
  LF = #10;
  CRLF = CR + LF;

  procedure MultiSort(a: TStringAlignGrid; C: array of Integer; T: array of String);
{
********************************************************************************
Diego A
Como utilizar este procedimiento:

  primer parametro es la grilla a ordenar
  segundo parametro son las columnas a ordenar en forma de vector de enteros
  tercer parámetro son los tipos de datos correspondientes a cada columna a ordenar

  Este método ordena de menor a mayor.

  ej MultiSort(gDetalle, [2,5,7,9], ['S', 'N', 'D', 'S']);
********************************************************************************
}
  function Comparar(F,X:integer;V : array of string) : Integer;
  var
    n1,n2 : Double;
    d1,d2 : TDateTime;
  begin
    if AnsiUpperCase(T[X])='N' then
    begin
      if not TryStrToFloat(A.Cells[C[X],F], n1) then
        n1 := -1000;
      if not TryStrToFloat(V[X], n2) then
        n2 := -1000;

      if n1<n2 then
        result := -1
      else if n1>n2 then
        result := 1
      else
      begin
        if X < high(C) then
          result := Comparar(F,X+1,V)
        else
          result := 0;
      end;
    end
    else if AnsiUpperCase(T[X])='D' then
    begin
      if not TryStrToDateTime(A.Cells[C[X],F],d1) then
        d1 := -1000;
      if not TryStrToDateTime(V[X],d2) then
        d2 := -1000;

      if d1<d2 then
        result := -1
      else if d1>d2 then
        result := 1
      else
      begin
        if X < high(C) then
          result := Comparar(F,X+1,V)
        else
          result := 0;
      end;
    end
    else
    begin
      if A.Cells[C[X],F] < V[X] then
        result := -1
      else if A.Cells[C[X],F] > V[X] then
        result := 1
      else
      begin
        if X < high(C) then
          result := Comparar(F,X+1,V)
        else
          result := 0;
      end;
    end;
  end;

  procedure QS(L,H:Integer);
  var
    xL,xH,I:Integer;
    m:array of String;
  begin
    if L >= H then
      exit;
    xL := L;
    xH := H;
    SetLength(M,High(C)+1);
    for I := 0 to High(C) do
      M[i] := A.Cells[C[i],(L+H)div 2];
    while xL < xH do
    begin
      while Comparar(xH,0,M) > 0 do Dec(xH);
      while Comparar(xL,0,M) < 0 do Inc(xL);
      if xL <= xH then
      begin
        if xL < xH then
          a.ExchangeRow(xL,xH);
        inc(xL);
        dec(xH);
      end;
    end;
    if xH > L then QS(L,xH);
    if xL < H then QS(xL,H);
  end;
begin
  if High(C) <> High(T) then
    exit;

  try
    A.BeginUpdate;
    QS(1,A.RowCount-1);
  finally
    A.EndUpdate;
  end;
end;


procedure prTraducirCodigoBarras(ATexto: string; var pID:string; var pFecha: String;var pImporte: string; pidDesde, pIDHasta,
  pFechaDesde, pFechaHasta, pImporteDesde, pImporteHasta: Integer; fPorcentajeRecargo: Double);
begin
  pID := Copy(ATexto, pIdDesde, pIDHasta - pIDDesde + 1);
  pFecha := Copy(Copy(ATexto, pFechaDesde, pFechaHasta - pFechaDesde+1),1,2) + '/' +
    Copy(Copy(ATexto, pFechaDesde, pFechaHasta - pFechaDesde+1),3,2) + '/' +
    Copy(Copy(ATexto, pFechaDesde, pFechaHasta - pFechaDesde+1),5,4);
  pImporte := FormatFloat('0.00', (ToFloat(Copy(ATexto, pImporteDesde, pImporteHasta - pImporteDesde+1))/100)*(1+FPorcentajeRecargo/100));
end;

function fxBuscarCedulon(ID, Fecha, Importe, pMes, pAnio:string; pCuota: boolean; pgrilla: TADVStringGrid;
  var pniIndice, niColID, niColImporte: Integer; niFila: Integer = 1; boBuscaEnBD: Boolean = True): Boolean;
var
  I: Integer;
  q: TFXQuery;
begin
  Result := False;

  for I := niFila to pGrilla.RowCount - 1 do
  begin
    if pGrilla.Cells[niColID, I] = ID then
    begin
      pniIndice := I;
      Result := True;
      Break;
    end;
  end;

  if boBuscaEnBD then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        ' Select Cuenta '+
        '   From CuerpoCedulones '+
        '  Where Cuenta =:Cuenta '+
        '    and Importe =:Importe '+
        '    and Mes =:Mes '+
        '    and Anio =:Anio '+
        '    and Cuota50 =:Cuota50 ';
      q.ParamByName('Cuenta').AsString := ID;
      q.ParamByName('Importe').AsFloat := ToFloat(Importe);
      q.ParamByName('Mes').AsString := pMes;
      q.ParamByName('Anio').AsInteger := ToInt(pAnio);
      if pCuota then
        q.ParamByName('Cuota50').AsInteger := 1
      else
        q.ParamByName('Cuota50').AsInteger := 0;
      q.Open;

      if not q.IsEmpty then
        Result := True;
    finally
      FreeAndNil(q);
    end;
  end;
end;

function fxGenerarBackup: Boolean;
var
  sPath: string;
  sPathOrigen: string;
  ip: string;
begin
  ip := '\\'+ObtenerServername + ':';
  sPath := Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4) + 'Backups\'+ FormatDatetime('dd_mm_yyyy', Now)+'\Inmosys.gdb';
//  sPath :=  'D:\Backups\'+ FormatDatetime('dd_mm_yyyy', Now)+'\Inmosys.gdb';
  Result := True;
  try
//    SetCurrentDir('D:\');
//    try
//      MkDir(PWideCHar('Backups'));
//    except
//
//    end;
//    SetCurrentDir('D:\Backups');
//    try
//      MkDir(PWideCHar(FormatDatetime('dd_mm_yyyy', Date)));
//    except
//
//    end;

    SetCurrentDir(Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4));
    try
      MkDir(PWideCHar('Backups'));
    except

    end;
    SetCurrentDir(Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4)+'Backups');
    try
      MkDir(PWideCHar(FormatDatetime('dd_mm_yyyy', Date)));
    except

    end;
    sPathOrigen :=obtenerRutaBD;

    if Pos('192.', sPathOrigen) > 0 then
      sPathOrigen := Copy(sPathOrigen, Pos(':', sPathOrigen) + 1, 100);

//    sPathOrigen := ip + sPathOrigen;
//    spathOrigen := AnsiReplaceStr(Uppercase(spathOrigen),'C:\','C\');

//    spath := IP + spath;
//    spath := AnsiReplaceStr(UpperCase(spath),'C:\','C\');

//    Showmessage(sPathOrigen);
//    Showmessage(sPath);

    CopyFile(PChar(sPathOrigen), PChar(sPath), False);

  Except
    Result := False;
  end;
end;

function fxDepurarBase: Boolean;
var
  sPath: string;
  sPathOriginal: string;

  qDepurar: TFXQuery;
begin
  sPath := Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4) + 'Data\Inmosys.gdb';

  sPathOriginal := obtenerRutaBD;

  if Pos('192.', sPathOriginal) > 0 then
    sPathOriginal := Copy(sPathOriginal, Pos(':', sPathOriginal) + 1, 100);

  Result := True;
  try
    SetCurrentDir(Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4)+'\Data');

    if CopyFile(pWideChar(spathOriginal), PWideChar(sPath), True) then
    begin
      DM.ConectarBD(sPath);

      qDepurar := CrearQuery;
      DM.IniciarTransaccion;
      try
        try
          qDepurar.SQL.Text := 'Execute procedure sp_borrarinactivas';
          qDepurar.ExecSQL();

          qDepurar.SQL.Text := 'delete from inmuebles where activo = 0';
          qDepurar.ExecSQL();

          dm.ConfirmarTransaccion;
        except
          dm.CancelarTransaccion;
        end;
      finally
        freeAndNil(qDepurar);
      end;

      DM.ConectarBD(sPathOriginal);
    end;
  Except
    Result := False;
  end;
end;

procedure InsertarImpuestos(Codinq, Fecha, tIPO, Letra, Numero,
    Item, Periodo, Importe: string; IDMovimiento: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    try
      q.SQL.Text := ' INSERT INTO IMPUESTOS (CODINQ, FECHA, TIPO, LETRA, NUMERO, ITEM, PERIODO, IMPORTE, PAGADO, USUARIO, IDMOVIMIENTO) ' +
                                   ' VALUES (:CODINQ, :FECHA, :TIPO, :LETRA, :NUMERO, :ITEM, :PERIODO, :IMPORTE, 0, :USUARIO, :IDMovimiento)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('FECHA').AsDatetime := Now;
      q.ParamByName('tIPO').AsString :=  tIPO;
      q.ParamByName('Letra').AsString :=  Letra;
      q.ParamByName('numero').AsString := numero;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := AnsiReplaceStr(Importe, '-', '');
      q.ParamByName('IDMovimiento').AsInteger := IDMovimiento;
      q.ParamByName('USUARIO').AsString := fPrincipal.fUsuario;
      q.ExecSQL;
    except
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarCuerpoRecibo(Codinq, Fecha, tIPO, Letra, Numero, Linea,
    Inquilino, direccion, iva, Item, Periodo, Importe, Total, Letras, Coditem, dniPropietario, Propietario: string; IDMovimiento: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    q.SQL.Text := ' INSERT INTO CUERPORECIBOS (CODINQ, FECHA, TIPO, LETRA, NUMERO, LINEA, inquilino, direccion, iva, ITEM, PERIODO, IMPORTE, total, letras, coditem, dnipropietario, propietario, IDMovimiento) ' +
                                 ' VALUES (:CODINQ, :FECHA, :TIPO, :LETRA, :NUMERO, :LINEA, :inquilino, :direccion, :iva, :ITEM, :PERIODO, :IMPORTE, :total, :letras, :coditem, :dnipropietario, :propietario, :IDMovimiento)';
    q.ParamByName('CODINQ').AsString := Codinq;
    q.ParamByName('FECHA').AsString :=  Fecha;
    q.ParamByName('tIPO').AsString :=  tIPO;
    q.ParamByName('Letra').AsString :=  Letra;
    q.ParamByName('numero').AsString := numero;
    q.ParamByName('Linea').AsString :=  Linea;
    q.ParamByName('Inquilino').AsString := Copy(Inquilino, 1, 50);
    q.ParamByName('direccion').AsString := Copy(Direccion, 1, 50);
    q.ParamByName('iva').AsString := iva;
    q.ParamByName('ITEM').AsString :=   Copy(Item, 1, 50);
    q.ParamByName('PERIODO').AsString := Copy(Periodo, 1, 50);
    q.ParamByName('IMPORTE').AsString := Importe;
    q.ParamByName('total').AsString := Total;
    q.ParamByName('Letras').AsString := letras;
    q.ParamByName('CODITEM').AsString := Coditem;
    q.ParamByName('dniPropietario').AsString := dniPropietario;
    q.ParamByName('Propietario').AsString := Propietario;
    q.ParamByName('IDMovimiento').AsInteger := IDMovimiento;
    q.ExecSQL;
  finally
    FreeAndNil(q);
  end;
end;

procedure EliminarRecibo(Codinq, Tipo, Letra, numero: string);
var
  q: TFXQuery;
  qBorrar: TFXQuery;

begin
  q := CrearQuery;
  qBorrar := CrearQuery;
  try
      q.SQL.Text := ' DELETE FROM CABEZARECIBOS  WHERE Tipo=:Tipo AND LETRA=:LETRA AND NUMERO=:NUMERO';
      q.ParamByName('Tipo').AsString := Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(numero,'-',''));
      q.ExecSql;

      if Letra <> 'P' then
      begin
        q.SQL.Text := ' Select * FROM CUERPORECIBOS  WHERE Tipo=:Tipo AND LETRA=:LETRA AND NUMERO=:NUMERO';
        q.ParamByName('Tipo').AsString := Tipo;
        q.ParamByName('letra').AsString :=  letra;
        q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(numero,'-',''));
        q.Open;

        while not q.eof do
        begin
          qBorrar.SQL.Text := ' DELETE FROM CTACTEINQUILINO WHERE idmOVIMIENTO =:idmOVIMIENTO AND Haber <> 0';
          qBorrar.ParamByName('idmOVIMIENTO').AsInteger :=  q.FieldByName('IDMovimiento').AsInteger;
          qBorrar.ExecSql;

          qBorrar.SQL.Text := ' DELETE FROM IMPUESTOS WHERE Tipo=:Tipo AND LETRA=:LETRA AND NUMERO=:NUMERO AND PAGADO = 0';
          qBorrar.ParamByName('Tipo').AsString := Tipo;
          qBorrar.ParamByName('letra').AsString :=  letra;
          qBorrar.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(numero,'-',''));
          qBorrar.ExecSql;
          q.Next;
        end;
      end;

      q.SQL.Text := ' DELETE FROM CUERPORECIBOS  WHERE Tipo=:Tipo AND LETRA=:LETRA AND NUMERO=:NUMERO';
      q.ParamByName('Tipo').AsString := Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(numero,'-',''));
      q.ExecSql;
  finally
    FreeAndNil(q);
    FreeAndNil(qBorrar);
  end;
end;

procedure InsertarCabezaRecibo(Codinq, Fecha, Tipo, Letra, numero, Pendiente: string; PendienteRetirar, UsoClave: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
      q.SQL.Text := ' DELETE FROM CABEZARECIBOS  WHERE CODINQ=:CODINQ AND tipo=:tipo and LETRA=:LETRA AND NUMERO=:NUMERO';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsString :=  numero;
      q.ExecSql;

      q.SQL.Text := ' DELETE FROM CUERPORECIBOS  WHERE CODINQ=:CODINQ AND tipo=:tipo and LETRA=:LETRA AND NUMERO=:NUMERO';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsString :=  numero;
      q.ExecSql;

      q.SQL.Text := ' INSERT INTO CABEZARECIBOS (CODINQ, FECHA, TIPO, LETRA, NUMERO, PENDIENTE, USUARIO, PENDIENTERETIRAR, USUARIOCAJA, USOCLAVE, CONTROLADO) ' +
                                   ' VALUES (:CODINQ, :FECHA, :TIPO, :LETRA, :NUMERO, :PENDIENTE, :USUARIO, :PENDIENTERETIRAR, :USUARIOCAJA, :USOCLAVE, :CONTROLADO)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('FECHA').AsDATETIME :=  now;
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsString :=  numero;
      q.ParamByName('uSUARIO').AsString :=  fPrincipal.fUsuario;
      q.ParamByName('pendiente').AsString :=   '1';
      q.ParamByName('pendienteRETIRAR').AsInteger := PendienteRetirar;
      q.ParamByName('uSUARIOcaja').AsString :=  fPrincipal.fUsuario;
      q.ParamByName('USOCLAVE').AsInteger :=  UsoClave;
      q.ParamByName('CONTROLADO').AsInteger := 0;
      q.ExecSql;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarAnomalia(Codinq, Fecha, Tipo, Letra, numero, Anomalia: string);
var
  q: TFXQuery;
  qID: TFXQuery;
  id: iNTEGER;
begin
  q := CrearQuery;
  qID := CrearQuery;
  try
    try
      qID.SQL.Text := 'Select Coalesce(Max(ID),0) + 1 as ID from ANomalias';
      qID.Open;

      ID := qID.FieldByName('ID').AsInteger;

      q.SQL.Text := ' INSERT INTO ANOMALIAS (ID, FECHA, CODINQ, TIPO, LETRA, NUMERO, ANOMALIA, USUARIO) '+
                    ' VALUES (:ID, :FECHA, :CODINQ, :TIPO, :LETRA, :NUMERO, :ANOMALIA, :USUARIO) ';

      q.ParamByName('ID').AsInteger := ID;
      q.ParamByName('FECHA').AsDATETIME :=  now;
      q.ParamByName('Codinq').AsString :=  Codinq;
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsString :=  numero;
      q.ParamByName('Anomalia').AsString :=  Anomalia;
      q.ParamByName('uSUARIO').AsString :=  fPrincipal.fUsuario;
      q.ExecSql;
    except
    end;
  finally
    FreeAndNil(q);
  end;
end;


procedure InsertarCabezaVale(CODIGO: Integer; DESCRIPCION:string; CODIGOCATEGORIA: Integer; MONTO, PENDIENTE:Double; Mes: Integer; Anio, CodigoEmpresa: Integer);
var
  q: TFXQuery;
  Consulta: string;

begin
  q := CrearQuery;
  try
    Consulta :=
      ' INSERT INTO CABEZAVALES (CODIGO, DESCRIPCION, CODIGOCATEGORIA, MES, ANIO, MONTO, PENDIENTE, CERRADO, CODIGOEMPRESA) '+
      ' VALUES (:CODIGO, :DESCRIPCION, :CODIGOCATEGORIA, :MES, :ANIO, :MONTO, :PENDIENTE, :CERRADO, :CODIGOEMPRESA)';
    q.SQL.Text := Consulta;
    q.ParamByName('Codigo').AsInteger  := Codigo;
    q.ParamByName('Descripcion').AsString :=  Descripcion;
    q.ParamByName('CODIGOCategoria').AsInteger := CodigoCategoria;
    q.ParamByName('Mes').AsInteger :=  Mes;
    q.ParamByName('Anio').AsInteger :=  Anio;
    q.ParamByName('Monto').AsFloat :=  Monto;
    q.ParamByName('Pendiente').AsFloat :=  Pendiente;
    q.ParamByName('Cerrado').AsBoolean :=  False;
    q.ParamByName('CodigoEmpresa').AsInteger :=  CodigoEmpresa;
    q.ExecSQL;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarCuerpoVale(CODIGO, Linea: Integer; Codinq, CodigoItem, DESCRIPCION:string; Fecha: TDatetime; Entra, Sale:Double; CodigoInterno: String; EsManual, PasadoAcaja: Integer);
var
  q: TFXQuery;
  Consulta: string;

begin
  q := CrearQuery;
  try
    Consulta :=
      ' INSERT INTO CUERPOVALES (CODIGO, CODINQ, FECHA, LINEA, CODIGOITEM, DESCRIPCION, ENTRA, SALE, ID, USUARIO, ESMANUAL, PASADOACAJA) '+
      ' VALUES (:CODIGO, :CODINQ, :FECHA, :LINEA, :CODIGOITEM, :DESCRIPCION, :ENTRA, :SALE, :ID, :USUARIO, :ESMANUAL, :PASADOACAJA)';
    q.SQL.Text := Consulta;
    q.ParamByName('Codigo').AsInteger  := Codigo;
    q.ParamByName('Codinq').AsString  := Codinq;
    q.ParamByName('Fecha').AsDatetime  := Fecha;
    q.ParamByName('Linea').AsInteger  := Linea;
    q.ParamByName('CodigoItem').AsString  := CodigoItem;
    q.ParamByName('Descripcion').AsString :=  Descripcion;
    q.ParamByName('Entra').AsFloat :=  Entra;
    q.ParamByName('Sale').AsFloat :=  Sale;
    q.ParamByName('ID').AsString := CodigoInterno;
    q.ParamByName('USUARIO').AsString := fPrincipal.FUsuario;
    q.ParamByName('ESMANUAL').AsInteger := EsManual;
    q.ParamByName('PASADOACAJA').AsInteger := PasadoACaja;
    q.ExecSQL;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarCaja(IDTransaccion: Integer; Fecha, Codinq, Tipo, Letra, numero: string);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
      q.SQL.Text := ' INSERT INTO CAJA (IDTRANSACCION, FECHA, CODINQ, TIPO, LETRA, NUMERO, USUARIO, CODIGOCAJA) ' +
                                   ' VALUES (:IDTransaccion, :FECHA, :CODINQ, :TIPO, :LETRA, :NUMERO, :USUARIO, :CODIGOCAJA)';
      q.ParamByName('idtransaccion').AsInteger  := IDTransaccion;
      q.ParamByName('FECHA').AsDATETIME :=  StrToDate(fecha);
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsFloat :=  ToFloat(numero);
      q.ParamByName('USUARIO').AsString :=  fPrincipal.fUsuario;
      q.ParamByName('CODIGOCAJA').AsInteger :=  fPrincipal.fCodigoCaja;
      q.ExecSql;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarCajaDetalles(IDTransaccion: Integer; Codinq, Coditem, Fecha, Linea, Item, periodo, Entra, Sale: string; IDMovimiento: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
      Periodo := AnsiReplaceStr(Periodo, 'IMP Y/O SERVICIOS', '');
      Periodo := AnsiReplaceStr(Periodo, 'IMPUESTOS A DESCONTAR', '');

      q.SQL.Text := ' INSERT INTO CAJADETALLES(IDTRANSACCION, CODINQ, CODITEM, FECHA, ITEM, PERIODO, ENTRA, SALE, LINEA, IDMOVIMIENTO) ' +
                                   ' VALUES (:IDTRANSACCION, :CODINQ, :CODITEM, :FECHA, :ITEM, :PERIODO, :ENTRA, :SALE, :LINEA, :IDMOVIMIENTO)';
      q.ParamByName('idtransaccion').AsInteger  := IDTransaccion;
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('CODITEM').AsString := CodiTEM;
      q.ParamByName('FECHA').AsDATETIME :=  StrToDate(fecha);
      q.ParamByName('Item').AsString :=  Item;
      q.ParamByName('Periodo').AsString := Trim(Periodo);
      if Entra = '' then
        Entra := '0';
      if Sale = '' then
        Sale := '0';

      if ToFloat(Entra) < 0 then
        q.ParamByName('Entra').AsFloat :=  ToFloat(Entra)*-1
      else
        q.ParamByName('Entra').AsFloat :=  ToFloat(Entra);

      if ToFloat(Sale) < 0 then
        q.ParamByName('Sale').AsFloat :=  ToFloat(Sale)*-1
      else
        q.ParamByName('Sale').AsFloat :=  ToFloat(Sale);

      q.ParamByName('Linea').AsInteger :=  ToiNT(lINEA);
      q.ParamByName('IDMovimiento').AsInteger :=  IDMovimiento;
      q.ExecSql;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarLiqinOrig(LiqinOrig: TClientDataset; Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total,Letras, Coditem, dniPropietario, Propietario: string; IDMovimiento: Integer);
begin
  try
    try
      LiqinOrig.Append;
      LiqinOrig.Fieldbyname('CODINQ').AsString := Codinq;
      LiqinOrig.Fieldbyname('INQUILINO').AsString :=  Inquilino;
      LiqinOrig.Fieldbyname('FECHA').AsString :=  Fecha;
      LiqinOrig.Fieldbyname('DIRECCION').AsString :=  Direccion;
      LiqinOrig.Fieldbyname('IVA').AsString :=   Iva;
      LiqinOrig.Fieldbyname('ITEM').AsString :=   Item;
      LiqinOrig.Fieldbyname('PERIODO').AsString := Periodo;
      LiqinOrig.Fieldbyname('IMPORTE').AsString := Importe;
      LiqinOrig.Fieldbyname('TOTAL').AsString := TOTAL;
      LiqinOrig.Fieldbyname('LETRAS').AsString := LETRAS;
      LiqinOrig.Fieldbyname('CODITEM').AsString := CODITEM;
      LiqinOrig.Fieldbyname('DNIPropietario').AsString := DNIPropietario;
      LiqinOrig.Fieldbyname('PROPIETARIO').AsString := pROPIETARIO;
      LiqinOrig.Fieldbyname('IDMovimiento').AsInteger := IDMovimiento;
//      LiqinOrig.Fieldbyname('Seleccionado').AsBoolean := True;
      LiqinOrig.Post;
    except
    end;
  finally
  end;
end;

procedure InsertarLiqPrOrigBase(Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; Orden, PrioridadFecha, Registro: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' INSERT INTO LIQprORIG (CODINQ, INQUILINO, FECHA, DIRECCION, IVA, ITEM, PERIODO, IMPORTE, TOTAL, LETRAS, ORDEN, PRIORIDADFECHA, REGISTRO, usuario) ' +
                                   ' VALUES (:CODINQ, :INQUILINO, :FECHA, :DIRECCION, :IVA, :ITEM, :PERIODO, :IMPORTE, :TOTAL, :LETRAS, :ORDEN, :PRIORIDADFECHA, :REGISTRO, :usuario)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('INQUILINO').AsString :=  Inquilino;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('DIRECCION').AsString :=  Direccion;
      q.ParamByName('IVA').AsString :=   Iva;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := Importe;
      q.ParamByName('TOTAL').AsString := TOTAL;
      q.ParamByName('LETRAS').AsString := LETRAS;
      q.ParamByName('ORDEN').AsInteger := Orden;
      q.ParamByName('PRIORIDADFECHA').AsInteger := PrioridadFecha;
      q.ParamByName('REGISTRO').AsInteger := Registro;
      q.ParamByName('USUARIO').AsString := fPrincipal.FUsuario;
      q.ExecSQL;
      dm.ConfirmarTransaccion;
    except
      dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarLiqPrOrig(LiqPrOrig: TClientDataSet; Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; Orden, PrioridadFecha: Integer);
begin
  try
    try
      LiqPrOrig.Append;
      LiqPrOrig.FieldbyName('CODINQ').AsString := Codinq;
      LiqPrOrig.FieldbyName('INQUILINO').AsString :=  Inquilino;
      LiqPrOrig.FieldbyName('FECHA').AsString :=  Fecha;
      LiqPrOrig.FieldbyName('DIRECCION').AsString :=  Direccion;
      LiqPrOrig.FieldbyName('IVA').AsString :=   Iva;
      LiqPrOrig.FieldbyName('ITEM').AsString :=   Item;
      LiqPrOrig.FieldbyName('PERIODO').AsString := Periodo;
      LiqPrOrig.FieldbyName('IMPORTE').AsString := Importe;
      LiqPrOrig.FieldbyName('TOTAL').AsString := TOTAL;
      LiqPrOrig.FieldbyName('LETRAS').AsString := LETRAS;
      LiqPrOrig.FieldbyName('ORDEN').AsInteger := Orden;
      LiqPrOrig.FieldbyName('PRIORIDADFECHA').AsInteger := PrioridadFecha;
      LiqPrOrig.Post;
    except
    end;
  finally
  end;
end;

procedure InsertarMasItem(MasItems: TClientDataSet; Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string; IDMovimiento: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    try
      MasItems.Append;
      MasItems.Fieldbyname('CODINQ').AsString := Codinq;
      MasItems.Fieldbyname('FECHA').AsString :=  Fecha;
      MasItems.Fieldbyname('ITEM').AsString :=   Item;
      MasItems.Fieldbyname('PERIODO').AsString := Periodo;
      MasItems.Fieldbyname('IMPORTE').AsString := Importe;
      MasItems.Fieldbyname('CODPRO').AsString := CodPro;
      MasItems.Fieldbyname('CODITEM').AsString := Coditem;
      MasItems.Fieldbyname('CLAVE').AsString :=  Fecha + Codinq + Coditem;
      MasItems.Fieldbyname('TIPOINGRESO').AsString := Inttostr(TipoIngreso);
      MasItems.Fieldbyname('DNIPropietario').AsString := DNIPropietario;
      MasItems.Fieldbyname('Referente').AsString := Referente;
      MasItems.Fieldbyname('Registro').AsInteger := IDMovimiento;
      MasItems.Post;
    except
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarMasItemA(MasItemsA: TClientDataSet; Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    try
      MasItemsA.Append;
      MasItemsA.Fieldbyname('CODINQ').AsString := Codinq;
      MasItemsA.Fieldbyname('FECHA').AsString :=  Fecha;
      MasItemsA.Fieldbyname('ITEM').AsString :=   Item;
      MasItemsA.Fieldbyname('PERIODO').AsString := Periodo;
      MasItemsA.Fieldbyname('IMPORTE').AsString := Importe;
      MasItemsA.Fieldbyname('CODPRO').AsString := CodPro;
      MasItemsA.Fieldbyname('CODITEM').AsString := Coditem;
      MasItemsA.Fieldbyname('CLAVE').AsString :=  Fecha + Codinq + Coditem;
      MasItemsA.Fieldbyname('TIPOINGRESO').AsString := Inttostr(TipoIngreso);
      MasItemsA.Fieldbyname('DNIPropietario').AsString := DNIPropietario;
      MasItemsA.Fieldbyname('Referente').AsString := Referente;
      MasItemsA.Post;
    except
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarMasItemR(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string; Orden: Integer; PrioridadFecha: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' INSERT INTO MASITEMSR (CODINQ, FECHA, ITEM, PERIODO, IMPORTE, CODPRO, CODITEM, CLAVE, TIPOINGRESO, ORDEN, PRIORIDADFECHA, REGISTRO, USUARIO) ' +
                                   ' VALUES (:CODINQ, :FECHA, :ITEM, :PERIODO, :IMPORTE, :CODPRO, :CODITEM, :CLAVE, :TIPOINGRESO, :ORDEN, :PRIORIDADFECHA, :REGISTRO, :USUARIO)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := Importe;
      q.ParamByName('CODPRO').AsString := CodPro;
      q.ParamByName('CODITEM').AsString := Coditem;
      q.ParamByName('CLAVE').AsString :=  Fecha + Codinq + Coditem;
      q.ParamByName('TIPOINGRESO').AsString := Inttostr(TipoIngreso);
      q.ParamByName('Orden').AsInteger := Orden;
      q.ParamByName('Registro').AsInteger := Registro;
      q.ParamByName('PrioridadFecha').AsInteger := PrioridadFecha;
      q.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
      q.ExecSQL;
      dm.ConfirmarTransaccion;
    except
      dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarRepProp(Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; ItemEntero, Propietario:string);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' INSERT INTO REPPROP (CODINQ, INQUILINO, FECHA, DIRECCION, IVA, ITEM, PERIODO, IMPORTE, TOTAL, LETRAS, ITEMENTERO, registro, PROPIETARIO, USUARIO) ' +
                                   ' VALUES (:CODINQ, :INQUILINO, :FECHA, :DIRECCION, :IVA, :ITEM, :PERIODO, :IMPORTE, :TOTAL, :LETRAS, :ITEMENTERO,(Select Gen_ID(GEN_repprop, 1) from RDB$DATABASE), :PROPIETARIO, :USUARIO)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('INQUILINO').AsString :=  Inquilino;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('DIRECCION').AsString :=  Direccion;
      q.ParamByName('IVA').AsString :=   Iva;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := Importe;
      q.ParamByName('TOTAL').AsString := TOTAL;
      q.ParamByName('LETRAS').AsString := LETRAS;
      q.ParamByName('ITEMENTERO').Asstring := ITEMENTERO;
      q.ParamByName('PROPIETARIO').Asstring := propietario;
      q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
      q.ExecSQL;
      dm.ConfirmarTransaccion;
    except
      dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarRepProp2(Codinq, Inquilino, Fecha, Direccion, Iva, Item, Periodo, Importe, Total, Letras: string; ItemEntero, Propietario:string);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' INSERT INTO REPPROP2 (CODINQ, INQUILINO, FECHA, DIRECCION, IVA, ITEM, PERIODO, IMPORTE, TOTAL, LETRAS, ITEMENTERO, registro, Propietario, USUARIO) ' +
                                   ' VALUES (:CODINQ, :INQUILINO, :FECHA, :DIRECCION, :IVA, :ITEM, :PERIODO, :IMPORTE, :TOTAL, :LETRAS, :ITEMENTERO, (Select Gen_ID(GEN_repprop, 1) from RDB$DATABASE), :Propietario, :Usuario)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('INQUILINO').AsString :=  Inquilino;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('DIRECCION').AsString :=  Direccion;
      q.ParamByName('IVA').AsString :=   Iva;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := Importe;
      q.ParamByName('TOTAL').AsString := TOTAL;
      q.ParamByName('LETRAS').AsString := LETRAS;
      q.ParamByName('ITEMENTERO').Asstring := ITEMENTERO;
      q.ParamByName('Propietario').Asstring := Propietario;
      q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
      q.ExecSQL;
      DM.ConfirmarTransaccion;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;
procedure InsertarMasItemBase(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; Registro: Integer; DniPropietario: string; Referente: string; Orden: Integer; PrioridadFecha: Integer);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' INSERT INTO MASITEMS (CODINQ, FECHA, ITEM, PERIODO, IMPORTE, CODPRO, CODITEM, CLAVE, TIPOINGRESO, REGISTRO, DNIPROPIETARIO, REFERENTE, ORDEN, PRIORIDADFECHA, usuario) ' +
                                   ' VALUES (:CODINQ, :FECHA, :ITEM, :PERIODO, :IMPORTE, :CODPRO, :CODITEM, :CLAVE, :TIPOINGRESO, (Select Gen_ID(GEN_ITEMAUTOM, 1) from RDB$DATABASE), :DNIPROPIETARIO, :REFERENTE, :ORDEN, :PRIORIDADFECHA, :usuario)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := Importe;
      q.ParamByName('CODPRO').AsString := CodPro;
      q.ParamByName('CODITEM').AsString := Coditem;
      q.ParamByName('CLAVE').AsString :=  Fecha + Codinq + Coditem;
      q.ParamByName('TIPOINGRESO').AsString := Inttostr(TipoIngreso);
      q.ParamByName('DNIPropietario').AsString := DNIPropietario;
      q.ParamByName('Referente').AsString := Referente;
      q.ParamByName('Orden').AsInteger := Orden;
      q.ParamByName('PrioridadFecha').AsInteger := PrioridadFecha;
      q.ParamByName('Usuario').AsString := fPrincipal.FUsuario;
      q.ExecSQL;
      DM.ConfirmarTransaccion;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure InsertarMasItemP(MasItemsp : TClientDataSet;Codinq, uBICACION, Importe: sTRING);
begin
  try
    try
      MasItemsP.Append;

      MasItemsP.FieldByName('CODINQ').AsString := Codinq;
      MasItemsP.FieldByName('UBICACION').AsString :=  UBICACION;
      MasItemsP.FieldByName('IMPORTE').AsString := Importe;
      MasItemsP.Post;
    except
    end;
  finally
  end;
end;

function InsertarItemautom(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer; pboValidaExistencia: Boolean = False): Integer;
var
  q: TFXQuery;
  qRegistro: TFXQuery;
  Existe: Boolean;

  function fxValidarExistencia(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem: string; TipoIngreso: Integer): Boolean;
  var
    q: TFXQuery;
  begin
    Result := False;
    q := CrearQuery;
    try
      q.SQL.Text := 'Select Coditem ' +
                    '  From ItemAutom' +
                    ' Where Codinq = :Codinq '+
                    '   And Coditem = :Coditem '+
                    '   and Item = :Item '+
                    '   and Periodo = :Periodo '+
                    '   and Importe = :Importe ';
      q.ParamByName('COdinq').AsString := Codinq;
      q.ParamByName('COditem').AsString := Coditem;
      q.ParamByName('Item').AsString := Item;
      q.ParamByName('Periodo').AsString := Periodo;
      q.ParamByName('Importe').AsString := Importe;
      q.Open;

      Result := not q.IsEmpty;
    finally
      q.Free;
    end;

  end;

begin
  Result := -1;
  q := CrearQuery;
  qRegistro := CrearQuery;

  if pboValidaExistencia then
    if fxValidarExistencia(Codinq, Fecha, Item, Periodo, Importe, CodPro, Coditem, TipoIngreso) then
      Exit;

  try
    try
      qRegistro.SQL.Text := 'Select Gen_ID(GEN_ITEMAUTOM, 1) as ID from RDB$DATABASE ';
      qRegistro.Open;

      Result := qRegistro.FieldByName('ID').AsInteger;

      qRegistro.Sql.text := 'Select Registro from Itemautom where Registro = :Registro ';
      qRegistro.ParambyName('Registro').AsInteger := Result;
      qRegistro.Open;

      Existe := not qRegistro.IsEmpty;

      while Existe do
      begin
        qRegistro.SQL.Text := 'Select Gen_ID(GEN_ITEMAUTOM, 1) as ID from RDB$DATABASE ';
        qRegistro.Open;

        Result := qRegistro.FieldByName('ID').AsInteger;
        qRegistro.Sql.text := 'Select Registro from Itemautom where Registro = :Registro ';
        qRegistro.ParambyName('Registro').AsInteger := Result;
        qRegistro.Open;

        Existe := not qRegistro.IsEmpty;
      end;

      q.SQL.Text := ' INSERT INTO ITEMAUTOM (CODINQ, FECHA, ITEM, PERIODO, IMPORTE, CODPRO, CODITEM, CLAVE, TIPOINGRESO, REGISTRO, usuario) ' +
                                   ' VALUES (:CODINQ, :FECHA, :ITEM, :PERIODO, :IMPORTE, :CODPRO, :CODITEM, :CLAVE, :TIPOINGRESO, :Registro, :usuario)';
      q.ParamByName('CODINQ').AsString := Codinq;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('ITEM').AsString :=   Item;
      q.ParamByName('PERIODO').AsString := Periodo;
      q.ParamByName('IMPORTE').AsString := Importe;
      q.ParamByName('CODPRO').AsString := CodPro;
      q.ParamByName('CODITEM').AsString := Coditem;
      q.ParamByName('CLAVE').AsString :=  Fecha + Codinq + Coditem;
      q.ParamByName('TIPOINGRESO').AsString := Inttostr(TipoIngreso);
      q.ParamByName('REGISTRO').AsInteger := Result;
      q.ParamByName('USUARIO').AsString := fPrincipal.fUsuario;
      q.ExecSQL;
    except
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qRegistro);
  end;
end;

procedure SetearImageIndex(Item : TActionClientItem);
var
  i : Integer;
  ActItem : TActionClientItem;

begin
  for i := 0 to Item.Items.Count-1 do
  begin
    ActItem := TActionClientItem(Item.Items[i]);
    SetearImageIndex(ActItem);
  end;

  if Assigned(Item.Action) then
    Item.ImageIndex := TAction(Item.Action).ImageIndex;
end;

function ConvertToBoolean(pValor : String) : Boolean;
begin
  pValor := Trim(AnsiUpperCase(pValor));
  Result := ((pValor = '1') or (pValor = 'S') or (pValor = 'SI'));
end;

function ConvertToDouble(pValor : String; pDefault : Double = 0.0) : Double;
var
  nDoubleValue : Double;
  pActualDecimalSeparator, pActualThousandSeparator : Char;
begin
  pActualDecimalSeparator := DecimalSeparator;
  pActualThousandSeparator := ThousandSeparator;

  DecimalSeparator:=','; ThousandSeparator:='.';

  try
    nDoubleValue := pDefault;

    pValor := Trim(pValor);

    if pValor <> '' then
      pValor := AnsiReplaceStr(pValor, 'N/C', '');

    if pValor <> '' then
    begin
      pValor := AnsiReplaceStr(pValor, '%', '');
      pValor := AnsiReplaceStr(pValor, '(', '-');
      pValor := AnsiReplaceStr(pValor, ')', '');
      pValor := AnsiReplaceStr(pValor, ' ', '');

      if not TryStrToFloat(pValor, nDoubleValue) then
        nDoubleValue := pDefault;
    end;
  finally
    Result := nDoubleValue;
    DecimalSeparator := pActualDecimalSeparator;
    ThousandSeparator := pActualThousandSeparator;
  end;
end;

function EnviarMail(const Subject, Body, FileName, SenderName, SenderEMail, RecepientName, RecepientEMail: String) : Boolean;
var
  MAPISendMail: TMAPISendMail;
  stRecepientEmail, lMailDefault: string;
  lRegistry: TRegistry;
  stDireccion: string;
begin
  MAPISendMail := TMAPISendMail.Create;
  lRegistry := TRegistry.Create(KEY_READ);

  try
    try
      lRegistry.RootKey := hkey_local_machine;
      lRegistry.OpenKey('SOFTWARE\Clients\Mail',true);
      lMailDefault := lRegistry.ReadString('');
      lMailDefault := AnsiUpperCase(lMailDefault);
      lRegistry.CloseKey;

      if lMailDefault <> 'MOZILLA THUNDERBIRD' then
          stRecepientEmail := AnsiReplaceStr(RecepientEMail, ',', ';');
    finally
      FreeAndNil(lRegistry);
    end;


    if (Subject<>'') then
      MAPISendMail.MailSubject := Subject;

    if (Body<>'') then
      MAPISendMail.MailBody := Body;


    if RecepientEMail <> '' then
      if Pos(';', stRecepientEmail) > 0 then
      begin
          stDireccion := Copy(stRecepientEmail, 1, Pos(';', stRecepientEMail)-1);
          stDireccion := AnsiReplaceStr(stdireccion, #34, '');
          MAPISendMail.AddRecipient(stDireccion, '', rkTO);
          stDireccion := Copy(stRecepientEmail, Pos(';', stRecepientEMail) + 1, 500);
          stDireccion := AnsiReplaceStr(stdireccion, #34, '');
          MAPISendMail.AddRecipient(stdireccion, '', rkTO);
      end
      else
      begin
         stDireccion := AnsiReplaceStr(stRecepientEmail, #34, '');

         MAPISendMail.AddRecipient(stRecepientEmail, '', rkTO);
      end;
    if FileName <> '' then
        MAPISendMail.AddAttachment(FileName);

    Result := MAPISendMail.SendMail;
  except
    on e:exception do
    begin
      Result := false;
      MostrarDialogoAceptar( 'Error al llamar a su programa de correo electrónico:'+ #13#10 + 'Msg.Sys.:' + e.message);
    end;
  end;
end;

function ConvertToInteger(pValor : String; pDefault : Integer = 0) : Integer;
var
  nIntegerValue : Integer;
begin
  nIntegerValue := pDefault;

  pValor := Trim(pValor);
  if pValor <> '' then
    TryStrToInt(pValor, nIntegerValue);

  Result := nIntegerValue;
end;

function ConvertToDate(pValor : String; pDefault : TDate = 0) : TDate;
var
  nDateValue : TDateTime;
begin
  nDateValue := pDefault;

  pValor := Trim(pValor);
  if pValor <> '' then
    TryStrToDate(pValor, nDateValue);

  Result := nDateValue;
end;

function ConvertToTime(pValor : String; pDefault : TTime = 0) : TTime;
var
  nTimeValue : TDateTime;
begin
  nTimeValue := pDefault;

  pValor := Trim(pValor);
  if pValor <> '' then
    TryStrToTime(pValor, nTimeValue);

  Result := nTimeValue;
end;

function ConvertToDateTime(pValor : String; pDefault : TDateTime = 0) : TDateTime;
var
  nDateTimeValue : TDateTime;
begin
  nDateTimeValue := pDefault;

  pValor := Trim(pValor);
  if pValor <> '' then
    TryStrToDateTime(pValor, nDateTimeValue);

  Result := nDateTimeValue;
end;

function ToFloat(Valor: string; Defecto:  Double = 0): Double;
begin
  try
    Result := Strtofloat(Valor);
  except
    Result := Defecto;
  end;
end;

function ToInt(Valor: string; Defecto:  Integer = 0): Integer;
begin
  try
    Result := StrtoInt(Valor);
  except
    Result := Defecto;
  end;
end;

function GrillaVacia(Grilla : TStringAlignGrid) : Boolean;
var
  i, j :Integer;
  bVacio : Boolean;
begin
  i := 0;
  bVacio := True;
  while (i < Grilla.RowCount-1) and bVacio do
  begin
    inc(i);
    j := -1;
    while (j < Grilla.ColCount-1) and bVacio do
    begin
      inc(j);
      bVacio := (Trim(Grilla.Cells[j,i]) = '');
    end;
  end;

  result := bVacio;
end;

function fxCargarLibreria(pNombreLibreria : String) : THandle;
begin
  if FileExists(Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4)+'\Librerias\Menues.dll') then
    pNombreLibreria := Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4)+'\Librerias\Menues.dll';

  try
    Result := LoadLibrary(pChar(pNombreLibreria));
  except
    Result := 0;
  end;
end;

procedure SeleccionarDispositivo(var Reporte: TppReport; Value: String; SucursalManual : Boolean; sEMail : String = '';
                                 ListaReportes : TObjectList = nil; sNombreDocumento: String = '';  p_stNombrePlantilla:String = '');
var
  Disp : TfmDispositivos;
begin
  try
    Disp := TfmDispositivos.Create( nil );
    Disp.Reporte := Reporte;
    Disp.ListaReportes := ListaReportes;
    Disp.sMail := sEMail;
    Disp.sNombreDocumento := sNombreDocumento;
    Disp.nombrePlantilla :=  p_stNombrePlantilla;
    if Value = '0' then
    begin
      if fPrincipal.ActiveMDIChild <> nil then
      begin
        if Pos('_', fPrincipal.ActiveMDIChild.Name) = 0 then
          Disp.IdFormulario := fPrincipal.ActiveMDIChild.Name
        else
          Disp.IdFormulario := Copy(fPrincipal.ActiveMDIChild.Name, 1, Pos('_', fPrincipal.ActiveMDIChild.Name)-1);
      end
    end
    else
     Disp.IdFormulario := Value;

    Disp.EsSucursalManual := SucursalManual;
    Disp.ShowModal;
  finally
    FreeAndNil(Disp);
  end;
end;

procedure SeleccionarDispositivo(var Reporte: TppReport; objMail: TMail; SucursalManual : Boolean; sEMail : String = '';
                                 ListaReportes : TObjectList = nil; sNombreDocumento: String = '';  p_stNombrePlantilla:String = '');
var
  Disp : TfmDispositivos;
begin
  try
    Disp := TfmDispositivos.Create( nil );
    Disp.Reporte := Reporte;
    Disp.ListaReportes := ListaReportes;
    Disp.sMail := sEMail;
    Disp.sNombreDocumento := sNombreDocumento;
    Disp.nombrePlantilla :=  p_stNombrePlantilla;
    Disp.objMail := objMail;
(*    if Value = '0' then
    begin
      if fPrincipal.ActiveMDIChild <> nil then
      begin
        if Pos('_', fPrincipal.ActiveMDIChild.Name) = 0 then
          Disp.IdFormulario := fPrincipal.ActiveMDIChild.Name
        else
          Disp.IdFormulario := Copy(fPrincipal.ActiveMDIChild.Name, 1, Pos('_', fPrincipal.ActiveMDIChild.Name)-1);
      end
    end
    else*)
    Disp.IdFormulario := '0';

    Disp.EsSucursalManual := SucursalManual;
    Disp.ShowModal;
  finally
    FreeAndNil(Disp);
  end;
end;

procedure SeleccionarDispositivo(boModal: Boolean; var Reporte: TppReport; objMail: TMail; SucursalManual : Boolean; sEMail : String = '';
                                 ListaReportes : TObjectList = nil; sNombreDocumento: String = '';  p_stNombrePlantilla:String = '');
var
  Disp : TfmDispositivos;
begin
  try
    Disp := TfmDispositivos.Create( nil );
    Disp.Reporte := Reporte;
    Disp.ListaReportes := ListaReportes;
    Disp.sMail := sEMail;
    Disp.sNombreDocumento := sNombreDocumento;
    Disp.nombrePlantilla :=  p_stNombrePlantilla;
    Disp.objMail := objMail;
(*    if Value = '0' then
    begin
      if fPrincipal.ActiveMDIChild <> nil then
      begin
        if Pos('_', fPrincipal.ActiveMDIChild.Name) = 0 then
          Disp.IdFormulario := fPrincipal.ActiveMDIChild.Name
        else
          Disp.IdFormulario := Copy(fPrincipal.ActiveMDIChild.Name, 1, Pos('_', fPrincipal.ActiveMDIChild.Name)-1);
      end
    end
    else*)
    Disp.IdFormulario := '0';

    Disp.EsSucursalManual := SucursalManual;
    if boModal then
      Disp.ShowModal
    else
    begin
      Disp.Show;
      Disp.btnMailClick(nil);
      Disp.Close;
    end;

  finally
    FreeAndNil(Disp);
  end;
end;

procedure ImprimirReporte(var Reporte: TppReport; Pipeline : TppJITPipeline = nil; Grilla : TStringAlignGrid = nil;
Value: String = '0'; SucursalManual: Boolean = false; sEMail : String = ''; ListaReportes : TObjectList = nil;
sNombreDocumento: String = ''; p_stNombrePlantilla:String = '');
var
  EH : TEHandler;
begin
  if (Grilla <> nil) and (Pipeline <> nil) then
  begin
    if GrillaVacia(Grilla) then
      Exit;
    EH := TEHandler.Create;
    try
        EH.Grilla := Grilla;
        EH.Datos := Pipeline;
        SeleccionarDispositivo(Reporte, Value, SucursalManual, sEMail, ListaReportes,sNombreDocumento,p_stNombrePlantilla);
    finally
      EH.Free;
    end
  end
  else
    SeleccionarDispositivo(Reporte, Value, SucursalManual, sEMail, ListaReportes, sNombreDocumento,p_stNombrePlantilla);
end;

procedure ImprimirReporte(var Reporte: TppReport; objMail: TMail; Pipeline : TppJITPipeline = nil; Grilla : TStringAlignGrid = nil;
Value: String = '0'; SucursalManual: Boolean = false; sEMail : String = ''; ListaReportes : TObjectList = nil;
sNombreDocumento: String = ''; p_stNombrePlantilla:String = '');
var
  EH : TEHandler;
begin
  if (Grilla <> nil) and (Pipeline <> nil) then
  begin
    if GrillaVacia(Grilla) then
      Exit;
    EH := TEHandler.Create;
    try
        EH.Grilla := Grilla;
        EH.Datos := Pipeline;
        SeleccionarDispositivo(Reporte, objMail, SucursalManual, sEMail, ListaReportes,sNombreDocumento,p_stNombrePlantilla);
    finally
      EH.Free;
    end
  end
  else
    SeleccionarDispositivo(Reporte, objMail, SucursalManual, sEMail, ListaReportes, sNombreDocumento,p_stNombrePlantilla);
end;

procedure ImprimirReporte(boModal: Boolean; var Reporte: TppReport; objMail: TMail; Pipeline : TppJITPipeline = nil; Grilla : TStringAlignGrid = nil;
Value: String = '0'; SucursalManual: Boolean = false; sEMail : String = ''; ListaReportes : TObjectList = nil;
sNombreDocumento: String = ''; p_stNombrePlantilla:String = '');
var
  EH : TEHandler;
begin
  if (Grilla <> nil) and (Pipeline <> nil) then
  begin
    if GrillaVacia(Grilla) then
      Exit;
    EH := TEHandler.Create;
    try
        EH.Grilla := Grilla;
        EH.Datos := Pipeline;
        SeleccionarDispositivo(boModal, reporte, objMail, SucursalManual, sEMail, ListaReportes,sNombreDocumento,p_stNombrePlantilla);
    finally
      EH.Free;
    end
  end
  else
    SeleccionarDispositivo(boModal, Reporte, objMail, SucursalManual, sEMail, ListaReportes, sNombreDocumento,p_stNombrePlantilla);
end;


function MostrarDialogoSiNo(Titulo:string;Mensaje: string;TipoDialogo:TMsgDlgType; BotonDefecto: TMsgDlgBtn = mbNo):boolean;
var
  msgDlg: TForm;
begin
  msgDlg:=CreateMessageDialog(Mensaje,TipoDialogo,[mbYes,mbNo], BotonDefecto);
  msgDlg.Caption:=Titulo;
  msgDlg.FormStyle:=fsNormal;
  (msgDlg.Components[2] as TButton).Caption:='&Si';
  Application.ProcessMessages;
  MostrarDialogoSiNo := (msgDlg.ShowModal=6);
  FreeAndNil(msgDlg);
end;

function MostrarDialogoSiNo(Mensaje:string;TipoDialogo:TMsgDlgType; BotonDefecto: TMsgDlgBtn = mbYes):boolean;overload;
var
msgDlg: TForm;
begin
  msgDlg:=CreateMessageDialog(Mensaje,TipoDialogo,[mbYes,mbNo], BotonDefecto);
  case TipoDialogo of
    mtWarning: msgDlg.Caption:='Advertencia';
    mtError: msgDlg.Caption:='Error';
    mtInformation: msgDlg.Caption:='Información';
    mtConfirmation: msgDlg.Caption:='Confirmación';
    mtCustom: msgDlg.Caption:='Inmosys';
  end;
  msgDlg.FormStyle:=fsNormal;
  (msgDlg.Components[2] as TButton).Caption:='&Si';
  Application.ProcessMessages;
  MostrarDialogoSiNo := (msgDlg.ShowModal=6);
  FreeAndNil(msgDlg);
end;

function MostrarDialogoSiNo(Mensaje: String; BotonDefecto: TMsgDlgBtn = mbYes) : Boolean; overload;
begin
  result := MostrarDialogoSiNo(Mensaje, mtConfirmation, BotonDefecto);
end;

function MostrarDialogoSiNo(Titulo, Mensaje: String; BotonDefecto: TMsgDlgBtn = mbYes) : Boolean; overload;
begin
  result := MostrarDialogoSiNo(Titulo, Mensaje, mtConfirmation, BotonDefecto);
end;

procedure MostrarDialogoAceptar(Titulo:string;Mensaje:string;TipoDialogo:TMsgDlgType);overload;
var
msgDlg: TForm;
begin
  msgDlg := CreateMessageDialog(Mensaje,TipoDialogo,[mbOK]);
  msgDlg.Caption:=Titulo;
  msgDlg.FormStyle:=fsNormal;
  (msgDlg.Components[2] as TButton).Caption:='&Aceptar';
  Application.ProcessMessages;
  msgDlg.ShowModal;
  FreeAndNil(msgDlg);
end;


procedure MostrarDialogoAceptar(Mensaje:string;TipoDialogo:TMsgDlgType);overload;
var
  msgDlg: TForm;
begin
  msgDlg:=CreateMessageDialog(Mensaje,TipoDialogo,[mbOK]);
  Application.ProcessMessages;
  case TipoDialogo of
    mtWarning: msgDlg.Caption:='Advertencia';
    mtError: msgDlg.Caption:='Error';
    mtInformation: msgDlg.Caption:='Información';
    mtConfirmation: msgDlg.Caption:='Confirmación';
    mtCustom: msgDlg.Caption:='Inmosys';
  end;
  msgDlg.FormStyle:=fsNormal;
  (msgDlg.Components[2] as TButton).Caption:='&Aceptar';
  Application.ProcessMessages;
  msgDlg.ShowModal;
  FreeAndNil(msgDlg);
end;
procedure MostrarDialogoAceptar(Mensaje:string);overload;
begin
  MostrarDialogoAceptar(Mensaje, mtInformation);
  Application.ProcessMessages;
end;

function FechaCorrecta(var AFecha: string): string;
begin
  if (Length(AFecha) = 0) or (AFecha = '  /  /    ') then
  begin
    Result := FormatDateTime('dd/mm/yyyy',Date());
    Exit;
  end;
  if Length(AFecha) = 6 then
  begin
    Result := TransformaFecha(AFecha);
    Exit;
  end;
  if Length(AFecha) = 10 then
    Result := AFecha;
end;

function FechaEnLetras(var AFecha: string): string;
var
  dia:    string;
  mes:    string;
  ano:    string;
  fecha1: string;

begin
  fecha1 := Afecha;
  delete(Afecha, 3, 8);
  dia    := Afecha;
  Afecha := fecha1;
  delete(Afecha, 6, 5);
  delete(Afecha, 1, 3);
  mes    := Afecha;
  Afecha := fecha1;
  delete(Afecha, 1, 6);
  ano := Afecha;
  if mes = '01' then mes := 'Enero';
  if mes = '02' then mes := 'Febrero';
  if mes = '03' then mes := 'Marzo';
  if mes = '04' then mes := 'Abril';
  if mes = '05' then mes := 'Mayo';
  if mes = '06' then mes := 'Junio';
  if mes = '07' then mes := 'Julio';
  if mes = '08' then mes := 'Agosto';
  if mes = '09' then mes := 'Septiembre';
  if mes = '10' then mes := 'Octubre';
  if mes = '11' then mes := 'Noviembre';
  if mes = '12' then mes := 'Diciembre';
  Result := dia + ' de ' + mes + ' de ' + ano;
end;


function validardatofijo(var AFecha, ANumero: string): Boolean;
begin
  Result := True;
  case strtoint(AFecha) of
    5: Result := (StrToInt(ANumero) < 2);
    10:Result := (StrToInt(ANumero) <> 1);
  end;
end;

function AgregarPunto(var ASinPunto: string): string;
begin
  if ASinPunto[Length(ASinPunto) - 1] = '.' then
    Result := ASinPunto + '0';
  if ASinPunto[Length(ASinPunto) - 2] = '.' then
    Result := ASinPunto;
  if ASinPunto[Length(ASinPunto) - 2] <> '.' then
    Result := ASinPunto + '.00';
end;

function MesExpensas(var AMes: string): string;
begin
  if AMes = 'ENE' then Result := '01';
  if AMes = 'FEB' then Result := '02';
  if AMes = 'MAR' then Result := '03';
  if AMes = 'ABR' then Result := '04';
  if AMes = 'MAY' then Result := '05';
  if AMes = 'JUN' then Result := '06';
  if AMes = 'JUL' then Result := '07';
  if AMes = 'AGO' then Result := '08';
  if (AMes='SEP') or (AMes='SET') then Result := '09';
  if AMes = 'OCT' then Result := '10';
  if AMes = 'NOV' then Result := '11';
  if AMes = 'DIC' then Result := '12';
end;

function DaMes(AMes: string): string;
var
  Mes: Integer;
begin
  Mes := StrToInt(AMes);
  if Mes = 1 then Result := 'ENE';
  if Mes = 2 then Result := 'FEB';
  if Mes = 3 then Result := 'MAR';
  if Mes = 4 then Result := 'ABR';
  if Mes = 5 then Result := 'MAY';
  if Mes = 6 then Result := 'JUN';
  if Mes = 7 then Result := 'JUL';
  if Mes = 8 then Result := 'AGO';
  if Mes = 9 then Result := 'SEP';
  if Mes = 10 then Result := 'OCT';
  if Mes = 11 then Result := 'NOV';
  if Mes = 12 then Result := 'DIC';
end;

function FechaConBarras(AFecha: string): string;
var
  Dia:   string;
  Mes:   string;
  Ano:   string;
  Fecha: string;

begin
  if AFecha <> '' then
  begin
    Fecha := AFecha;
    Delete(Fecha,1,6);
    Dia   := Fecha;
    Fecha := AFecha;
    Delete(Fecha,1,4);
    Delete(Fecha,3,2);
    Mes:=Fecha;
    Fecha := AFecha;
    Delete(Fecha,5,4);
    Ano := Fecha;
    Result := dia + '/' + Mes + '/' + Ano;
  end
  else
    Result := '';
end;
function BoolToInt(Value: Boolean):Integer;
begin
  if Value then
    Result := 1
  else
    Result := 0;
end;

function ValidarNumero(var ANumero: string): string;
begin
  Result := FormatFLoat('0.00', ToFloat(ANumero));
end;

function DiasHabiles(ADias: Integer): string;
begin
  if ADias = 1 then
    Result := 'UN (1) DIA HABIL';
  if ADias = 2 then
    Result := 'DOS (2) DIAS HABILES';
  if ADias = 3 then
    Result := 'TRES (3) DIAS HABILES';
  if ADias = 4 then
    Result := 'CUATRO (4) DIAS HABILES';
  if ADias = 5 then
    Result := 'CINCO (5) DIAS HABILES';
  if ADias = 6 then
    Result := 'SEIS (6) DIAS HABILES';
  if ADias = 7 then
    Result := 'SIETE (7) DIAS HABILES';
  if ADias = 8 then
    Result := 'OCHO (8) DIAS HABILES';
  if ADias = 9 then
    Result := 'NUEVE (9) DIAS HABILES';
  if ADias = 10 then
    Result := 'DIEZ (10) DIAS HABILES';
  if ADias = 11 then
    Result := 'ONCE (11) DIAS HABILES';
  if ADias = 12 then
    Result := 'DOCE (12) DIAS HABILES';
  if ADias = 13 then
    Result := 'TRECE (13) DIAS HABILES';
  if ADias = 14 then
    Result := 'CATORCE (14) DIAS HABILES';
  if ADias = 15 then
    Result := 'QUINCE (15) DIAS HABILES';
  if ADias = 16 then
    Result := 'DIECISEIS (16) DIAS HABILES';
  if ADias = 17 then
    Result := 'DIECISIETE (17) DIAS HABILES';
  if ADias = 18 then
    Result := 'DIECIOCHO (18) DIAS HABILES';
  if ADias = 19 then
    Result := 'DIECINUEVE (19) DIAS HABILES';
  if ADias = 20 then
    Result := 'VEINTE (20) DIAS HABILES';
end;


function DevuelveMes(AMes: Integer): string;
begin
  case AMes of
    1: Result  := 'ENERO';
    2: Result  := 'FEBRERO';
    3: Result  := 'MARZO';
    4: Result  := 'ABRIL';
    5: Result  := 'MAYO';
    6: Result  := 'JUNIO';
    7: Result  := 'JULIO';
    8: Result  := 'AGOSTO';
    9: Result  := 'SEPTIEMBRE';
    10: Result := 'OCTUBRE';
    11: Result := 'NOVIEMBRE';
    12: Result := 'DICIEMBRE';
  END;
end;

function DevuelveMes(AMes: String): Integer;
begin
  Result := 0;
  if AMes = 'ENERO' then
    Result := 1
  else if AMes = 'FEBRERO' then
    Result := 2
  else if AMes = 'MARZO' then
    Result := 3
  else if AMes = 'ABRIL' then
    Result := 4
  else if AMes = 'MAYO' then
    Result := 5
  else if AMes = 'JUNIO' then
    Result := 6
  else if AMes = 'JULIO' then
    Result := 7
  else if AMes = 'AGOSTO' then
    Result := 8
  else if AMes = 'SEPTIEMBRE' then
    Result := 9
  else if AMes = 'OCTUBRE' then
    Result := 10
  else if AMes = 'NOVIEMBRE' then
    Result := 11
  else if AMes = 'DICIEMBRE' then
    Result := 12;
end;

function TransformaFecha(AFecha: string): string;
var
  Dia:string;
  Mes:string;
  Ano:string;
  Fecha:string;

begin
  if Length(AFecha) = 6 then
  begin
    Fecha:= AFecha;
    Delete(Fecha ,3 ,4);
    Dia   := Fecha;
    Fecha := AFecha;
    Delete(Fecha, 1, 2);
    Delete(Fecha, 3, 2);
    Mes   := Fecha;
    Fecha := AFecha;
    Delete(Fecha, 1, 4);
    Ano   := Fecha;
    Result:= Dia + '/' + Mes + '/20' + Ano;
  end;
end;

function FechaAmericana(AFecha: string): string;
var
  Dia:string;
  Mes:string;
  Ano:string;
  Fecha:string;

begin
    Fecha:= AFecha;
    Delete(Fecha ,3 ,8);
    Dia   := Fecha;
    Fecha := AFecha;
    Mes   := Copy(Fecha,4,2);
    Fecha := AFecha;
    Ano   := Copy(Fecha,7,4);
    Result:= Mes + '/' + Dia +'/'+  Ano;
end;

function FechaAlReves(AFecha: string): string;
var
  Dia:   string;
  Mes:   string;
  Ano:   string;
  Fecha: string;

begin
  Fecha := AFecha;
  Delete(Fecha, 3, 8);
  Dia   := Fecha;
  Fecha := AFecha;
  Delete(Fecha, 1, 3);
  Delete(Fecha, 3, 5);
  Mes   := Fecha;
  Fecha := AFecha;
  Delete(Fecha, 1, 6);
  Ano   := Fecha;
  Result:= Ano + Mes + Dia;
end;


function CrearQuery: TFXQuery;
begin
  Result := DM.CrearQuery;
end;

function LargoCodigo(var ACodigo: string): string;
begin
  case Length(ACodigo) of
    1: Result := '000' + ACodigo;
    2: Result := '00' + ACodigo;
    3: Result := '0' + ACodigo;
  else
    Result    := ACodigo
  end;
end;
function importeenletras(var Importe: string):string; overload;
var
  Monto: Currency;

begin
  Monto := ToFloat(Importe);
  Result := ImporteEnLetras(Monto);
end;

function ImporteEnLetras(var Valor: Currency): string;
const
  UNIDADES: array[0..9] of string = ('', 'un', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve');
  DECENAS: array[0..9] of string = ('', 'diez', 'veinte', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa');
  DIECIS: array[0..9] of string = ('diez', 'once', 'doce', 'trece', 'catorce', 'quince', 'dieciséis', 'diecisiete', 'dieciocho', 'diecinueve');
  VEINTES: array[0..9] of string = ('veinte', 'veintiuno', 'veintidós', 'veintitrés', 'veinticuatro', 'veinticinco', 'veintiséis', 'veintisiete', 'veintiocho', 'veintinueve');
  CENTENAS: array[0..9] of string = ('', 'ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos');

  function Trimestre(Valor: Integer): string;
  var
    u, d, c: Integer;
  begin
    Result := '';
    c := Valor div 100;
    d := (Valor mod 100) div 10;
    u := (Valor mod 10);

    // Centenas
    if (c = 1) and (d = 0) and (u = 0) then
      Result := 'cien '
    else
      Result := CENTENAS[c] + ' ';

    // Decenas y Unidades
    case d of
      0: Result := Result + UNIDADES[u];
      1: Result := Result + DIECIS[u];
      2: if u = 0 then Result := Result + 'veinte' else Result := Result + VEINTES[u];
      3..9: if u = 0 then Result := Result + DECENAS[d] else Result := Result + DECENAS[d] + ' y ' + UNIDADES[u];
    end;
    Result := Trim(Result);
  end;

var
  nEntero: Int64;
  nDecimales: Integer;
  sLetras: string;
  m_millones, m_miles, m_unidades: Integer;

begin
  nEntero := Trunc(Valor);
  nDecimales := Round(Frac(Valor) * 100);

  if nEntero = 0 then
    sLetras := 'cero'
  else
  begin
    m_millones := nEntero div 1000000;
    m_miles := (nEntero mod 1000000) div 1000;
    m_unidades := nEntero mod 1000;

    sLetras := '';

    if m_millones > 0 then
    begin
      if m_millones = 1 then sLetras := 'un millón '
      else sLetras := Trimestre(m_millones) + ' millones ';
    end;

    if m_miles > 0 then
    begin
      if m_miles = 1 then sLetras := sLetras + 'mil '
      else sLetras := sLetras + Trimestre(m_miles) + ' mil ';
    end;

    if m_unidades > 0 then
      sLetras := sLetras + Trimestre(m_unidades);
  end;

  Result := LowerCase(Trim(sLetras)) + ' con ' + FormatFloat('00', nDecimales) + '/100';
end;

//function importeenletras(var importe:string):string;
//var
//  largo,l:integer;
// imp,centavos,letras,LetrasMil, limpio:string;
// c1,c2,c3,c4,c5,c6:string;
// begin
// imp:=importe;
// largo:=length(importe);
// delete(imp,1,largo-2);
// centavos:=imp;
// imp:=importe;
// delete(imp,largo-2,3);
// limpio:=imp;
// l:=length(imp);
// if l=1 then
//  c1:=limpio;
// if l=2 then
// begin
//  delete(limpio,1,1);
//  c1:=limpio;
//  limpio:=imp;
//  delete(limpio,2,1);
//  c2:=limpio;
// end;
// if l=3 then
// begin
//  delete(limpio,1,2);
//  c1:=limpio;
//  limpio:=imp;
//  delete(limpio,1,1);
//  delete(limpio,2,1);
//  c2:=limpio;
//  limpio:=imp;
//  delete(limpio,2,2);
//  c3:=limpio;
// end;
// if l=4 then
// begin
//  delete(limpio,1,3);
//  c1:=limpio;
//  limpio:=imp;
//  delete(limpio,1,2);
//  delete(limpio,2,1);
//  c2:=limpio;
//  limpio:=imp;
//  delete(limpio,1,1);
//  delete(limpio,2,2);
//  c3:=limpio;
//  limpio:=imp;
//  delete(limpio,2,3);
//  c4:=limpio;
// end;
// if l=5 then
// begin
//  delete(limpio,1,4);
//  c1:=limpio;
//  limpio:=imp;
//  delete(limpio,1,3);
//  delete(limpio,2,1);
//  c2:=limpio;
//  limpio:=imp;
//  delete(limpio,1,2);
//  delete(limpio,2,3);
//  c3:=limpio;
//  limpio:=imp;
//  delete(limpio,1,1);
//  delete(limpio,2,3);
//  c4:=limpio;
//  limpio:=imp;
//  delete(limpio,2,4);
//  c5:=limpio;
// end;
// if l=6 then
// begin
//  delete(limpio,1,5);
//  c1:=limpio;
//  limpio:=imp;
//  delete(limpio,1,4);
//  delete(limpio,2,1);
//  c2:=limpio;
//  limpio:=imp;
//  delete(limpio,1,3);
//  delete(limpio,2,3);
//  c3:=limpio;
//  limpio:=imp;
//  delete(limpio,1,2);
//  delete(limpio,2,4);
//  c4:=limpio;
//  limpio:=imp;
//  delete(limpio,1,1);
//  delete(limpio,2,5);
//  c5:=limpio;
//  limpio:=imp;
//  delete(limpio,2,5);
//  c6:=limpio;
// end;
//
//
//   if c1='1' then letras:='uno';
//   if c1='2' then letras:='dos';
//   if c1='3' then letras:='tres';
//   if c1='4' then letras:='cuatro';
//   if c1='5' then letras:='cinco';
//   if c1='6' then letras:='seis';
//   if c1='7' then letras:='siete';
//   if c1='8' then letras:='ocho';
//   if c1='9' then letras:='nueve';
//   if (c1='0') AND (L = 1) then letras:='cero';
//
//   {DOS CIFRAS};
//
//   if c2='1' then
//    begin
//     if c1='0' then letras:='diez';
//     if c1='1' then letras:='once';
//     if c1='2' then letras:='doce';
//     if c1='3' then letras:='trece';
//     if c1='4' then letras:='catorce';
//     if c1='5' then letras:='quince';
//     if c1='6' then letras:='dieci'+letras;
//     if c1='7' then letras:='dieci'+letras;
//     if c1='8' then letras:='dieci'+letras;
//     if c1='9' then letras:='dieci'+letras;
//    end;
// if c2='2' then
//    begin
//      if c1='0' then
//       letras:='veinte'
//      else
//       letras:='veinti'+letras;
//      end;
//    if c2='3' then
//    begin
//      if c1='0' then
//       letras:='treinta'
//      else
//       letras:='treinta y '+letras;
//      end;
//    if c2='4' then
//    begin
//      if c1='0' then
//       letras:='cuarenta'
//      else
//       letras:='cuarenta y '+letras;
//      end;
//    if c2='5' then
//    begin
//      if c1='0' then
//       letras:='cincuenta'
//      else
//       letras:='cincuenta y '+letras;
//      end;
//    if c2='6' then
//    begin
//      if c1='0' then
//       letras:='sesenta'
//      else
//       letras:='sesenta y '+letras;
//      end;
//    if c2='7' then
//    begin
//      if c1='0' then
//       letras:='setenta'
//      else
//       letras:='setenta y '+letras;
//      end;
//    if c2='8' then
//    begin
//      if c1='0' then
//       letras:='ochenta'
//      else
//       letras:='ochenta y '+letras;
//      end;
//    if c2='9' then
//    begin
//      if c1='0' then
//       letras:='noventa'
//      else
//       letras:='noventa y '+letras;
//      end;
//    if c2='0' then
//    begin
//      if c1='0' then
//        letras:=''
//      else
//       letras:=letras;
//    end;
//    if c3='1' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='cien'
//       else
//        letras:='ciento '+letras;
//     end
//     else
//      letras:='ciento '+letras;
//     end;
//    if c3='2' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='Doscientos'
//       else
//        letras:='doscientos '+letras;
//
//     end
//     else
//      letras:='doscientos '+letras;
//     end;
//    if c3='3' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='trescientos'
//    else
//        letras:='trescientos '+letras;
//
//     end
//     else
//      letras:='trescientos '+letras;
//     end;
//    if c3='4' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='cuatrocientos'
//    else
//        letras:='cuatrocientos '+letras;
//     end
//     else
//      letras:='cuatrocientos '+letras;
//     end;
//    if c3='5' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='quinientos'
//    else
//        letras:='quinientos '+letras;
//     end
//     else
//      letras:='quinientos '+letras;
//     end;
//    if c3='6' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='seiscientos'
//    else
//        letras:='seiscientos '+letras;
//     end
//     else
//      letras:='seiscientos '+letras;
//     end;
//    if c3='7' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='setecientos'
//    else
//        letras:='setecientos '+letras;
//     end
//     else
//      letras:='setecientos '+letras;
//     end;
//    if c3='8' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='ochocientos'
//    else
//        letras:='ochocientos '+letras;
//     end
//     else
//      letras:='ochocientos '+letras;
//     end;
//    if c3='9' then
//    begin
//     if c2='0' then
//     begin
//       if c1='0' then letras:='novecientos'
//    else
//        letras:='novecientos '+letras;
//     end
//     else
//      letras:='novecientos '+letras;
//     end;
//
//   if c4='1' then letrasmil:='un';
//   if c4='2' then letrasmil:='dos';
//   if c4='3' then letrasmil:='tres';
//   if c4='4' then letrasmil:='cuatro';
//   if c4='5' then letrasmil:='cinco';
//   if c4='6' then letrasmil:='seis';
//   if c4='7' then letrasmil:='siete';
//   if c4='8' then letrasmil:='ocho';
//   if c4='9' then letrasmil:='nueve';
//   if c4='0' then letrasmil:='';
//
//   {DOS CIFRAS};
//
//   if c5='1' then
//   begin
//     if c4='0' then letrasmil:='diez';
//     if c4='1' then letrasmil:='once';
//     if c4='2' then letrasmil:='doce';
//     if c4='3' then letrasmil:='trece';
//     if c4='4' then letrasmil:='catorce';
//     if c4='5' then letrasmil:='quince';
//     if c4='6' then letrasmil:='dieci'+letrasmil;
//     if c4='7' then letrasmil:='dieci'+letrasmil;
//     if c4='8' then letrasmil:='dieci'+letrasmil;
//     if c4='9' then letrasmil:='dieci'+letrasmil;
//   end;
//
//   if c5='2' then
//   begin
//      if c4='0' then
//        letrasmil:='veinte'
//      else
//       letrasmil:='veinti'+letrasmil;
//    end;
//
//    if c5='3' then
//    begin
//      if c4='0' then
//       letrasmil:='treinta'
//      else
//       letrasmil:='treinta y '+letrasmil;
//      end;
//    if c5='4' then
//    begin
//      if c4='0' then
//       letrasmil:='cuarenta'
//      else
//       letrasmil:='cuarenta y '+letrasmil;
//      end;
//    if c5='5' then
//    begin
//      if c4='0' then
//       letrasmil:='cincuenta'
//      else
//       letrasmil:='cincuenta y '+letrasmil;
//      end;
//    if c5='6' then
//    begin
//      if c4='0' then
//       letrasmil:='sesenta'
//      else
//       letrasmil:='sesenta y '+letrasmil;
//      end;
//    if c5='7' then
//    begin
//      if c4='0' then
//       letrasmil:='setenta'
//      else
//       letrasmil:='setenta y '+letrasmil;
//      end;
//    if c5='8' then
//    begin
//      if c4='0' then
//       letrasmil:='ochenta'
//      else
//       letrasmil:='ochenta y '+letrasmil;
//      end;
//    if c5='9' then
//    begin
//      if c4='0' then
//       letrasmil:='noventa'
//      else
//       letrasmil:='noventa y '+letrasmil;
//      end;
//
//    if c5='0' then
//    begin
//      if c4='0' then
//        LetrasMil:=''
//      else
//       LetrasMil:=letrasMil;
//    end;
//
//    if c6='1' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='cien'
//       else
//        LetrasMil:='ciento '+LetrasMil;
//     end
//     else
//      LetrasMil:='ciento '+LetrasMil;
//     end;
//
//    if c6='2' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='Doscientos'
//       else
//        LetrasMil:='doscientos '+LetrasMil;
//
//     end
//     else
//      LetrasMil:='doscientos '+LetrasMil;
//     end;
//    if c6='3' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='trescientos'
//    else
//        LetrasMil:='trescientos '+LetrasMil;
//
//     end
//     else
//      LetrasMil:='trescientos '+LetrasMil;
//     end;
//    if c6='4' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='cuatrocientos'
//    else
//        LetrasMil:='cuatrocientos '+LetrasMil;
//     end
//     else
//      LetrasMil:='cuatrocientos '+LetrasMil;
//     end;
//    if c6='5' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='quinientos'
//    else
//        LetrasMil:='quinientos '+LetrasMil;
//     end
//     else
//      LetrasMil:='quinientos '+LetrasMil;
//     end;
//    if c6='6' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='seiscientos'
//    else
//        LetrasMil:='seiscientos '+LetrasMil;
//     end
//     else
//      LetrasMil:='seiscientos '+LetrasMil;
//     end;
//    if c6='7' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='setecientos'
//    else
//        LetrasMil:='setecientos '+LetrasMil;
//     end
//     else
//      LetrasMil:='setecientos '+LetrasMil;
//     end;
//    if c6='8' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='ochocientos'
//    else
//        LetrasMil:='ochocientos '+LetrasMil;
//     end
//     else
//      LetrasMil:='ochocientos '+LetrasMil;
//     end;
//    if c6='9' then
//    begin
//     if c5='0' then
//     begin
//       if c4='0' then LetrasMil:='novecientos'
//    else
//        LetrasMil:='novecientos '+LetrasMil;
//     end
//     else
//      LetrasMil:='novecientos '+LetrasMil;
//     end;
//
//     if LetrasMil <> '' then
//       LetrasMil := LetrasMil + ' mil ';
//     letras := LetrasMil + letras + ' con ' + centavos +'/100';
//     importeenletras:=letras;
//end;

function Sumar(var AUno, ADos: string): string;
begin
  Result := IntToStr(StrToInt(AUno) + StrToInt(ADos));
end;

function Restar(var AUno, ADos: string): string;
begin
  Result := IntToStr(StrToInt(ADos) - StrToInt(AUno));
end;

function TransformarFecha(var AFecha: string): string;
var
  Dia: string;
  Mes: string;
  Ano: string;
  Aux: string;
begin
  Aux := AFecha;
  Delete(AFecha,3,8);
  Dia  := AFecha;
  AFecha := Aux;
  Delete(AFecha, 6, 5);
  Delete(AFecha, 1, 3);
  Mes    := Afecha;
  AFecha := Aux;
  Delete(AFecha,1,6);
  Ano := AFecha;
  if Mes = '01' then Mes := 'Enero';
  if Mes = '02' then Mes := 'Febrero';
  if Mes = '03' then Mes := 'Marzo';
  if Mes = '04' then Mes := 'Abril';
  if Mes = '05' then Mes := 'Mayo';
  if Mes = '06' then Mes := 'Junio';
  if Mes = '07' then Mes := 'Julio';
  if Mes = '08' then Mes := 'Agosto';
  if Mes = '09' then Mes := 'Septiembre';
  if Mes = '10' then Mes := 'Octubre';
  if Mes = '11' then Mes := 'Noviembre';
  if Mes = '12' then Mes := 'Diciembre';
  Result := Dia + ' de ' + Mes + ' de ' + Ano;
end;

function AgregarPunto2(var ASinPunto: string): string;
var
  Largo:    Integer;
  Importe:  string;
  Centavos: string;

begin
  Largo   := Length(ASinPunto);
  Importe := ASinPunto;
  Delete(Importe, Largo - 1, 3);
  Importe  := Importe + '.';
  Centavos := ASinPunto;
  Delete(Centavos, 1, Largo - 2);
  Result := Importe + Centavos;
end;

function conversion(var AValor: string): string;
var
  Largo:    Integer;
  I:        Integer;
  Prov:     string;
  SinPunto: string;

begin
  Largo := Length(AValor);
  for I := 0 to Largo - 1 do
    if (Largo - I) <> (Largo - 2) then
      Prov := Prov + (AValor[Largo - I]);
  for I := 0 to Largo - 2 do
    sinpunto := sinpunto + (Prov[(Largo - 1) - I]);
  Result := SinPunto;
end;




function ObtenerCeldaInicial(AHoja: string): Integer;
var
  Ini: TInifile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI' ) );
  try
    Result := Ini.ReadInteger(AHoja, 'Inicial', 1);
  finally
    Ini.Free;
  end;
end;

function ObtenerRutaExcel: string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create('C:\Inmosys\Inmosys.INI' );
  try
    Result := Ini.ReadString('RutaExcel', 'Ruta', '');
  finally
    Ini.Free;
  end;
end;

function ObtenerServername: string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI' ) );
  try
    Result := Ini.Readstring('GENERAL', 'SERVERNAME', 'LIQUIDACIONES');
  finally
    FreeAndNil(Ini);
  end;
end;

function ObtenerRutaBD: string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI' ) );
  try
    Result := Ini.Readstring('GENERAL', 'RUTA', '192.168.0.30:C:\Inmosys 4.0\Data\Inmosys.gdb');
  finally
    FreeAndNil(Ini);
  end;
end;

function ObtenerRealizaBackup: Integer;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI' ) );
  try
    Result := Ini.ReadInteger('General', 'Backup', 0);
  finally
    FreeAndNil(Ini);
  end;
end;

  function fxObtenerCodigo(pstTabla: string; pstCampo: string = 'CODIGO'): Integer;
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text :=
      ' Select Coalesce(Max('+pstCampo+'), 0) as Codigo From ' + pstTabla;
    q.Open;

    Result := q.FieldbyName('Codigo').AsInteger + 1;
  finally
    FreeAndNil(q);
  end;

end;

function cuotadgr(Mes,Anio:string; pnicuotas: Integer):string;
begin
  if pniCuotas = 4 then
  begin
    case strtoint(Mes) of
      1: Result:='1RA. CUOTA /'+Anio;
      3: result:='2DA. CUOTA /'+Anio;
      6: result:='3RA. CUOTA /'+Anio;
      9: result:='4TA. CUOTA /'+Anio;
    end;
  end
  else if pniCuotas = 10 then
  begin
    case strtoint(Mes) of
      1: Result:='1RA. CUOTA /'+Anio;
      2: result:='2DA. CUOTA /'+Anio;
      3: result:='3RA. CUOTA /'+Anio;
      4: result:='4TA. CUOTA /'+Anio;
      5: result:='5TA. CUOTA /'+Anio;
      6: result:='6TA. CUOTA /'+Anio;
      7: result:='7MA. CUOTA /'+Anio;
      8: result:='8VA. CUOTA /'+Anio;
      9: result:='9NA. CUOTA /'+Anio;
      10: result:='10MA. CUOTA /'+Anio;
    end
  end
  else if pniCuotas = 12 then
  begin
    case strtoint(Mes) of
      1: Result:='1RA. CUOTA /'+Anio;
      2: result:='2DA. CUOTA /'+Anio;
      3: result:='3RA. CUOTA /'+Anio;
      4: result:='4TA. CUOTA /'+Anio;
      5: result:='5TA. CUOTA /'+Anio;
      6: result:='6TA. CUOTA /'+Anio;
      7: result:='7MA. CUOTA /'+Anio;
      8: result:='8VA. CUOTA /'+Anio;
      9: result:='9NA. CUOTA /'+Anio;
      10: result:='10MA. CUOTA /'+Anio;
      11: result:='11VA. CUOTA /'+Anio;
      12: result:='12VA. CUOTA /'+Anio;
    end;
  end;
end;

function periodoimpuestos(Mes, Anio: string):string;
begin
  Result := 'PER. ' + Mes + '/' + Anio;
end;

function fxObtenerProximoNumero(pCodinq: Double; Letra: String; Tipo: string): Double;
var
  q: TFXQuery;
  Desde: Double;
  Hasta: Double;

begin
  Desde := pCodinq * 100000000;
  Hasta := pCodinq * 100000000 + 100000000;
  Result := 1;

  q := CrearQuery;
  try
    try
      q.SQL.Text := 'Select Coalesce(Max(Numero), 0) as Numero from CabezaRecibos Where Numero >= :Desde and Numero <= :Hasta and Letra = :Letra and Tipo = :Tipo';
      q.ParamByName('Desde').AsFloat := Desde;
      q.ParamByName('Hasta').AsFloat := Hasta;
      q.ParamByName('Letra').AsString := Letra;
      q.ParamByName('Tipo').AsString := Tipo;
      q.Open;

      if q.FieldbyName('Numero').AsFloat = 0  then
        Result := 1
      else
        Result := q.FieldbyName('Numero').AsFloat  - Desde + 1;
    except
    end;
  finally
    FreeAndNil(q);
  end;
end;

function fxRedondearImporte(pndImporte, pndRedondeo:Double):Double;
var
  ndImporte: double;
begin
  if Abs(pndRedondeo) < 0.01  then
    pndRedondeo := 1;
  ndImporte := pndImporte;

  ndImporte := ndImporte/pndRedondeo;
  ndImporte := ndImporte - Trunc(ndImporte);
  ndImporte := ndImporte * pndRedondeo;
  if ndImporte<>0 then
    ndImporte := pndRedondeo - ndImporte;
  ndImporte := pndImporte + Abs(ndImporte);

  Result := ndImporte;
end;

function ValidarEmail(var Value: string): string;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;

  begin
    Result:= False;
    for i:= 1 to Length(s) do // illegal char in s -> no valid address
      if not (CharInSet(s[i], ['a'..'z','A'..'Z','0'..'9','_','-','.'])) then
        Exit;
    Result:= True;
  end;

var
  niItem, i,len: Integer;
  namePart, serverPart: String;
  emails: TStringList;

begin // of IsValidEmail
  Result:= '';

  Value := AnsiReplaceStr(Value, ';', ',');

  emails := TStringList.Create;
  emails.Delimiter := ',';
  emails.DelimitedText := Value;
  Value := '';

  for niItem := 0 to emails.Count - 1 do
  begin
    if Trim(emails[niItem]) = '' then
    begin
      Result := Result + '';
      Continue;
    end;

    i:= Pos('@', emails[niItem]);
    namePart:= Copy(emails[niItem], 1, i - 1);
    serverPart:= Copy(emails[niItem],i+1,Length(emails[niItem]));
    len:=Length(serverPart);

    if (not (CheckAllowed(namePart) and CheckAllowed(serverPart))) or (Length(serverPart) = 0) or (Length(namePart) = 0)
        or ((len<4) or (Pos('.',serverPart)=0) or (serverPart[1]='.') or (serverPart[len]='.') or (serverPart[len-1]='.')) then
      Result := Result + emails[niItem] + CRLF
    else
      Value := Value + emails[niItem] + ',';
  end;

  Value := Copy(Value, 1, Length(Value) - 1);
end;

procedure MostrarDialogoError(pstMensaje : String);
begin
  MostrarDialogoAceptar(pstMensaje, mtError);
end;

procedure MostrarDialogoError(pstMensaje, pstMensajeGenerico: String; erException : Exception);
var
  stError : String;
begin
  stError := UpperCase(erException.Message);
  if (Pos('FOREIGN KEY', stError) <> 0) or
     (Pos('UNIQUE KEY', stError) <> 0) or
     (Pos('UNKNOWN DATABASE', stError) <> 0) then
    MostrarDialogoAceptar(pstMensaje, mtError)
  else
    MostrarDialogoAceptar(
      pstMensajeGenerico + CRLF + CRLF +
      'Detalles Técnicos: ' + erException.Message, mtError);
end;

function fxObtenerMail(sCodigoABuscar:String; boEsPropietario: Boolean):String;
var q : TFXQuery;
begin
  Result := '';

  q:=CrearQuery;
  try
    if boEsPropietario then
    begin
      q.SQL.Text :=
        ' Select MailPropietario as Mail ' +
        '   From Inmuebles '+
        '  Where Codinq = :Codigo ';
      q.ParamByName('Codigo').AsString := sCodigoABuscar;
      q.Open;
    end
    else
    begin
      q.SQL.Text :=
        ' Select MailInquilino as Mail '+
        '   From Inmuebles '+
        '  Where Codinq = :Codigo ';
      q.ParamByName('Codigo').AsString := sCodigoABuscar;
      q.Open;
    end;

    if not q.isempty then
      Result := q.FieldBYname('Mail').AsString;

  finally
    q.free;
  end;
end;

function Strip( s: string; Modo: byte = 0): string;
//
{ Pone una stripper en Flexxus :) -Saca los caracteres invalidos de un string, incluyendo el blanco-
   Si es modo = 0, es modo "blando". Relajado. Permite blancos, guiones, etc.
   Si es modo = 1, es modo HARD y no permite NINGUN INVALIDO que no sea letras/numeros    .pr.  }
type
   TCarac = TSysCharSet;

var resultado: string;
    i:integer;
    cCarac: TCarac;
begin
    cCarac := [#0..#31];
    if Modo = 1 then
       cCarac := [#0..#47, #58..#64, #91..#255];

    for i := 1 to length( s ) do
    begin
      if not CharInSet( s[ i ], cCarac ) then
         resultado := resultado + s[i];
    end;
    Result := resultado;
end;

function periodoalquiler(Mes, Anio:string):string;
begin
  Result := 'CORRESPONDE ' + Mes + '/' + Anio;
end;

function ObtenerID(pGenerador: string): LongInt;
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.sql.text := 'Select Gen_ID(' + pGenerador + ', 1) as ID from RDB$DATABASE';
    Q.Open;

    Result := q.fieldbyname('id').AsInteger;
  finally
    freeAndNil(q);
  end;
end;

end.
