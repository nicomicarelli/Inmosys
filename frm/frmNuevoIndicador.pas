unit frmNuevoIndicador;

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
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator, fxQuery,
  AdvMemo, cxMaskEdit, cxDropDownEdit;

type
  TFNuevoIndicador = class(TForm)
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
    Label1: TLabel;
    edtTitulo: TEdit;
    chActivo: TcxCheckBox;
    Label2: TLabel;
    edtSql: TMemo;
    chFormatoMoneda: TcxCheckBox;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    edtRubro: TEdit;
    cboRubro: TcxComboBox;
    Label5: TLabel;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure edtRubroKeyPress(Sender: TObject; var Key: Char);
    procedure cboRubroPropertiesChange(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    procedure prBorrarIndicador(pCodigo: Integer);
  public
    procedure Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  FNuevoIndicador: TFNuevoIndicador;

implementation

uses frmprincipal, frmABMCajas, frmABMIndicadores;

{$R *.dfm}

procedure TFNuevoIndicador.btnGrabarClick(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
  Titulo: string;
  Sql: string;
  Rubro: Integer;

begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;
  Titulo      := edtTitulo.text;
  SQL         := edtSql.text;
  Rubro       := ToInt(edtRubro.Text);

  if ValidarDatos then
  begin
    if DM.GrabarIndicadores(Codigo, Descripcion, Titulo, Sql, chActivo.Checked, chFOrmatoMoneda.Checked, FOperacion, Rubro) then
    begin
      MostrarDialogoAceptar('Información','El Indicador se grabo satisfactoriamente.', mtInformation);
      Close;
    end;
  end;
end;

procedure TFNuevoIndicador.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNuevoIndicador.Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;

  btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
  edtCodigo.Enabled  := (Operacion in  [toNuevo]);
  edtDescripcion.Enabled  := True;

  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := ' Select Coalesce(Max(Codigo)+1, 1) as Codigo '+
                    '   From Indicadores ';
      q.Open;

      edtCodigo.Text := q.FieldByName('Codigo').AsString;
    finally
      FreeAndNIl(q);
    end;
    edtDescripcion.Text := '';
    edtTitulo.Text := '';
    edtSQL.Lines.Clear;
    Exit;
  end;

  if (Operacion = toModificar) or (Operacion = toEliminar) then
  begin
    edtDescripcion.SetFocus;

    q := CrearQuery;
    try
      q.SQL.Text := ' Select I.* '+
                    '   from Indicadores I'+
                    '  where I.codigo=:Codigo';
      q.ParamByName('Codigo').AsInteger := pCodigo;
      q.Open;

      if pCodigo > 0 then
      begin
        edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
        edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
        edtTitulo.Text               := q.Fieldbyname('Titulo').asstring;
        edtSql.text                  := q.Fieldbyname('Consulta').asstring;
        chFormatoMoneda.Checked      := q.Fieldbyname('FormatoMoneda').asInteger =1;
        chActivo.Checked             := q.Fieldbyname('Activo').asInteger =1;
        edtRubro.Text                := q.FieldByName('Rubro').AsString;

        if edtRubro.Text <> '' then
        begin
          q.SQL.Text := 'Select Descripcion from RubrosIndicadores where codigo=:Codigo';
          q.ParamByName('Codigo').AsString := edtRubro.Text;
          q.Open;

          cboRubro.ItemIndex := cboRubro.Properties.items.indexof
            (q.FieldByName('Descripcion').AsString);
        end;

      end;
    finally
      FreeAndNil(q);
    end;
  end;

  if Operacion = toEliminar then
  begin
    prBorrarIndicador(pCodigo);
    Close;
  end;
  if Assigned(FABMIndicadores) then
    FABMIndicadores.btnActualizarClick(nil);
end;

procedure TFNuevoIndicador.cboRubroPropertiesChange(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from RubrosIndicadores where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboRubro.Text;
    q.Open;

    edtRubro.Text := q.FieldByName('Codigo').AsString;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoIndicador.edtRubroKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
      if edtRubro.Text = '' then
        edtRubro.SetFocus
      else
      begin
        q.SQL.Text :=
          ' Select Descripcion from RubrosIndicadores where Codigo = :Codigo';
        q.ParamByName('Codigo').AsString := edtRubro.Text;
        q.Open;

        cboRubro.ItemIndex := cboRubro.Properties.items.indexof
          (q.FieldByName('Descripcion').AsString);

        if FOperacion = toMostrar then
          Exit;
        btnGrabar.SetFocus;
      end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoIndicador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dsDatos);
  FreeAndNil(cdsDatos);
  action := caFree;
  fNuevoIndicador := nil;
end;

procedure TFNuevoIndicador.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  fPrincipal.Center(Self);
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Descripcion from RubrosIndicadores order by descripcion';
    q.Open;

    while not q.Eof do
    begin
      cboRubro.Properties.items.Add(q.FieldByName('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoIndicador.prBorrarIndicador(pCodigo: Integer);
var
  q: TFXQuery;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el indicador seleccionada?', mtConfirmation) then
  begin
    q := CrearQuery;
    try
      DM.IniciarTransaccion;
      try
        q.SQL.Text := 'Delete from Indicadores where codigo = :Codigo';
        q.ParamByName('Codigo').AsInteger := pCodigo;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos eliminados correctamente.');
      except
        DM.CancelarTransaccion;
        MostrarDialogoAceptar( 'Ocurrio un error al eliminar el indicador.', mtError);
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;


function TFNuevoIndicador.ValidarDatos: Boolean;
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

  if Trim(edtTitulo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Titulo. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtSql.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Consulta. ', mtInformation);
    Result := False;
    Exit;
  end;
end;


end.
