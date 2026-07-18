unit frminmuebles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  FXQuery, IBTable,
  IBCustomDataSet, IBQuery, Funciones, ActnList, ToolWin, ImgList,
  Mask, Aligrid, Menus, sqlExpr, Declaraciones, System.Actions, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, frmDeudaImpuestos;

type
  TfInmuebles = class(TForm)
    aclLista: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actExpensas: TAction;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Panel1: TPanel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    chkEntregarImpuestos: TCheckBox;
    chActivo: TCheckBox;
    chTributa: TCheckBox;
    chPuedeTransferir: TCheckBox;
    chPrelegales: TCheckBox;
    chDevuelveDiferencias: TCheckBox;
    chDesocupado: TCheckBox;
    lblAlquilerInicial: TLabel;
    lblInquilino: TLabel;
    lblPropietario: TLabel;
    lblFechaInicio: TLabel;
    lblFechaVencimiento: TLabel;
    lblUbicacion: TLabel;
    lblFechadePago: TLabel;
    lblFechaPago: TLabel;
    lblTelefono: TLabel;
    lblDireccion: TLabel;
    lblLiquidacion: TLabel;
    lblLiquida: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TMaskEdit;
    Edit2: TMaskEdit;
    Edit4: TMaskEdit;
    Edit5: TMaskEdit;
    Edit8: TMaskEdit;
    Edit9: TMaskEdit;
    Edit7: TMaskEdit;
    Edit6: TMaskEdit;
    Edit10: TMaskEdit;
    Combobox2: TMaskEdit;
    Edit11: TMaskEdit;
    edtdniReferente: TMaskEdit;
    edReferente: TMaskEdit;
    cboRazonSocial: TComboBox;
    emailpropietario: TMaskEdit;
    emailinquilino: TMaskEdit;
    edPlantillaPropietario: TMaskEdit;
    edPlantillaInquilino: TMaskEdit;
    edtDNIInquilino: TMaskEdit;
    edtDNIPropietario: TMaskEdit;
    lblContratoVencido1: TLabel;
    lblContratoVencido2: TLabel;
    Memo1: TMemo;
    chLegales: TCheckBox;
    chJuicioDesalojo: TCheckBox;
    chJuicioPVE: TCheckBox;
    chRescinde: TCheckBox;
    chSeDesocupa: TCheckBox;
    chDescuentaGastos: TCheckBox;
    chTienePresupuestos: TCheckBox;
    MaskEdit1: TMaskEdit;
    chPasar: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    cboCtaBancaria: TComboBox;
    Label12: TLabel;
    MaskEdit2: TMaskEdit;
    chPasarDesalojo: TCheckBox;
    MaskEdit3: TMaskEdit;
    chPasarPVE: TCheckBox;
    MaskEdit4: TMaskEdit;
    Label13: TLabel;
    edNomCatastral: TMaskEdit;
    Label14: TLabel;
    edUFuncional: TMaskEdit;
    Label15: TLabel;
    edNumCuenta: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    memObservaciones: TMemo;
    chRenueva: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure btnBorrarClick(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Enter(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure actModificarExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure actExpensasExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure Combobox2KeyPress(Sender: TObject; var Key: Char);
    procedure edtdniReferenteKeyPress(Sender: TObject; var Key: Char);
    procedure edReferenteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure emailpropietarioKeyPress(Sender: TObject; var Key: Char);
    procedure emailinquilinoKeyPress(Sender: TObject; var Key: Char);
    procedure edPlantillaPropietarioKeyPress(Sender: TObject; var Key: Char);
    procedure edPlantillaInquilinoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDNIInquilinoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDNIPropietarioKeyPress(Sender: TObject; var Key: Char);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure chDesocupadoClick(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure chLegalesClick(Sender: TObject);
    procedure chPasarClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure cboRazonSocialClick(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure chJuicioDesalojoClick(Sender: TObject);
    procedure chJuicioPVEClick(Sender: TObject);
  public
    FOperacion: TTipoOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    Function CalculaExpensas(Codigo: String): Boolean;
    function ValidarDatos: Boolean;
  end;

var
  fInmuebles: TfInmuebles;

implementation

uses frmdatos, frmABMInmuebles, frmPrincipal;

{$R *.DFM}


procedure TfInmuebles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FInmuebles := nil;
end;

procedure TfInmuebles.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  fPrincipal.Center(Self);
  q := CrearQuery;
  try
    q.SQL.Text := 'Select CuentaBancaria, Descripcion from RazonesSociales';
    q.Open;

    cboRazonSocial.Clear;
    cboctaBancaria.Clear;
    while not q.Eof do
    begin
      cboRazonSocial.items.Add(q.Fieldbyname('Descripcion').AsString);
      cboctaBancaria.items.Add(q.Fieldbyname('CuentaBancaria').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(Q);
  end;
end;

procedure TfInmuebles.MaskEdit1Exit(Sender: TObject);
var
  Fecha: TDateTime;
begin
  if not TryStrToDate(Maskedit1.Text, Fecha) then
  begin
    MostrarDialogoAceptar('La fecha ingresada es inválida. Verifique por favor.');
    MaskEdit1.SetFocus;
  end;

  if chLegales.Checked then
    maskedit1.Text := FormatDatetime('05/mm/yyyy', Fecha)
  else
    maskedit1.Text := FormatDatetime('10/mm/yyyy', Fecha);
end;

procedure TfInmuebles.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
var
   Fecha: string;
   Ano:   Integer;

begin
  if Key = #13 then
  begin
    if Trim(Maskedit1.Text) = '' then
      Maskedit1.Text := FormatDatetime('dd/mm/yyyy',Date())
    else
    begin
      if Length(Maskedit1.Text) = 6 then
      begin
        Fecha      := Maskedit1.Text;
        Maskedit1.Text := TransformaFecha(Fecha);
      end;
    end;

//    Fecha := Maskedit1.Text;
//    Delete(Fecha, 1, 6);
//    Ano   := StrToInt(Fecha) + 2;
//    Fecha := Maskedit1.Text;
//    Delete(Fecha, 7, 4);
//
//    if Edit6.Text = '' then
//      Edit6.Text := Fecha + IntToStr(Ano);
  end;
end;

procedure TfInmuebles.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',',','.', #8, #13]) then
    Key := #0;
end;

procedure TfInmuebles.MaskEdit3Exit(Sender: TObject);
var
  Fecha: TDateTime;
begin
  if not TryStrToDate(Maskedit3.Text, Fecha) then
  begin
    MostrarDialogoAceptar('La fecha ingresada es inválida. Verifique por favor.');
    MaskEdit3.SetFocus;
  end;

  if chJuicioDesalojo.Checked then
    maskedit3.Text := FormatDatetime('05/mm/yyyy', Fecha)
  else
    maskedit3.Text := FormatDatetime('10/mm/yyyy', Fecha);
end;

procedure TfInmuebles.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
var
   Fecha: string;
   Ano:   Integer;

begin
  if Key = #13 then
  begin
    if Trim(Maskedit3.Text) = '' then
      Maskedit3.Text := FormatDatetime('dd/mm/yyyy',Date())
    else
    begin
      if Length(Maskedit3.Text) = 6 then
      begin
        Fecha      := Maskedit3.Text;
        Maskedit3.Text := TransformaFecha(Fecha);
      end;
    end;
  end;
end;

procedure TfInmuebles.MaskEdit4Exit(Sender: TObject);
var
  Fecha: TDateTime;
begin
  if not TryStrToDate(Maskedit4.Text, Fecha) then
  begin
    MostrarDialogoAceptar('La fecha ingresada es inválida. Verifique por favor.');
    MaskEdit4.SetFocus;
  end;

  if chJuicioPVE.Checked then
    maskedit4.Text := FormatDatetime('05/mm/yyyy', Fecha)
  else
    maskedit4.Text := FormatDatetime('10/mm/yyyy', Fecha);
end;

procedure TfInmuebles.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
var
   Fecha: string;
   Ano:   Integer;

begin
  if Key = #13 then
  begin
    if Trim(Maskedit4.Text) = '' then
      Maskedit4.Text := FormatDatetime('dd/mm/yyyy',Date())
    else
    begin
      if Length(Maskedit4.Text) = 6 then
      begin
        Fecha      := Maskedit4.Text;
        Maskedit4.Text := TransformaFecha(Fecha);
      end;
    end;
  end;
end;

procedure TfInmuebles.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  FechaDesde, FechaHasta: TDatetime;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edit1.Text := '';
    edit2.Text := '';
    edit4.Text := '';
    edit5.Text := '';
    edit6.Text := '';
    edit7.Text := '';
    edit8.Text := '';
    edit9.Text := '';
    edit10.Text := '';
    edit11.Text := '';
    emailPropietario.Text := '';
    emailInquilino.Text := '';
    edReferente.Text := '';
    edtDNIPropietario.Text := '';
    edtDNIInquilino.Text := '';
    edtDNIReferente.Text := '';
    Combobox2.Text := '';
  end;

  if Operacion = toModificar then
    edit2.SetFocus;

  q := CrearQuery;
  try
    with q do
    begin
      SQL.Text := 'Select * from Inmuebles where codinq=:Codigo';
      ParamByName('Codigo').AsString := pCodigo;
      Open;

      if not q.IsEmpty then
      begin
        Edit1.Text     := FieldbyName('Codinq').AsString;
        Edit2.Text     := FieldbyName('Inquilino').AsString;
        Edit4.Text     := FieldbyName('Propietario').AsString;
        Edit5.Text     := FieldbyName('Telefono').AsString;
        Edit8.Text     := FieldbyName('Domicilio').AsString;
        Edit9.Text     := FieldbyName('Ubicacion').AsString;
        Edit7.Text     := FormatDatetime('dd/mm/yyyy', FieldbyName('FechaInicio').AsDatetime);
        Edit6.Text     := FormatDatetime('dd/mm/yyyy', FieldbyName('FechaFin').AsDatetime);
        Edit10.Text    := FormatFloat('0.00', ToFloat(FieldbyName('Alquiler').AsString));
        Maskedit2.Text    := FormatFloat('0.00', FieldbyName('PorcentajeGastoBancario').AsFloat);
        Edit11.Text    := FieldbyName('Liquidacion').AsString;
        EdtDNIPropietario.Text    := FieldbyName('DniPropietario').AsString;
        EdtDNIInquilino.Text    := FieldbyName('DniInquilino').AsString;
        EdtDNIReferente.Text    := FieldbyName('DniReferente').AsString;
        eMailPropietario.Text    := FieldbyName('MailPropietario').AsString;
        eMailInquilino.Text    := FieldbyName('MailInquilino').AsString;
        edPlantillaPropietario.Text    := FieldbyName('PlantillaPropietario').AsString;
        edPlantillaInquilino.Text    := FieldbyName('PlantillaInquilino').AsString;
        EdReferente.Text := FieldbyName('Referente').AsString;
        ComboBox2.Text := FieldbyName('FechaPago').AsString;
        CboRazonSocial.Itemindex := FieldbyName('RazonSocial').AsInteger;
        cboRazonSocialClick(nil);
//        CboctaBancaria.Itemindex := FieldbyName('CuentaBancaria').AsInteger;
        chkEntregarImpuestos.Checked := (FieldbyName('EntregarImpuestos').AsInteger = 1);
        FechaDesde     := Date();
        FechaHasta     := FieldbyName('FechaFin').AsDatetime;
        chActivo.Checked := FieldbyName('Activo').AsInteger = 1;
        chTributa.Checked := FieldbyName('Tributa').AsInteger = 1;
        chPuedeTransferir.Checked := FieldbyName('PuedeTransferir').AsInteger = 1;
        chPrelegales.Checked := FieldbyName('Prelegales').AsInteger = 1;
        chDevuelveDiferencias.Checked := FieldbyName('DevuelveDiferencias').AsInteger = 1;
        chDesocupado.Checked := FieldbyName('Desocupado').AsInteger = 1;
        chRenueva.Checked := FieldbyName('Renueva').AsInteger = 1;

        chLegales.OnClick := nil;
        chLegales.Checked := FieldbyName('Legales').AsInteger = 1;
        chLegales.OnClick := chLegalesClick;

        chRescinde.Checked := FieldbyName('Rescinde').AsInteger = 1;
        chSeDesocupa.Checked := FieldbyName('SeDesocupa').AsInteger = 1;
        chJuicioDesalojo.Checked := FieldbyName('JuicioDesalojo').AsInteger = 1;
        chJuicioPVE.Checked := FieldbyName('JuicioPVE').AsInteger = 1;
        chDescuentaGastos.Checked := FieldbyName('DescuentaGastos').AsInteger = 1;
        chTienePresupuestos.Checked := FieldbyName('TienePresupuestos').AsInteger = 1;

        edNomCatastral.Text    := FieldbyName('NomenclaturaCatastral').AsString;
        edUFuncional.Text    := FieldbyName('UnidadFuncional').AsString;
        edNumCuenta.Text    := FieldbyName('NumeroCuenta').AsString;
        memObservaciones.Text    := FieldbyName('Observaciones').AsString;


        if FechaDesde > FechaHasta then
        begin
          lblContratoVencido2.Visible := True;
          lblContratoVencido1.Visible := True;
          lblContratoVencido2.Caption := 'Contrato Vencido';
          lblContratoVencido1.Caption := 'Contrato Vencido';
        end;
        actModificar.Execute;
      end;
    end;
    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edit1.Enabled  := (Operacion in  [toNuevo]);
    edit2.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit4.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit5.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit6.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit7.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit8.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit9.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit10.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edit11.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edReferente.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDniPropietario.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDniInquilino.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDniReferente.Enabled  := (Operacion in  [toNuevo, toModificar]);
    Combobox2.Enabled  := (Operacion in  [toNuevo, toModificar]);
    CboRazonSocial.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMInmuebles) then
      FABMInmuebles.ActualizarClick(nil);
  end;
end;


procedure TfInmuebles.cboRazonSocialClick(Sender: TObject);
begin
  cboCtaBancaria.ItemIndex := cboRazonSocial.ItemIndex;
end;

procedure TfInmuebles.chDesocupadoClick(Sender: TObject);
begin
  if chDesocupado.Checked then
    chRescinde.Checked := False;
end;

procedure TfInmuebles.chJuicioDesalojoClick(Sender: TObject);
begin
  chLegales.OnClick := nil;
  chPasarPve.OnClick := nil;
  chPasarDesalojo.Visible := True;
  Maskedit3.Visible := True;
  chLegales.Checked := False;
  chJuicioPVE.Checked := False;
  chPasar.Visible := False;
  Maskedit1.Visible := False;
  chPasarPVE.Visible := False;
  Maskedit4.Visible := False;
  chLegales.OnClick := chLegalesClick;
  chJuicioPve.OnClick := chJuicioPVEClick;
end;

procedure TfInmuebles.chJuicioPVEClick(Sender: TObject);
begin
  chLegales.OnClick := nil;
  chJuicioDesalojo.OnClick := nil;

  chPasarPVE.Visible := True;
  Maskedit4.Visible := True;
  chLegales.Checked := False;
  chJuicioDesalojo.Checked := False;

  chPasar.Visible := False;
  Maskedit1.Visible := False;
  chPasarDesalojo.Visible := False;
  Maskedit3.Visible := False;
  chLegales.OnClick := chLegalesClick;
  chJuicioDesalojo.OnClick := chJuicioDesalojoClick;
end;

procedure TfInmuebles.chLegalesClick(Sender: TObject);
begin
  chJuicioPVE.OnClick := nil;
  chJuicioDesalojo.OnClick := nil;

  chPasar.Visible := True;
  Maskedit1.Visible := True;
  chJuicioDesalojo.Checked := False;
  chJuicioPVE.Checked := False;

  chPasarDesalojo.Visible := False;
  Maskedit3.Visible := False;
  chPasarPVE.Visible := False;
  Maskedit4.Visible := False;

  chJuicioPVE.OnClick := chJuicioPVEClick;
  chJuicioDesalojo.OnClick := chJuicioDesalojoClick;

end;

procedure TfInmuebles.chPasarClick(Sender: TObject);
begin
  if chLegales.Checked then
    maskedit1.Text := FormatDatetime('05/mm/yyyy', Date)
  else
    maskedit1.Text := FormatDatetime('10/mm/yyyy', Date);
end;

procedure TfInmuebles.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codinq:     string;
  q:          TFXQuery;
begin
  btnGrabar.Enabled := True;
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      Codinq := FormatFloat('0000', ToFloat(Edit1.Text));
      with q do
      begin
        Close;
        Sql.Text := ' select * from inmuebles where codinq = :codinq';
        ParamByName('codinq').AsString := Codinq;
        Open;
        if not IsEmpty then
        begin
          MostrarDialogoAceptar('Ya existe un Inmueble con ese Código. Verifique por favor.');
          edit1.SetFocus;
          btnGrabar.Enabled := False;
          Exit;
        end
        else
        begin
          Edit1.Text     := Codinq;
          Edit2.Text     := '';
          Edit5.Text     := '';
          Edit8.Text     := '';
          Edit4.Text     := '';
          Edit9.Text     := '';
          Edit7.Text     := '';
          EdReferente.Text     := '';
          EdtDniPropietario.Text     := '';
          EdtDniInquilino.Text     := '';
          EdtDniReferente.Text     := '';
          Edit6.Text     := '';
          Edit10.Text    := '0.00';
          ComboBox2.Text := '';
          actNuevo.Execute;
        end;
      end;
      Edit2.SetFocus;
      actExpensas.Execute;
    end;
  finally
    freeAndNil(q);
  end;
end;

procedure TfInmuebles.Edit7KeyPress(Sender: TObject; var Key: Char);
var
   Fecha: string;
   Ano:   Integer;

begin
  if Key = #13 then
  begin
    Edit6.SetFocus;
    if Trim(Edit7.Text) = '' then
      Edit7.Text := FormatDatetime('dd/mm/yyyy',Date())
    else
    begin
      if Length(Edit7.Text) = 6 then
      begin
        Fecha      := Edit7.Text;
        Edit7.Text := TransformaFecha(Fecha);
      end;
    end;

    Fecha := Edit7.Text;
    Delete(Fecha, 1, 6);
    Ano   := StrToInt(Fecha) + 2;
    Fecha := Edit7.Text;
    Delete(Fecha, 7, 4);

    if Edit6.Text = '' then
      Edit6.Text := Fecha + IntToStr(Ano);
  end;
end;

procedure TfInmuebles.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  if Key = #13 then
  begin
    if Length(Edit6.Text) = 10 then
      Edit10.SetFocus
    else
    begin
      Fecha      := Edit6.Text;
      Edit6.Text := TransformaFecha(Fecha);
    end;
  end;
end;

procedure TfInmuebles.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit9.SetFocus;
end;

procedure TfInmuebles.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EmailPropietario.SetFocus;
end;

procedure TfInmuebles.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  Case Key of
    #73: lblLiquida.Caption := 'Liquida impuestos solamente';
    #78: lblLiquida.Caption := 'No liquida automaticamente';
    #83: lblLiquida.Caption := 'Liquida automaticamente';
  end;
  IF KEY = #13 THEN
    cboRazonSocial.SetFocus;
end;

procedure TfInmuebles.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfInmuebles.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Combobox2.SetFocus;
    if Edit10.Text = '' then
      Edit10.Text:='0.00'
    else
      Edit10.Text := FormatFloat('0.00', StrToFloat(Edit10.Text));
  end;
end;

procedure TfInmuebles.ComboBox2Change(Sender: TObject);
begin
  if (Combobox2.Text = '10') or (Combobox2.Text = '15') or (Combobox2.Text = '20') or (Combobox2.Text = '25') or (Combobox2.Text = '30') then
    ComboBox2.Text:='1º al ' + ComboBox2.Text
end;

procedure TfInmuebles.ComboBox2Enter(Sender: TObject);
begin
  lblFechaPago.Caption := 'Ingrese 10, 15, 20, 25, 30';
  lblFechaPago.Visible := True;
end;

procedure TfInmuebles.ComboBox2Exit(Sender: TObject);
begin
  lblFechaPago.Visible := False;
end;

procedure TfInmuebles.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   Edit8.SetFocus;
end;

procedure TfInmuebles.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  IF kEY = #13 then
    EdtdniInquilino.SetFocus;
end;

procedure TfInmuebles.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtDNIPropietario.SetFocus;
end;

procedure TfInmuebles.btnBorrarClick(Sender: TObject);
begin
  actBorrar.Execute;
end;

procedure TfInmuebles.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   Edit11.SetFocus;
end;

procedure TfInmuebles.Edit1Exit(Sender: TObject);
begin
  Edit1.Text := FormatFloat('0000', ToFloat(Edit1.Text));
end;

procedure TfInmuebles.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   actGrabar.Execute;
end;

procedure TfInmuebles.Edit11Enter(Sender: TObject);
begin
  lblLiquida.Visible := True;
  lblLiquida.Caption := 'S/N/I   - S:Liq. Autom  - N: No Liq. Autom  -  I: Liq. solo Imp.';
end;

procedure TfInmuebles.Edit11Change(Sender: TObject);
var
  Opcion: string;

begin
  Opcion             := Edit11.Text;
  lblLiquida.Visible := True;
  if Opcion = 'S' then lblLiquida.Caption := 'Liquida Automaticamente';
  if Opcion = 'N' then lblLiquida.Caption := 'No liquida Automaticamente';
  if Opcion = 'I' then lblLiquida.Caption := 'Liquida Impuestos Solamente';
end;

procedure TfInmuebles.actNuevoExecute(Sender: TObject);
begin
  Edit2.Text        := '';
  Edit5.Text        := '';
  Edit4.Text        := '';
  Edit8.Text        := '';
  Edit11.Text       := '';
  Edit6.Text        := '';
  Edit7.Text        := '';
  Edit9.Text        := '';
  Edreferente.Text  := '';
  EdtDniPropietario.Text     := '';
  EdtDniInquilino.Text     := '';
  EdtDniReferente.Text     := '';
  Edit10.Text       := '0.00';
  ComboBox2.Text    :='';
  Edit2.Enabled     :=True;
  Edit4.Enabled     :=True;
  Edit6.Enabled     :=True;
  Edit7.Enabled     :=True;
  Edit9.Enabled     :=True;
  Edit10.Enabled    :=True;
  ComboBox2.Enabled :=True;
  Edit1.Enabled     :=True;
  Edit1.SetFocus;
end;

procedure TfInmuebles.AdvGlowButton1Click(Sender: TObject);
var
  q: TFXQuery;
begin
  if not MostrarDialogoSiNo('¿Esta seguro de eliminar la historia de este usuario?') then
    Exit;

  DM.IniciarTransaccion;
  q := CrearQuery;
  try
    try
      q.SQL.Text := 'Delete from ItemAutom where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(Edit1.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from CtaCteInquilino where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(Edit1.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from CtaCtePropietario where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(Edit1.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from Impuestos where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(Edit1.Text);
      q.ExecSQL;

      q.SQL.Text := 'Update Automatizacion Set PPOBRASI = ''0.00'', PPOBRASID = ''0'', PPOBRASIH = ''0'' where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(Edit1.Text);
      q.ExecSQL;

      DM.ConfirmarTransaccion;

      MostrarDialogoAceptar('Datos eliminados satisfactoriamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfInmuebles.actModificarExecute(Sender: TObject);
begin
  Edit1.Enabled     := True;
  Edit2.Enabled     := True;
  Edit4.Enabled     := True;
  Edit6.Enabled     := True;
  Edit7.Enabled     := True;
  Edit9.Enabled     := True;
  Edit10.Enabled    := True;
  ComboBox2.Enabled := True;
  Edit1.SetFocus;
end;

procedure TfInmuebles.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Inquilino: string;
  Propietario: string;
  Ubicacion: string;
  q: TFXQuery;
  stTexto: string;
  Agua9, Agua27, Muni9, Muni27, Dgr9, DGR27, Expensas9, Expensas27: Double;
  PasarAgua, PasarMuni, PasarDGR, PasarExpensas: Boolean;
  Fecha: string;
begin
  Codigo      := edit1.Text;
  Codigo      := LargoCodigo(Codigo);

  if (chDesocupado.Checked) then
  begin
    stTexto := 'DESOCUPADO';
    Edit2.Text := stTexto;
  end;

  IF (chLegales.Checked) then
    stTexto := 'EN LEGALES';

  if (chDesocupado.Checked) then
  begin
    if not MostrarDialogoSiNo('ATENCION!!!'+#13#10+#13#10+'Ha marcado la propiedad como DESOCUPADO. '+
    #13#10+'Esta accion la debe hacer LUEGO DE AUTOMATIZAR EL MES NUNCA ANTES!!!!.'+
    #13#10+'Esta accion no se podra revertir.'+
    #13#10+'¿Desea continuar de todos modos?', mtWarning) then
    Exit
    else
      Edit11.text := 'I';
  end;

  if (chDesocupado.Checked) or (chLegales.Checked) then
  begin
    if not MostrarDialogoSiNo('ATENCION!!!'+#13#10+#13#10+'Ha marcado la propiedad como '+stTexto+'. Los valores de Agua, Tasa Municipal, Rentas y Expensas que pueda haber en el codigo 09 pasaran al 27'+
    #13#10+'Los porcentajes de cobro de impuestos pasaran del inquilino al propietario.'+
    #13#10+'Esta accion no se podra revertir.'+
    #13#10+'¿Desea continuar de todos modos?', mtWarning) then
    Exit;
  end;

  q := CrearQuery;
  if chSeDesocupa.checked then
  begin
    q.sql.text := ' select ca.codigo, ca.descripcion, Sum(cu.entra - cu.sale) as deuda '+
                  '  from cuerpovales cu '+
                  ' inner join cabezavales ca on ca.codigo = cu.codigo '+
                  ' where cu.codinq = :Codigo '+
                  '   and ca.codigoempresa in (1,2,3) '+
                  '   and cu.codigoitem = ''09'' '+
                  '   and ca.cerrado = 0 '+
                  ' group by 1,2 '+
                  ' having Sum(cu.entra - cu.sale) > 0 ';
    q.ParamByName('Codigo').AsString      := Codigo;
    q.Open;

    if not q.IsEmpty then
    begin
      TFDeudaImpuestos.Ejecutar(q);
      if not MostrarDialogoSiNo('ATENCION!!!'+#13#10+#13#10+'Ha marcado "SE DESOCUPA"'+
        #13#10+'El inquilino posee cosas pendientes en los vales. Por favor reviselos.'+
        #13#10+'¿Desea continuar de todos modos?', mtWarning,mbNO ) then
      begin
        chSeDesocupa.Checked := False;
        Exit;
      end;
    end;
  end;

  DM.IniciarTransaccion;
  try
    try
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('Select * from inmuebles where codinq=:cODINQ');
        ParamByName('cODINQ').AsString := eDIT1.TEXT;
        Open;

        if isEmpty then
        begin
          q.SQL.text := 'Insert into Inmuebles(Codinq, Inquilino, Telefono, propietario, Domicilio, FechaInicio, FechaFin, ' +
           ' ubicacion, Alquiler, FechaPago, Liquidacion, DNIPropietario, Referente, RazonSocial, entregarimpuestos, Tributa, '+
           ' Activo, MailPropietario, MailInquilino, PlantillaPropietario, PlantillaInquilino, DniInquilino, DNIReferente, PuedeTransferir, Prelegales, DevuelveDiferencias, Desocupado, '+
           ' Legales, Rescinde, Sedesocupa, JuicioDesalojo, JuicioPVE, DescuentaGastos, TienePresupuestos, CUENTABANCARIA, PorcentajeGastoBancario, NomenclaturaCatastral, unidadfuncional, numerocuenta, Observaciones, Renueva) ' +
           '             Values (:Codinq, :Inquilino, :Telefono, :propietario, :Domicilio, :FechaInicio, :FechaFin, ' +
           ' :ubicacion, :Alquiler, :FechaPago, :Liquidacion, :DNIPropietario, :Referente, :RazonSocial, '+
           ' :entregarimpuestos, :Tributa, :Activo, :MailPropietario, :MailInquilino, :PlantillaPropietario, :PlantillaInquilino, :DNIInquilino, :DNIReferente, :PuedeTransferir, :Prelegales, :DevuelveDiferencias, :Desocupado, '+
           ' :Legales, :Rescinde, :Sedesocupa, :JuicioDesalojo, :JuicioPVE, :DescuentaGastos, :TienePresupuestos, :CUENTABANCARIA, :PorcentajeGastoBancario, :NomenclaturaCatastral, :unidadfuncional, :numerocuenta, :Observaciones, :Renueva) ';
          q.ParambyName('Codinq').AsString  := Edit1.Text;
          q.ParambyName('Inquilino').AsString  := Trim(Edit2.Text);
          q.ParambyName('Telefono').AsString  := Edit5.Text;
          q.ParambyName('Propietario').AsString  := Edit4.Text;
          q.ParambyName('Domicilio').AsString  := Edit8.Text;
          q.ParambyName('FechaInicio').AsString  := Copy(Edit7.Text, 4,2) + '/' + Copy(Edit7.Text, 1,2) + '/' + Copy(Edit7.Text, 7,4);
          q.ParambyName('FechaFin').AsString  := Copy(Edit6.Text, 4,2) + '/' + Copy(Edit6.Text, 1,2) + '/' + Copy(Edit6.Text, 7,4);
          q.ParambyName('Ubicacion').AsString  := Edit9.Text;
          q.ParambyName('Alquiler').AsString  := Edit10.Text;
          q.ParambyName('FechaPago').AsString  := Combobox2.Text;
          q.ParambyName('Liquidacion').AsString  := Edit11.Text;
          q.ParambyName('Referente').AsString  := edReferente.Text;
          q.ParambyName('RazonSocial').AsInteger  := cboRazonSocial.itemindex;
          q.ParambyName('DNIReferente').AsString  := EdtdniReferente.Text;
          q.ParambyName('DNIInquilino').AsString  := EdtdniInquilino.Text;
          q.ParambyName('DNIPropietario').AsString  := EdtdniPropietario.Text;

          if chkEntregarImpuestos.Checked then
            q.ParambyName('EntregarImpuestos').AsInteger  := 1
          else
            q.ParambyName('EntregarImpuestos').AsInteger  := 0;

          if chActivo.Checked then
            q.ParambyName('activo').AsInteger  := 1
          else
            q.ParambyName('activo').AsInteger  := 0;

          if chTributa.Checked then
            q.ParambyName('Tributa').AsInteger  := 1
          else
            q.ParambyName('Tributa').AsInteger  := 0;
          if Trim(eMailPropietario.Text) <> '' then
            q.ParambyName('MailPropietario').AsString  := eMailPropietario.Text
          else
            q.ParambyName('MailPropietario').AsString  := '-';

          if Trim(eMailInquilino.Text) <> '' then
            q.ParambyName('MailInquilino').AsString  := eMailInquilino.Text
          else
            q.ParambyName('MailInquilino').AsString  := '-';

          if Trim(edPlantillaInquilino.Text) <> '' then
            q.ParambyName('PlantillaInquilino').AsString  := edPlantillaInquilino.Text
          else
            q.ParambyName('PlantillaInquilino').AsString  := '0';

          if Trim(edPlantillaPropietario.Text) <> '' then
            q.ParambyName('PlantillaPropietario').AsString  := edPlantillaPropietario.Text
          else
            q.ParambyName('PlantillaPropietario').AsString  := '0';
          q.ParambyName('PuedeTransferir').AsInteger  := BoolToInt(chPuedeTransferir.Checked);
          q.ParambyName('Prelegales').AsInteger  := BoolToInt(chPrelegales.Checked);
          q.ParambyName('DevuelveDiferencias').AsInteger  := BoolToInt(chDevuelveDiferencias.Checked);
          q.ParambyName('Desocupado').AsInteger  := BoolToInt(chDesocupado.Checked);

          q.ParambyName('Renueva').AsInteger  := BoolToInt(chRenueva.Checked);
          q.ParambyName('Legales').AsInteger  := BoolToInt(chLegales.Checked);
          q.ParambyName('Rescinde').AsInteger  := BoolToInt(chRescinde.Checked);
          q.ParambyName('SeDesocupa').AsInteger  := BoolToInt(chSeDesocupa.Checked);
          q.ParambyName('JuicioDesalojo').AsInteger  := BoolToInt(chJuicioDesalojo.Checked);
          q.ParambyName('JuicioPVE').AsInteger  := BoolToInt(chJuicioPVE.Checked);
          q.ParambyName('DescuentaGastos').AsInteger  := BoolToInt(chDescuentaGastos.Checked);
          q.ParambyName('TienePresupuestos').AsInteger  := BoolToInt(chTienePresupuestos.Checked);
          q.ParambyName('CuentaBancaria').AsInteger  := cboCtaBancaria.ItemIndex;
          q.ParambyName('POrcentajeGastoBancario').AsFloat  := TOFloat(Maskedit2.Text);
          q.ParambyName('NomenclaturaCatastral').AsString  := edNomCatastral.Text;
          q.ParambyName('UnidadFuncional').AsString  := edUFuncional.Text;
          q.ParambyName('NumeroCuenta').AsString  := edNumCuenta.Text;
          q.ParambyName('Observaciones').AsString  := memObservaciones.Text;

          q.ExecSQL;
        end
        else
        begin
          Codigo      := edit1.Text;
          Codigo      := LargoCodigo(Codigo);
          Propietario := Trim(Edit4.text);
          Inquilino   := Trim(Edit2.text);
          Ubicacion   := Trim(Edit9.text);
          q.Close;
          q.SQL.Clear;
          q.SQL.add('Update Inmuebles Set Codinq=:Codinq, ' +
                                        ' Inquilino = :Inquilino, ' +
                                        ' Telefono = :Telefono, ' +
                                        ' Propietario = :Propietario, ' +
                                        ' Domicilio = :Domicilio, ' +
                                        ' FechaInicio = :FechaInicio, '+
                                        ' FechaFin = :FechaFin, ' +
                                        ' Ubicacion = :Ubicacion, ' +
                                        ' Alquiler = :Alquiler, '+
                                        ' FechaPago = :FechaPago,'+
                                        ' Liquidacion = :Liquidacion, '+
                                        ' DNIReferente = :DNIReferente, ' +
                                        ' DNIPropietario = :DNIPropietario, ' +
                                        ' DNIInquilino = :DNIInquilino, ' +
                                        ' Referente = :Referente, ' +
                                        ' RazonSocial = :RazonSocial, ' +
                                        ' EntregarImpuestos = :EntregarImpuestos, ' +
                                        ' Activo = :Activo, ' +
                                        ' Tributa = :Tributa, ' +
                                        ' MailPropietario = :MailPropietario, '+
                                        ' MailInquilino = :MailInquilino, '+
                                        ' PlantillaPropietario = :PlantillaPropietario, '+
                                        ' PlantillaInquilino = :PlantillaInquilino, '+
                                        ' PuedeTransferir = :PuedeTransferir, '+
                                        ' Prelegales = :Prelegales, '+
                                        ' DevuelveDiferencias = :DevuelveDiferencias, '+
                                        ' Desocupado = :Desocupado, '+
                                        ' Legales = :Legales, '+
                                        ' Rescinde = :Rescinde, '+
                                        ' SeDesocupa = :SeDesocupa, '+
                                        ' JuicioDesalojo = :JuicioDesalojo, '+
                                        ' JuicioPVE = :JuicioPVE, '+
                                        ' DescuentaGastos = :DescuentaGastos, '+
                                        ' TienePresupuestos = :TienePresupuestos, '+
                                        ' CUentaBancaria = :CuentaBancaria, '+
                                        ' NomenclaturaCatastral = :NomenclaturaCatastral, '+
                                        ' UnidadFuncional = :UnidadFuncional, '+
                                        ' NumeroCuenta = :NumeroCuenta, '+
                                        ' Observaciones = :Observaciones, '+
                                        ' Renueva = :Renueva, '+
                                        ' PorcentajeGastoBancario = :PorcentajeGastoBancario '+
                                        ' Where codinq =:Codinq');
          q.ParambyName('Codinq').AsString  := Edit1.Text;
          q.ParambyName('Inquilino').AsString  := Trim(Edit2.Text);
          q.ParambyName('Telefono').AsString  := Edit5.Text;
          q.ParambyName('Propietario').AsString  := Edit4.Text;
          q.ParambyName('Domicilio').AsString  := Edit8.Text;
          q.ParambyName('FechaInicio').AsString  := Copy(Edit7.Text, 4,2) + '/' + Copy(Edit7.Text, 1,2) + '/' + Copy(Edit7.Text, 7,4);
          q.ParambyName('FechaFin').AsString  := Copy(Edit6.Text, 4,2) + '/' + Copy(Edit6.Text, 1,2) + '/' + Copy(Edit6.Text, 7,4);
          q.ParambyName('Ubicacion').AsString  := Edit9.Text;
          q.ParambyName('Alquiler').AsString  := Edit10.Text;
          if (Combobox2.Text = '') or (Combobox2.Text = '0') then
            Combobox2.Text := '1º al 25';
          q.ParambyName('FechaPago').AsString  := Combobox2.Text;
          q.ParambyName('Liquidacion').AsString  := Edit11.Text;
          q.ParambyName('DNIReferente').AsString  := EdtdniReferente.Text;
          q.ParambyName('DNIInquilino').AsString  := EdtdniInquilino.Text;
          q.ParambyName('DNIPropietario').AsString  := EdtdniPropietario.Text;
          q.ParambyName('Referente').AsString  := edReferente.Text;
          q.ParambyName('RazonSocial').AsInteger  := cboRazonSocial.itemindex;
          q.ParambyName('MailPropietario').AsString  := EmailPropietario.Text;
          q.ParambyName('MailInquilino').AsString  :=  EmailInquilino.Text;
          q.ParambyName('POrcentajeGastoBancario').AsFloat  := TOFloat(Maskedit2.Text);
          q.ParambyName('Observaciones').AsString  := memObservaciones.Text;

          if chkEntregarImpuestos.Checked then
            q.ParambyName('EntregarImpuestos').AsInteger  := 1
          else
            q.ParambyName('EntregarImpuestos').AsInteger  := 0;

          if chTributa.Checked then
            q.ParambyName('Tributa').AsInteger  := 1
          else
            q.ParambyName('Tributa').AsInteger  := 0;

          if chActivo.Checked then
            q.ParambyName('activo').AsInteger  := 1
          else
            q.ParambyName('activo').AsInteger  := 0;

          if Trim(edPlantillaInquilino.Text) <> '' then
            q.ParambyName('PlantillaInquilino').AsString  := edPlantillaInquilino.Text
          else
            q.ParambyName('PlantillaInquilino').AsString  := '0';

          if Trim(edPlantillaPropietario.Text) <> '' then
            q.ParambyName('PlantillaPropietario').AsString  := edPlantillaPropietario.Text
          else
            q.ParambyName('PlantillaPropietario').AsString  := '0';
          q.ParambyName('PuedeTransferir').AsInteger  := BoolToInt(chPuedeTransferir.Checked);
          q.ParambyName('Prelegales').AsInteger  := BoolToInt(chPrelegales.Checked);
          q.ParambyName('DevuelveDiferencias').AsInteger  := BoolToInt(chDevuelveDiferencias.Checked);
          q.ParambyName('Desocupado').AsInteger  := BoolToInt(chDesocupado.Checked);
          q.ParambyName('Legales').AsInteger  := BoolToInt(chLegales.Checked);
          q.ParambyName('Rescinde').AsInteger  := BoolToInt(chRescinde.Checked);
          q.ParambyName('SeDesocupa').AsInteger  := BoolToInt(chSeDesocupa.Checked);
          q.ParambyName('JuicioDesalojo').AsInteger  := BoolToInt(chJuicioDesalojo.Checked);
          q.ParambyName('JuicioPVE').AsInteger  := BoolToInt(chJuicioPVE.Checked);
          q.ParambyName('Renueva').AsInteger  := BoolToInt(chRenueva.Checked);
          q.ParambyName('DescuentaGastos').AsInteger  := BoolToInt(chDescuentaGastos.Checked);
          q.ParambyName('TienePresupuestos').AsInteger  := BoolToInt(chTienePresupuestos.Checked);
          q.ParambyName('CuentaBancaria').AsInteger  := CBOCtaBancaria.ItemIndex;
          q.ParambyName('NomenclaturaCatastral').AsString  := edNomCatastral.Text;
          q.ParambyName('UnidadFuncional').AsString  := edUFuncional.Text;
          q.ParambyName('NumeroCuenta').AsString  := edNumCuenta.Text;

          q.ExecSQL;

          q.Close;
          q.SQL.Clear;
          q.SQL.add('Update Itemautom Set CodPro = :Propietario, Usuario = :Usuario where Codinq = :Codigo');
          q.ParamByName('Usuario').AsString := FPrincipal.fUsuario;
          q.ParamByName('Propietario').AsString := Propietario;
          q.ParamByName('Codigo').AsString := Codigo;
          q.ExecSQL;

          q.Close;
          q.SQL.Clear;
          q.SQL.add('Update Automatizacion Set Propietario = :Propietario, Inquilino = :Inquilino, Inmueble = :Inmueble where Codinq = :Codigo');
          q.ParamByName('Propietario').AsString := Trim(Propietario);
          q.ParamByName('Inquilino').AsString   := Trim(Inquilino);
          q.ParamByName('Inmueble').AsString    := Trim(Ubicacion);
          q.ParamByName('Codigo').AsString      := Codigo;
          q.ExecSQL;

          if not chActivo.Checked then
          begin
            q.Close;
            q.SQL.Clear;
            q.SQL.add('Update Automatizacion Set PpobrasId = ''0'', PpobrasIh = ''0'', PpobrasI = ''0.00'', expensas9 = ''0.00'', expensas14 = ''0.00'', expensas27 = ''0.00'' where Codinq = :Codigo');
            q.ParamByName('Codigo').AsString      := Codigo;
            q.ExecSQL;
          end;

          if (chDesocupado.Checked) or (chLegales.Checked) then
          begin
            q.Sql.text := 'Select Agua9, Agua27, Muni9, Muni27, DGR9, DGR27, Expensas9, Expensas27 From Automatizacion where codinq = :Codigo';
            q.ParamByName('Codigo').AsString      := Codigo;
            q.Open;

            Agua9 := q.FieldByName('Agua9').AsFloat;
            Agua27 := q.FieldByName('Agua27').AsFloat;
            Muni9 := q.FieldByName('Muni9').AsFloat;
            Muni27 := q.FieldByName('Muni27').AsFloat;
            DGR9 := q.FieldByName('DGR9').AsFloat;
            DGR27 := q.FieldByName('DGR27').AsFloat;
            Expensas9 := q.FieldByName('Expensas9').AsFloat;
            Expensas27 := q.FieldByName('Expensas27').AsFloat;

            Agua27 := AGua27 + aGUA9;
            mUNI27 := mUNI27 + mUNI9;
            DGR27 := DGR27 + DGR9;
            Expensas27 := Abs(Expensas27) + Abs(Expensas9);

            q.Close;
            q.SQL.Clear;
            q.SQL.add('Update Automatizacion Set  ');
              q.SQL.add('Agua27 = :Agua27, Agua9 = ''0.00'', Muni27=:Muni27, Muni9=''0.00'', DGR27=:DGR27, DGR9=''0.00'', EXPENSAS27=:EXPENSAS27, EXPENSAS9=''0.00'' ');
            q.SQL.add('where Codinq = :Codigo ');
            q.ParamByName('Codigo').AsString      := Codigo;
            q.ParamByName('Agua27').AsString      := FormatFloat('0.00', Agua27);
            q.ParamByName('Muni27').AsString      := FormatFloat('0.00', Muni27);
            q.ParamByName('DGR27').AsString       := FormatFloat('0.00', DGR27);
            q.ParamByName('Expensas27').AsString  := FormatFloat('0.00', Expensas27);
            q.ParamByName('Codigo').AsString      := Codigo;
            q.ExecSQL;

            q.Close;
            q.SQL.Clear;
            q.SQL.add('Update PorcentajeCobro Set  ');
              q.SQL.add('PorcentajePropietario = PorcentajePropietario + PorcentajeInquilino, PorcentajeInquilino = 0 ');
            q.SQL.add('where Codinq = :Codigo ');
            q.ParamByName('Codigo').AsString      := Codigo;
            q.ExecSQL;

          end;

        end;
      end;

      if chLegales.Checked and chPasar.Checked then
      begin
        Fecha := FormatDatetime('yyyymmdd', StrToDate(Maskedit1.text));
        q.Sql.text :=
          'Update itemautom Set Fecha = :Fecha1, Coditem = ''27'', ITEM = ''IMPUESTOS A DESCONTAR '' '+
          ' Where Coditem = ''09'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsString       := Fecha;
        q.ParamByName('Fecha1').AsString      := FormatDatetime('yyyymm10', strTodate(Maskedit1.text));
        q.ExecSQL;

        q.Sql.text :=
          'Update CuerpoVales Set CodigoItem = ''27'', DESCRIPCION = REPLACE(DESCRIPCION, ''IMP Y/O SERVICIOS'', ''IMPUESTOS A DESCONTAR '') '+
          ' Where CodiGOItem = ''09'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsDateTime       := strTodate(Maskedit1.text);
        q.ExecSQL;
      end;

      if not (chLegales.Checked) and chPasar.Checked then
      begin
        Fecha := FormatDatetime('yyyymmdd', StrToDate(Maskedit1.text));

        q.Sql.text :=
          'Update itemautom Set Fecha = :Fecha1, Coditem = ''09'', ITEM = ''IMP Y/O SERVICIOS'' '+
          ' Where Coditem = ''27'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsString       := Fecha;
        q.ParamByName('Fecha1').AsString      := FormatDatetime('yyyymm05', strTodate(Maskedit1.Text));
        q.ExecSQL;

        q.Sql.text :=
          'Update CuerpoVales Set CodigoItem = ''09'', DESCRIPCION = REPLACE(DESCRIPCION, ''IMPUESTOS A DESCONTAR '', ''IMP Y/O SERVICIOS'') '+
          ' Where CodiGOItem = ''27'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsDatetime       := strTodate(Maskedit1.text);
        q.ExecSQL;
      end;

      if chJuicioDesalojo.Checked and chPasarDesalojo.Checked then
      begin
        Fecha := FormatDatetime('yyyymmdd', StrToDate(Maskedit3.text));
        q.Sql.text :=
          'Update itemautom Set Fecha = :Fecha1, Coditem = ''27'', ITEM = ''IMPUESTOS A DESCONTAR '' '+
          ' Where Coditem = ''09'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsString       := Fecha;
        q.ParamByName('Fecha1').AsString      := FormatDatetime('yyyymm10', strTodate(Maskedit3.text));
        q.ExecSQL;

        q.Sql.text :=
          'Update CuerpoVales Set CodigoItem = ''27'', DESCRIPCION = REPLACE(DESCRIPCION, ''IMP Y/O SERVICIOS'', ''IMPUESTOS A DESCONTAR '') '+
          ' Where CodiGOItem = ''09'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsDateTime       := strTodate(Maskedit3.text);
        q.ExecSQL;
      end;

      if not (chJuicioDesalojo.Checked) and chPasarDesalojo.Checked then
      begin
        Fecha := FormatDatetime('yyyymmdd', StrToDate(Maskedit3.text));

        q.Sql.text :=
          'Update itemautom Set Fecha = :Fecha1, Coditem = ''09'', ITEM = ''IMP Y/O SERVICIOS'' '+
          ' Where Coditem = ''27'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsString       := Fecha;
        q.ParamByName('Fecha1').AsString      := FormatDatetime('yyyymm05', strTodate(Maskedit3.Text));
        q.ExecSQL;

        q.Sql.text :=
          'Update CuerpoVales Set CodigoItem = ''09'', DESCRIPCION = REPLACE(DESCRIPCION, ''IMPUESTOS A DESCONTAR '', ''IMP Y/O SERVICIOS'') '+
          ' Where CodiGOItem = ''27'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsDatetime       := strTodate(Maskedit3.text);
        q.ExecSQL;
      end;

      if chJuicioPVE.Checked and chPasarPVE.Checked then
      begin
        Fecha := FormatDatetime('yyyymmdd', StrToDate(Maskedit4.text));
        q.Sql.text :=
          'Update itemautom Set Fecha = :Fecha1, Coditem = ''27'', ITEM = ''IMPUESTOS A DESCONTAR '' '+
          ' Where Coditem = ''09'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsString       := Fecha;
        q.ParamByName('Fecha1').AsString      := FormatDatetime('yyyymm10', strTodate(Maskedit4.text));
        q.ExecSQL;

        q.Sql.text :=
          'Update CuerpoVales Set CodigoItem = ''27'', DESCRIPCION = REPLACE(DESCRIPCION, ''IMP Y/O SERVICIOS'', ''IMPUESTOS A DESCONTAR '') '+
          ' Where CodiGOItem = ''09'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsDateTime       := strTodate(Maskedit4.text);
        q.ExecSQL;
      end;

      if not (chJuicioPVE.Checked) and chPasarPVE.Checked then
      begin
        Fecha := FormatDatetime('yyyymmdd', StrToDate(Maskedit4.text));

        q.Sql.text :=
          'Update itemautom Set Fecha = :Fecha1, Coditem = ''09'', ITEM = ''IMP Y/O SERVICIOS'' '+
          ' Where Coditem = ''27'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsString       := Fecha;
        q.ParamByName('Fecha1').AsString      := FormatDatetime('yyyymm05', strTodate(Maskedit4.Text));
        q.ExecSQL;

        q.Sql.text :=
          'Update CuerpoVales Set CodigoItem = ''09'', DESCRIPCION = REPLACE(DESCRIPCION, ''IMPUESTOS A DESCONTAR '', ''IMP Y/O SERVICIOS'') '+
          ' Where CodiGOItem = ''27'' and codinq = :Codigo and Fecha >= :Fecha ';
        q.ParamByName('Codigo').AsString      := Codigo;
        q.ParamByName('Fecha').AsDatetime       := strTodate(Maskedit4.text);
        q.ExecSQL;
      end;



      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('El inmueble se grabó correctamente.');
      Close;
    except
      on E:Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ha ocurrido un error al grabar el inmueble. Datos Técnicos: ' + e.Message);
      end;
    end;
  Finally
    FreeAndNil(q);
  end;
end;

procedure TfInmuebles.actBorrarExecute(Sender: TObject);
begin
  Application.ProcessMessages;
  if MostrarDialogoSiNo('¿Esta seguro de elimiar el Inmueble seleccionado?'+ #13 + #10 +
   'Se eliminará toda la información relacionada al inmueble, y no podrá recuperarse') then
  begin
    DM.IniciarTransaccion;
    try
      DM.BorrarInmueble(Edit1.Text);
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Inmueble Eliminado correctamente.');
    except
      DM.CancelarTransaccion;
    end;

    Edit1.Text     := '';
    Edit2.Text     := '';
    Edit4.Text     := '';
    Edit9.Text     := '';
    Edit7.Text     := '';
    Edit6.Text     := '';
    Edit5.Text     := '';
    Edit8.Text     := '';
    Edit10.Text    := '';
    Edit11.Text    := '';
    ComboBox2.Text := '';
    edReferente.Text := '';
    EdtDniPropietario.Text     := '';
    EdtDniInquilino.Text     := '';
    EdtDniReferente.Text     := '';
  end;
end;

procedure TfInmuebles.actExpensasExecute(Sender: TObject);
var
  I      :    Integer;
  Dato   :    string;
  MesDato:    string;
  AnoDato:    string;
  Mayor  :    Integer;
  periodo:    string;
  mesperiodo: string;
  anoperiodo: string;
  anohoy:     string;
  meshoy:     string;
  anototali:  Integer;
  anoperiodoi:Integer;
  mesperiodoi:Integer;
  meshoyi:    Integer;
  anohoyi:    Integer;
  cantmeses:  Integer;
  estado:     string;
  q:          TFXQuery;
  Debe:       string;
begin
  Mayor := 0;
  CantMeses := 0;
  q:= CrearQuery;
  try
    with Q do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' Select Distinct I.Periodo, A.* from ItemAutom I');
      Sql.add('Join Automatizacion A on I.Codinq = A.Codinq');
      Sql.add('Where I.Codinq= :Codinq and I.Coditem= :Coditem and i.Periodo like :Periodo and a.EstadoExpensas <> :Estado');
      ParamByName('coditem').AsString := '28';
      ParamByName('periodo').AsString := 'EXPS. COMUNES%';
      ParamByName('CODINQ').AsString  := Edit1.Text;
      ParamByName('Estado').AsString  := 'NO TIENE';
      Open;
    end;
    if not q.isEmpty then
    begin
      for I := 1 to q.RecordCount do
      begin
        Dato := q.fieldbyName('Periodo').AsString;
        Delete(Dato,1,14);
        MesDato := Dato;
        Delete(MesDato,4,5);
        AnoDato := Dato;
        Delete(AnoDato,1,4);
        MesDato := MesExpensas(MesDato);
        Dato := AnoDato + MesDato;
        if Mayor < StrToInt(Dato) then
          Mayor := StrToInt(Dato);
        q.Next;
      end;

      Dato           := IntToStr(Mayor);
      Delete(Dato,1,4);
      AnoDato        := IntToStr(Mayor);
      Delete(AnoDato,5,2);
      Dato           := DaMes(Dato);
      Dato           := Dato + '/' + AnoDato;

      ESTADO     := q.FieldbyName('EstadoExpensas').AsString;
      Periodo    := Dato;//CALCULO Periodo mmm/aaaa
      Delete(Dato,4,5);
      mesPeriodo := MesExpensas(Dato); //CALCULO EL MES Periodo (99);
      Delete(Periodo,1,4);
      anoPeriodo := Periodo; //CALCULO DEL AÑO DEL Periodo (9999);
      anohoy     := FormatDatetime('yyyy',Date);
      meshoy     := FormatDatetime('mm', date());

      meshoyi    := StrToInt(meshoy);
      anohoyi    := StrToInt(anohoy);
      mesPeriodoi:= StrToInt(mesPeriodo);
      anoPeriodoi:= StrToInt(anoPeriodo);
      anototali  := anohoyi-anoPeriodoi;

      if (mesPeriodoi>meshoyi) and (anoPeriodoi<anohoyi) then
        cantmeses := (((anototali*12)-mesPeriodoi)+meshoyi);
      if (mesPeriodoi<=meshoyi) and (anoPeriodoi<anohoyi) then
        cantmeses := ((anototali*12)+(meshoyi-mesPeriodoi));
      if (mesPeriodoi<meshoyi) and (anoPeriodoi=anohoyi) then
        cantmeses := (meshoyi-mesPeriodoi);
      if estado='MES VENCIDO' then
        CANTMESES := CANTMESES - 1;
      IF ESTADO='NO TIENE' then
        CANTMESES := 0;

      Debe := ' Expensas Adeudadas: ';
      for i:=1 to cantmeses do
      begin
        mesPeriodoi := mesPeriodoi + 1;
        if mesPeriodoi > 12 then
        begin
          mesPeriodoi := 1;
          anoPeriodoi := anoPeriodoi + 1;
        end;
        anoPeriodo := IntToStr(anoPeriodoi);
        if mesPeriodoi < 10 then
          mesPeriodo := '0' + IntToStr(mesPeriodoi)
        else
          mesPeriodo := IntToStr(mesPeriodoi);
        mesPeriodo := dames(mesPeriodo); //mes proximo en letras;

        Debe := Debe + ' ' + MesPeriodo + '/' + AnoPeriodo + '  -  ';
      end;
    end;
  Finally
    Memo1.Text := Debe;
    FreeAndNil(q);
  end;
end;

procedure TfInmuebles.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfInmuebles.Combobox2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit11.SetFocus;
end;

procedure TfInmuebles.edtDNIInquilinoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus;
end;

procedure TfInmuebles.edtDNIPropietarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdReferente.SetFocus;
end;

procedure TfInmuebles.edtdniReferenteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit5.SetFocus;
end;

procedure TfInmuebles.emailinquilinoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edPlantillaInquilino.SetFocus;
end;

procedure TfInmuebles.emailpropietarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edPlantillaPropietario.SetFocus;
end;

procedure TfInmuebles.edPlantillaInquilinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    Edit7.SetFocus;

end;

procedure TfInmuebles.edPlantillaPropietarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    EmailInquilino.SetFocus;

end;

procedure TfInmuebles.edReferenteKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF kEY = #13 then
    EdtdniReferente.SetFocus;
end;


function TfInmuebles.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edit1.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edit2.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un inquilino. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit4.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un propietario. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edReferente.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un referente. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edtDniPropietario.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un dni al propietario. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edtDniInquilino.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un dni al inquilino. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edtDniReferente.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un dni al referente. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edit5.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un teléfono. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit8.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una dirección. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit9.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar la ubicación del inmueble. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit7.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar la fecha de inicio ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit6.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar la fecha de fin ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit10.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar el monto de Alquiler. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(Combobox2.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar la fecha de pago. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edit11.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar el tipo de liquidación. ', mtInformation);
    Result := False;
    Exit;
  end;
  if cboRazonSocial.ItemIndex = -1 then
  begin
    MostrarDialogoAceptar('Debe ingresar la razón social. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

Function TfInmuebles.CalculaExpensas(Codigo: String): Boolean;
var
  I      :    Integer;
  Dato   :    string;
  MesDato:    string;
  AnoDato:    string;
  Mayor  :    Integer;
  periodo:    string;
  mesperiodo: string;
  anoperiodo: string;
  anohoy:     string;
  meshoy:     string;
  anototali:  Integer;
  anoperiodoi:Integer;
  mesperiodoi:Integer;
  meshoyi:    Integer;
  anohoyi:    Integer;
  cantmeses:  Integer;
  estado:     string;
  q:          TFXQuery;
  Debe:       string;
begin
  Result := False;
  Mayor := 0;
  CANTMESES := 0;
  q:= CrearQuery;
  try
    with Q do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' Select Distinct I.Periodo, A.* from ItemAutom I');
      Sql.add('Join Automatizacion A on I.Codinq = A.Codinq');
      Sql.add('Where I.Codinq= :Codinq and I.Coditem= :Coditem and i.Periodo like :Periodo and a.EstadoExpensas <> :Estado');
      ParamByName('coditem').AsString := '28';
      ParamByName('periodo').AsString := 'EXPS. COMUNES%';
      ParamByName('CODINQ').AsString  := Codigo;
      ParamByName('Estado').AsString  := 'NO TIENE';
      Open;
    end;
    if not q.isEmpty then
    begin
      for I := 1 to q.RecordCount do
      begin
        Dato := q.fieldbyName('Periodo').AsString;
        Delete(Dato,1,14);
        MesDato := Dato;
        Delete(MesDato,4,5);
        AnoDato := Dato;
        Delete(AnoDato,1,4);
        MesDato := MesExpensas(MesDato);
        Dato := AnoDato + MesDato;
        if Mayor < StrToInt(Dato) then
          Mayor := StrToInt(Dato);
        q.Next;
      end;

      Dato           := IntToStr(Mayor);
      Delete(Dato,1,4);
      AnoDato        := IntToStr(Mayor);
      Delete(AnoDato,5,2);
      Dato           := DaMes(Dato);
      Dato           := Dato + '/' + AnoDato;

      ESTADO     := q.FieldbyName('EstadoExpensas').AsString;
      Periodo    := Dato;//CALCULO Periodo mmm/aaaa
      Delete(Dato,4,5);
      mesPeriodo := MesExpensas(Dato); //CALCULO EL MES Periodo (99);
      Delete(Periodo,1,4);
      anoPeriodo := Periodo; //CALCULO DEL AÑO DEL Periodo (9999);
      anohoy     := FormatDatetime('yyyy',Date);
      meshoy     := FormatDatetime('mm', date());

      meshoyi    := StrToInt(meshoy);
      anohoyi    := StrToInt(anohoy);
      mesPeriodoi:= StrToInt(mesPeriodo);
      anoPeriodoi:= StrToInt(anoPeriodo);
      anototali  := anohoyi-anoPeriodoi;

      if (mesPeriodoi>meshoyi) and (anoPeriodoi<anohoyi) then
        cantmeses := (((anototali*12)-mesPeriodoi)+meshoyi);
      if (mesPeriodoi<=meshoyi) and (anoPeriodoi<anohoyi) then
        cantmeses := ((anototali*12)+(meshoyi-mesPeriodoi));
      if (mesPeriodoi<meshoyi) and (anoPeriodoi=anohoyi) then
        cantmeses := (meshoyi-mesPeriodoi);
      if estado='MES VENCIDO' then
        CANTMESES := CANTMESES - 1;
      IF ESTADO='NO TIENE' then
        CANTMESES := 0;

      Debe := ' Expensas Adeudadas: ';
      for i:=1 to cantmeses do
      begin
        mesPeriodoi := mesPeriodoi + 1;
        if mesPeriodoi > 12 then
        begin
          mesPeriodoi := 1;
          anoPeriodoi := anoPeriodoi + 1;
        end;
        anoPeriodo := IntToStr(anoPeriodoi);
        if mesPeriodoi < 10 then
          mesPeriodo := '0' + IntToStr(mesPeriodoi)
        else
          mesPeriodo := IntToStr(mesPeriodoi);
        mesPeriodo := dames(mesPeriodo); //mes proximo en letras;

        Debe := Debe + ' ' + MesPeriodo + '/' + AnoPeriodo + '  -  ';
        Result := True;
        Exit;
      end;
    end;
  Finally
    Memo1.Text := Debe;
    FreeAndNil(q);
  end;
end;


end.
