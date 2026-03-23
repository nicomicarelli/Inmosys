unit frmNuevaCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, ExtCtrls, AdvGlowButton, AdvPanel,
  Declaraciones, SQLExpr, frmDatos, Funciones, dbClient, Provider, Menus,
  cxContainer, cxGroupBox, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator, fxQuery;

type
  TfNuevaCaja = class(TForm)
    AdvPanel1: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    cxGrid1: TcxGrid;
    gUsuarios: TcxGridDBTableView;
    Usuarios_Seleccionado: TcxGridDBColumn;
    Usuarios_Nombre: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PopupMenu1: TPopupMenu;
    Seleccionartodos1: TMenuItem;
    Deseleccionartodos1: TMenuItem;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Seleccionartodos1Click(Sender: TObject);
    procedure Deseleccionartodos1Click(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    procedure prBorrarCaja(pCodigoCaja: Integer);
    procedure prPrepararDataset;
    procedure prCargarUsuarios;
  public
    procedure Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  fNuevaCaja: TfNuevaCaja;

implementation

uses frmprincipal, frmABMCajas;

{$R *.dfm}

procedure TfNuevaCaja.btnGrabarClick(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;

begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;

  if ValidarDatos then
  begin
    if DM.GrabarCajas(Codigo, Descripcion, cdsDatos, FOperacion) then
    begin
      MostrarDialogoAceptar('Información','La Caja se grabo satisfactoriamente.', mtInformation);
      Close;
    end
    else
      MostrarDialogoAceptar('Información','Ocurrio un error al grabar la caja.', mtInformation);
  end;
end;

procedure TfNuevaCaja.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNuevaCaja.Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;

  btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
  edtCodigo.Enabled  := (Operacion in  [toNuevo]);
  edtDescripcion.Enabled  := True;
  prCargarUsuarios;

  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtDescripcion.Text := '';
    Exit;
  end;

  if (Operacion = toModificar) or (Operacion = toEliminar) then
  begin
    edtDescripcion.SetFocus;

    q := CrearQuery;
    try
      q.SQL.Text := ' Select C.*, CU.* '+
                    '   from Cajas C '+
                    '  inner join CajasUsuarios CU on C.CodigoCaja = CU.COdigoCaja '+
                    '  where C.codigoCaja=:Codigo';
      q.ParamByName('Codigo').AsInteger := pCodigo;
      q.Open;

      if pCodigo > 0 then
      begin
        edtCodigo.Text               := q.FieldbyName('CodigoCaja').asstring;
        edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      end;

      cdsDatos.First;
      while not q.Eof do
      begin
        cdsDatos.Filtered := False;
        cdsDatos.Filter :='NOMBRE=' + '''' + q.FieldbyName('CodigoUsuario').AsString + '''';
        cdsDatos.Filtered := True;

        cdsDatos.Edit;
        cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
        cdsDatos.Post;
        q.Next;
      end;
      cdsDatos.Filtered := False;
      cdsDatos.First;
    finally
      FreeAndNil(q);
    end;
  end;

  if Operacion = toEliminar then
  begin
    prBorrarCaja(pCodigo);
    Close;
  end;
  if Assigned(FABMCajas) then
    FABMCajas.btnActualizarClick(nil);
end;

procedure TfNuevaCaja.Deseleccionartodos1Click(Sender: TObject);
begin
  gUsuarios.DataController.BeginFullUpdate;
  try
    cdsDatos.First;
    while not cdsDatos.eof do
    begin
      cdsDatos.Edit;
      cdsDatos.FieldByName('Seleccionado').AsBoolean := False;
      cdsDatos.Post;
      cdsDatos.Next;
    end;
    cdsDatos.First;
  finally
    gUsuarios.DataController.EndFullUpdate;
  end;
end;

procedure TfNuevaCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dsDatos);
  FreeAndNil(cdsDatos);
  action := caFree;
  fNuevaCaja := nil;
end;

procedure TfNuevaCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
end;

procedure TfNuevaCaja.prBorrarCaja(pCodigoCaja: Integer);
var
  q: TFXQuery;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar la caja seleccionada?', mtConfirmation) then
  begin
    q := CrearQuery;
    try
      DM.IniciarTransaccion;
      try
        q.SQL.Text := 'Delete from CajasUsuarios where codigocaja = :Codigo';
        q.ParamByName('Codigo').AsInteger := pCodigoCaja;
        q.ExecSQL;

        q.SQL.Text := 'Delete from Cajas where codigocaja = :Codigo';
        q.ParamByName('Codigo').AsInteger := pCodigoCaja;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos eliminados correctamente.');
      except
        DM.CancelarTransaccion;
        MostrarDialogoAceptar( 'Ocurrio un error al eliminar la caja.', mtError);
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

procedure TfNuevaCaja.prCargarUsuarios;
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Nombre From Usuarios';
    q.Open;

    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldbyName('Seleccionado').AsBoolean := FOperacion = toNuevo;
      cdsDatos.FieldbyName('Nombre').AsString := q.FieldbyName('Nombre').AsString;
      cdsDatos.Post;
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
  cdsDatos.First;
end;

procedure TfNuevaCaja.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Seleccionado', ftBoolean);
  cdsDatos.FieldDefs.Add('Nombre', ftString, 50);
  cdsDatos.CreateDataset;

  Usuarios_seleccionado.DataBinding.FieldName := 'Seleccionado';
  Usuarios_Nombre.DataBinding.FieldName := 'Nombre';

  dsDatos.DataSet := cdsDatos;
  gUsuarios.DataController.DataSource := dsDatos;
end;

procedure TfNuevaCaja.Seleccionartodos1Click(Sender: TObject);
begin
  gUsuarios.DataController.BeginFullUpdate;
  try
    cdsDatos.First;
    while not cdsDatos.eof do
    begin
      cdsDatos.Edit;
      cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
      cdsDatos.Post;
      cdsDatos.Next;
    end;
    cdsDatos.First;
  finally
    gUsuarios.DataController.EndFullUpdate;
  end;
end;

function TfNuevaCaja.ValidarDatos: Boolean;
var
  boSeleccionado: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripción. ', mtInformation);
    Result := False;
    Exit;
  end;

  cdsDatos.First;
  boSeleccionado := False;
  while not cdsDatos.eof  do
  begin
    if cdsDatos.FieldByName('Seleccionado').AsBoolean then
    begin
      boSeleccionado := True;
      Break;
    end;
    cdsDatos.Next;
  end;
  cdsDatos.First;

  if not boSeleccionado then
  begin
    MostrarDialogoAceptar('Debe seleccionar al menos un usuario. ', mtInformation);
    Result := False;
    Exit;
  end;
end;


end.
