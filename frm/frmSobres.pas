unit frmSobres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, FXQuery, Declaraciones,
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
  AdvGlowButton, cxGroupBox;

type
  TFSobres = class(TForm)
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
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    ComboCodigos: TComboBox;
    chActivo: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  FSobres: TFSobres;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmABMSobres;

{$R *.DFM}

procedure TFSobres.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FSobres := nil;
end;

procedure TFSobres.FormCreate(Sender: TObject);
var
  q: tFXQuery;
begin
  fPrincipal.Center(Self);
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Codigo, descripcion from sobres where principal = 1 and activo = 1 order by codigo';
    q.Open;

    while not q.Eof do
    begin
      Combobox1.Items.Add(q.FieldByName('Descripcion').AsString);
      ComboCodigos.Items.Add(q.FieldByName('Codigo').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TFSobres.ValidarDatos: Boolean;
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

  if (checkbox1.Checked) and (combobox1.ItemIndex = -1) then
  begin
    MostrarDialogoAceptar('Debe seleccionar un sobre padre. ', mtInformation);
    Result := False;
    Exit;
  end;

  if (checkbox1.Checked) and (combobox1.text = '') then
  begin
    MostrarDialogoAceptar('Debe seleccionar un sobre padre. ', mtInformation);
    Result := False;
    Exit;
  end;

  if (checkbox1.Checked) and (checkbox2.Checked) then
  begin
    MostrarDialogoAceptar('No puede ser principal y depender de un sobre al mismo tiempo. ', mtInformation);
    Result := False;
    Exit;
  end;


end;

procedure TFSobres.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TFSobres.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TFSobres.actNuevoExecute(Sender: TObject);
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

procedure TFSobres.actGrabarExecute(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
  principal:   Integer;
  activo:      Integer;
  Depende:     Integer;
begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;
  if checkbox2.Checked then
    Principal   := 1
  else
    Principal   := 0;
  if chActivo.Checked then
    Activo   := 1
  else
    Activo   := 0;

  if checkbox1.Checked then
    depende := StrtoInt(combocodigos.text)
  else
    depende := -1;

  if ValidarDatos then
  begin
    if DM.GrabarSobres(Codigo, Descripcion, Principal, Depende, Operacion, Activo) then
    begin
      MostrarDialogoAceptar('Información','El Sobre se grabo satisfactoriamente', mtInformation);
      actNuevo.Execute;
    end;
  end;
  Close;
end;


procedure TFSobres.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: tFXQuery;
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
          SQL.Add('select * from Sobres where codigo = :Codigo order by descripcion');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe un Sobre con ese Código. Verifique por favor.', mtInformation);
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

procedure TFSobres.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Delete from sobres where Codigo = :Codigo ';
    q.ParamByName('Codigo').AsString := edtCodigo.Text;
    q.ExecSql;
  finally
    FreeAndNil(q);
  end;

end;

procedure TFSobres.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TFSobres.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFSobres.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: tFXQuery;

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
    if pCodigo <> '' then
    begin
      q.SQL.Text := 'Select * from Sobres where codigo=:Codigo order by descripcion';
      q.ParamByName('Codigo').AsString := pCodigo;
      q.Open;

      edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
      edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      checkbox2.Checked            := q.Fieldbyname('Principal').asInteger = 1;
      chActivo.Checked             := q.Fieldbyname('Activo').asInteger = 1;
      checkbox1.Checked            := q.Fieldbyname('depende').asInteger <> -1;
      Combocodigos.ItemIndex       := Combocodigos.Items.IndexOf(q.Fieldbyname('depende').asString);
      combobox1.Itemindex          := Combocodigos.Items.IndexOf(q.Fieldbyname('depende').asString);
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMSobres) then
      FABMSobres.ActualizarClick(nil);
  end;
end;

procedure TFSobres.CheckBox2Click(Sender: TObject);
begin
  if checkbox2.Checked then
  begin
    combobox1.ItemIndex := -1;
    Checkbox1.checked := False;
    Checkbox1.Enabled := false;
    combobox1.Enabled := False;
  end
  else
  begin
    Checkbox1.checked := True;
    Checkbox1.Enabled := True;
    combobox1.Enabled := True;
  end;
end;

procedure TFSobres.ComboBox1Change(Sender: TObject);
begin
  ComboCodigos.ItemIndex := Combobox1.ItemIndex;
end;

end.


