unit frmdatos;

interface

uses
  SysUtils, Classes, DB,
  Declaraciones, WideStrings, DBXFirebird, System.UITypes,
  FMTBcd, dbClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Comp.Client, fxConnection, FXQuery, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, vcl.Dialogs;

type
  TNivelOptimizacion = (opNone, opOptimizaSelect, opOptimizaUpdateInsert, opOptimizaAlPalo, opOptimizaAlPaloSelect, opOptimizaOpen );
  TPorcentajes = Array [0..5] of Double;
  TDM = class(TDataModule)
    Conexion: TFXConnection;
  private
  public
    function ConectarBD(RutaBD: string): Boolean;
    function CrearQuery: TFXQuery;
    function fxCrearQuery(pOptimizacion: TNivelOptimizacion = opNone): TFXQuery;

    procedure IniciarTransaccion;
    procedure ConfirmarTransaccion;
    procedure CancelarTransaccion;
    procedure prBorrarElemento(pCodigo, pTabla, pCampoCodigo, pElemento: String);

    function GrabarRubroIndicador(const ACodigo, ADescripcion: string; Operacion: TTipoOperacion): Boolean;
    function GrabarCajas(const ACodigo, ADescripcion: string; CdsDatos: TClientDataset; Operacion: TTipoOperacion): Boolean;
    function GrabarRazonesSociales(const ACodigo, ADescripcion, AColor, ACuentaBancaria: string; APorcentaje: Double; Operacion: TTipoOperacion): Boolean;
    function GrabarIndice(const ACodigo, ADescripcion: string; APorcentajes:  TPorcentajes; Operacion: TTipoOperacion): Boolean;
    function GrabarSobres(const ACodigo, ADescripcion: string; Principal, Depende: Integer; Operacion: TTipoOperacion; Activo: Integer): Boolean;
    function GrabarVales(Codigo, Descripcion: string; Categoria: Integer; Monto, Pendiente: Double; Cerrado: Boolean; Operacion: TTipoOperacion; Mes, Anio: Integer; Codinq, Coditem: string; cdsDatos: TClientDataset): Boolean;
    function GrabarUsuarios(const ANombre, AClave: string; Operacion: TTipoOperacion): Boolean;
    function GrabarRubrosDatosFijos(const ACodigo, ADescripcion: string; Operacion: TTipoOperacion): Boolean;
    function GrabarCategoriasVales(const ACodigo, ADescripcion: string; AEsConsorcio: Boolean; Operacion: TTipoOperacion): Boolean;
    function GrabarConceptos(const ACodigo, ADescripcion: string; AInqProp, AListado,
      ASobre, ADescuenta, AOtroSobre: Integer; ATributa: Boolean; Operacion: TTipoOperacion; Orden, Rubro, Activo, Honorarios: Integer): Boolean;
    procedure BorrarInmueble(ACodigo: string);
    function GrabarIndicadores(const ACodigo, ADescripcion, Atitulo, aSQL: string; AActivo, AFormatoMoneda: Boolean; Operacion: TTipoOperacion; ARubro: Integer): Boolean;
  end;

var
  DM: TDM;

implementation

uses Funciones, frmprincipal;
{$R *.dfm}

function TDM.GrabarCajas(const ACodigo, ADescripcion: string;
  CdsDatos: TClientDataset; Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update Cajas set CodigoCaja = :Codigo, ';
    Consulta := Consulta +
      'Descripcion =:Descripcion where CodigoCaja=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into Cajas (CodigoCaja, Descripcion) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ExecSQL;

      q.SQL.Text := 'Delete from CajasUsuarios where codigocaja = :Codigo';
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ExecSQL;

      Consulta :=
        'Insert into CajasUsuarios (CodigoCaja, CodigoUsuario) ';
      Consulta := Consulta +
        'Values (:Codigo, :CodigoUsuario)';

      while not cdsDatos.eof do
      begin
        if cdsDatos.FieldbyName('Seleccionado').AsBoolean then
        begin
          q.Close;
          q.SQL.Text := Consulta;
          q.ParamByName('Codigo').AsString := ACodigo;
          q.ParamByName('CodigoUsuario').AsString := cdsDatos.FieldByName('Nombre').AsString;
          q.ExecSQL;
        end;
        cdsDatos.Next;
      end;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarRubroIndicador(const ACodigo, ADescripcion: string; Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update RubrosIndicadores set Codigo = :Codigo, ';
    Consulta := Consulta +
      'Descripcion =:Descripcion where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into RubrosIndicadores (Codigo, Descripcion) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ExecSQL;

      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarConceptos(const ACodigo, ADescripcion: string; AInqProp, AListado,
  ASobre, ADescuenta, AOtroSobre: Integer; ATributa: Boolean; Operacion: TTipoOperacion; Orden, Rubro, Activo, Honorarios:Integer): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update Conceptos set Codigo = :Codigo, ';
    Consulta := Consulta +
      ' Descripcion =:Descripcion, InqProp = :InqProp, Listado=:Listado, '+
      ' Sobre = :Sobre , OtroSobre = :OtroSobre,  Descuenta = :Descuenta, '+
      ' Tributa = :Tributa, Orden = :Orden, CodigoRubro = :Rubro, Activo = :Activo, Honorarios = :Honorarios '+
      ' where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into Conceptos (Codigo, Descripcion, InqProp, Listado, Sobre, Descuenta, OtroSobre, Tributa, Orden, CodigoRubro, Activo, Honorarios) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion, :InqProp, :Listado, :Sobre, :Descuenta, :OtroSobre, :Tributa, :Orden, :Rubro,:Activo, :Honorarios)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ParamByName('InqProp').AsInteger := AInqProp;
      q.ParamByName('Listado').AsInteger := AListado;
      q.ParamByName('Sobre').AsInteger := ASobre;
      q.ParamByName('OtroSobre').AsInteger := AOtroSobre;
      q.ParamByName('Descuenta').AsInteger := ADescuenta;
      if Atributa then
        q.ParamByName('Tributa').AsInteger := 1
      else
        q.ParamByName('Tributa').AsInteger := 0;
      q.ParamByName('Orden').AsInteger := Orden;
      q.ParamByName('Rubro').AsInteger := Rubro;
      q.ParamByName('Activo').AsInteger := Activo;
      q.ParamByName('Honorarios').AsInteger := Honorarios;
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarIndicadores(const ACodigo, ADescripcion, Atitulo, aSQL: string; AActivo, AFormatoMoneda: Boolean; Operacion: TTipoOperacion; ARubro: Integer): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update Indicadores set Codigo = :Codigo, ';
    Consulta := Consulta +
      'Descripcion =:Descripcion, Titulo =:Titulo, Consulta = :Consulta, Activo = :Activo, FOrmatoMoneda = :FormatoMoneda, Rubro = :Rubro where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      ' INSERT INTO INDICADORES (CODIGO, DESCRIPCION, TITULO, ACTIVO, CONSULTA, FORMATOMONEDA, RUBRO) '+
      ' VALUES (:CODIGO, :DESCRIPCION, :TITULO, :ACTIVO, :CONSULTA, :FORMATOMONEDA, :RUBRO)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ParamByName('Titulo').AsString := ATitulo;
      q.ParamByName('Consulta').AsString := ASQL;
      q.ParamByName('Activo').AsInteger := Booltoint(AActivo);
      q.ParamByName('FOrmatoMoneda').AsInteger := Booltoint(AFormatoMoneda);
      q.ParamByName('Rubro').AsInteger := ARubro;
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarIndice(const ACodigo, ADescripcion: string;
  APorcentajes: TPorcentajes; Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update Indices set Codigo = :Codigo, ';
    Consulta := Consulta +
      'Descripcion =:Descripcion, Mensual = :Mensual, Bimestral = :Bimestral, Trimestral = :Trimestral, Cuatrimestral = :Cuatrimestral, Semestral = :Semestral, Anual = :Anual where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into Indices (Codigo, Descripcion, Mensual, Bimestral, Trimestral, Cuatrimestral, Semestral, Anual) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion, :Mensual, :Bimestral, :Trimestral, :Cuatrimestral, :Semestral, :Anual)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ParamByName('Mensual').AsFloat := APorcentajes[0];
      q.ParamByName('Bimestral').AsFloat := APorcentajes[1];
      q.ParamByName('Trimestral').AsFloat := APorcentajes[2];
      q.ParamByName('Cuatrimestral').AsFloat := APorcentajes[3];
      q.ParamByName('Semestral').AsFloat := APorcentajes[4];
      q.ParamByName('Anual').AsFloat := APorcentajes[5];
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarRazonesSociales(const ACodigo, ADescripcion, AColor, ACuentaBancaria: string; APorcentaje: Double;Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update RazonesSociales set Codigo = :Codigo, ';
    Consulta := Consulta +
      'Descripcion =:Descripcion, Color = :Color, Porcentaje=:Porcentaje, CUentaBancaria = :CuentaBancaria where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into RazonesSociales (Codigo, Descripcion, Color, Porcentaje, CuentaBancaria) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion, :Color, :Porcentaje, :CuentaBancaria)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ParamByName('Color').AsString := AColor;
      q.ParamByName('Porcentaje').AsFloat := APorcentaje;
      q.ParamByName('CuentaBancaria').AsString := ACuentaBancaria;
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarSobres(const ACodigo, ADescripcion: string; Principal, Depende: Integer; Operacion: TTipoOperacion; Activo: Integer): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update Sobres set ';
    Consulta := Consulta +
      'Descripcion =:Descripcion, Principal=:principal, depende=:depende, activo = :Activo where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into Sobres (Codigo, Descripcion, Sistema, Principal, Depende, Activo) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion, 0, :Principal, :Depende, :Activo)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ParamByName('Principal').AsInteger := Principal;
      q.ParamByName('Depende').AsInteger := Depende;
      q.ParamByName('Activo').AsInteger := Activo;
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarVales(Codigo, Descripcion: string; Categoria: Integer; Monto, Pendiente: Double; Cerrado: Boolean; Operacion: TTipoOperacion; Mes, Anio: Integer; Codinq, Coditem: string; cdsDatos: TClientDataset): Boolean;
var
  Consulta: string;
  ConsultaCuerpo: string;
  ConsultaBorrado: string;
  q: TFXQuery;
  qCuerpo: TFXQuery;
  I: Integer;
  Total: Double;

begin
  if Operacion in [toNuevo, toCopia, toCopiaFiel, toCopiaLimpia] then
  begin
    IniciarTransaccion;
    q := CrearQuery;
    qCuerpo := CrearQuery;
    try
      Consulta :=
        ' INSERT INTO CABEZAVALES (CODIGO, DESCRIPCION, CODIGOCATEGORIA, MONTO, PENDIENTE, CERRADO, MES, ANIO, CODINQ, CODITEM) '+
        ' VALUES (:CODIGO, :DESCRIPCION, :CODIGOCATEGORIA, :MONTO, :PENDIENTE, :CERRADO, :MES, :ANIO, :CODINQ, :CODITEM)';
      ConsultaCuerpo :=
        ' INSERT INTO CUERPOVALES (CODIGO, LINEA, CODIGOITEM, DESCRIPCION, ENTRA, SALE, CODINQ, FECHA, ID, USUARIO, ESMANUAL, PASADOACAJA) '+
        ' VALUES (:CODIGO, :LINEA, :CODIGOITEM, :DESCRIPCION, :ENTRA, :SALE, :CODINQ, :FECHA, :ID, :USUARIO, :ESMANUAL, :PASADOACAJA)';
      try
        q.Close;
        q.SQL.Text := Consulta;
        q.ParamByName('Codigo').AsString := Codigo;
        q.ParamByName('Descripcion').AsString := Descripcion;
        q.ParamByName('CodigoCategoria').AsInteger := Categoria;
        q.ParamByName('Monto').AsFloat := Monto;
        q.ParamByName('Pendiente').AsFloat := Pendiente;
        q.ParamByName('Cerrado').AsBoolean := Cerrado;
        q.ParamByName('Mes').AsInteger := Mes;
        q.ParamByName('Anio').AsInteger := Anio;
        q.ParamByName('Codinq').AsString := Codinq;
        q.ParamByName('Coditem').AsString := Coditem;
        q.ExecSQL;

        if Operacion in [toNuevo] then
        begin
          qCuerpo.Close;
          qCuerpo.SQL.Text := ConsultaCuerpo;
          qCuerpo.ParamByName('Codigo').AsString := Codigo;
          qCuerpo.ParamByName('Linea').AsInteger := 1;
          qCuerpo.ParamByName('CodigoItem').AsString := '-1';
          qCuerpo.ParamByName('Descripcion').AsString := 'Alta de vale' ;
          qCuerpo.ParamByName('Entra').AsFloat := Monto;
          qCuerpo.ParamByName('Sale').AsFloat := 0;
          qCuerpo.ParamByName('Codinq').AsString := '-1';
          qCuerpo.ParamByName('Fecha').AsDatetime := Date();
          qCuerpo.ParamByName('ID').AsInteger := ObtenerID('GEN_VALES');
          qCuerpo.ParamByName('USUARIO').AsString := fPrincipal.fUsuario;
          qCuerpo.ParamByName('ESMANUAL').AsInteger := 0;
          qCuerpo.ParamByName('PASADOACAJA').AsInteger := 0;
          qCuerpo.ExecSQL;
        end;
        ConfirmarTransaccion;
        Result := True;
      Except
        on e: Exception do
        begin
          CancelarTransaccion;
          Result := False;
        end;
      end;
    finally
      FreeAndNil(q);
    end;
  end;

  if Operacion in [toModificar, toCopia, toCopiaFiel, toCopiaLimpia] then
  begin
    IniciarTransaccion;
    q := CrearQuery;
    qCuerpo := CrearQuery;
    try
      Consulta := ' UPDATE CABEZAVALES '+
                  '    SET DESCRIPCION = :DESCRIPCION, '+
                  '        CODIGOCATEGORIA = :CODIGOCATEGORIA, '+
                  '        MONTO = :MONTO, '+
                  '        PENDIENTE = :PENDIENTE, '+
                  '        CERRADO = :CERRADO, '+
                  '        MES = :MES, '+
                  '        ANIO = :ANIO, '+
                  '        CODINQ = :CODINQ, '+
                  '        CODITEM = :CODITEM '+
                  '    WHERE (CODIGO = :CODIGO)';
      ConsultaBorrado :=
                  ' DELETE FROM CUERPOVALES WHERE CODIGO = :CODIGO ';

      ConsultaCuerpo :=
        ' INSERT INTO CUERPOVALES (CODIGO, LINEA, CODIGOITEM, DESCRIPCION, ENTRA, SALE, CODINQ, FECHA, ID, USUARIO, ESMANUAL, PASADOACAJA) '+
        ' VALUES (:CODIGO, :LINEA, :CODIGOITEM, :DESCRIPCION, :ENTRA, :SALE, :CODINQ, :FECHA, :ID, :USUARIO, :ESMANUAL, :PASADOACAJA)';

      try
        q.Close;
        q.SQL.Text := ConsultaBorrado;
        q.ParamByName('Codigo').AsString := Codigo;
        q.ExecSql;

        cdsDatos.First;
        I := 1;
        qCuerpo.SQL.Text := ConsultaCuerpo;
        Monto := 0;
        while not cdsDatos.eof do
        begin
          if cdsDatos.FieldByName('Seleccionado').AsBoolean then
          begin
            Total := Total + cdsDatos.FieldbyName('Entra').AsFloat - cdsDatos.FieldbyName('Sale').AsFloat;
            qCuerpo.Close;
            qCuerpo.ParamByName('Codigo').AsString := Codigo;
            qCuerpo.ParamByName('Linea').AsInteger := I;
            qCuerpo.ParamByName('CodigoItem').AsString := cdsDatos.FieldbyName('CodItem').AsString;
            qCuerpo.ParamByName('Descripcion').AsString := cdsDatos.FieldbyName('Descripcion').AsString;
            qCuerpo.ParamByName('Entra').AsFloat := cdsDatos.FieldbyName('Entra').AsFloat;
            qCuerpo.ParamByName('Sale').AsFloat := cdsDatos.FieldbyName('Sale').AsFloat;
            qCuerpo.ParamByName('Codinq').AsString := cdsDatos.FieldbyName('Codigo').AsString;
            qCuerpo.ParamByName('Fecha').AsDatetime := cdsDatos.FieldByName('Fecha').AsDatetime;
            qCuerpo.ParamByName('ID').AsInteger := ObtenerID('GEN_VALES');
            qCuerpo.ParamByName('USUARIO').AsString := cdsDatos.FieldbyName('Usuario').AsString;
            qCuerpo.ParamByName('EsManual').AsInteger := Booltoint(cdsDatos.FieldbyName('EsManual').AsBoolean);
            qCuerpo.ParamByName('PasadoACaja').AsInteger := 0;
            qCuerpo.ExecSQL;
            Inc(I);
          end;
          cdsDatos.Next;
        end;

        q.Close;
        q.SQL.Text := Consulta;
        q.ParamByName('Codigo').AsString := Codigo;
        q.ParamByName('Descripcion').AsString := Descripcion;
        q.ParamByName('CodigoCategoria').AsInteger := Categoria;
        q.ParamByName('Monto').AsFloat := Total;
        q.ParamByName('Pendiente').AsFloat := Total;
        q.ParamByName('Cerrado').AsBoolean := Cerrado;
        q.ParamByName('Mes').AsInteger := Mes;
        q.ParamByName('Anio').AsInteger := Anio;
        q.ParamByName('Codinq').AsString := Codinq;
        q.ParamByName('Coditem').AsString := Coditem;
        q.ExecSQL;



        ConfirmarTransaccion;
        Result := True;
      Except
        CancelarTransaccion;
        Result := False;
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

function TDM.GrabarUsuarios(const ANombre, AClave: string; Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update Usuarios set ';
    Consulta := Consulta +
      'Clave=:Clave where Nombre=:Nombre';
  end
  else
  begin
    Consulta :=
      'Insert into Usuarios (Nombre, Clave) ';
    Consulta := Consulta +
      'Values (:Nombre, :Clave)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Nombre').AsString := ANombre;
      q.ParamByName('Clave').AsString := AClave;
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarRubrosDatosFijos(const ACodigo, ADescripcion: string; Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update RubrosDatosFijos set ';
    Consulta := Consulta +
      'Descripcion=:Descripcion where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into RubrosDatosFijos (Codigo, Descripcion) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TDM.GrabarCategoriasVales(const ACodigo, ADescripcion: string; AEsConsorcio: Boolean; Operacion: TTipoOperacion): Boolean;
var
  Consulta: string;
  q: TFXQuery;
begin
  if Operacion = toModificar then
  begin
    Consulta := 'Update CategoriasVales set ';
    Consulta := Consulta +
      'Descripcion=:Descripcion, EsConsorcio=:EsConsorcio where Codigo=:Codigo';
  end
  else
  begin
    Consulta :=
      'Insert into CategoriasVales (Codigo, Descripcion, EsConsorcio) ';
    Consulta := Consulta +
      'Values (:Codigo, :Descripcion, :EsConsorcio)';
  end;

  q := CrearQuery;
  try
    IniciarTransaccion;
    try
      q.Close;
      q.SQL.Text := Consulta;
      q.ParamByName('Codigo').AsString := ACodigo;
      q.ParamByName('Descripcion').AsString := ADescripcion;
      q.ParamByName('EsConsorcio').AsInteger := BoolToInt(AEsConsorcio);
      q.ExecSQL;
      ConfirmarTransaccion;
      Result := True;
    Except
      CancelarTransaccion;
      Result := False;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TDM.BorrarInmueble(ACodigo: string);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    with Q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('Delete from Inmuebles where Codinq= :Codinq');
      ParamByName('Codinq').AsString := ACodigo;
      ExecSQL;
      Sql.Clear;
      Sql.Add('Delete from Automatizacion where Codinq= :Codinq');
      ParamByName('Codinq').AsString := ACodigo;
      ExecSql;
      Sql.Clear;
      Sql.Add('Delete from ContratosEscalonados where Codinq= :Codinq');
      ParamByName('Codinq').AsString := ACodigo;
      ExecSql;
      Sql.Clear;
      Sql.Add('Delete from ItemAutom where Codinq= :Codinq');
      ParamByName('Codinq').AsString := ACodigo;
      ExecSql;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TDM.IniciarTransaccion;
begin
  if Conexion.intransaction then
    Conexion.Rollback;
  Conexion.Starttransaction;
end;

procedure TDM.CancelarTransaccion;
begin
  Conexion.Rollback;
end;

function TDM.ConectarBD(RutaBD:string): Boolean;
begin
  with Conexion do
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
  Result := Conexion.Connected;
end;

procedure TDM.prBorrarElemento(pCodigo, pTabla, pCampoCodigo, pElemento: String);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    DM.IniciarTransaccion;
    try
      q.SQL.Text := Format('Delete from %s where %s = :Codigo', [pTabla, pCampoCodigo]);
      q.ParamByName('Codigo').AsString := pCodigo;
      q.ExecSQL;

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Movimiento Eliminado correctamente.');
    except
      DM.CancelarTransaccion;
      MostrarDialogoAceptar( Format('Ocurrio un error al eliminar %s.', [pElemento]), mtError);
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TDM.ConfirmarTransaccion;
begin
  Conexion.Commit;
end;

function TDM.CrearQuery: TFXQuery;
begin
  Result := TFXQuery.Create(nil);
  Result.Connection := Conexion;
end;


function TDM.fxCrearQuery(pOptimizacion: TNivelOptimizacion = opNone): TFXQuery;
{ Version definitiva de esta funcion en 03.25 }
var
  q : TFXQuery;

    procedure prOptimizaObjQuery;
    {$REGION 'Sobre "Optimizacion"'}
     {
      -Si su query debe consultar una base para editar cursores locales con dataware componentes, o debe navegar un cursor obtenido
      desde un dbserver poniendole una grilla/dataset (dbgrid) ------> NO USAR OPTIMIZACION.

      Ej.
            fDatos.fxCrearQuery;
            fSucursalManual.fxCrearQuerySucursal;

      -Si debe vestir grillas soretes TStringAlingGrid, o si debe contar o sumar, o si debe hacer consultas que transversara hacia adelante,
      o reportes, entonces -------> USE OPTIMIZACION SIMPLE

            fDatos.fxCrearQuery(true);
            fSucursalManual.fxCrearQuerySucursal(true);

      Esto no es excusa para escribir consultas malas o lentas. Tratemos siempre de escribir consultas SQL como corresponde. Hay trucos
      para escribir buenas consultas. Lean en la web como. Todo lo que hay acá, acelera la gestion contra el server, pero si la consulta
      es MALA o LENTA por el peso de su trabajo, no la va a acelerar.

      Si aun asi, con esta optimizacion, la consulta sigue siendo lenta o mas lenta que antes, el problema es la consulta. Si la consulta
      no se puede optimizar, entonces el diseño de las tablas esta en crisis. Toda consulta que tiene muchos joins, es por mal diseño.

      Todo lo de aqui es para TFXQuery. NO para otra clase de tablas.

      Tener en cuenta que:

        TQuery = TADQuery (XE3) o TFDQuery (XE7).
        TTabla = TADTable(XE3) o TFDTable(XE7). Este es muy ideal para browsers como TDBGRID con cursores locales.

      Nos enfrentamos a 2 disyuntivas:

        -consulta que abre rapida, pero si navegas el recordset en los extremos tarda una eternidad o te puede dar "out of memory",
         como ocurre con el Ibexpert.

        -consulta que TARDA mucho en abrir porque los trae todos, pero la navegacion es rapida y no da "out of memory".

      Como lo resolvemos:
         -Escribiendo muy bien la consulta (ver en la web Consultas SQL Heterogeneas)

         -Ejecutar "execute blocks" o "store procedures" o "VISTAS" que devuelvan los cursores de datos

         -Mapeando consultas a una base local sqlite (ver uDbLocal.pas)

         -Recordar
            * Ley de bases de datos: el uso de cursores locales, reduce el trafico en la red y alivia al servidor.
              Usa menos recursos y va mas rapido.

            * Si browseas con dbgrid, usas TTabla (ver uDbLocal.pas)

            * Usar TClientDataset -o el hermano mellizo mejor de FireDAC- para mapear cursores locales
              Ver tipo generico definido aqui TClienteDataSet y ver la funcion GetClienteDataSet

            * Evitar ser un Programador Sorete: si la consulta es lenta y los programas IbExpert/Sinatica nos dicen
              donde tarda mas, seguro, vas y le clavas un indice sobre esa expresion lenta.
              NO: Aceleras una lectura, pero a expensas de la grabacion y del overbloat de la base de datos.

            * A futuro: Si las consultas se ponen pesadas siempre en la base, es mejor generar "tablas pre-preparadas readonly" para extraer
              reportes. Esas tablas pueden estar en otra base o en la misma. Y asi se evita el festival de JOINs.
              Si no sabes que son las "tablas pre-preparadas readonly", te lo explico en persona.

         -Si la tabla tendra pocos registros, no ponerle indices. Confiar en el mapeo propio que hace el DBMS y los procesadores de hoy.
          La media es unos 3000 registros. Con los procesadores de hoy, los caches, la memoria, es mas que suficiente. Si la tabla
          sera accedida via joins, con una primary key es suficiente.

                                                         --------- IMPORTANTE -----------

         Las consultas optimizadas tienen cierto cuidados que deben tomarse:

         -Deben hacer al final de trabajar con una query

              <MiTablaOptimizada>.EnableControls;

         -Si usan RecordCount(), esta devuelve la cantidad de registros en pagina, no el total. isempty() te da true al final despues
          de recorrer una lista de registros. Esto ocurre porque para optimizar el uso de recursos y la velocidad, los registros
          son eliminados de la memoria una vez usados. Mucho ojo!.

          RECORDAR FINALMENTE QUE LAS CONSULTAS OPTIMIZADAS NO-PUEDEN-RECORRERSE HACIA ATRAS. Son para vestir otras cosas y van siempre
          para adelante. Si se necesita algo asi, hay dos opciones. La primera y mejor:

            -hacer la consulta optimizada y no usar optimizaciones
            -pasarle el resultado a un TClienteDataSet

            var
               cds : TClientDataSet;
               qry: TFXQuery;
            begin
               cds := TClientDataSet.Create(nil);
               qry := fDatos.fxCrearQuery(true);  //o tambien, mejor -> uBaseDatos.fxCrearQuery(fDatos, opOptimizaAlPalo)
               try
                 qry.sql.text := 'Select * from esto y aquello lleno de tables y joins...';
                 qry.Open;
                 cds.SetProvider(qry);  <--- pasa al tcientdataset
                 cds.Open;  // aca laburas ya con el tclientdataset
                 ...
               finally
                  cds.free;
                  qry.free;
               end;
            end;                                                                .pr.
     }
    {$ENDREGION}
    begin
        WITH q DO
        BEGIN
           { Recuerden que a los mensajes internos visuales de Windows, el S.O. les asigna la mas baja prioridad.
             https://stackoverflow.com/questions/29725340/do-some-windows-messages-have-higher-priority-than-others     .pr. }
           DisableControls;

//           ActiveStoredUsage := [auRunTime];
           AutoCalcFields := False;
           ObjectView     := False;
           CachedUpdates  := false;
           IndexesActive  := False;

           FormatOptions.StrsEmpty2Null := false;
           FormatOptions.StrsTrim       := false;
           FormatOptions.AssignedValues := [];

           FetchOptions.AutoClose      := False;
           FetchOptions.Items          := [fiBlobs, fiDetails];
           FetchOptions.Unidirectional := true;
           FetchOptions.CursorKind     := ckForwardOnly;
           FetchOptions.DetailOptimize := false;

           ResourceOptions.StoreItems := [siData];
           ResourceOptions.MacroCreate := False;
           ResourceOptions.MacroExpand := False;
           ResourceOptions.ArrayDMLSize   := 0;
           ResourceOptions.AssignedValues := [rvParamCreate, rvParamExpand,
                                              rvMacroCreate, rvMacroExpand,
                                              rvEscapeExpand,
                                              rvCmdExecMode, rvCmdExecTimeout,
                                              rvDirectExecute, rvDefaultParamType,
                                              rvStoreItems, rvUnifyParams, rvKeepConnection];

           UpdateOptions.ReadOnly     := true;
           UpdateOptions.FastUpdates  := false;
           UpdateOptions.UpdateChangedFields := false;
           UpdateOptions.RefreshDelete       := false;
           UpdateOptions.RequestLive         := false;
           UpdateOptions.CountUpdatedRecords := false;
           UpdateOptions.CheckRequired       := false;
           UpdateOptions.CheckReadOnly       := false;
           UpdateOptions.CheckUpdatable      := false;
           UpdateOptions.EnableDelete        := false;
           UpdateOptions.EnableInsert        := false;
           UpdateOptions.EnableUpdate        := false;

           if pOptimizacion in [opOptimizaAlPalo, opOptimizaAlPaloSelect] then
           {$REGION 'Sobre Optimizacion Al Palo'}
           {
             A las chapas: Exige consultas muy bien escritas con sus alias.
             -No usar con barras de estado.
             -No usar con dbgrid
             -No usar isempty
             -No usar recordcount
             -NO USAR CON BLOBS.
             -SOLO USAR CON SELECT. va muy bien con SUM, AVG etc...
             Ej:
                 var MiQuery: TFXQuery;
                 begin
                     MiQuery := uBaseDatos.fxCrearQuery(fDatos, opOptimizaAlPalo)
                     try
                        <reporte, sum, operaciones hacia adelante>....
                     finally
                        MiQuery.Free;
                     end;
                 end       .pr. }
           {$ENDREGION}
           begin
              FetchOptions.AssignedValues  := [evItems, evUnidirectional, evCursorKind, evMode];
              FetchOptions.RowsetSize      := 1000;
              FetchOptions.Cache           := [fiDetails];
              FetchOptions.RecordCountMode := cmFetched;
              FetchOptions.Mode  := fmOnDemand;

              UpdateOptions.AssignedValues       := [];
              UpdateOptions.LockMode             := lmNone;
              UpdateOptions.LockPoint            := lpDeferred;
              UpdateOptions.RefreshMode          := rmOnDemand;
              UpdateOptions.FetchGeneratorsPoint := gpImmediate;

              ResourceOptions.SilentMode := True;
           end
           else if pOptimizacion = opOptimizaUpdateInsert then {optimiza para pegarle al server grabando (insert/update, masivos o no)}
           begin
              FetchOptions.AssignedValues  := [];
              UpdateOptions.AssignedValues := [];
           end
           else if pOptimizacion = opOptimizaSelect then
           { Optimizacion comun para selects }
           begin
              FetchOptions.AssignedValues  := [evItems, evUnidirectional, evCursorKind, evRecordCountMode];
              UpdateOptions.AssignedValues := [];
           end
           else if pOptimizacion = opOptimizaOpen then
           {$REGION 'Sobre Optimizacion opOptimizaOpen'}
           {
              Aclaración esto se agregó porque en base a todas las opciones anteriores para optimización, ninguna
              sirve para el caso donde se tiene mas de 200.000 registros y con ninguna de las optimizaciónes
              nombradas mas arriba es posible hacer que un Open de una Query que no tarde una locura de tiempo!!!

              - No se necesita hacer una consulta de todos los registros y tener que esperar una eternidad.

              * No hay que considerarse el Dr Stange para decir Programador Sorete. Nadie es superior a nadie.

              * Todas las explicaciones que se dan mas arriba, ley de BD y demás no sirve de nada ,si no puedo hacer un tipico select count(*) a una tabla de 3.000.000 de registros.
                 y la consulta me tarda una eternindad, que tenga o no tenga indices la tabla, si tengo millones de registros tirar un simple count(*)
                 Me va a demorar una eternidad aca y en china.El que quiera preguntar se lo demuestro.

              * Con lo cual esto sirve si necesitas
                   --- Obtener RecordCount
                   --- Abrir una Query de la forma mas rapida posible, minimo uso de memoria para muchisimos registros, con el fetch de 1000 registros y no un FetchALL(No quiero que mi app demore abrir una consulta de 3.000.000 de registros,
                       abro lo mas rapido que pueda y hare fetchs parciales luego con GetNextPacket para tomar los siguientes 1000 registros)
                   --- Fetch parcial cada 1000 registros
                   --- Recorrer la Query
                   --- Necesito usar una Barra de Progreso
           {$ENDREGION}
           begin
             FetchOptions.Mode           := fmOnDemand;
             FetchOptions.RowSetSize     := 1000;
           end;
        END;
    end;

begin
  q := TFXQuery.Create(nil);
  try
    q.Connection := Conexion;
    {$IFNDEF SIN_OPTIMIZAR}
    if pOptimizacion <> opNone then   { es alguna opcion de TNivelOptimizacion?, optimiza. Si no, es una consulta comun }
       prOptimizaObjQuery;
    {$ENDIF}
    Result := q;
  except
    Result := nil;
    FreeAndNil(q);
  end;
end;

end.
