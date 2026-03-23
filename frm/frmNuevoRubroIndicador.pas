unit frmNuevoRubroIndicador;

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
  TfNuevoRubroIndicador = class(TForm)
    AdvPanel1: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    PopupMenu1: TPopupMenu;
    Seleccionartodos1: TMenuItem;
    Deseleccionartodos1: TMenuItem;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    procedure prBorrar(pCodigo: Integer);
  public
    procedure Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  fNuevoRubroIndicador: TfNuevoRubroIndicador;

implementation

uses frmprincipal, frmABMCajas, frmNuevaCaja;

{$R *.dfm}

procedure TfNuevoRubroIndicador.btnGrabarClick(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;

begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;

  if ValidarDatos then
  begin
    if DM.GrabarRubroIndicador(Codigo, Descripcion, FOperacion) then
    begin
      MostrarDialogoAceptar('Información','El Rubro Indicador se grabo satisfactoriamente.', mtInformation);
      Close;
    end;
  end;
end;

procedure TfNuevoRubroIndicador.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNuevoRubroIndicador.Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;

  btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
  edtCodigo.Enabled  := (Operacion in  [toNuevo]);
  edtDescripcion.Enabled  := True;

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
      q.SQL.Text := ' Select C.*'+
                    '   from RubrosIndicadores C '+
                    '  where C.codigo=:Codigo';
      q.ParamByName('Codigo').AsInteger := pCodigo;
      q.Open;

      if pCodigo > 0 then
      begin
        edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
        edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      end;
    finally
      FreeAndNil(q);
    end;
  end;

  if Operacion = toEliminar then
  begin
    prBorrar(pCodigo);
    Close;
  end;
  if Assigned(FABMCajas) then
    FABMCajas.btnActualizarClick(nil);
end;

procedure TfNuevoRubroIndicador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fNuevoRubroIndicador := nil;
end;

procedure TfNuevoRubroIndicador.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfNuevoRubroIndicador.prBorrar(pCodigo: Integer);
var
  q: TFXQuery;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el rubro seleccionado?', mtConfirmation) then
  begin
    q := CrearQuery;
    try
      DM.IniciarTransaccion;
      try
        q.SQL.Text := 'Delete from RubrosIndicadores where codigo = :Codigo';
        q.ParamByName('Codigo').AsInteger := pCodigo;
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

function TfNuevoRubroIndicador.ValidarDatos: Boolean;
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
end;


end.

