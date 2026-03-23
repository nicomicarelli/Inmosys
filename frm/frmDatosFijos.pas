unit frmDatosFijos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Spin, FXQuery, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
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
  AdvGlowButton, cxGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxRadioGroup;

type
  TfDatosfijos = class(TForm)
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
    cxGroupBox1: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    lblInquilinoPropietario: TLabel;
    lblListadoInforme: TLabel;
    lblSobreDestino: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    edtInquilinoPropietario: TEdit;
    edtListadoInforme: TEdit;
    edtSobreDestino: TEdit;
    cboAfecta: TComboBox;
    cboListado: TComboBox;
    cboSobre: TComboBox;
    edtDescuenta: TEdit;
    cboDescuenta: TComboBox;
    edtOtroSobre: TEdit;
    cboOtroSobre: TComboBox;
    chTributa: TCheckBox;
    spOrden: TSpinEdit;
    cxGroupBox2: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    edtRubro: TEdit;
    cboRubro: TcxComboBox;
    Label1: TLabel;
    chActivo: TCheckBox;
    Label5: TLabel;
    rgHonorarios: TcxRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboAfectaChange(Sender: TObject);
    procedure cboListadoChange(Sender: TObject);
    procedure cboSobreChange(Sender: TObject);
    procedure cboOtroSobreChange(Sender: TObject);
    procedure cboDescuentaChange(Sender: TObject);
    procedure cboRubroPropertiesChange(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  fDatosfijos: TfDatosfijos;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos;
{$R *.DFM}

procedure TfDatosfijos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fDatosfijos := nil;
end;

procedure TfDatosfijos.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    fPrincipal.Center(Self);
    q.SQL.Text := 'Select * from sobres where activo = 1 order by descripcion';
    q.Open;

    while not q.Eof do
    begin
      cboOtroSobre.items.Add(q.FieldByName('Descripcion').AsString);
      cboSobre.items.Add(q.FieldByName('Descripcion').AsString);
      cboDescuenta.items.Add(q.FieldByName('Descripcion').AsString);
      q.Next;
    end;

    q.SQL.Text := 'Select Descripcion from RubrosDatosFijos order by descripcion';
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

function TfDatosfijos.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripción. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtInquilinoPropietario.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Tipo Inquilino o Propietario. ',
      mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtSobreDestino.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Sobre Destino. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescuenta.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Sobre del cual a Descontar. ',
      mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtListadoInforme.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un Listado Informe. ', mtInformation);
    Result := False;
    Exit;
  end;

end;

procedure TfDatosfijos.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if Trim(edtDescripcion.Text) = '' then
      edtDescripcion.SetFocus
    else
      edtInquilinoPropietario.SetFocus;
end;

procedure TfDatosfijos.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13])
    then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TfDatosfijos.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
  begin
    if TWinControl.ClassNameIs('TEdit') then
    begin
      Self.Controls[I].Enabled := True;
      TEdit(Self.Controls[I]).Text := '';
    end;
    if TWinControl.ClassNameIs('TCombobox') then
      TComboBox(Self.Controls[I]).ItemIndex := -1;
  end;
end;

procedure TfDatosfijos.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Descripcion: string;
  InqProp: Integer;
  Listado: Integer;
  Sobre: Integer;
  Descuenta: Integer;
  OtroSobre: Integer;
  Orden: Integer;
  Rubro: Integer;
  Activo: Integer;
begin
  Codigo := edtCodigo.Text;
  Descripcion := edtDescripcion.Text;
  InqProp := ToInt(edtInquilinoPropietario.Text);
  Listado := ToInt(edtListadoInforme.Text);
  Sobre := ToInt(edtSobreDestino.Text);
  Descuenta := ToInt(edtDescuenta.Text);
  OtroSobre := ToInt(edtOtroSobre.Text);
  orden     := spOrden.Value;
  Rubro     := ToInt(edtRubro.Text);
  Activo    := BoolToInt(chActivo.Checked);

  if ValidarDatos then
  begin
    if DM.GrabarConceptos(Codigo, Descripcion, InqProp, Listado, Sobre,
      Descuenta, OtroSobre, chTributa.Checked, Operacion, Orden, Rubro, Activo, rgHonorarios.ItemIndex) then
    begin
      MostrarDialogoAceptar('Información',
        'El dato fijo se grabo satisfactoriamente', mtInformation);
      actNuevo.Execute;
    end;
    Close;
  end;
end;

procedure TfDatosfijos.DatosKeyPress(Sender: TObject; var Key: Char);
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
          SQL.Add('select * from conceptos where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          MostrarDialogoAceptar(
            'Ya existe un Dato Fijo con ese Código. Verifique por favor.',
            mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          edtCodigo.SetFocus;
      end;
      if not(Key in ['0' .. '9', #8]) then
        Key := #0;
    end;

    if (TWinControl(Sender).Name = 'edtInquilinoPropietario') then
    begin
      if not(Key in ['0' .. '2', #8, #13]) then
        Key := #0;
      if Key = #13 then
      begin
        if edtInquilinoPropietario.Text = '' then
          edtInquilinoPropietario.SetFocus
        else
        begin
          cboAfecta.ItemIndex := StrToInt(edtInquilinoPropietario.Text);
          edtListadoInforme.SetFocus;
        end;
      end;
    end;

    if (TWinControl(Sender).Name = 'edtListadoInforme') then
    begin
      if not(Key in ['0' .. '3', #8, #13]) then
        Key := #0;
      if Key = #13 then
        if edtListadoInforme.Text = '' then
          edtListadoInforme.SetFocus
        else
        begin
          cboListado.ItemIndex := StrToInt(edtListadoInforme.Text);
          edtSobreDestino.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtSobreDestino') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtSobreDestino.Text = '' then
          edtSobreDestino.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtSobreDestino.Text;
          q.Open;

          cboSobre.ItemIndex := cboSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtDescuenta.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtOtroSobre') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtOtroSobre.Text = '' then
          edtOtroSobre.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtOtroSobre.Text;
          q.Open;

          cboOtroSobre.ItemIndex := cboOtroSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtDescuenta.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtDescuenta') then
    begin
      if not(Key in ['0' .. '4', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtDescuenta.Text = '' then
          edtDescuenta.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtDescuenta.Text;
          q.Open;

          cboDescuenta.ItemIndex := cboDescuenta.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtRubro.SetFocus;
        end;
    if (TWinControl(Sender).Name = 'edtRubro') then
    begin
      if not(CharInSet(Key, ['0' .. '9', #8, #13])) then
        Key := #0;

      if Key = #13 then
        if edtRubro.Text = '' then
          edtRubro.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from RubrosDatosFijos where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtRubro.Text;
          q.Open;

          cboRubro.ItemIndex := cboRubro.Properties.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          btnGrabar.SetFocus;
        end;
    end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfDatosfijos.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(edtCodigo.Text) <> '');
end;

procedure TfDatosfijos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfDatosfijos.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtDescripcion.Text := '';
    edtInquilinoPropietario.Text := '';
    edtListadoInforme.Text := '';
    edtSobreDestino.Text := '';
    edtDescuenta.Text := '';
    cboListado.ItemIndex := -1;
    cboAfecta.ItemIndex := -1;
    cboSobre.ItemIndex := -1;
    cboOtroSobre.ItemIndex := -1;
    cboDescuenta.ItemIndex := -1;
    SpOrden.Value := 1;
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from conceptos where codigo=:Codigo';
    q.ParamByName('Codigo').AsString := pCodigo;
    q.Open;

    edtCodigo.Text := q.FieldByName('Codigo').AsString;
    edtDescripcion.Text := q.FieldByName('Descripcion').AsString;
    edtInquilinoPropietario.Text := q.FieldByName('InqProp').AsString;
    cboAfecta.ItemIndex := q.FieldByName('InqProp').asInteger;
    edtListadoInforme.Text := q.FieldByName('Listado').AsString;
    cboListado.ItemIndex := q.FieldByName('Listado').asInteger;
    edtSobreDestino.Text := q.FieldByName('Sobre').AsString;
    edtOtroSobre.Text := q.FieldByName('OtroSobre').AsString;
    edtDescuenta.Text := q.FieldByName('Descuenta').AsString;
    chTributa.Checked := q.FieldByName('Tributa').AsInteger = 1;
    spOrden.Value     := q.FieldByName('Orden').AsInteger;
    edtRubro.Text := q.FieldByName('CodigoRubro').AsString;
    chActivo.Checked := q.FieldByName('Activo').AsInteger = 1;
    rgHonorarios.ItemIndex := q.FieldByName('Honorarios').AsInteger;

    if edtRubro.Text <> '' then
    begin
      q.SQL.Text := 'Select Descripcion from RubrosDatosFijos where codigo=:Codigo';
      q.ParamByName('Codigo').AsString := edtRubro.Text;
      q.Open;

      cboRubro.ItemIndex := cboRubro.Properties.items.indexof
        (q.FieldByName('Descripcion').AsString);
    end;

    if edtSobreDestino.Text <> '' then
    begin
      q.SQL.Text := 'Select Descripcion from Sobres where codigo=:Codigo';
      q.ParamByName('Codigo').AsString := edtSobreDestino.Text;
      q.Open;

      cboSobre.ItemIndex := cboSobre.items.indexof
        (q.FieldByName('Descripcion').AsString);
    end;
    if edtOtroSobre.Text <> '' then
    begin
      q.SQL.Text := 'Select Descripcion from Sobres where codigo=:Codigo';
      q.ParamByName('Codigo').AsString := edtOtroSobre.Text;
      q.Open;

      cboOtroSobre.ItemIndex := cboOtroSobre.items.indexof
        (q.FieldByName('Descripcion').AsString);
    end;

    if edtDescuenta.Text <> '' then
    begin
      q.SQL.Text := 'Select Descripcion from Sobres where codigo=:Codigo';
      q.ParamByName('Codigo').AsString := edtDescuenta.Text;
      q.Open;

      cboDescuenta.ItemIndex := cboDescuenta.items.indexof
        (q.FieldByName('Descripcion').AsString);
    end;

    btnGrabar.Visible := (Operacion in [toNuevo, toModificar]);
    edtCodigo.Enabled := (Operacion in [toNuevo]);
    edtInquilinoPropietario.Enabled := (Operacion in [toNuevo, toModificar]);
    edtListadoInforme.Enabled := (Operacion in [toNuevo, toModificar]);
    edtSobreDestino.Enabled := (Operacion in [toNuevo, toModificar]);
    edtDescuenta.Enabled := (Operacion in [toNuevo, toModificar]);
    edtDescripcion.Enabled := (Operacion in [toNuevo, toModificar]);
    cboAfecta.Enabled := (Operacion in [toNuevo, toModificar]);
    cboListado.Enabled := (Operacion in [toNuevo, toModificar]);
    cboSobre.Enabled := (Operacion in [toNuevo, toModificar]);
    cboOtroSobre.Enabled := (Operacion in [toNuevo, toModificar]);
    cboDescuenta.Enabled := (Operacion in [toNuevo, toModificar]);
    spOrden.Enabled := (Operacion in [toNuevo, toModificar]);
    chActivo.Enabled := (Operacion in [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMDatosFijos) then
      FABMDatosFijos.ActualizarClick(nil);
  end;
end;

procedure TfDatosfijos.cboAfectaChange(Sender: TObject);
begin
  edtInquilinoPropietario.Text := Inttostr(cboAfecta.ItemIndex);
end;

procedure TfDatosfijos.cboDescuentaChange(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from sobres where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboDescuenta.Text;
    q.Open;

    edtDescuenta.Text := q.FieldByName('Codigo').AsString;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfDatosfijos.cboListadoChange(Sender: TObject);
begin
  edtListadoInforme.Text := Inttostr(cboListado.ItemIndex);
end;

procedure TfDatosfijos.cboOtroSobreChange(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from sobres where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboOtroSobre.Text;
    q.Open;

    edtOtroSobre.Text := q.FieldByName('Codigo').AsString;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfDatosfijos.cboRubroPropertiesChange(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from RubrosDatosFijos where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboRubro.Text;
    q.Open;

    edtRubro.Text := q.FieldByName('Codigo').AsString;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfDatosfijos.cboSobreChange(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from sobres where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboSobre.Text;
    q.Open;

    edtSobreDestino.Text := q.FieldByName('Codigo').AsString;

  finally
    FreeAndNil(q);
  end;
end;

end.
