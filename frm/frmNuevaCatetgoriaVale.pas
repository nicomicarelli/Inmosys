unit frmNuevaCatetgoriaVale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
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
  AdvGlowButton, cxGroupBox, AdvPanel, fxQuery, cxCheckBox;

type
  TfNuevaCategoriaVale = class(TForm)
    popOrdenar: TPopupMenu;
    Ordenar1: TMenuItem;
    Cdigo1: TMenuItem;
    Descripcin1: TMenuItem;
    Destino1: TMenuItem;
    pnlFondo: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    ColorDialog1: TColorDialog;
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    chEsConsorcio: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
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
    procedure Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
    procedure prBorrarCategoria(pCodigo: Integer);

  end;

var
  fNuevaCategoriaVale: TfNuevaCategoriaVale;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmABMCategoriasVales;

{$R *.DFM}

procedure TfNuevaCategoriaVale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevaCategoriaVale := nil;
end;

procedure TfNuevaCategoriaVale.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TfNuevaCategoriaVale.ValidarDatos: Boolean;
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

procedure TfNuevaCategoriaVale.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TfNuevaCategoriaVale.actNuevoExecute(Sender: TObject);
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

procedure TfNuevaCategoriaVale.actGrabarExecute(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
  EsConsorcio: Boolean;
begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;
  EsConsorcio := chEsConsorcio.Checked;

  if ValidarDatos then
  begin
    if DM.GrabarCategoriasVales(Codigo, Descripcion, EsConsorcio, Operacion) then
    begin
      MostrarDialogoAceptar('Información','La categoría se grabo satisfactoriamente', mtInformation);
      Close;
    end;
  end;
end;


procedure TfNuevaCategoriaVale.DatosKeyPress(Sender: TObject; var Key: Char);
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
          SQL.Add('select * from CategoriasVales where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe una Categoría con ese Código. Verifique por favor.', mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus;
      end;
      if not (CharInSet(Key, ['0'..'9', #8])) then
        Key := #0;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNuevaCategoriaVale.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfNuevaCategoriaVale.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNuevaCategoriaVale.Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;
  edtCodigo.Enabled := False;

  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := ' Select Coalesce(Max(Codigo)+1, 1) as Codigo '+
                    '   From CategoriasVales ';
      q.Open;

      edtCodigo.Text := q.FieldByName('Codigo').AsString;
    finally
      FreeAndNIl(q);
    end;
    edtDescripcion.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from CategoriasVales where codigo=:Codigo';
    q.ParamByName('Codigo').AsInteger := pCodigo;
    q.Open;

    if pCodigo <> 0 then
    begin
      edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
      edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      chEsConsorcio.Checked        := q.Fieldbyname('EsConsorcio').asInteger = 1;
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    prBorrarCategoria(pCodigo);
    Close;
    if Assigned(FABMCategoriasVales) then
      FABMCategoriasVales.ActualizarClick(nil);
  end;
end;

procedure TfNuevaCategoriaVale.prBorrarCategoria(pCodigo: Integer);
var
  q: TFXQuery;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar la categoria seleccionada?', mtConfirmation) then
  begin
    q := CrearQuery;
    try
      DM.IniciarTransaccion;
      try
        q.SQL.Text := 'Delete from CategoriasVales where codigo = :Codigo';
        q.ParamByName('Codigo').AsInteger := pCodigo;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos eliminados correctamente.');
      except
        DM.CancelarTransaccion;
        MostrarDialogoAceptar( 'Ocurrio un error al eliminar la categoría.', mtError);
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

end.
