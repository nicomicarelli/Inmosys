unit frmGestionPropiedad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  IBTable,
  IBCustomDataSet, IBQuery, Funciones, ActnList, ToolWin, ImgList,
  Aligrid, Menus, sqlExpr, Declaraciones, DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Grids, Spin, cxSpinEdit, AdvObj, BaseGrid, AdvGrid,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, System.Actions, fxQuery;

type
  TFGestionPropiedad = class(TForm)
    pgcInmueble: TPageControl;
    General: TTabSheet;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ImageList1: TImageList;
    aclLista: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actExpensas: TAction;
    lblFechaInicio: TLabel;
    lblFechaVencimiento: TLabel;
    lblFechadePago: TLabel;
    lblTelefono: TLabel;
    lblDireccion: TLabel;
    lblLiquidacion: TLabel;
    lblLiquida: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    chkEntregarImpuestos: TCheckBox;
    chTributa: TCheckBox;
    edReferente: TcxTextEdit;
    edtDNI: TcxTextEdit;
    Edit5: TcxTextEdit;
    Edit8: TcxTextEdit;
    Edit7: TcxMaskEdit;
    Edit6: TcxMaskEdit;
    Combobox2: TcxTextEdit;
    Edit11: TcxTextEdit;
    cboRazonSocial: TcxComboBox;
    tbAutomatizacion: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label46: TLabel;
    Label13: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label58: TLabel;
    CheckBox1: TCheckBox;
    gDetalle: TStringAlignGrid;
    Panel2: TPanel;
    lblInquilino: TLabel;
    edCodigo: TcxTextEdit;
    Edit2: TcxTextEdit;
    chActivo: TCheckBox;
    Edit4: TcxTextEdit;
    lblPropietario: TLabel;
    lblAlquilerInicial: TLabel;
    Edit10: TcxTextEdit;
    lblUbicacion: TLabel;
    Edit9: TcxTextEdit;
    lblContratoVencido1: TLabel;
    Label22: TLabel;
    Label50: TLabel;
    Label44: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label14: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Panel12: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Panel13: TPanel;
    Label10: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Panel14: TPanel;
    Label11: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Panel15: TPanel;
    Label12: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Edit1: TcxTextEdit;
    Edit42: TcxTextEdit;
    Edit12: TcxTextEdit;
    Edit43: TcxTextEdit;
    Edit3: TcxTextEdit;
    Edit44: TcxTextEdit;
    Edit23: TcxComboBox;
    Edit13: TcxTextEdit;
    Edit14: TcxTextEdit;
    Edit15: TcxTextEdit;
    Edit16: TcxTextEdit;
    Edit17: TcxTextEdit;
    Edit18: TcxTextEdit;
    cxComboBox1: TcxComboBox;
    Edit19: TcxTextEdit;
    Edit20: TcxTextEdit;
    Edit21: TcxTextEdit;
    Edit22: TcxTextEdit;
    Edit24: TcxTextEdit;
    Edit25: TcxTextEdit;
    Edit26: TcxTextEdit;
    Edit27: TcxTextEdit;
    Edit28: TcxTextEdit;
    Edit45: TcxTextEdit;
    Edit46: TcxTextEdit;
    Edit29: TcxTextEdit;
    Edit38: TcxTextEdit;
    Edit47: TcxTextEdit;
    Edit36: TcxTextEdit;
    Edit37: TcxTextEdit;
    Edit48: TcxTextEdit;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    cxTextEdit9: TcxTextEdit;
    cxTextEdit10: TcxTextEdit;
    cxTextEdit11: TcxTextEdit;
    cxTextEdit12: TcxTextEdit;
    cxTextEdit13: TcxTextEdit;
    cxTextEdit14: TcxTextEdit;
    cxTextEdit15: TcxTextEdit;
    cxComboBox2: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    Label59: TLabel;
    cxComboBox3: TcxComboBox;
    cxSpinEdit2: TcxSpinEdit;
    StringAlignGrid1: TStringAlignGrid;
    tbNovedades: TTabSheet;
    gNovedades: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure btnBorrarClick(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Change(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure actModificarExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure actExpensasExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure Combobox2KeyPress(Sender: TObject; var Key: Char);
    procedure edtdniKeyPress(Sender: TObject; var Key: Char);
    procedure edReferenteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Combobox2PropertiesChange(Sender: TObject);
    procedure Edit11PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    FOperacion: TTipoOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    Function CalculaExpensas(Codigo: String): Boolean;
    function ValidarDatos: Boolean;
  end;

var
  FGestionPropiedad: TFGestionPropiedad;

implementation

uses frmprincipal, frmABMInmuebles, frmdatos;

{$R *.dfm}
procedure TFGestionPropiedad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FGestionPropiedad := nil;
end;

procedure TFGestionPropiedad.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  fPrincipal.Center(Self);
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Descripcion from RazonesSociales';
    q.Open;

    cboRazonSocial.Properties.Items.Clear;
    while not q.Eof do
    begin
      cboRazonSocial.Properties.items.Add(q.Fieldbyname('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(Q);
  end;
end;

procedure TFGestionPropiedad.FormShow(Sender: TObject);
begin
  pgcInmueble.ActivePage := General;
end;

procedure TFGestionPropiedad.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  FechaDesde, FechaHasta: TDatetime;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edCodigo.Text := '';
    edit2.Text := '';
    edit4.Text := '';
    edit5.Text := '';
    edit6.Text := '';
    edit7.Text := '';
    edit8.Text := '';
    edit9.Text := '';
    edit10.Text := '';
    edit11.Text := '';
    edReferente.Text := '';
    edtDNI.Text := '';
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
        edCodigo.Text     := FieldbyName('Codinq').AsString;
        Edit2.Text     := FieldbyName('Inquilino').AsString;
        Edit4.Text     := FieldbyName('Propietario').AsString;
        Edit5.Text     := FieldbyName('Telefono').AsString;
        Edit8.Text     := FieldbyName('Domicilio').AsString;
        Edit9.Text     := FieldbyName('Ubicacion').AsString;
        Edit7.Text     := FormatDatetime('dd/mm/yyyy', FieldbyName('FechaInicio').AsDatetime);
        Edit6.Text     := FormatDatetime('dd/mm/yyyy', FieldbyName('FechaFin').AsDatetime);
        Edit10.Text    := FormatFloat('0.00', ToFloat(FieldbyName('Alquiler').AsString));
        Edit11.Text    := FieldbyName('Liquidacion').AsString;
        EdtDNI.Text    := FieldbyName('DniPropietario').AsString;
        EdReferente.Text := FieldbyName('Referente').AsString;
        ComboBox2.Text := FieldbyName('FechaPago').AsString;
        CboRazonSocial.Itemindex := FieldbyName('RazonSocial').AsInteger;
        chkEntregarImpuestos.Checked := (FieldbyName('EntregarImpuestos').AsInteger = 1);
        FechaDesde     := Date();
        FechaHasta     := FieldbyName('FechaFin').AsDatetime;
        chActivo.Checked := FieldbyName('Activo').AsInteger = 1;
        chTributa.Checked := FieldbyName('Tributa').AsInteger = 1;

        if FechaDesde > FechaHasta then
        begin
          lblContratoVencido1.Visible := True;
          lblContratoVencido1.Caption := 'Contrato Vencido';
        end;
        actModificar.Execute;
      end;
    end;
    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edCodigo.Enabled  := (Operacion in  [toNuevo]);
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
    edtDni.Enabled  := (Operacion in  [toNuevo, toModificar]);
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


procedure TFGestionPropiedad.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Codinq:     string;
  q:          TFXQuery;
begin
  btnGrabar.Enabled := True;
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      Codinq := FormatFloat('0000', ToFloat(edCodigo.Text));
      with q do
      begin
        Close;
        Sql.Text := ' select * from inmuebles where codinq = :codinq';
        ParamByName('codinq').AsString := Codinq;
        Open;
        if not IsEmpty then
        begin
          MostrarDialogoAceptar('Ya existe un Inmueble con ese Código. Verifique por favor.');
          edCodigo.SetFocus;
          btnGrabar.Enabled := False;
          Exit;
        end
        else
        begin
          edCodigo.Text     := Codinq;
          Edit2.Text     := '';
          Edit5.Text     := '';
          Edit8.Text     := '';
          Edit4.Text     := '';
          Edit9.Text     := '';
          Edit7.Text     := '';
          EdReferente.Text     := '';
          EdtDni.Text     := '';
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

procedure TFGestionPropiedad.Edit7KeyPress(Sender: TObject; var Key: Char);
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

procedure TFGestionPropiedad.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TFGestionPropiedad.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit9.SetFocus;
end;

procedure TFGestionPropiedad.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit7.SetFocus;
end;

procedure TFGestionPropiedad.Edit11PropertiesChange(Sender: TObject);
var
  Opcion: string;

begin
  Opcion             := Edit11.Text;
  lblLiquida.Visible := True;
  if Opcion = 'S' then lblLiquida.Caption := 'Liquida Automaticamente';
  if Opcion = 'N' then lblLiquida.Caption := 'No liquida Automaticamente';
  if Opcion = 'I' then lblLiquida.Caption := 'Liquida Impuestos Solamente';
end;

procedure TFGestionPropiedad.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFGestionPropiedad.Edit10KeyPress(Sender: TObject; var Key: Char);
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

procedure TFGestionPropiedad.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   Edit8.SetFocus;
end;

procedure TFGestionPropiedad.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus;
end;

procedure TFGestionPropiedad.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    EdReferente.SetFocus;
  end;
end;

procedure TFGestionPropiedad.btnBorrarClick(Sender: TObject);
begin
  actBorrar.Execute;
end;

procedure TFGestionPropiedad.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   Edit11.SetFocus;
end;

procedure TFGestionPropiedad.edCodigoExit(Sender: TObject);
begin
  edCodigo.Text := FormatFloat('0000', ToFloat(edCodigo.Text));
end;

procedure TFGestionPropiedad.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   actGrabar.Execute;
end;

procedure TFGestionPropiedad.Edit11Change(Sender: TObject);
var
  Opcion: string;

begin
  Opcion             := Edit11.Text;
  lblLiquida.Visible := True;
  if Opcion = 'S' then lblLiquida.Caption := 'Liquida Automaticamente';
  if Opcion = 'N' then lblLiquida.Caption := 'No liquida Automaticamente';
  if Opcion = 'I' then lblLiquida.Caption := 'Liquida Impuestos Solamente';
end;

procedure TFGestionPropiedad.actNuevoExecute(Sender: TObject);
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
  Edtdni.Text       := '';
  Edit10.Text       := '0.00';
  ComboBox2.Text    :='';
  Edit2.Enabled     :=True;
  Edit4.Enabled     :=True;
  Edit6.Enabled     :=True;
  Edit7.Enabled     :=True;
  Edit9.Enabled     :=True;
  Edit10.Enabled    :=True;
  ComboBox2.Enabled :=True;
  edCodigo.Enabled     :=True;
  edCodigo.SetFocus;
end;

procedure TFGestionPropiedad.actModificarExecute(Sender: TObject);
begin
  edCodigo.Enabled     := True;
  Edit2.Enabled     := True;
  Edit4.Enabled     := True;
  Edit6.Enabled     := True;
  Edit7.Enabled     := True;
  Edit9.Enabled     := True;
  Edit10.Enabled    := True;
  ComboBox2.Enabled := True;
  edCodigo.SetFocus;
end;

procedure TFGestionPropiedad.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Inquilino: string;
  Propietario: string;
  Ubicacion: string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if DM.Conexion.InTransaction then
      Dm.Conexion.Rollback;
    DM.Conexion.StartTransaction;
    try
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('Select * from inmuebles where codinq=:cODINQ');
        ParamByName('cODINQ').AsString := edCodigo.TEXT;
        Open;

        if isEmpty then
        begin
          q.SQL.text := 'Insert into Inmuebles(Codinq, Inquilino, Telefono, propietario, Domicilio, FechaInicio, FechaFin, ' +
           ' ubicacion, Alquiler, FechaPago, Liquidacion, DNIPropietario, Referente, RazonSocial, entregarimpuestos, Tributa, Activo) ' +
           '             Values (:Codinq, :Inquilino, :Telefono, :propietario, :Domicilio, :FechaInicio, :FechaFin, ' +
           ' :ubicacion, :Alquiler, :FechaPago, :Liquidacion, :DNIPropietario, :Referente, :RazonSocial, :entregarimpuestos, :Tributa, :Activo )';

          q.ParambyName('Codinq').AsString  := edCodigo.Text;
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
          q.ParambyName('DNIPropietario').AsString  := Edtdni.Text;
          q.ParambyName('Referente').AsString  := edReferente.Text;
          q.ParambyName('RazonSocial').AsInteger  := cboRazonSocial.itemindex;

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
          q.ExecSQL;
        end
        else
        begin
          Codigo      := edCodigo.Text;
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
                                        ' DNIPropietario = :DNIPropietario, ' +
                                        ' Referente = :Referente, ' +
                                        ' RazonSocial = :RazonSocial, ' +
                                        ' EntregarImpuestos = :EntregarImpuestos, ' +
                                        ' Activo = :Activo, ' +
                                        ' Tributa = :Tributa ' +
                                        ' Where codinq =:Codinq');

          q.ParambyName('Codinq').AsString  := edCodigo.Text;
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
          q.ParambyName('DNIPropietario').AsString  := Edtdni.Text;
          q.ParambyName('Referente').AsString  := edReferente.Text;
          q.ParambyName('RazonSocial').AsInteger  := cboRazonSocial.itemindex;

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

          q.ExecSQL;

          q.Close;
          q.SQL.Clear;
          q.SQL.add('Update Itemautom Set CodPro = :Propietario where Codinq = :Codigo');
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
        end;
      end;
      DM.Conexion.Commit;
      MostrarDialogoAceptar('El inmueble se grabó correctamente.');
      Close;
    except
      on E:Exception do
      begin
        MostrarDialogoAceptar('Ha ocurrido un error al grabar el inmueble. Datos Técnicos: ' + e.Message);
        DM.Conexion.Rollback;
      end;
    end;
  Finally
    FreeAndNil(q);
  end;
end;

procedure TFGestionPropiedad.actBorrarExecute(Sender: TObject);
begin
  Application.ProcessMessages;
  if MostrarDialogoSiNo('¿Esta seguro de elimiar el Inmueble seleccionado?'+ #13 + #10 +
   'Se eliminará toda la información relacionada al inmueble, y no podrá recuperarse') then
  begin
    if DM.Conexion.InTransaction then
      DM.Conexion.Rollback;
    DM.Conexion.StartTransaction;
    try
      DM.BorrarInmueble(edCodigo.Text);
      DM.Conexion.Commit;
    except
      DM.Conexion.Rollback;
    end;

    edCodigo.Text     := '';
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
    edtDni.Text := '';
  end;
end;

procedure TFGestionPropiedad.actExpensasExecute(Sender: TObject);
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
      ParamByName('CODINQ').AsString  := edCodigo.Text;
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

procedure TFGestionPropiedad.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFGestionPropiedad.Combobox2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit11.SetFocus;
end;

procedure TFGestionPropiedad.Combobox2PropertiesChange(Sender: TObject);
begin
  if (Combobox2.Text = '10') or (Combobox2.Text = '15') or (Combobox2.Text = '20') or (Combobox2.Text = '25') or (Combobox2.Text = '30') then
    ComboBox2.Text:='1º al ' + ComboBox2.Text
end;

procedure TFGestionPropiedad.edtdniKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Edit5.SetFocus;
  end;
end;

procedure TFGestionPropiedad.edReferenteKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF kEY = #13 then
    Edtdni.SetFocus;
end;

function TFGestionPropiedad.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edCodigo.text) = '' then
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
  if Trim(edtDni.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un dni. ', mtInformation);
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

Function TFGestionPropiedad.CalculaExpensas(Codigo: String): Boolean;
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
  q:= CrearQuery;
  CantMeses := 0;
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
