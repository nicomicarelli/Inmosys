unit frmautomatizacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  ActnList, ImgList, ToolWin, sqlexpr, strUtils, Spin, FXQuery, System.Actions,
  ALIGRID, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxContainer,
  cxEdit, AdvGlowButton, cxGroupBox, frmClaveCaja, DBClient;

type
  TfAutomatizacion = class(TForm)
    DataSource1: TDataSource;
    aclLista: TActionList;
    aclModificar: TAction;
    actGrabar: TAction;
    actNuevo: TAction;
    actBorrar: TAction;
    actBuscar: TAction;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Panel2: TPanel;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Edit6: TEdit;
    Edit4: TEdit;
    edit5: TComboBox;
    CheckBox1: TCheckBox;
    chTransfiere: TCheckBox;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    edit2: TComboBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    Panel16: TPanel;
    Label44: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit3: TEdit;
    edit23: TComboBox;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Panel4: TPanel;
    Label7: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Panel12: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Panel13: TPanel;
    Label10: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    chCuotas: TComboBox;
    Panel14: TPanel;
    Label11: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Panel15: TPanel;
    Label12: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    cxTabSheet2: TcxTabSheet;
    Panel1: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label46: TLabel;
    Label1: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Edit24: TEdit;
    Edit27: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit37: TEdit;
    Edit28: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit29: TEdit;
    Edit38: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    ComboBox2: TComboBox;
    SpinEdit2: TSpinEdit;
    cxTabSheet3: TcxTabSheet;
    gDetalle: TStringAlignGrid;
    chSolicitarClave: TCheckBox;
    Label50: TLabel;
    cboCtaBancaria: TComboBox;
    Label60: TLabel;
    Edit51: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit70KeyPress(Sender: TObject; var Key: Char);
    procedure Edit60KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure Edit47KeyPress(Sender: TObject; var Key: Char);
    procedure Edit49KeyPress(Sender: TObject; var Key: Char);
    procedure Edit50KeyPress(Sender: TObject; var Key: Char);
    procedure Edit52KeyPress(Sender: TObject; var Key: Char);
    procedure Edit53KeyPress(Sender: TObject; var Key: Char);
    procedure Edit55KeyPress(Sender: TObject; var Key: Char);
    procedure Edit26KeyPress(Sender: TObject; var Key: Char);
    procedure Edit29KeyPress(Sender: TObject; var Key: Char);
    procedure Edit28KeyPress(Sender: TObject; var Key: Char);
    procedure Edit31KeyPress(Sender: TObject; var Key: Char);
    procedure Edit32KeyPress(Sender: TObject; var Key: Char);
    procedure Edit33KeyPress(Sender: TObject; var Key: Char);
    procedure Edit34KeyPress(Sender: TObject; var Key: Char);
    procedure Edit35KeyPress(Sender: TObject; var Key: Char);
    procedure Edit36KeyPress(Sender: TObject; var Key: Char);
    procedure Edit39KeyPress(Sender: TObject; var Key: Char);
    procedure Edit37KeyPress(Sender: TObject; var Key: Char);
    procedure Edit38KeyPress(Sender: TObject; var Key: Char);
    procedure Edit40KeyPress(Sender: TObject; var Key: Char);
    procedure Edit41KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure Edit24KeyPress(Sender: TObject; var Key: Char);
    procedure Edit27KeyPress(Sender: TObject; var Key: Char);
    procedure Edit30KeyPress(Sender: TObject; var Key: Char);
    procedure Edit43KeyPress(Sender: TObject; var Key: Char);
    procedure Edit44KeyPress(Sender: TObject; var Key: Char);
    procedure Edit45KeyPress(Sender: TObject; var Key: Char);
    procedure Edit46KeyPress(Sender: TObject; var Key: Char);
    procedure Edit48KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure chTransfiereClick(Sender: TObject);

  private
    procedure prCargarCuotas;
  public
    MesAno: Integer;
    cdsAnomalias: TClientDataset;

  end;

var
  fAutomatizacion: TfAutomatizacion;

implementation

uses frmDatos, Funciones, frmprincipal;
{$R *.DFM}

procedure TfAutomatizacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  fAutomatizacion := nil;
end;

procedure TfAutomatizacion.FormActivate(Sender: TObject);
var
  I: Integer;
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    with q do
    begin
      Close;
      SQL.clear;
      SQL.Add('select codinq, inquilino from inmuebles order by inquilino');
      Open;
    end;
    with q do
    begin
      Close;
      SQL.clear;
      SQL.Add('select ubicacion from inmuebles order by ubicacion');
      Open;
      Edit5.Items.clear;
      for I := 1 to RecordCount do
      begin
        Edit5.Items.Add(FieldByName('Ubicacion').AsString);
        Next;
      end;
    end;
    MesAno := ToInt(FormatDatetime('YYYYMM', Date));
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAutomatizacion.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  q: TFXQuery;
begin
  Codigo := Edit1.Text;
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      Edit1.Text := FormatFloat('0000', ToFloat(Codigo));
      With q do
      begin
        SQL.Text := ' Select a.*,i.alquiler,i.inquilino, i.Razonsocial as cuentaBancaria, I.POrcentajeGastoBancario ' +
          '   from inmuebles i ' +
          '   left join automatizacion a on i.codinq=a.codinq ' +
          '  where a.codinq=:codinq';
        ParamByName('codinq').AsString := Edit1.Text;
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit3.Text := Fields[46].AsString;
          Edit6.Text := FormatFloat('0.00', FieldByName('Alquiler').AsFloat);
          Edit7.Text := Fields[6].AsString;
          cboCtaBancaria.ItemIndex := FieldbyName('CuentaBancaria').AsInteger;
          if ToFloat(AnsiReplaceStr(Fields[7].AsString,',','.')) < 0 then
            Edit8.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[7].AsString,',','.')))
          else
            Edit8.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[7].AsString,',','.')) * -1);

          Edit51.Text := FormatFloat('0.00', FieldByName('PorcentajeGastoBancario').AsFloat);
          Edit9.Text := Fields[26].AsString;
          Edit10.Text := Fields[31].AsString;
          Edit11.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[35].AsString,',','.')) * -1);
          Edit12.Text := Fields[27].AsString;
          Edit13.Text := Fields[32].AsString;
          Edit14.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[36].AsString,',','.')) * -1);
          Edit15.Text := Fields[28].AsString;
          Edit16.Text := Fields[33].AsString;
          Edit17.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[37].AsString,',','.')) * -1);
          Edit18.Text := FieldbyName('Expensas9').AsString;
          Edit19.Text := Fields[34].AsString;
          Edit20.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[38].AsString,',','.')) * -1);
          Edit21.Text := Fields[30].AsString;
          Edit22.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(Fields[39].AsString,',','.')) * -1);
          edit23.Text := Fields[13].AsString;
          Edit24.Text := Fields[14].AsString;
          Edit25.Text := Fields[15].AsString;
          Edit26.Text := Fields[16].AsString;
          Edit27.Text := Fields[17].AsString;
          Edit28.Text := Fields[18].AsString;
          Edit29.Text := Fields[19].AsString;
          Edit30.Text := Fields[20].AsString;
          Edit31.Text := Fields[21].AsString;
          Edit32.Text := Fields[22].AsString;
          Edit33.Text := Fields[23].AsString;
          Edit34.Text := Fields[24].AsString;
          Edit35.Text := Fields[25].AsString;
          Edit36.Text := Fields[40].AsString;
          Edit37.Text := Fields[41].AsString;
          Edit38.Text := Fields[42].AsString;
          Edit39.Text := Fields[43].AsString;
          Edit40.Text := Fields[44].AsString;
          Edit41.Text := Fields[45].AsString;
          Edit45.Text := FormatFloat('0.00', FieldbyName('PPOBRASP').AsFloat);
          Edit46.Text := FieldbyName('PPOBRASPD').AsString;
          Edit47.Text := FieldbyName('PPOBRASPH').AsString;
          Edit48.Text := FormatFloat('0.00', FieldbyName('PPOBRASI').AsFloat);
          Edit49.Text := FieldbyName('PPOBRASID').AsString;
          Edit50.Text := FieldbyName('PPOBRASIH').AsString;
          Combobox1.ItemIndex := FieldbyName('PPOBRASPMES').AsInteger - 1;
          Combobox2.ItemIndex := FieldbyName('PPOBRASIMES').AsInteger - 1;
          SpinEdit1.Value := FieldbyName('PPOBRASPANIO').AsInteger;
          SpinEdit2.Value := FieldbyName('PPOBRASIANIO').AsInteger;
          Edit42.Text := FieldByName('RecuperoGastos').AsString;

          if ToFloat(AnsiReplaceStr(FieldByName('ComisionExtraordinaria').AsString,',','.')) < 0 then
            Edit44.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(FieldByName('ComisionExtraordinaria').AsString,',','.')))
          else
            Edit44.Text := FormatFloat('0.00', ToFloat(AnsiReplaceStr(FieldByName('ComisionExtraordinaria').AsString,',','.')) * -1);

          chSolicitarClave.Checked := FieldbyName('SolicitaClave').AsInteger = 1;
          Edit43.Text := FieldByName('PorcentajeExtraordinario').AsString;
          Edit3.Text := Fields[46].AsString;
          if Fields[47].AsFloat = 1 then
            CheckBox1.Checked := True
          else
            CheckBox1.Checked := False;
          if FieldbyName('Cuotas').AsInteger = 4 then
            chCuotas.ItemIndex := 0
          else if FieldbyName('Cuotas').AsInteger = 10 then
            chCuotas.ItemIndex := 1
          else if FieldbyName('Cuotas').AsInteger = 12 then
            chCuotas.ItemIndex := 2;

          chTransfiere.Checked := FieldbyName('Transfiere').AsInteger = 1;
          prCargarCuotas;
          cxPageControl1.ActivePage := cxTabSheet1;
          Edit7.SetFocus;
          aclModificar.Execute;
        end;
        if IsEmpty then
        begin
          Close;
          SQL.clear;
          SQL.Add('select * from inmuebles where codinq=:codinq');
          ParamByName('Codinq').AsString := Edit1.Text;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit6.Text := Fields[9].AsString;
            Edit7.Text := '0.00';
            Edit8.Text := '0.00';
            Edit9.Text := '0.00';
            Edit10.Text := '0.00';
            Edit11.Text := '0.00';
            Edit12.Text := '0.00';
            Edit13.Text := '0.00';
            Edit14.Text := '0.00';
            Edit15.Text := '0.00';
            Edit16.Text := '0.00';
            Edit17.Text := '0.00';
            Edit18.Text := '0.00';
            Edit19.Text := '0.00';
            Edit20.Text := '0.00';
            Edit21.Text := '0.00';
            Edit22.Text := '0.00';
            Edit42.Text := '0.00';
            Edit44.Text := '0.00';
            edit23.Text := '';
            actNuevo.Execute;
            cxPageControl1.ActivePage := cxTabSheet1;
            Edit7.SetFocus;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Edit6.Text := '';
            MostrarDialogoAceptar
              ('Inmueble correspondiente al inquilino ' + Edit1.Text +
                ' No cargado');
          end;
        end;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAutomatizacion.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus
end;

procedure TfAutomatizacion.Edit70KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit6.SetFocus;
end;

procedure TfAutomatizacion.Edit60KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit9.SetFocus
end;

procedure TfAutomatizacion.Edit6Exit(Sender: TObject);
var
  Tecla: Char;
begin
  Tecla := #13;
  Edit3KeyPress(nil, Tecla);
end;

procedure TfAutomatizacion.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit8.SetFocus
end;

procedure TfAutomatizacion.Edit9KeyPress(Sender: TObject; var Key: Char);
var
  Nombre: string;
begin
  if not CharInSet(Key, ['0' .. '9', '.', #8, #13, ',']) then
    Key := #0;

  if Key = #13 then
  begin
    TEdit(Sender).Text := FormatFloat('0.00', ToFloat(TEdit(Sender).Text));
    Nombre := TEdit(Sender).Name;
    Nombre := Copy(Nombre, 5, 2);
    if Assigned(TEdit(FindComponent('Edit' + Floattostr(ToFloat(Nombre) + 1)))) then
      TEdit(FindComponent('Edit' + Floattostr(ToFloat(Nombre) + 1))).SetFocus;
  end;
end;

procedure TfAutomatizacion.Edit2KeyPress(Sender: TObject; var Key: Char);
VAR
  Q: TFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      with q do
      begin
        Close;
        SQL.clear;
        SQL.Add('select * from automatizacion a');
        SQL.Add('join Inmuebles i on');
        SQL.Add('a.codinq = i.Codinq');
        SQL.Add('where a.Inquilino= :Inquilino');
        ParamByName('inquilino').AsString := Edit2.Text;
        Open;
        if not q.IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit6.Text := Fields[5].AsString;
          Edit7.Text := Fields[6].AsString;
          Edit8.Text := FormatFloat('0.00', Fields[7].AsFloat * -1);
          Edit9.Text := Fields[26].AsString;
          Edit10.Text := Fields[31].AsString;
          Edit11.Text := Fields[35].AsString;
          Edit12.Text := Fields[27].AsString;
          Edit13.Text := Fields[32].AsString;
          Edit14.Text := Fields[36].AsString;
          Edit15.Text := Fields[28].AsString;
          Edit16.Text := Fields[33].AsString;
          Edit17.Text := Fields[37].AsString;
          Edit18.Text := FieldbyName('Expensas9').AsString; ;
          Edit19.Text := Fields[34].AsString;
          Edit20.Text := Fields[38].AsString;
          Edit21.Text := Fields[30].AsString;
          Edit22.Text := Fields[39].AsString;
          edit23.Text := Fields[13].AsString;
          Edit24.Text := Fields[14].AsString;
          Edit25.Text := Fields[15].AsString;
          Edit26.Text := Fields[16].AsString;
          Edit27.Text := Fields[17].AsString;
          Edit28.Text := Fields[18].AsString;
          Edit29.Text := Fields[19].AsString;
          Edit30.Text := Fields[20].AsString;
          Edit31.Text := Fields[21].AsString;
          Edit32.Text := Fields[22].AsString;
          Edit33.Text := Fields[23].AsString;
          Edit34.Text := Fields[24].AsString;
          Edit35.Text := Fields[25].AsString;
          if FieldbyName('Cuotas').AsInteger = 4 then
            chCuotas.ItemIndex := 0
          else if FieldbyName('Cuotas').AsInteger = 10 then
            chCuotas.ItemIndex := 1
          else if FieldbyName('Cuotas').AsInteger = 12 then
            chCuotas.ItemIndex := 2;

          aclModificar.Execute;
        end;
        if q.Isempty then
        begin
          Close;
          SQL.clear;
          SQL.Add('select * from inmuebles where inquilino=:inquilino');
          ParamByName('inquilino').AsString := Edit2.Text;
          Open;
          if not q.isempty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit6.Text := Fields[9].AsString;
            Edit7.Text := '0.00';
            Edit8.Text := '0.00';
            Edit9.Text := '0.00';
            Edit10.Text := '0.00';
            Edit11.Text := '0.00';
            Edit12.Text := '0.00';
            Edit13.Text := '0.00';
            Edit14.Text := '0.00';
            Edit15.Text := '0.00';
            Edit16.Text := '0.00';
            Edit17.Text := '0.00';
            Edit18.Text := '0.00';
            Edit19.Text := '0.00';
            Edit20.Text := '0.00';
            Edit21.Text := '0.00';
            Edit22.Text := '0.00';
            edit23.Text := '';
            Edit24.Text := '0.00';
            Edit25.Text := '0';
            Edit26.Text := '0';
            Edit27.Text := '0.00';
            Edit28.Text := '0';
            Edit29.Text := '0';
            Edit30.Text := '0.00';
            Edit31.Text := '0';
            Edit32.Text := '0';
            Edit33.Text := '0.00';
            Edit34.Text := '0';
            Edit35.Text := '0';
            actNuevo.Execute;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Edit6.Text := '';
            Showmessage('Inmueble correspondiente al inquilino ' + Edit1.Text +
                ' No cargado');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAutomatizacion.Edit13KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
begin
  if Key = #13 then
  begin
    Importe := Edit13.Text;
    Edit13.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit14.SetFocus;
  end;
  if Key = '-' then
    Key := #0;
end;

procedure TfAutomatizacion.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    Edit2.Items.clear;
    if Key = #13 then
    begin
      Edit7.SetFocus;
      with q do
      begin
        Close;
        SQL.clear;
        SQL.Add('select * from inmuebles where ubicacion=:ubicacion');
        ParamByName('ubicacion').AsString := Edit5.Text;
        Open;
        Edit2.Text := Fields[1].AsString;
        for I := 1 to RecordCount do
        begin
          Edit2.Items.Add(Fields[1].AsString);
          Next;
        end;
        Close;
        SQL.clear;
        SQL.Add('select * from automatizacion where inquilino=:inquilino');
        ParamByName('inquilino').AsString := Edit2.Text;
        Open;
        Edit1.Text := Fields[0].AsString;
        Edit2.Text := Fields[1].AsString;
        Edit4.Text := Fields[3].AsString;
        Edit5.Text := Fields[4].AsString;
        Edit6.Text := Fields[5].AsString;
        Edit7.Text := Fields[6].AsString;
        Edit8.Text := FormatFloat('0.00', Fields[7].AsFloat * -1);
        Edit9.Text := Fields[26].AsString;
        Edit10.Text := Fields[31].AsString;
        Edit11.Text := Fields[35].AsString;
        Edit12.Text := Fields[27].AsString;
        Edit13.Text := Fields[32].AsString;
        Edit14.Text := Fields[36].AsString;
        Edit15.Text := Fields[28].AsString;
        Edit16.Text := Fields[33].AsString;
        Edit17.Text := Fields[37].AsString;
        Edit18.Text := FieldbyName('Expensas9').AsString;
        Edit19.Text := Fields[34].AsString;
        Edit20.Text := Fields[38].AsString;
        Edit21.Text := Fields[30].AsString;
        Edit22.Text := Fields[39].AsString;
        edit23.Text := Fields[13].AsString;
        Edit24.Text := Fields[14].AsString;
        Edit25.Text := Fields[15].AsString;
        Edit26.Text := Fields[16].AsString;
        Edit27.Text := Fields[17].AsString;
        Edit28.Text := Fields[18].AsString;
        Edit29.Text := Fields[19].AsString;
        Edit30.Text := Fields[20].AsString;
        Edit31.Text := Fields[21].AsString;
        Edit32.Text := Fields[22].AsString;
        Edit33.Text := Fields[23].AsString;
        Edit34.Text := Fields[24].AsString;
        Edit35.Text := Fields[25].AsString;
        if RecordCount = 0 then
        begin
          Close;
          SQL.clear;
          SQL.Add('select * from inmuebles where ubicacion=:ubicacion');
          ParamByName('ubicacion').AsString := Edit5.Text;
          Open;
          if not isempty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit6.Text := Fields[9].AsString;
            Edit7.Text := '0.00';
            Edit8.Text := '0.00';
            Edit9.Text := '0.00';
            Edit10.Text := '0.00';
            Edit11.Text := '0.00';
            Edit12.Text := '0.00';
            Edit13.Text := '0.00';
            Edit14.Text := '0.00';
            Edit15.Text := '0.00';
            Edit16.Text := '0.00';
            Edit17.Text := '0.00';
            Edit18.Text := '0.00';
            Edit19.Text := '0.00';
            Edit20.Text := '0.00';
            Edit21.Text := '0.00';
            Edit22.Text := '0.00';
            edit23.Text := '';
            Edit24.Text := '0.00';
            Edit25.Text := '0';
            Edit26.Text := '0';
            Edit27.Text := '0.00';
            Edit28.Text := '0';
            Edit29.Text := '0';
            Edit30.Text := '0.00';
            Edit31.Text := '0';
            Edit32.Text := '0';
            Edit33.Text := '0.00';
            Edit34.Text := '0';
            Edit35.Text := '0';
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Edit6.Text := '';
            Edit7.Text := '0.00';
            Edit8.Text := '0.00';
            Edit9.Text := '0.00';
            Edit10.Text := '0.00';
            Edit11.Text := '0.00';
            Edit12.Text := '0.00';
            Edit13.Text := '0.00';
            Edit14.Text := '0.00';
            Edit15.Text := '0.00';
            Edit16.Text := '0.00';
            Edit17.Text := '0.00';
            Edit18.Text := '0.00';
            Edit19.Text := '0.00';
            Edit20.Text := '0.00';
            Edit21.Text := '0.00';
            Edit22.Text := '0.00';
            edit23.Text := '';
            Edit24.Text := '0.00';
            Edit25.Text := '0';
            Edit26.Text := '0';
            Edit27.Text := '0.00';
            Edit28.Text := '0';
            Edit29.Text := '0';
            Edit30.Text := '0.00';
            Edit31.Text := '0';
            Edit32.Text := '0';
            Edit33.Text := '0.00';
            Edit34.Text := '0';
            Edit35.Text := '0';
            MostrarDialogoAceptar('Inmueble correspondiente al Inquilino ' + Edit1.Text +
                ' No cargado');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAutomatizacion.Edit24KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit25.SetFocus;
end;

procedure TfAutomatizacion.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit26.SetFocus;
end;

procedure TfAutomatizacion.Edit47KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit30.SetFocus;
end;

procedure TfAutomatizacion.Edit48KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
begin
  if Key = #13 then
  begin
    Importe := Edit48.Text;
    Edit48.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit49.SetFocus;
  end;
end;

procedure TfAutomatizacion.Edit49KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit50.SetFocus;
end;

procedure TfAutomatizacion.Edit50KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit1.SetFocus;
end;

procedure TfAutomatizacion.Edit52KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edit23.SetFocus;
end;

procedure TfAutomatizacion.Edit53KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit24.SetFocus;
end;

procedure TfAutomatizacion.Edit55KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit26.SetFocus;
end;

procedure TfAutomatizacion.Edit26KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit27.SetFocus;
end;

procedure TfAutomatizacion.Edit27KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit28.SetFocus;
end;

procedure TfAutomatizacion.Edit29KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit36.SetFocus;
end;

procedure TfAutomatizacion.Edit28KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit29.SetFocus;
end;

procedure TfAutomatizacion.Edit30KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit31.SetFocus;

end;

procedure TfAutomatizacion.Edit31KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit32.SetFocus;
end;

procedure TfAutomatizacion.Edit32KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit33.SetFocus;
end;

procedure TfAutomatizacion.Edit33KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
begin
  if Key = #13 then
  begin
    Importe := Edit33.Text;
    Edit33.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit34.SetFocus;
  end;
end;

procedure TfAutomatizacion.Edit34KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit35.SetFocus;
end;

procedure TfAutomatizacion.Edit35KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit39.SetFocus;
end;

procedure TfAutomatizacion.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAutomatizacion.chTransfiereClick(Sender: TObject);
begin
  Label50.Visible := chTransfiere.Checked;
  Label60.Visible := chTransfiere.Checked;
  Edit51.Visible := chTransfiere.Checked;
  cboCtaBancaria.Visible := chTransfiere.Checked;
end;

procedure TfAutomatizacion.Edit36KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
begin
  if Key = #13 then
  begin
    Importe := Edit36.Text;
    Edit36.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit37.SetFocus;
  end;
end;

procedure TfAutomatizacion.Edit39KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
begin
  if Key = #13 then
  begin
    Importe := Edit39.Text;
    Edit39.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit40.SetFocus;
  end;
end;

procedure TfAutomatizacion.Edit3Exit(Sender: TObject);
var
  Tecla: Char;
begin
  Tecla := #13;
  Edit3KeyPress(nil, Tecla);
end;

procedure TfAutomatizacion.Edit37KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit38.SetFocus;
end;

procedure TfAutomatizacion.Edit38KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit45.SetFocus;
end;

procedure TfAutomatizacion.Edit40KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit41.SetFocus;
end;

procedure TfAutomatizacion.Edit41KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit48.SetFocus;
end;

procedure TfAutomatizacion.Edit43KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
  Porcentaje: Double;
  Centavos: string;
begin
  if Key = '.' then
    Key := ',';

  if Key = #13 then
  begin
    if Edit43.Text = '' then
      Edit43.Text := '0';
    Importe := Edit6.Text;
    Importe := FormatFloat('0.00', ToFloat(Importe));
    Porcentaje := ToFloat(Importe) * ToFloat(Edit43.Text) / 100;
//    Porcentaje := Trunc(Porcentaje);
    Importe := FormatFloat('0.00', Porcentaje);
    Centavos := Copy(Importe, Length(Importe) - 1, 2);
    Delete(Importe, Length(Importe) - 1, 2);
    if StrToInt(Centavos) > 50 then
      Importe := FormatFloat('0.00', ToFloat(Importe) + 1)
    else if StrTofLOAT(Centavos) > 0 then
      Importe := FormatFloat('0.00', ToFloat(Importe) + 0.50);

    Edit44.Text := FormatFloat('0.00', ToFloat(Importe) * -1);
    Edit44.Text := AnsiReplacestr(Edit44.Text, ',', '.');
    Edit9.SetFocus;
  end;
  if Key = '-' then
    Key := #0;
end;

procedure TfAutomatizacion.Edit44KeyPress(Sender: TObject; var Key: Char);
var
  Nombre: string;
begin
  if not CharInSet(Key, ['0' .. '9', '.','-', #8, #13, ',']) then
    Key := #0;

  if Key = #13 then
  begin
    TEdit(Sender).Text := FormatFloat('0.00', ToFloat(TEdit(Sender).Text));
    Nombre := TEdit(Sender).Name;
    Nombre := Copy(Nombre, 5, 2);
    if Assigned(TEdit(FindComponent('Edit' + Floattostr(ToFloat(Nombre) + 1)))) then
      TEdit(FindComponent('Edit' + Floattostr(ToFloat(Nombre) + 1))).SetFocus;
  end;

  if ToFloat(Edit44.Text) > 0 then
    Edit44.Text := FormatFloat('0.00',  ToFloat(Edit44.Text)*-1);
end;

procedure TfAutomatizacion.Edit45KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
begin
  if Key = #13 then
  begin
    Importe := Edit45.Text;
    Edit45.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit46.SetFocus;
  end;
end;

procedure TfAutomatizacion.Edit46KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit47.SetFocus;
end;

procedure TfAutomatizacion.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  FPrincipal.Center(Self);
  cdsAnomalias := TClientDataset.Create(nil);
  cdsAnomalias.FieldDefs.Clear;
  cdsAnomalias.FieldDefs.Add('Descripcion', ftString, 200);
  cdsAnomalias.CreateDataset;
  q := CrearQuery;
  try
    q.SQL.Text := 'Select CuentaBancaria, Descripcion from RazonesSociales';
    q.Open;

    cboctaBancaria.Clear;
    while not q.Eof do
    begin
      cboctaBancaria.items.Add(q.Fieldbyname('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(Q);
  end;
end;

procedure TfAutomatizacion.prCargarCuotas;
var
  q: TFXQuery;
  qMovimientos: TFXQuery;
  I: Integer;
begin
  qMovimientos := CrearQuery;
  try
    gDetalle.Vaciar;
    I := 1;
    qMovimientos.SQL.Text := 'Select * from ItemAutom where codinq = :Codinq ';
    qMovimientos.SQL.Add(' and Coditem >= :Desde and Coditem <= :Hasta ');
    qMovimientos.SQL.Add(' order by Fecha, Coditem ');
    qMovimientos.ParamByName('Desde').AsString := '300';
    qMovimientos.ParamByName('Hasta').AsString := '300';
    qMovimientos.ParamByName('Codinq').AsString := Edit1.text;
    qMovimientos.Open;

    while not qMovimientos.eof do
    begin
        gDetalle.Cells[0,I] := qMovimientos.FieldByName('Coditem').AsString;
        gDetalle.Cells[1,I] := qMovimientos.FieldByName('Item').AsString + ' ' + qMovimientos.FieldByName('Periodo').AsString;
        gDetalle.Cells[2,I] := FechaConBarras(qMovimientos.FieldByName('Fecha').AsString);
        if qMovimientos.FieldByName('Importe').IsNull then
          gDetalle.Cells[3,I] := ''
        else
        begin
          if (qMovimientos.FieldByName('Coditem').AsString = '12') or(qMovimientos.FieldByName('Coditem').AsString = '121') or (qMovimientos.FieldByName('Coditem').AsString = '27') then
          begin
            if ToFloat(qMovimientos.FieldByName('Importe').AsString) < 0 then
              gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Importe').AsString))
            else
              gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Importe').AsString)*-1);
          end
          else
            gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Importe').AsString));
        end;

        gDetalle.Cells[4,I] := qMovimientos.FieldByName('Codinq').AsString;
        gDetalle.Cells[5,I] := qMovimientos.FieldByName('Clave').AsString;
        gDetalle.Cells[6,I] := qMovimientos.FieldByName('Registro').AsString;
        Inc(I);
        qMovimientos.Next;
      end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
  finally
    FreeAndNil(qMovimientos);
  end;
end;

procedure TfAutomatizacion.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  Comision: Double;
  Resultado: Boolean;
begin
  if Trim(edit1.Text) = '' then
    Exit;

  cdsAnomalias.EmptyDataSet;

  q := CrearQuery;
  try
    if MostrarDialogoSiNo('¿Esta seguro de grabar estos datos?',
      mtconfirmation, mbYes) then
    begin
      if MesAno > (ToFloat(SpinEdit2.text + FormatFloat('00',Combobox2.ItemIndex+1))) then
      begin
        if ToFloat(Edit48.Text) <> 0 then
          if ToFloat(edit49.Text) = 1 then
          begin
            MostrarDialogoAceptar('El mes de inicio del plan de pago para inquilinos no puede ser anterior al mes actual.');
            Exit;
          end;
      end;

      if MesAno > (ToFloat(SpinEdit1.text + FormatFloat('00',Combobox1.ItemIndex+1))) then
      begin
        if ToFloat(Edit45.Text) <> 0 then
          if ToFloat(edit46.Text) = 1 then
          begin
            MostrarDialogoAceptar('El mes de inicio del plan de pago para propietarios no puede ser anterior al mes actual.');
            Exit;
          end;
      end;

      // Anomalias Agua
      q.SQL.Text :=
        ' Select PorcentajeInquilino, PorcentajePropietario '+
        '   From PorcentajeCobro ' +
        '  where Codinq = :Codinq ' +
        '    and Codigo = :Codigo ';
      q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(Edit1.Text));
      q.ParambyName('Codigo').AsInteger := 2;
      q.Open;

      if q.FieldByName('PorcentajePropietario').AsFloat <> 0 then
      begin
        if toFloat(Edit11.Text) = 0 then
        begin
          cdsAnomalias.Append;
          cdsAnomalias.FieldByName('Descripcion').AsString := 'NO COINCIDEN los porcentajes de cobro, con la automatizacion en AGUAS CORDOBESAS.';
          cdsAnomalias.Post;
        end;
      end;
      if q.FieldByName('PorcentajeInquilino').AsFloat <> 0 then
      begin
        if toFloat(Edit9.Text) = 0 then
        begin
          cdsAnomalias.Append;
          cdsAnomalias.FieldByName('Descripcion').AsString := 'NO COINCIDEN los porcentajes de cobro, con la automatizacion en AGUAS CORDOBESAS.';
          cdsAnomalias.Post;
        end;
      end;

      // Rentas
      q.SQL.Text :=
        ' Select PorcentajeInquilino, PorcentajePropietario '+
        '   From PorcentajeCobro ' +
        '  where Codinq = :Codinq ' +
        '    and Codigo = :Codigo ';
      q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(Edit1.Text));
      q.ParambyName('Codigo').AsInteger := 1;
      q.Open;

      if q.FieldByName('PorcentajePropietario').AsFloat <> 0 then
      begin
        if toFloat(Edit17.Text) = 0 then
        begin
          cdsAnomalias.Append;
          cdsAnomalias.FieldByName('Descripcion').AsString := 'NO COINCIDEN los porcentajes de cobro, con la automatizacion en D.G.R.';
          cdsAnomalias.Post;
        end;
      end;
      if q.FieldByName('PorcentajeInquilino').AsFloat <> 0 then
      begin
        if toFloat(Edit15.Text) = 0 then
        begin
          cdsAnomalias.Append;
          cdsAnomalias.FieldByName('Descripcion').AsString := 'NO COINCIDEN los porcentajes de cobro, con la automatizacion en D.G.R.';
          cdsAnomalias.Post;
        end;
      end;

      // Tasa Municipal
      q.SQL.Text :=
        ' Select PorcentajeInquilino, PorcentajePropietario '+
        '   From PorcentajeCobro ' +
        '  where Codinq = :Codinq ' +
        '    and Codigo = :Codigo ';
      q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(Edit1.Text));
      q.ParambyName('Codigo').AsInteger := 3;
      q.Open;

      if q.FieldByName('PorcentajePropietario').AsFloat <> 0 then
      begin
        if toFloat(Edit14.Text) = 0 then
        begin
          cdsAnomalias.Append;
          cdsAnomalias.FieldByName('Descripcion').AsString := 'NO COINCIDEN los porcentajes de cobro, con la automatizacion en Tasa Municipal';
          cdsAnomalias.Post;
        end;
      end;
      if q.FieldByName('PorcentajeInquilino').AsFloat <> 0 then
      begin
        if toFloat(Edit12.Text) = 0 then
        begin
          cdsAnomalias.Append;
          cdsAnomalias.FieldByName('Descripcion').AsString := 'NO COINCIDEN los porcentajes de cobro, con la automatizacion en Tasa Municipal';
          cdsAnomalias.Post;
        end;
      end;

//      if not cdsAnomalias.IsEmpty then
//        if MostrarDialogoSiNo('ANOMALIA!!! '+ #13#10#13#10 + 'Si desea continuar deberá introducir su clave de autorización.'+#13#10+'¿Desea continuar?', mterror, mbNo)then
//        begin
//          if TFClaveCaja.Ejecutar(cdsAnomalias, Resultado) then
//          begin
//            if not Resultado then
//              Exit;
//          end
//          else
//            Exit;
//        end
//        else
//          Exit;


      DM.IniciarTransaccion;
      try
        cdsAnomalias.First;

        while not cdsAnomalias.eof do
        begin
          InsertarAnomalia(FormatFloat('0000', ToFloat(Edit1.Text)),
                           'Now',
                           '',
                           '',
                           FormatFloat('0000', ToFloat(Edit1.Text)),
                           'IMPUESTOS ' + cdsAnomalias.FieldByName('Descripcion').AsString);
          cdsAnomalias.Next;
        end;

        if Edit42.Text = '' then
          Edit42.Text := '0.00';
        if Edit24.Text = '' then
          Edit24.Text := '0.00';
        if Edit25.Text = '' then
          Edit25.Text := '0';
        if Edit26.Text = '' then
          Edit26.Text := '0';
        if Edit27.Text = '' then
          Edit27.Text := '0.00';
        if Edit28.Text = '' then
          Edit28.Text := '0';
        if Edit29.Text = '' then
          Edit29.Text := '0';
        if Edit30.Text = '' then
          Edit30.Text := '0.00';
        if Edit31.Text = '' then
          Edit31.Text := '0';
        if Edit32.Text = '' then
          Edit32.Text := '0';
        if Edit33.Text = '' then
          Edit33.Text := '0.00';
        if Edit34.Text = '' then
          Edit34.Text := '0';
        if Edit35.Text = '' then
          Edit35.Text := '0';
        if Edit36.Text = '' then
          Edit36.Text := '0.00';
        if Edit37.Text = '' then
          Edit37.Text := '0';
        if Edit38.Text = '' then
          Edit38.Text := '0';
        if Edit39.Text = '' then
          Edit39.Text := '0.00';
        if Edit40.Text = '' then
          Edit40.Text := '0';
        if Edit41.Text = '' then
          Edit41.Text := '0';
        if Edit3.Text = '' then
          Edit3.Text := '0';
        if Edit8.Text = '' then
          Edit8.Text := '0.00';
        if Edit42.Text = '' then
          Edit42.Text := '0';
        if Edit43.Text = '' then
          Edit43.Text := '0.00';
        if Edit45.Text = '' then
          Edit45.Text := '0.00';
        if Edit46.Text = '' then
          Edit46.Text := '0';
        if Edit47.Text = '' then
          Edit47.Text := '0';
        if Edit48.Text = '' then
          Edit48.Text := '0.00';
        if Edit49.Text = '' then
          Edit49.Text := '0';
        if Edit50.Text = '' then
          Edit50.Text := '0';

        q.SQL.Text := 'Delete from automatizacion where codinq=:Codinq';
        q.ParamByName('Codinq').AsString := FormatFloat
          ('0000', ToFloat(Edit1.Text));
        q.ExecSQL;

        q.SQL.Text := ' INSERT INTO AUTOMATIZACION ( ' +
          ' CODINQ, INQUILINO, CODPRO, PROPIETARIO, ' +
          ' INMUEBLE, ALQUILER, BONIFICACION, COMISION, ' +
          ' AGUA, MUNICIPALIDAD, DGR, EXPENSAS, ITSI, ESTADOEXPENSAS, ' +
          ' PPDGRP, PPDGRPD, PPDGRPH, PPTMUNP, PPTMUNPD, PPTMUNH, PPDGRI, ' +
          ' PPDGRID, PPDGRIH, PPTMUNI, PPTMUNID, PPTMUNIH, AGUA9, MUNI9, ' +
          ' DGR9, EXPENSAS9, ITSI9, AGUA2, MUNI5, DGR4, EXPENSAS14, ' +
          ' AGUA27, MUNI27, DGR27, EXPENSAS27, ITSI27, PPAGUAP, PPAGUAPD, ' +
          ' PPAGUAPH, PPAGUAI, PPAGUAID, PPAGUAIH, PORCENTAJE, PAGARE, ' +
          ' RECUPEROGASTOS, COMISIONEXTRAORDINARIA, PORCENTAJEEXTRAORDINARIO, '+
          ' PPOBRASP, PPOBRASPD, PPOBRASPH, PPOBRASPMES, PPOBRASPANIO, '+
          ' PPOBRASI, PPOBRASID, PPOBRASIH, PPOBRASIMES, PPOBRASIANIO, CUOTAS, TRANSFIERE, SOLICITACLAVE) ' +
          ' VALUES ( ' + ' :CODINQ, :INQUILINO, :CODPRO, :PROPIETARIO, ' +
          ' :INMUEBLE, :ALQUILER, :BONIFICACION, :COMISION, ' +
          ' :AGUA, :MUNICIPALIDAD, :DGR, :EXPENSAS, :ITSI, :ESTADOEXPENSAS, ' +
          ' :PPDGRP, :PPDGRPD, :PPDGRPH, :PPTMUNP, :PPTMUNPD, :PPTMUNH, :PPDGRI, '
          +
          ' :PPDGRID, :PPDGRIH, :PPTMUNI, :PPTMUNID, :PPTMUNIH, :AGUA9, :MUNI9, ' +
          ' :DGR9, :EXPENSAS9, :ITSI9, :AGUA2, :MUNI5, :DGR4, :EXPENSAS14, '
          +
          ' :AGUA27, :MUNI27, :DGR27, :EXPENSAS27, :ITSI27, :PPAGUAP, :PPAGUAPD, ' +
          ' :PPAGUAPH, :PPAGUAI, :PPAGUAID, :PPAGUAIH, :PORCENTAJE, :PAGARE, '+
          ' :RECUPEROGASTOS, :COMISIONEXTRAORDINARIA, :PORCENTAJEEXTRAORDINARIO, '+
          ' :PPOBRASP, :PPOBRASPD, :PPOBRASPH, :PPOBRASPMES, :PPOBRASPANIO, '+
          ' :PPOBRASI, :PPOBRASID, :PPOBRASIH, :PPOBRASIMES, :PPOBRASIANIO, :PCUOTAS, :TRANSFIERE, :SOLICITACLAVE)';

        with q do
        begin
          ParamByName('Codinq').AsString := Edit1.Text;
          ParamByName('Inquilino').AsString := Trim(Edit2.Text);
          ParamByName('CodPro').AsString := '';
          ParamByName('Propietario').AsString := Trim(Edit4.Text);
          ParamByName('Inmueble').AsString := Edit5.Text;
          ParamByName('Alquiler').AsString := Edit6.Text;
          ParamByName('Bonificacion').AsString := Edit7.Text;
          if ToFloat(Edit8.Text) < 0 then
            Comision := ToFloat(Edit8.Text) * -1
          else
            Comision := ToFloat(Edit8.Text);
          ParamByName('Comision').AsString := Floattostr(Comision);
          if ToFloat(Edit44.Text) < 0 then
            Comision := ToFloat(Edit44.Text) * -1
          else
            Comision := ToFloat(Edit44.Text);
          ParamByName('ComisionExtraordinaria').AsString := Floattostr(Comision);

          ParamByName('PorcentajeExtraordinario').AsString := Edit43.Text;
          ParamByName('Agua').AsString := Edit9.Text;
          ParamByName('Municipalidad').AsString := '';
          ParamByName('DGR').AsString := '';
          ParamByName('Expensas').AsString := '';
          ParamByName('ITSI').AsString := '';
          ParamByName('ESTADOEXPENSAS').AsString := edit23.Text;
          ParamByName('PPDGRP').AsString := Edit24.Text;
          ParamByName('PPDGRPD').AsString := Edit25.Text;
          ParamByName('PPDGRPH').AsString := Edit26.Text;
          ParamByName('PPTMUNP').AsString := Edit27.Text;
          ParamByName('PPTMUNPD').AsString := Edit28.Text;
          ParamByName('PPTMUNH').AsString := Edit29.Text;
          ParamByName('PPDGRI').AsString := Edit30.Text;
          ParamByName('PPDGRID').AsString := Edit31.Text;
          ParamByName('PPDGRIH').AsString := Edit32.Text;
          ParamByName('PPTMUNI').AsString := Edit33.Text;
          ParamByName('PPTMUNID').AsString := Edit34.Text;
          ParamByName('PPTMUNIH').AsString := Edit35.Text;

          ParamByName('Agua9').AsString := Edit9.Text;
          ParamByName('Muni9').AsString := Edit12.Text;
          ParamByName('DGR9').AsString := Edit15.Text;
          ParamByName('expensas9').AsString := Edit18.Text;
          ParamByName('ITSI9').AsString := Edit21.Text;

          ParamByName('Agua2').AsString := Edit10.Text;
          ParamByName('Muni5').AsString := Edit13.Text;
          ParamByName('DGR4').AsString := Edit16.Text;
          ParamByName('expensas14').AsString := Edit19.Text;

          ParamByName('Agua27').AsString := Floattostr(aBS(ToFloat(Edit11.Text)));
          ParamByName('Muni27').AsString := Floattostr(aBS(ToFloat(Edit14.Text)));
          ParamByName('DGR27').AsString := Floattostr(aBS(ToFloat(Edit17.Text)));
          ParamByName('expensas27').AsString := Edit20.Text;
          ParamByName('ITSI27').AsString := Edit22.Text;

          ParamByName('PPAGUAP').AsString := Edit36.Text;
          ParamByName('PPAGUAPD').AsString := Edit37.Text;
          ParamByName('PPAGUAPH').AsString := Edit38.Text;
          ParamByName('PPAGUAI').AsString := Edit39.Text;
          ParamByName('PPAGUAID').AsString := Edit40.Text;
          ParamByName('PPAGUAIH').AsString := Edit41.Text;
          ParamByName('PPOBRASP').AsString := Edit45.Text;
          ParamByName('PPOBRASPD').AsString := Edit46.Text;
          ParamByName('PPOBRASPH').AsString := Edit47.Text;
          ParamByName('PPOBRASPMES').AsInteger := Combobox1.ItemIndex + 1;
          ParamByName('PPOBRASPANIO').AsInteger := SpinEdit1.Value;
          ParamByName('PPOBRASI').AsString := Edit48.Text;
          ParamByName('PPOBRASID').AsString := Edit49.Text;
          ParamByName('PPOBRASIH').AsString := Edit50.Text;
          ParamByName('PPOBRASIMES').AsInteger := Combobox2.ItemIndex + 1;
          ParamByName('PPOBRASIANIO').AsInteger := SpinEdit2.Value;
          ParamByName('PORCENTAJE').AsString := Edit3.Text;
          ParamByName('RECUPEROGASTOS').AsString := Edit42.Text;

          if CheckBox1.Checked then
            ParamByName('PAGARE').AsInteger := 1
          else
            ParamByName('PAGARE').AsInteger := 0;

          if chTransfiere.Checked then
            ParamByName('TRANSFIERE').AsInteger := 1
          else
            ParamByName('TRANSFIERE').AsInteger := 0;

          if chSolicitaRClave.Checked then
            ParamByName('SOLICITACLAVE').AsInteger := 1
          else
            ParamByName('SOLICITACLAVE').AsInteger := 0;

          if chCuotas.ItemIndex = 2 then
            ParamByName('PCUOTAS').AsInteger := 12
          else if chCuotas.ItemIndex = 1 then
            ParamByName('PCUOTAS').AsInteger := 10
          else if chCuotas.ItemIndex = 0 then
            ParamByName('PCUOTAS').AsInteger := 4;
          ExecSQL;
        end;
        Dm.ConfirmarTransaccion;
        MostrarDialogoAceptar('Datos de Automatización grabados correctamente.');
      Except
        on E: Exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar(
            'Ocurrio un error al grabar los datos de automatización. Datos Técnicos: '
              + E.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAutomatizacion.actNuevoExecute(Sender: TObject);
begin
  Edit7.Text := '0.00';
  Edit8.Text := '0.00';
  Edit9.Text := '0.00';
  Edit10.Text := '0.00';
  Edit11.Text := '0.00';
  Edit12.Text := '0.00';
  Edit13.Text := '0.00';
  Edit14.Text := '0.00';
  Edit15.Text := '0.00';
  Edit16.Text := '0.00';
  Edit17.Text := '0.00';
  Edit18.Text := '0.00';
  Edit19.Text := '0.00';
  Edit20.Text := '0.00';
  Edit21.Text := '0.00';
  Edit22.Text := '0.00';
  edit23.Text := '';
  Edit24.Text := '0.00';
  Edit25.Text := '0';
  Edit26.Text := '0';
  Edit27.Text := '0.00';
  Edit28.Text := '0';
  Edit29.Text := '0';
  Edit30.Text := '0.00';
  Edit31.Text := '0';
  Edit32.Text := '0';
  Edit33.Text := '0.00';
  Edit34.Text := '0';
  Edit35.Text := '0';
  Edit36.Text := '0.00';
  Edit37.Text := '0';
  Edit38.Text := '0';
  Edit39.Text := '0.00';
  Edit40.Text := '0';
  Edit41.Text := '0';
  Edit44.Text := '0.00';
  Edit43.Text := '0';
  Edit45.Text := '0.00';
  Edit46.Text := '0';
  Edit47.Text := '0';
  Edit48.Text := '0.00';
  Edit49.Text := '0';
  Edit50.Text := '0';
  Combobox1.ItemIndex := 0;
  SpinEdit1.Value := 2014;
  Combobox2.ItemIndex := 0;
  SpinEdit2.Value := 2014;
  Edit1.SetFocus;
//  DM.ibtAutomatizacion.Open;
//  DM.ibtAutomatizacion.Append;
end;

procedure TfAutomatizacion.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfAutomatizacion.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
  Porcentaje: Double;
  Centavos: string;
begin

//  DecimalSeparator := ',';
//  ThousandSeparator := '.';


  if Key = '.' then
    Key := ',';

  if Key = #13 then
  begin
    if Edit3.Text = '' then
      Edit3.Text := '0';
    Edit3.text := AnsiReplaceStr(Edit3.text, ',','.');

    Importe := Edit6.Text;
    Importe := AnsiReplaceStr(Importe, ',','.');
    Importe := FormatFloat('0.00', ToFloat(Importe));
    Porcentaje := ToFloat(Importe) * ToFloat(Edit3.Text) / 100;
//    Porcentaje := Trunc(Porcentaje);
    Importe := FormatFloat('0.00', Porcentaje);
    Centavos := Copy(Importe, Length(Importe) - 1, 2);
    Delete(Importe, Length(Importe) - 1, 2);
    if StrToInt(Centavos) > 50 then
      Importe := FormatFloat('0.00', ToFloat(Importe) + 1)
    else if StrTofLOAT(Centavos) > 0 then
      Importe := FormatFloat('0.00', ToFloat(Importe) + 0.50);

    Edit8.Text := FormatFloat('0.00', ToFloat(Importe) * -1);
    Edit8.Text := AnsiReplacestr(Edit8.Text, ',', '.');
    Edit9.SetFocus;
  end;
  if Key = '-' then
    Key := #0;

//  DecimalSeparator := '.';
//  ThousandSeparator := ',';
end;

end.
