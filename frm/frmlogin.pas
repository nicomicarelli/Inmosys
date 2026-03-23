unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  Funciones, AdvPanel, ImgList,
  AdvGlowButton, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit,  cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Variants, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  AdvSmoothMenu, dxSkinsdxBarPainter, cxClasses, dxBar, dxRibbon, FXQuery;

type
  TfrmClave = class(TForm)
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    cbxUsuarios: TcxTextEdit;
    edContrasena: TcxTextEdit;
    cbCaja: TcxLookupComboBox;
    btnCancelar: TAdvGlowButton;
    btnAceptar: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxUsuariosKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtContrasenaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxUsuariosExit(Sender: TObject);
  private
    { Private declarations }
  public
    ds: TDatasource;
    class function Ejecutar: Boolean;
  end;

var
  frmClave: TfrmClave;

implementation

uses frmPrincipal, frmDatos;

{$R *.DFM}

procedure TfrmClave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ds);
  frmClave := nil;
  Action := caFree;
end;

procedure TfrmClave.cbxUsuariosExit(Sender: TObject);
begin
  cbCaja.Text := cbxUsuarios.Text;
end;

procedure TfrmClave.cbxUsuariosKeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;

begin
  if Key = #13 then
  begin
    edContrasena.SetFocus;
//    for I := 0 to cbCaja.Properties.Items.Count - 1 do
//    BEGIN
//      if cbCaja.Text = cbxUsuarios.Text then
//      begin
//        cbCaja.ItemIndex := I;
//        Exit;
//      end;
//
//    END;
//
//    cbCaja.ItemIndex := I;
  end;
end;

procedure TfrmClave.FormCreate(Sender: TObject);
var
  Ruta: String;
  qCajas: TFXQuery;

begin
  Ruta := obtenerRutaBD;
  if not DM.ConectarBD(Ruta) then
  begin
    MostrarDialogoAceptar('Falló la conexión a la base de datos.', mterror);
    Exit;
  end;
  ds := TDatasource.Create(nil);

  qCajas := CrearQuery;
  qCajas.sql.text := 'Select * from cajas';
  qCajas.Open;

  ds.DataSet := qCajas;
  cbCaja.Properties.ListSource := ds;
  cbCaja.EditValue := 1;
end;

procedure TfrmClave.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
    btnCancelar.Click;
end;

procedure TfrmClave.btnSalirClick(Sender: TObject);
begin
  Close;
end;

class function TfrmClave.Ejecutar: Boolean;
begin
  with TfrmClave.Create(Application) do
    Result := showmodal = mrOK;
end;

procedure TfrmClave.btnAceptarClick(Sender: TObject);
var
  Nombre: string;
  Clave:  string;
  q: TFXQuery;
  Valor: Integer;
begin
  Nombre := cbxUsuarios.Text;
  Clave  := edContrasena.Text;
  q := CrearQuery;
  try
    if VarisNull(cbCaja.EditValue) or (cbCaja.EditValue = -1)  then
    begin
      MostrarDialogoAceptar('Debe seleccionar una caja.');
      Exit;
    end;

    q.SQL.Text := ' Select CodigoUsuario ' +
               '      from Cajasusuarios ' +
               '     where UPPER(CodigoUsuario)= :pNombre AND UPPER(CodigoCaja) =:Codigo';
    q.ParamByName('pNombre').AsString := Uppercase(Nombre);
    q.ParamByName('Codigo').AsInteger := cbCaja.EditValue;
    q.Open;

    if q.IsEmpty  then
    begin
      MostrarDialogoAceptar('El usuario no tiene permisos para operar con esa caja.');
      Exit;
    end;

    q.SQL.Text := ' Select nombre,clave ' +
               '      from usuarios ' +
               '     where UPPER(nombre)= :pNombre AND UPPER(CLAVE) =:Clave';

    q.ParamByName('pNombre').AsString := Uppercase(Nombre);
    q.ParamByName('Clave').AsString := Uppercase(Clave);
    q.Open;

    if q.IsEmpty then
    begin
      MostrarDialogoAceptar('Usuario o clave incorrecta');
      Exit;
    end
    else
    begin
      ModalResult := mrOK;
      fPrincipal.fUsuario := Nombre;
      fPrincipal.FCodigoCaja := cbCaja.EditValue;
      fPrincipal.StatusBar1.Panels[0].Text := 'Usuario: ' + Nombre + ' - Caja: ' + cbCaja.Text;

      q.Sql.Text := ' Select Max(Registro) as Registro from Itemautom';
      q.Open;
      Valor := q.FieldbyName('Registro').AsInteger;

      dm.IniciarTransaccion;
      try
        q.sql.text := ' ALTER SEQUENCE GEN_ITEMAUTOM RESTART WITH ' + Inttostr(Valor);
        q.ExecSql;
        dm.ConfirmarTransaccion;
      Except
        dm.CancelarTransaccion;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmClave.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmClave.edtContrasenaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnAceptar.SetFocus;
end;

end.
