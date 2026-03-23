unit frmRubrosDatosFijos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  AdvGlowButton, cxGroupBox, AdvPanel, fxQuery;

type
  TFRubroDatosFijos = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    popOrdenar: TPopupMenu;
    Ordenar1: TMenuItem;
    Cdigo1: TMenuItem;
    Descripcin1: TMenuItem;
    Destino1: TMenuItem;
    ColorDialog1: TColorDialog;
    pnlFondo: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    procedure prBorrar(pCodigo: Integer);
    function ValidarDatos: Boolean;
  end;

var
  FRubroDatosFijos: TFRubroDatosFijos;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmABMSobres, frmSobres, frmABMUsuarios, frmABMRubrosDatosFijos;

{$R *.DFM}

procedure TFRubroDatosFijos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FRubroDatosFIjos := nil;
  if Assigned(fABMRubrosDatosFijos) then
    fABMRubrosDatosFijos.ActualizarClick(NIL);
end;

procedure TFRubroDatosFijos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TFRubroDatosFijos.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Codigo. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripcion. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

procedure TFRubroDatosFijos.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TFRubroDatosFijos.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    actGrabar.Execute;
    edtDescripcion.SetFocus;
  end;
end;

procedure TFRubroDatosFijos.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
  begin
    if TWinControl.ClassNameIs('TEdit') then
    begin
      Self.Controls[I].Enabled := True;
      TEdit(Self.Controls[I]).Text    := '';
    end;
  end;
end;

procedure TFRubroDatosFijos.actGrabarExecute(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;

  if ValidarDatos then
  begin
    if DM.GrabarRubrosDatosFIjos(Codigo, Descripcion, Operacion) then
    begin
      MostrarDialogoAceptar('Información','El Rubro se grabo satisfactoriamente', mtInformation);
      actNuevo.Execute;
    end;
  end;
  Close;
end;

procedure TFRubroDatosFijos.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        edtDescripcion.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from RubrosDatosFijos where Descripcion = :Descripcion');
          ParamByName('Descripcion').AsString := edtDescripcion.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe un Rubro con esa Descripción. Verifique por favor.', mtInformation);
          edtDescripcion.Text := '';
          edtDescripcion.SetFocus;
          Exit;
        end;
        if edtDescripcion.Text = '' then
          edtDescripcion.SetFocus;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFRubroDatosFijos.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(edtDescripcion.Text) <> '');
end;

procedure TFRubroDatosFijos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFRubroDatosFijos.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select Coalesce(Max(Codigo)+1, 1) as Codigo from RubrosDatosFijos';
      q.Open;
      edtDescripcion.Text := '';
      edtCodigo.Text := q.FIeldbyName('Codigo').AsString;
      edtCodigo.Enabled := False;
    finally
      FreeAndNil(q);
    end;
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;

  q := CrearQuery;
  try
    if pCodigo <> '' then
    begin
      q.SQL.Text := 'Select * from RubrosDatosFijos where Codigo=:Codigo';
      q.ParamByName('Codigo').AsString := pCodigo;
      q.Open;

      edtDescripcion.Text := q.FieldbyName('Descripcion').asstring;
      edtCodigo.Text      := q.Fieldbyname('Codigo').asstring;
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled   := (Operacion in  [toNuevo]);
  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    prBorrar(ToInt(pCodigo));
    Close;
  end;
end;

procedure TFRubroDatosFijos.prBorrar(pCodigo: Integer);
var
  q: TFXQuery;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el rubro seleccionado?', mtConfirmation) then
  begin
    q := CrearQuery;
    try
      DM.IniciarTransaccion;
      try
        q.SQL.Text := 'Delete from RubrosDatosFIjos where codigo = :Codigo';
        q.ParamByName('Codigo').AsInteger := pCodigo;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos eliminados correctamente.');

      except
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Inmosys', 'Ocurrio un error al eliminar el rubro de datos fijos.', mtError);
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

end.


