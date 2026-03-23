unit frmRazonesSociales;

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
  TFRazonesSociales = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ColorDialog1: TColorDialog;
    cxGroupBox2: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label1: TLabel;
    edtPorcentaje: TEdit;
    Label3: TLabel;
    edCuentaBancaria: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure edtPorcentajeKeyPress(Sender: TObject; var Key: Char);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  FRazonesSociales: TFRazonesSociales;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales;

{$R *.DFM}

procedure TFRazonesSociales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FRazonesSociales := nil;
end;

procedure TFRazonesSociales.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TFRazonesSociales.ValidarDatos: Boolean;
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

procedure TFRazonesSociales.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TFRazonesSociales.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TFRazonesSociales.actNuevoExecute(Sender: TObject);
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
    if TWinControl.ClassNameIs('TCombobox') then
      TCombobox(Self.Controls[I]).ItemIndex := -1;
  end;
end;

procedure TFRazonesSociales.actGrabarExecute(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
  Color:       string;
  CuentaBancaria: string;
  Porcentaje:  Double;
begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;
  Color       := ColortoString(Edit1.color);
  Porcentaje  := ToFloat(edtPorcentaje.Text);
  CuentaBancaria := edCuentaBancaria.text;

  if ValidarDatos then
  begin
    if DM.GrabarRazonesSociales(Codigo, Descripcion, Color, CuentaBancaria, Porcentaje, Operacion) then
    begin
      MostrarDialogoAceptar('Información','La Razon Social se grabo satisfactoriamente', mtInformation);
      actNuevo.Execute;
    end;
  end;
end;


procedure TFRazonesSociales.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        if Length(edtCodigo.Text) = 1 then
          edtCodigo.Text := '0' + edtCodigo.Text;
        edtDescripcion.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from RazonesSociales where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe una Razon Social con ese Código. Verifique por favor.', mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus;
      end;
      if not (Key in ['0'..'9', #8]) then
        Key := #0;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFRazonesSociales.edtPorcentajeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',','.', #8, #13]) then
    Key := #0;
  if key = ',' then
    Key := '.';
end;

procedure TFRazonesSociales.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    With q do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from RazonesSociales where codigo = :Codigo');
      ParamByName('Codigo').AsString := edtCodigo.Text;
      ExecSql;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFRazonesSociales.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TFRazonesSociales.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFRazonesSociales.Button1Click(Sender: TObject);
var
  Color: TColor;
begin
  ColorDialog1.Execute;
  Color := ColorDialog1.Color;
  Edit1.Color := Color;
end;

procedure TFRazonesSociales.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtDescripcion.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from RazonesSociales where codigo=:Codigo';
    q.ParamByName('Codigo').AsString := pCodigo;
    q.Open;

    if pCodigo <> '' then
    begin
      edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
      edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      edCuentaBancaria.Text        := q.Fieldbyname('CuentaBancaria').asstring;
      Edit1.Color                  := StringToColor(q.Fieldbyname('Color').asstring);
      edtPorcentaje.Text           := FormatFloat('0.00', q.Fieldbyname('Porcentaje').asFloat);
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edCuentaBancaria.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtPorcentaje.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMRazonesSociales) then
      FABMRazonesSociales.ActualizarClick(nil);
  end;
end;

end.
