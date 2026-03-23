unit frmUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  System.Actions, FXQuery, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  AdvGlowButton, cxGroupBox;

type
  TFUsuarios = class(TForm)
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
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    edtNombre: TEdit;
    edtClave: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtClaveKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  FUsuarios: TFUsuarios;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmABMSobres, frmSobres, frmABMUsuarios;

{$R *.DFM}

procedure TFUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FUsuarios := nil;
end;

procedure TFUsuarios.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TFUsuarios.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtNombre.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Nombre. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtClave.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Clave. ', mtInformation);
    Result := False;
    Exit;
  end;

end;

procedure TFUsuarios.edtClaveKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtNombre.Text) = '' then
     EdtNombre.SetFocus;
end;

procedure TFUsuarios.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtNombre.SetFocus;
  end;
end;

procedure TFUsuarios.actNuevoExecute(Sender: TObject);
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

procedure TFUsuarios.actGrabarExecute(Sender: TObject);
var
  Nombre:      string;
  Clave: string;
begin
  Nombre      := edtNombre.text;
  Clave       := edtClave.text;

  if ValidarDatos then
  begin
    if DM.GrabarUsuarios(Nombre, Clave, Operacion) then
    begin
      MostrarDialogoAceptar('Información','El Usuario se grabo satisfactoriamente', mtInformation);
      actNuevo.Execute;
    end;
  end;
  Close;
end;


procedure TFUsuarios.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtNombre' then
    begin
      if Key = #13 then
      begin
        edtClave.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from Usuarios where Nombre = :Nombre');
          ParamByName('Nombre').AsString := edtNombre.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe un Usuario con ese Nombre. Verifique por favor.', mtInformation);
          edtNombre.Text := '';
          edtNombre.SetFocus;
          Exit;
        end;
        if edtNombre.Text = '' then
          EdtNombre.SetFocus;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFUsuarios.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
 q := CrearQuery;
  try
      q.SQL.Text := 'Delete from Usuarios where Nombre=:Nombre';
      q.ParamByName('Nombre').AsString := edtNombre.Text;
      q.ExecSql;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFUsuarios.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtNombre.Text) <> '');
end;

procedure TFUsuarios.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFUsuarios.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtNombre.Text := '';
    edtClave.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtClave.SetFocus;
  end;

  q := CrearQuery;
  try
    if pCodigo <> '' then
    begin
      q.SQL.Text := 'Select * from Usuarios where Nombre=:Nombre';
      q.ParamByName('Nombre').AsString := pCodigo;
      q.Open;

      edtNombre.Text               := q.FieldbyName('Nombre').asstring;
      edtClave.Text                := q.Fieldbyname('Clave').asstring;
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtNombre.Enabled  := (Operacion in  [toNuevo]);
    edtClave.Enabled   := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMUsuarios) then
      FABMUsuarios.ActualizarClick(nil);
  end;
end;

end.


