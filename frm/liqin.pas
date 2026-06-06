unit liqin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  ImgList, ToolWin, Funciones,
  ActnList, Declaraciones, sqlexpr, dbCLient, Provider,
  ALIGRID, ppParameter, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBJIT, ppModule, raCodMod, ppVar,
  ppStrtch, ppRegion, ppDBPipe, FMTBcd,
  IBTable, IBCustomDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMemo, cxRichEdit, AdvObj, BaseGrid, AdvGrid, cxMaskEdit, cxDropDownEdit,
  AdvPanel, StrUtils, voDispositivos, DateUtils, FXQuery, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  ppDesignLayer, System.Actions, System.UITypes, AdvGlowButton, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ppSubRpt, dxGDIPlusClasses;
type
  TFrmLiquidacionInquilinos = class(TForm)
    plTitulo: TppJITPipeline;
    plTituloppField1: TppField;
    plTituloppField2: TppField;
    plTituloppField3: TppField;
    plTituloppField4: TppField;
    plTituloppField5: TppField;
    plTituloppField6: TppField;
    plTituloppField7: TppField;
    plTituloppField8: TppField;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    aclAcciones: TActionList;
    aclCalculoItems: TAction;
    actExpensas: TAction;
    actFechaMesSiguiente: TAction;
    actPlanesdePago: TAction;
    actAlquilerACuenta: TAction;
    actImpuestosAlPropietario: TAction;
    actNotaCercanaFecha: TAction;
    actListadoRecibos: TAction;
    actCargaInmuebles: TAction;
    actCargadeConceptos: TAction;
    actPoneMesPagado: TAction;
    actImprimirRecibo: TAction;
    actFechaExpensas: TAction;
    actCaja: TAction;
    plTituloppField9: TppField;
    Panel3: TPanel;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Panel4: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    gImpresion: TStringAlignGrid;
    Edit9: TEdit;
    Edit11: TEdit;
    Panel1: TPanel;
    gNovedades: TAdvStringGrid;
    Edit1: TcxTextEdit;
    Edit4: TcxTextEdit;
    Edit7: TcxMaskEdit;
    Edit6: TcxMaskEdit;
    Edit8: TcxMaskEdit;
    Edit2: TcxComboBox;
    Edit5: TcxComboBox;
    Edit3: TcxTextEdit;
    ComboBox1: TComboBox;
    Edit10: TEdit;
    edCtaCte: TcxTextEdit;
    Edit12: TcxTextEdit;
    Button1: TButton;
    ExpensasAReclamar: TppField;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppVariable4: TppVariable;
    ppDBText6: TppDBText;
    ppVariable5: TppVariable;
    ppDetailBand2: TppDetailBand;
    ppVariable6: TppVariable;
    ppVariable7: TppVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppVariable8: TppVariable;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    raCodeModule2: TraCodeModule;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    gDetalleSeleccion: TStringAlignGrid;
    cxGrid1: TcxGrid;
    gDetalle: TcxGridDBTableView;
    Columna_Item: TcxGridDBColumn;
    Columna_Seleccion: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    Columna_Importe: TcxGridDBColumn;
    Columna_coditem: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    memNovedades: TMemo;
    Label4: TLabel;
    edtTotal: TcxTextEdit;
    AdvGlowButton1: TAdvGlowButton;
    Reporte: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppVariable1: TppVariable;
    ppDBText3: TppDBText;
    ppVariable2: TppVariable;
    ppDetailBand1: TppDetailBand;
    ppVariable3: TppVariable;
    ppVariable9: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppVariable10: TppVariable;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ReporteVistaPrevia: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDBText11: TppDBText;
    ppLabel7: TppLabel;
    ppDBText12: TppDBText;
    ppVariable11: TppVariable;
    ppDBText13: TppDBText;
    ppVariable12: TppVariable;
    ppDetailBand3: TppDetailBand;
    ppVariable13: TppVariable;
    ppVariable14: TppVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppVariable15: TppVariable;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    raCodeModule3: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ReporteVistaPreviaDuplicado: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDBText16: TppDBText;
    ppLabel10: TppLabel;
    ppDBText17: TppDBText;
    ppVariable16: TppVariable;
    ppDBText18: TppDBText;
    ppVariable17: TppVariable;
    ppDetailBand4: TppDetailBand;
    ppVariable18: TppVariable;
    ppVariable19: TppVariable;
    ppSummaryBand4: TppSummaryBand;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppVariable20: TppVariable;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    raCodeModule4: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList4: TppParameterList;
    lbTransfiere: TLabel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Label10: TLabel;
    cxTextEdit1: TcxTextEdit;
    ReporteFijo: TppReport;
    ppParameterList6: TppParameterList;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText21: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape2: TppShape;
    ppVariable21: TppVariable;
    ppVariable22: TppVariable;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppHeaderBand5: TppHeaderBand;
    ppShape3: TppShape;
    ppVariable25: TppVariable;
    ppVariable26: TppVariable;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppVariable27: TppVariable;
    ppVariable28: TppVariable;
    ppSummaryBand5: TppSummaryBand;
    raCodeModule5: TraCodeModule;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppVariable29: TppVariable;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    raCodeModule6: TraCodeModule;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList5: TppParameterList;
    plTituloppField10: TppField;
    ReporteFijoDuplicado: TppReport;
    ppTitleBand5: TppTitleBand;
    ppShape6: TppShape;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText27: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppShape7: TppShape;
    ppVariable36: TppVariable;
    ppVariable37: TppVariable;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppVariable38: TppVariable;
    ppImage3: TppImage;
    ppHeaderBand7: TppHeaderBand;
    ppVariable39: TppVariable;
    ppVariable40: TppVariable;
    ppImage4: TppImage;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand9: TppDetailBand;
    ppVariable41: TppVariable;
    ppVariable42: TppVariable;
    ppSummaryBand9: TppSummaryBand;
    raCodeModule9: TraCodeModule;
    ppDesignLayers9: TppDesignLayers;
    ppDesignLayer9: TppDesignLayer;
    ppDetailBand10: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppVariable43: TppVariable;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    raCodeModule10: TraCodeModule;
    ppDesignLayers10: TppDesignLayers;
    ppDesignLayer10: TppDesignLayer;
    ppParameterList7: TppParameterList;
    ppTitleBand3: TppTitleBand;
    ppShape4: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText22: TppDBText;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppShape5: TppShape;
    ppVariable23: TppVariable;
    ppVariable24: TppVariable;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppVariable35: TppVariable;
    ppImage2: TppImage;
    ppHeaderBand6: TppHeaderBand;
    ppVariable30: TppVariable;
    ppVariable31: TppVariable;
    ppImage1: TppImage;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppVariable32: TppVariable;
    ppVariable33: TppVariable;
    ppSummaryBand7: TppSummaryBand;
    raCodeModule7: TraCodeModule;
    ppDesignLayers7: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppVariable34: TppVariable;
    ppDBText23: TppDBText;
    ppDBText26: TppDBText;
    raCodeModule8: TraCodeModule;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure aclCalculoItemsExecute(Sender: TObject);
    procedure actExpensasExecute(Sender: TObject);
    procedure actFechaMesSiguienteExecute(Sender: TObject);
    procedure actPlanesdePagoExecute(Sender: TObject);
    procedure actImpuestosAlPropietarioExecute(Sender: TObject);
    procedure actNotaCercanaFechaExecute(Sender: TObject);
    procedure actListadoRecibosExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    function plTituloGetFieldValue(aFieldName: string): Variant;
    procedure gNovedadesButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure edFechaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Edit8PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Edit6PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Edit5PropertiesChange(Sender: TObject);
    procedure memNovedadesDblClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure Columna_ImporteGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    objMail: TMail;
  public
    LiqinOrig: TClientDataSet;
    dspLiqinOrig: TDatasetProvider;
    EstaVencido: Boolean;
    Punitorios: Double;
    boFaltaRespuesta: Boolean;
    cdsDatos: TClientDataSet;
    dsDatos: TDataSource;
    Expensas:   string;
    cdsAnomalias: TClientDataset;
    FDeEnvioMails: Boolean;
    class procedure Ejecutar;
    function fxDeterminarDeudaInquilino(pCodinq, pFecha: string): Double;
    procedure prCargarNovedades(pFechaDesde, pFechaHasta: TDateTime; pCodinq: string);
    function fxExistenItemsEnCero(cdsDatos:TClientDataSet): Boolean;
    function fxExistenItemsConDecimales(cdsDatos:TClientDataSet): Boolean;
    function fxExistenItemsEnRecibos(cdsDatos, cdsAnomalias:TClientDataSet): Boolean;
    function fxExistenMasDeDosExpensas(Expensas: String): Boolean;
    function fxExistenPlanDeObrasEnRecibos(cdsDatos: TClientDataSet; var Recibo: String): Boolean;

    procedure prPrepararDataset;
    procedure prCalcularDeudas;
  end;

var
  FrmLiquidacionInquilinos: TFrmLiquidacionInquilinos;

implementation

uses frmPrincipal, frmDatos, frmConfirmacionRecibos, frmCargaNovedades,
  frmABMMovimientos, frmclavecaja;

{$R *.DFM}


class procedure TFrmLiquidacionInquilinos.Ejecutar;
begin
  with TFrmLiquidacionInquilinos.Create(Application) do
    ShowModal;
end;

procedure TFrmLiquidacionInquilinos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF aSSIGNED(LiqinOrig) THEN
    FreeAndNil(LiqinOrig);
  IF aSSIGNED(dspLiqinOrig) THEN
    FreeAndNil(dspLiqinOrig);
  Action := caFree;
  FrmLiquidacionInquilinos := nil;
end;

procedure TFrmLiquidacionInquilinos.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: tFXQuery;
  qColor: tFXQuery;

begin
  q := CrearQuery;
  qColor := CrearQuery;
  try
    if Key = #13 then
    begin
      cdsDatos.EmptyDataSet;
      gImpresion.Vaciar;
      Codigo     := Edit1.Text;
      Edit1.Text := LargoCodigo(Codigo);
      Codigo     := Edit1.Text;
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select A.*, I.*, I.Inquilino as InquilinoRecibo from automatizacion a ,inmuebles i where a.codinq=i.codinq and a.codinq=:codinq');
        ParamByName('Codinq').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Fecha      := FieldByName('FechaFin').AsString;
          Fecha      := FechaAlReves(Fecha);
          Hoy        := DatetoStr(Date());
          Hoy        := FechaAlReves(Hoy);
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := FieldbyName('Inquilinorecibo').AsString;;
          Edit3.Text := Fields[2].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := FieldByName('CodPro').AsString;
          Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
          qCOlor.sql.Text := 'Select Descripcion, color, CuentaBancaria from razonessociales where Descripcion =:Descripcion';
          qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
          qColor.Open;

          Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
          Panel1.Caption := qCOlor.FieldByName('Descripcion').AsString;
          cxTextEdit1.Text := qCOlor.FieldByName('Descripcion').AsString;

          if StrToInt(Fecha) < StrToInt(hoy) then
          begin
            fecha := FieldbyName('FechaFin').AsString;
            SHOWMESSAGE('CONTRATO DE LOCACION VENCIDO');
            EstaVencido := True;
            Edit1.SETFOCUS;
          end
          else
            EstaVencido := False;
          lbTransfiere.Visible := Fieldbyname('PuedeTransferir').AsInteger = 0;
          cxTextEdit1.Visible := not lbTransfiere.Visible;
        end
        else
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where codinq= :codinq');
          ParamByName('Codinq').AsString := Codigo;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit3.Text := Fields[3].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit9.Text := Fields[14].AsString;
            Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
            qCOlor.sql.Text := 'Select CuentaBancaria, color from razonessociales where Descripcion =:Descripcion';
            qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
            qColor.Open;

            Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);

            cxTextEdit1.Text := qCOlor.FieldByName('CuentaBancaria').AsString;
            lbTransfiere.Visible := Fieldbyname('PuedeTransferir').AsInteger = 0;
            cxTextEdit1.Visible := not lbTransfiere.Visible;
          end
          else
          begin
            Edit2.Text := '';
            Edit3.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino '+Codigo+' No cargado');
            Exit;
          end;
        end;
        Edit7.setfocus;
      end;
      Memo1.Lines.Clear;
      memNovedades.Lines.Clear;
      if q.FieldbyName('Rescinde').AsInteger = 1 then
      Begin
        MostrarDialogoAceptar('El Inquilino Rescinde contrato proximamente. Verifique por favor');
        memNovedades.Lines.Add('El Inquilino Rescinde contrato proximamente.');
      End;
      if q.Fieldbyname('PuedeTransferir').AsInteger = 0 then
        memNovedades.Lines.Add('El Inquilino NO PUEDE TRANSFERIR');

    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  if Key = #13 then
  begin
    Edit8.setfocus;
    Fecha := Edit6.Text;
    if Fecha = '  /  /    ' then
    begin
      Fecha := DateToStr(Date());
      Delete(Fecha, 3, 8);
      if Fecha = '31' then
        Fecha := DateToStr(Date() - 31)
      else
        Fecha := DateToStr(Date() - 30);
      Delete(Fecha, 1, 2);
      Fecha      := '15' + Fecha;
      Edit6.Text := Fecha;
    end;
    if Length(Trim(Fecha)) = 8 then
    begin
      Fecha      := TransformaFecha(Trim(AnsiReplaceStr(Fecha, '/','')));
      Edit6.Text := Fecha;
    end;
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit6PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TFrmLiquidacionInquilinos.Edit7KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit7.Text;
  if Key = #13 then
  begin
    if Fecha = '  /  /    '  then
    begin
      try
        StrToDate(Fecha);
      Except
        Edit7.Text := FormatDateTime('dd/mm/yyyy', Date);
      end;
    end;

    Edit7.Text := FormatDateTime('dd/mm/yyyy', StrToDate(Edit7.Text));
    Edit6.setfocus;
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit8KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
 ano,mes,dia:string;
 mesi,anoi:integer;
 Deuda: Double;
 Resultado: Boolean;
begin
  btnGrabar.Enabled := True;
  if Key = #13 then
  begin
    Fecha := Edit8.Text;
    if Fecha='  /  /    ' then
    begin
      Fecha := Edit6.Text;
      Delete(Fecha,3,8);
      dia   := Fecha;
      Fecha := Edit6.Text;
      Delete(Fecha,1,3);
      Delete(Fecha,3,5);
      Mes   := Fecha;
      Fecha := Edit6.Text;
      Delete(Fecha,1,6);
      ano := Fecha;
      if Length(mes) = 1 then
        mes := '0' + mes;
      if mes = '12' then
      begin
        mes  := '01';
        anoi := StrToInt(ano)+1;
        ano  := IntToStr(anoi);
      end
      else
      begin
        mesi := StrToInt(mes)+1;
        mes  := IntToStr(mesi);
        if Length(mes) = 1 then
          mes := '0' + mes;
      end;
      Fecha      := dia + '/' + mes + '/' + ano;
      Edit8.Text := Fecha;
    end;
    if Length(Trim(Fecha)) = 8 then
    begin
      Fecha      := TransformaFecha(Trim(AnsiReplaceStr(Fecha, '/','')));
      Edit8.Text := Fecha;
    end;
    cdsDatos.EmptyDataSet;
    gImpresion.Vaciar;
    memo1.Lines.Clear;
    actFechaMesSiguiente.Execute;
    aclCalculoItems.Execute;
    Deuda := fxDeterminarDeudaInquilino(Edit1.Text, edit6.Text);
    Label1.Caption := 'Saldo al: ' + FormatDateTime('04/mm/yyyy', Date + 1);
    edCtaCte.Text := FormatFloat('0.00', Deuda);
    if Deuda > 0 then
    begin
      edCtaCte.Text := FormatFloat('0.00', Deuda);
      if not fDeEnvioMails then
        if not MostrarDialogoSiNo('El Inquilino posee deuda previa al dia ' + edit7.Text + ' por $ '+ FormatFloat('0.00', Deuda)+' ¿Desea cobrarle de todos modos?', mbYes) then
          btnGrabar.Enabled := False;

      prCalcularDeudas;
    end
    else
      edCtaCte.Text := FormatFloat('0.00', 0);

    prCargarNovedades(StrToDate(FormatDateTime('dd/mm/yyyy', StrToDate(edit6.Text))), StrToDate(FormatDateTime('dd/mm/yyyy', StrToDate(edit8.Text))), Edit1.text);
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit8PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := False;
end;


procedure TFrmLiquidacionInquilinos.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  q: tFXQuery;
  qColor: tFXQuery;
begin
  q := CrearQuery;
  qColor := CrearQuery;
  try
    if Key = #13 then
    begin
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a,inmuebles i where a.codinq=i.codinq and a.inquilino=:inquilino');
        ParamByName('inquilino').AsString := Edit2.Text;
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[2].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
          Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
          qCOlor.sql.Text := 'Select color from razonessociales where Descripcion =:Descripcion';
          qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
          qColor.Open;

          Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
        end;
        if isEmpty then
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where inquilino=:inquilino');
          ParamByName('inquilino').AsString := Edit2.Text;
          Open;
          if Not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit3.Text := Fields[3].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
            qCOlor.sql.Text := 'Select color from razonessociales where Descripcion =:Descripcion';
            qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
            qColor.Open;

            Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
          end
          else
          begin
            Edit2.Text:='';
            Edit3.Text:='';
            Edit4.Text:='';
            Edit5.Text:='';
            Showmessage('Inmueble correspondiente al inquilino '+ Edit4.Text +' No cargado');
          end;
        end;
        Edit7.SetFocus;
      end;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: tFXQuery;
  qColor: tFXQuery;

begin
  q := CrearQuery;
  qColor := CrearQuery;
  try
    if Key = #13 then
    begin
      if Edit5.Text <> '' then
      begin
        q.Sql.Text := 'Select Ubicacion from Inmuebles Where UPPER(ubicacion) like :Ubicacion';
        q.ParambyName('Ubicacion').AsString := '%' + Copy(Uppercase(Edit5.text),1,48) + '%';
        q.Open;

        Edit5.Properties.Items.Clear;
        while not q.eof do
        begin
          Edit5.Properties.Items.Add(q.FieldbyName('Ubicacion').AsString);
          q.Next;
        end;
        if Edit5.Properties.Items.Count = 1 then
          Edit5.ItemIndex := 0
        else
        begin
          Edit5.DroppedDown := True;
          Exit;
        end;
      end;
      cdsDatos.EmptyDataSet;
      gImpresion.Vaciar;
      Codigo     := Edit5.Text;
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and I.Ubicacion=:Ubicacion');
        ParamByName('Ubicacion').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Fecha      := FieldByName('FechaFin').AsString;
          Fecha      := FechaAlReves(Fecha);
          Hoy        := DatetoStr(Date());
          Hoy        := FechaAlReves(Hoy);
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[2].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := FieldByName('CodPro').AsString;
          Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
          qCOlor.sql.Text := 'Select color from razonessociales where Descripcion =:Descripcion';
          qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
          qColor.Open;

          Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
          if StrToInt(Fecha) < StrToInt(hoy) then
          begin
            fecha := FieldbyName('FechaFin').AsString;
            SHOWMESSAGE('CONTRATO DE LOCACION VENCIDO');
            EstaVencido := True;
            Edit1.SETFOCUS;
          end
          else
            EstaVencido := False;
        end
        else
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where Ubicacion = :Ubicacion');
          ParamByName('Ubicacion').AsString := Codigo;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit3.Text := Fields[3].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit9.Text := Fields[14].AsString;
            Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
            qCOlor.sql.Text := 'Select color from razonessociales where Descripcion =:Descripcion';
            qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
            qColor.Open;

            Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
          end
          else
          begin
            Edit2.Text := '';
            Edit3.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino '+Codigo+' No cargado');
          end;
        end;
        Edit7.setfocus;
      end;
      Memo1.Lines.Clear;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit5PropertiesChange(Sender: TObject);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: tFXQuery;
  qColor: tFXQuery;

begin
  q := CrearQuery;
  qColor := CrearQuery;
  try
    cdsDatos.EmptyDataSet;
    gImpresion.Vaciar;
    Codigo     := Edit5.Text;
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and I.Ubicacion=:Ubicacion');
      ParamByName('Ubicacion').AsString := Codigo;
      Open;
      if not IsEmpty then
      begin
        Fecha      := FieldByName('FechaFin').AsString;
        Fecha      := FechaAlReves(Fecha);
        Hoy        := DatetoStr(Date());
        Hoy        := FechaAlReves(Hoy);
        Edit1.Text := Fields[0].AsString;
        Edit2.Text := Fields[1].AsString;
        Edit3.Text := Fields[2].AsString;
        Edit4.Text := Fields[3].AsString;
        Edit5.Text := Fields[4].AsString;
        Edit9.Text := FieldByName('CodPro').AsString;
        Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
        qCOlor.sql.Text := 'Select color from razonessociales where Descripcion =:Descripcion';
        qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
        qColor.Open;

        Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
        if StrToInt(Fecha) < StrToInt(hoy) then
        begin
          fecha := FieldbyName('FechaFin').AsString;
          SHOWMESSAGE('CONTRATO DE LOCACION VENCIDO');
          EstaVencido := True;
          Edit1.SETFOCUS;
        end
        else
          EstaVencido := False;
      end
      else
      begin
        Close;
        Sql.clear;
        Sql.Add('select * from inmuebles where Ubicacion = :Ubicacion');
        ParamByName('Ubicacion').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[3].AsString;
          Edit4.Text := Fields[4].AsString;
          Edit5.Text := Fields[8].AsString;
          Edit9.Text := Fields[14].AsString;
          Combobox1.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
          qCOlor.sql.Text := 'Select color from razonessociales where Descripcion =:Descripcion';
          qColor.ParamByName('Descripcion').AsString := Combobox1.Text;
          qColor.Open;

          Panel1.Color := Stringtocolor(qCOlor.FieldByName('Color').AsString);
        end
        else
        begin
          Edit2.Text := '';
          Edit3.Text := '';
          Edit4.Text := '';
          Edit5.Text := '';
          Showmessage('Inmueble correspondiente al inquilino '+Codigo+' No cargado');
        end;
      end;
      Edit7.setfocus;
    end;
    Memo1.Lines.Clear;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;



procedure TFrmLiquidacionInquilinos.edFechaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TFrmLiquidacionInquilinos.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
  q: TFXQuery;

begin
  q := DM.CrearQuery;
  try
    if Key = #13 then
    begin
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from inmuebles where propietario=:propietario');
        ParamByName('propietario').AsString := Edit4.Text;
        Open;
        FetchAll;
        Edit2.Properties.Items.Clear;
        for I := 1 to RecordCount do
        begin
          Edit2.Properties.Items.Add(Fields[1].AsString);
          Next;
        end;
        Close;
        Sql.clear;
        Sql.Add('select * from automatizacion a,inmuebles i where a.codinq=i.codinq and a.propietario=:propietario');
        ParamByName('propietario').AsString := Edit4.Text;
        Open;
        FetchAll;
        if RecordCount > 0 then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[2].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
        end
        else
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where propietario=:propietario');
          ParamByName('propietario').AsString := Edit4.Text;
          Open;
          if RecordCount > 0 then
          begin
            Edit1.Text:= Fields[0].AsString;
            Edit2.Text:= Fields[1].AsString;
            Edit3.Text:= Fields[3].AsString;
            Edit4.Text:= Fields[4].AsString;
            Edit5.Text:= Fields[8].AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit3.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al Propietario '+ Edit4.Text +' No cargado');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionInquilinos.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
 a,d:string;
 i:integer;
 q: TFXQuery;
begin
  q := DM.CrearQuery;
  try
    if Key = #13 then
    begin
      Codigo     := Edit3.Text;
      Codigo     := LargoCodigo(Codigo);
      Edit3.Text := Codigo;
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from inmuebles where codpro=:codpro');
        ParamByName('codpro').AsString := Codigo;
        Open;
        FetchAll;
        Edit2.Properties.items.Clear;
        for I := 1 to RecordCount do
        begin
          Edit2.Properties.Items.Add(Fields[1].AsString);
          Next;
        end;
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a,inmuebles i  where a.codinq=i.codinq and a.codpro=:codpro');
        ParamByName('codpro').AsString := Codigo;
        Open;
        FetchAll;
        if RecordCount > 0 then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[2].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
          d := Fields[26].AsString;
        end;
        if RecordCount = 0 then
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where codpro=:codpro');
          ParamByName('codpro').AsString := Codigo;
          Open;
          if Recordcount > 0 then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit3.Text := Fields[3].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
          end
          else
          begin
            Edit2.Text :='';
            Edit3.Text :='';
            Edit4.Text :='';
            Edit5.Text :='';
            Showmessage('Inmueble correspondiente al Propietario '+a+' No cargado');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;


procedure TFrmLiquidacionInquilinos.FormCreate(Sender: TObject);
var
  q: tFXQuery;
begin
  boFaltaRespuesta := False;
  fPrincipal.Center(Self);
  FDeEnvioMails := False;
  prPrepararDataset;
  LiqinOrig := TClientDataSet.Create(nil);
  dspLiqinOrig := TDatasetProvider.Create(nil);
  actCargaInmuebles.Execute;
  q:= CrearQuery;
  try
    q.SQL.Text := 'Select Descripcion from razonessociales';
    q.Open;

    Combobox1.Clear;
    while not q.eof do
    begin
      combobox1.Items.Add(q.FieldByName('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;

  Edit2.Clear;
  Edit5.Clear;
  q := CrearQuery;
  try
    q.Close;
    q.Sql.Clear;
    q.Sql.Add('select ubicacion from inmuebles order by ubicacion');
    q.Open;
    while not q.eof do
    begin
      Edit5.Properties.Items.Add(q.Fieldbyname('Ubicacion').AsString);
      q.Next;
    end;
    q.Sql.Clear;
    q.Sql.Add('select Inquilino from inmuebles order by Inquilino');
    q.Open;

    while not q.eof do
    begin
      Edit2.Properties.Items.Add(q.Fieldbyname('Inquilino').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TFrmLiquidacionInquilinos.fxDeterminarDeudaInquilino(pCodinq,
  pFecha: string): Double;
var
  q: tFXQuery;
  q1: tFXQuery;
  q2: tFXQuery;
  q3: tFXQuery;
  Fecha: TDatetime;
begin
  Fecha := Date + 1;
  q := crearQuery;
  q1 := crearQuery;
  q2 := crearQuery;
  q3 := crearQuery;
  try
        q1.SQL.Text :=
          '  sELECT sUM(CAST(i.iMPORTE AS DOUBLE PRECISION)) as Deuda'+
          '    FROM (Select I.Fecha, I.Codinq, I.Coditem, I.Item, I.Periodo, I.Importe'+
          '          From ITEMAUTOM I '+
          '          where I.codinq = :Codinq '+
          '            AND I.IMPORTE <> '''' '+
          '            and cast(replace(I.IMPORTE, '','',''.'') as double precision) <> 0) I '+
          '   INNER JOIN (select CODIGO, INQPROP '+
          '             from CONCEPTOS '+
          '             WHERE INQPROP <> 2) C on C.CODIGO = I.CODITEM '+
          '   inner join(select A.CODINQ, A.FECHAINICIO, A.INQUILINO, A.MailInquilino '+
          '             from INMUEBLES A '+
          '             order by A.CODINQ) A on A.CODINQ = I.CODINQ '+
          '   where I.codinq = :Codinq '+
          '     and cast(substring(I.fecha FROM 5 FOR 2)||''/''||substring(I.fecha FROM 7 FOR 2)||''/''||substring(I.fecha FROM 1 FOR 4) AS TIMESTAMP) >= A.FECHAINICIO '+
          '     and I.CODITEM in (''01'', ''08'', ''20'', ''30'') '+
          '     AND C.inqprop <> 2 '+
          '     and I.Fecha <= :Fecha '+
          '     AND NOT EXISTS(SELECT CU.CODITEM '+
          '                      FROM CUERPORECIBOS CU '+
          '                     INNER JOIN CABEZARECIBOS CA ON CA.CODINQ = CU.CODINQ '+
          '                     WHERE CA.CODINQ = i.CODINQ '+
          '                       AND CU.CODINQ = :CODINQ '+
          '                       AND CU.CODITEM = I.coditem '+
          '                       and cu.CODITEM in (''01'', ''08'', ''20'', ''30'') '+
          '                       AND CU.TIPO = ''RE'' '+
          '                       and cu.item = i.item '+
          '                       and cu.periodo = i.periodo) ';
        q1.ParamByName('Codinq').AsString := pCodinq;
        q1.ParamByName('Fecha').AsString := FormatDateTime('YYYYMM04', Fecha);

//        if not TodosDescripcion.Checked then
//        begin
//          q1.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
//          q1.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
//        end;

        q1.Open;

        q2.SQL.Text :=
          '  sELECT sUM(CAST(i.iMPORTE AS DOUBLE PRECISION)) as Deuda'+
          '    FROM (Select I.Fecha, I.Codinq, I.Coditem, I.Item, I.Periodo, I.Importe '+
          '          From ITEMAUTOM I '+
          '          where I.codinq = :Codinq '+
          '            AND I.IMPORTE <> '''' '+
          '            and cast(replace(I.IMPORTE, '','',''.'') as double precision) <> 0) I '+
          '   INNER JOIN (select CODIGO, INQPROP '+
          '             from CONCEPTOS '+
          '             WHERE INQPROP <> 2) C on C.CODIGO = I.CODITEM '+
          '   inner join(select A.CODINQ, A.FECHAINICIO, A.INQUILINO '+
          '             from INMUEBLES A '+
          '             order by A.CODINQ) A on A.CODINQ = I.CODINQ '+
          '   where I.codinq = :Codinq '+
          '     and I.Fecha <= :Fecha '+
          '     and cast(substring(I.fecha FROM 5 FOR 2)||''/''||substring(I.fecha FROM 7 FOR 2)||''/''||substring(I.fecha FROM 1 FOR 4) AS TIMESTAMP) >= A.FECHAINICIO '+
          '     and I.CODITEM in (''02'', ''04'', ''05'', ''09'') '+
          '     AND C.inqprop <> 2 '+
          '     AND NOT EXISTS(SELECT CU.CODITEM '+
          '                      FROM CUERPORECIBOS CU '+
          '                     INNER JOIN CABEZARECIBOS CA ON CA.CODINQ = CU.CODINQ '+
          '                     WHERE CA.CODINQ = i.CODINQ '+
          '                       AND CU.CODINQ = :CODINQ '+
          '                       AND CU.CODITEM = I.coditem '+
          '                       and cu.CODITEM in (''02'', ''04'', ''05'', ''09'') '+
          '                       AND CU.TIPO = ''RE'' '+
          '                       and cu.item = i.item '+
          '                       and cu.periodo = i.periodo) ';

        q2.ParamByName('Codinq').AsString := pCodinq;
        q2.ParamByName('Fecha').AsString := FormatDateTime('YYYYMM04', Fecha);
        q2.Open;

        q3.SQL.Text :=
          '  sELECT sUM(CAST(i.iMPORTE AS DOUBLE PRECISION)) as Deuda'+
          '    FROM (Select I.Fecha, I.Codinq, I.Coditem, I.Item, I.Periodo, I.Importe '+
          '          From ITEMAUTOM I '+
          '          where I.codinq = :Codinq '+
          '            AND I.IMPORTE <> '''' '+
          '            and cast(replace(I.IMPORTE, '','',''.'') as double precision) <> 0) I '+
          '   INNER JOIN (select CODIGO, INQPROP '+
          '             from CONCEPTOS '+
          '             WHERE INQPROP <> 2) C on C.CODIGO = I.CODITEM '+
          '   inner join(select A.CODINQ, A.FECHAINICIO, A.INQUILINO '+
          '             from INMUEBLES A '+
          '             order by A.CODINQ) A on A.CODINQ = I.CODINQ '+
          '   where I.codinq = :Codinq '+
          '     and I.Fecha <= :Fecha '+
          '     and cast(substring(I.fecha FROM 5 FOR 2)||''/''||substring(I.fecha FROM 7 FOR 2)||''/''||substring(I.fecha FROM 1 FOR 4) AS TIMESTAMP) >= A.FECHAINICIO '+
          '     and I.Coditem not in (''01'',''20'',''30'',''08'', ''09'',''04'',''05'',''02'')'+
          '     AND C.inqprop <> 2 '+
          '     AND NOT EXISTS(SELECT CU.CODITEM '+
          '                      FROM CUERPORECIBOS CU '+
          '                     INNER JOIN CABEZARECIBOS CA ON CA.CODINQ = CU.CODINQ '+
          '                     WHERE CA.CODINQ = i.CODINQ '+
          '                       AND CU.CODINQ = :CODINQ '+
          '                       AND CU.CODITEM = I.coditem '+
          '                       and CU.Coditem not in (''01'',''20'',''30'',''08'', ''09'',''04'',''05'',''02'')'+
          '                       AND CU.TIPO = ''RE'' '+
          '                       and cu.item = i.item '+
          '                       and cu.periodo = i.periodo) ';
        q3.ParamByName('Codinq').AsString := pCodinq;
        q3.ParamByName('Fecha').AsString := FormatDateTime('YYYYMM04', Fecha);
        q3.Open;



//    q.SQL.Text :=
//          '  sELECT sUM(CAST(i.iMPORTE AS DOUBLE PRECISION)) as Deuda'+
//          '    FROM (Select I.Fecha, I.Codinq, I.Coditem, I.Item, I.Periodo, I.Importe, I.Registro, I.Usuario '+
//          '          From ITEMAUTOM I '+
//          '          where I.codinq = :Codinq '+
//          '            AND I.IMPORTE <> '''' '+
//          '            and cast(replace(I.IMPORTE, '','',''.'') as double precision) <> 0) I '+
//          '   INNER JOIN (select CODIGO, INQPROP '+
//          '             from CONCEPTOS '+
//          '             WHERE INQPROP <> 2) C on C.CODIGO = I.CODITEM '+
//          '   inner join(select A.CODINQ, A.FECHAINICIO, A.INQUILINO, A.Propietario '+
//          '             from INMUEBLES A '+
//          '            where A.CODINQ = :CODINQ '+
//               '             order by A.CODINQ) A on A.CODINQ = I.CODINQ '+
//          '   where I.codinq = :Codinq '+
//          '     and cast(substring(I.fecha FROM 5 FOR 2)||''/''||substring(I.fecha FROM 7 FOR 2)||''/''||substring(I.fecha FROM 1 FOR 4) AS TIMESTAMP) >= A.FECHAINICIO '+
//  //        '     and I.CODITEM in (''01'', ''08'', ''20'', ''30'') '+
//          '     AND C.inqprop <> 2 '+
//          '     and I.Fecha <=:Fecha '+
//          '     AND NOT EXISTS(SELECT CU.CODITEM '+
//          '                      FROM CUERPORECIBOS CU '+
//          '      inner join CABEZARECIBOS CA on CA.CODINQ = CU.CODINQ and ca.tipo = cu.tipo and ca.letra = cu.letra and ca.numero = cu.numero '+
//          '                     WHERE CA.CODINQ = i.CODINQ '+
//          '                       and ca.fecha >= A.fechainicio '+
//          '                       and CU.CODINQ = :codinq '+
//          '                       AND CU.CODITEM = I.coditem '+
//          '                       AND CU.TIPO = ''RE'' '+
//          '                       and cu.item = i.item '+
//          '                       and cu.periodo = i.periodo) ';
//    q.ParamByName('Codinq').AsString := pCodinq;
//    q.ParamByName('Fecha').AsString := FormatDateTime('YYYYMM04', Fecha);
//    q.Open;

    Result := 0;
    if not q1.IsEmpty then
      Result := q1.FieldByName('Deuda').AsFloat;
    if not q2.IsEmpty then
      Result := Result + q2.FieldByName('Deuda').AsFloat;
    if not q3.IsEmpty then
      Result := Result + q3.FieldByName('Deuda').AsFloat;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
    FreeAndNil(q2);
    FreeAndNil(q3);
  end;
end;

function TFrmLiquidacionInquilinos.fxExistenItemsEnCero(cdsDatos:TClientDataSet): Boolean;
var
  I:Integer;
begin
  Result := False;
  cdsDatos.First;
  while not cdsDatos.Eof do
  begin
    if (cdsDatos.FieldByName('Coditem').AsString = '46') or
      (cdsDatos.FieldByName('Coditem').AsString = '67') or
      (cdsDatos.FieldByName('Coditem').AsString = '23') or
      (cdsDatos.FieldByName('Coditem').AsString = '28') or
      (cdsDatos.FieldByName('Coditem').AsString = '29') or
      (cdsDatos.FieldByName('Coditem').AsString = '53') or
      (cdsDatos.FieldByName('Coditem').AsString = '58') or
      (cdsDatos.FieldByName('Coditem').AsString = '74') or
      (cdsDatos.FieldByName('Coditem').AsString = '211') or
      (cdsDatos.FieldByName('Coditem').AsString = '212') or
      (cdsDatos.FieldByName('Coditem').AsString = '213') or
      (cdsDatos.FieldByName('Coditem').AsString = '400') or
      (cdsDatos.FieldByName('Coditem').AsString = '401') or
      (cdsDatos.FieldByName('Coditem').AsString = '402') then
    begin
      cdsDatos.Next;
      Continue;
    end;

    if ToFloat(cdsDatos.FieldByName('Importe').AsString) = 0 then
    begin
      Result := True;
      Break;
    end;
    cdsDatos.Next;
  end;
end;

function TFrmLiquidacionInquilinos.fxExistenItemsEnRecibos(
  cdsDatos, cdsAnomalias: TClientDataSet): Boolean;
var
  q: TFXQuery;
  Recibo: string;
begin
  Result := False;
  q := CrearQuery;
  try
    cdsDatos.First;
    while not cdsDatos.Eof do
    begin
      if (ToInt(cdsDatos.FieldByName('Coditem').AsString) in [12, 121, 46, 67, 24, 41, 211,212,213]) then
      begin
        cdsDatos.Next;
        Continue;
      end;

      if (ToInt(cdsDatos.FieldByName('Coditem').AsString) = 300) then
      begin
        cdsDatos.Next;
        Continue;
      end;

      if (NOT cdsDatos.FieldByName('Seleccionado').AsBoolean) then
      begin
        cdsDatos.Next;
        Continue;
      end;

      q.SQL.Text := 'Select C.Tipo, C.Letra, C.Numero, C.Item, C.Periodo ' +
                    '  From CuerpoRecibos C '+
                    ' Inner Join CabezaRecibos CA on CA.Codinq = C.Codinq and Ca.Tipo = C.Tipo and Ca.Letra = C.Letra and CA.Numero = C.Numero '+
                    ' Inner Join Inmuebles I on I.Codinq = CA.Codinq '+
                    ' Where C.Codinq = :Codinq '+
                    '   and C.Item = :Item '+
                    '   and C.Periodo = :Periodo '+
                    '   and CA.Tipo = ''RE'' '+
                    '   and I.Inquilino = C.Inquilino ';
      q.ParamByName('Codinq').AsString := Edit1.text;
      q.ParamByName('Item').AsString := cdsDatos.FieldByName('Item').AsString;
      q.ParamByName('Periodo').AsString := cdsDatos.FieldByName('Descripcion').AsString;
      q.Open;

      while not q.eof do
      begin
        Recibo := ' HAY ITEMS PRESENTES YA COBRADOS EN EL RECIBO '+
                  q.FieldByName('Tipo').AsString + ' ' +
                  q.FieldByName('Letra').AsString + ' ' +
                  FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat) + ' ' +
                  q.FieldByName('Item').AsString + ' ' + q.FieldByName('Periodo').AsString;
        cdsAnomalias.Append;
        cdsAnomalias.FieldByName('Descripcion').AsString := Recibo;
        cdsAnomalias.Post;
        Result := True;
        q.Next;
      end;
      cdsDatos.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TFrmLiquidacionInquilinos.fxExistenPlanDeObrasEnRecibos(
  cdsDatos: TClientDataSet; var Recibo: String): Boolean;
var
  q: TFXQuery;
begin
  Result := False;
  q := CrearQuery;
  try
    cdsDatos.First;
    while not cdsDatos.Eof do
    begin
      if ToInt(cdsDatos.FieldByName('Coditem').AsString) <> 300 then
      begin
        cdsDatos.Next;
        Continue;
      end;

      q.SQL.Text := 'Select C.Tipo, C.Letra, C.Numero, C.Item, C.Periodo ' +
                    '  From CuerpoRecibos C '+
                    ' Inner Join CabezaRecibos CA on CA.Codinq = C.Codinq and Ca.Tipo = C.Tipo and Ca.Letra = C.Letra and CA.Numero = C.Numero '+
                    ' Inner Join Inmuebles I on I.Codinq = CA.Codinq '+
                    ' Where C.Codinq = :Codinq '+
                    '   and C.Item = :Item '+
                    '   and C.Periodo = :Periodo '+
                    '   and CA.Tipo = ''RE'' '+
                    '   and I.Inquilino <> C.Inquilino ';
      q.ParamByName('Codinq').AsString := Edit1.text;
      q.ParamByName('Item').AsString := cdsDatos.FieldByName('Item').AsString;
      q.ParamByName('Periodo').AsString := cdsDatos.FieldByName('Descripcion').AsString;
      q.Open;

      if not q.IsEmpty then
      begin
        Recibo := ' HAY PLANES DE OBRAS YA COBRADOS EN EL RECIBO '+
                  q.FieldByName('Tipo').AsString + ' ' +
                  q.FieldByName('Letra').AsString + ' ' +
                  FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
        Result := True;
        Break;
      end;
      cdsDatos.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TFrmLiquidacionInquilinos.fxExistenItemsConDecimales(cdsDatos:TClientDataSet): Boolean;
var
  I:Integer;
  Importe: String;
begin
  Result := False;
  cdsDatos.First;
  while not cdsDatos.Eof do
  begin
    Importe := FormatFloat('0.00', ToFloat(cdsDatos.FieldByName('Importe').AsString));

    if (Copy(Importe, Pos('.', Importe) + 2,1) <> '0') and (Copy(Importe, Pos('.', Importe) + 2,1) <> '') then
    begin
      Result := True;
      Break;
    end;
    cdsDatos.Next;
  end;
end;

function TFrmLiquidacionInquilinos.fxExistenMasDeDosExpensas(Expensas: String): Boolean;
begin
  Result := Length(AnsiReplaceStr(Trim(Expensas), ' ', '')) > 18;
end;

procedure TFrmLiquidacionInquilinos.prPrepararDataset;
begin
  cdsAnomalias := TClientDataset.Create(nil);
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Seleccionado', ftBoolean);
  cdsDatos.FieldDefs.Add('Item', ftString, 100);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.FieldDefs.Add('Importe', ftString, 15);
  cdsDatos.FieldDefs.Add('Coditem', ftString, 4);
  cdsDatos.CreateDataset;

  cdsAnomalias.FieldDefs.Clear;
  cdsAnomalias.FieldDefs.Add('Descripcion', ftString, 200);
  cdsAnomalias.CreateDataset;

  Columna_Seleccion.DataBinding.FieldName := 'Seleccionado';
  Columna_Item.DataBinding.FieldName := 'Item';
  Columna_Descripcion.DataBinding.FieldName := 'Descripcion';
  Columna_Importe.DataBinding.FieldName := 'Importe';
  Columna_Coditem.DataBinding.FieldName := 'Coditem';

  dsDatos.DataSet := cdsDatos;
  gDetalle.DataController.DataSource := dsDatos;
end;

procedure TFrmLiquidacionInquilinos.gNovedadesButtonClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if FCargaNovedades = nil then
    Application.CreateForm(TFCargaNovedades, FCargaNovedades)
  else
    FCargaNovedades.Show;

  FCargaNovedades.Cargar(gNovedades.Cells[2, ARow],toModificar);

  FCargaNovedades.FCodigoInquilino := Edit1.Text;
  FCargaNovedades.FDesde := StrToDate(Edit6.Text);
  FCargaNovedades.FHasta := StrToDate(Edit8.Text);
end;

procedure TFrmLiquidacionInquilinos.memNovedadesDblClick(Sender: TObject);
begin
  if FABMMovimientos = nil then
    Application.CreateForm(TFABMMovimientos, FABMMovimientos)
  else
    FABMMovimientos.Show;

    FABMMovimientos.edDesde.Text := Edit1.text;
    FABMMovimientos.edHasta.Text := Edit1.text;
    FABMMovimientos.edtItemDesde.Text := '28';
    FABMMovimientos.edItemHasta.Text := '28';
    FABMMovimientos.ActualizarClick(nil);

end;

function TFrmLiquidacionInquilinos.plTituloGetFieldValue(
  aFieldName: string): Variant;
var
  q: TFXQuery;

begin
  if aFieldName = 'Fecha' then
    Result := gImpresion.Cells[2,1]
  else if aFieldName = 'Numero' then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select Count(*) + 1 as Cantidad from Cabezarecibos where Tipo = ''RE'' ';
      q.Open;

      Result := q.FieldByName('Cantidad').AsInteger;
    finally
      FreeAndNil(q);
    end;
  end
  else if aFieldName = 'Codinq' then
    Result := gImpresion.Cells[0,1]
  else if aFieldName = 'Total' then
    Result := gImpresion.Cells[8,1]
  else if aFieldName = 'Letras' then
    Result := gImpresion.Cells[9,1]
  else if aFieldName = 'Inquilino' then
    Result := gImpresion.Cells[1,1]
  else if aFieldName = 'Direccion' then
    Result := gImpresion.Cells[3,1]
  else if aFieldName = 'Propietario' then
    Result := gImpresion.Cells[12,1]
  else if aFieldName = 'ExpensasAReclamar' then
    if Trim(memo1.Text) = 'Expensas a reclamar:' then
      Result := ''
    else
      Result := 'Comprobantes de expensas adeudados: ' + Trim(Copy(memo1.Text, Pos('Expensas a reclamar:', memo1.Text) + 21, 500)) + ' (S.E.U.O.)'
  else if aFieldName = 'Vencido' then
    if not EstaVencido then
    begin
      Result := '';
    end
    else
    begin
      Result := 'Se deja aclarado que, se recibe el importe precitado, sin que ello implique reconducción contractual, sino que se recibe en ' + #13#10 +
                ' los terminos de los art. 1222 y 1223 del Código Civil.';
    end
  else if aFieldName = 'DNIPropietario' then
    Result := gImpresion.Cells[11,1];


end;

procedure TFrmLiquidacionInquilinos.prCalcularDeudas;
var
  q: TFXQuery;
  boTieneDeuda: Boolean;
begin
  boTieneDeuda := False;
  q := CrearQuery;
  try
    q.Sql.text :=
     ' Select * from ( '+
     ' Select distinct I.*,IM.PuedeTransferir, IM.Rescinde, CR.importe as Pagado '+
     '   from itemautom I '+
     '   inner join inmuebles IM on IM.codinq = I.codinq '+
     '   Left Join cuerporecibos CR on CR.coditem = i.Coditem '+
     '                             and CR.codinq = I.Codinq '+
     '                             and cr.item = I.Item '+
     '                             and cr.periodo = I.periodo '+
     '                             AND CR.TIPO = ''RE'' '+
     ' where I.coditem in (''01'',''20'',''08'',''30'') '+
     '   and I.fecha <= :Fecha '+
     '   and cast(substring(I.fecha from 5 for 2)||''/''||substring(I.fecha from 7 for 2)||''/''||substring(I.fecha from 1 for 4) as timestamp) >= IM.fechaInicio '+
     '   and I.Codinq = :Codinq '+
     ' ) '+
     ' where pagado is null ';
    q.ParambyName('Codinq').AsString := Edit1.text;
    q.ParambyName('Fecha').AsString := FormatDatetime('yyyymmdd', Strtodate(Edit6.text));
    q.Open;

    memNovedades.Lines.Clear;
    if q.FieldbyName('Rescinde').AsInteger = 1 then
    Begin
      MostrarDialogoAceptar('El Inquilino Rescinde contrato proximamente. Verifique por favor');
      memNovedades.Lines.Add('El Inquilino Rescinde contrato proximamente.');
    End;
    if q.Fieldbyname('PuedeTransferir').AsInteger = 0 then
      memNovedades.Lines.Add('El Inquilino NO PUEDE TRANSFERIR');

    while not q.eof do
    begin
      memNovedades.Lines.add('DEBE ' + q.FieldbyName('Item').AsString  + ' ' + q.FieldbyName('Periodo').AsString);
      boTieneDeuda := True;
      q.Next;
    end;
    if boTieneDeuda then
      if not MostrarDialogoSiNo('El Inquilino posee deuda de Alquiler/Saldo Alquiler ¿Desea cobrarle de todos modos?', mbNO) then
        btnGrabar.Enabled := False;

  finally
    q.Free;
  end;
end;

procedure TFrmLiquidacionInquilinos.prCargarNovedades(pFechaDesde, pFechaHasta: TDateTime; pCodinq: string);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.Sql.Text := 'Select * from Novedades where Codinq = :Codinq and FechaRelacion >= :FechaDesde and FechaRelacion <= :FechaHasta order by Fecha desc , IDNovedad ';
    q.ParamByName('Codinq').AsString := pCodinq;
    q.ParambyName('FechaDesde').AsDateTime := pFechaDesde;
    q.ParambyName('FechaHasta').AsDateTime := pFechaHasta;
    q.Open;

    gNovedades.Clear;
    I := 1;
    gNovedades.ColWidths[2] := -1;
    boFaltaRespuesta := False;
    while not q.Eof do
    begin
      gNovedades.Cells[0, I] := 'Titulo: ';
      gNovedades.CellProperties[0,I].FontStyle := [fsBold];
      gNovedades.CellProperties[1,I].FontStyle := [fsBold];
      gNovedades.CellProperties[1,I].FontColor := clNavy;
      if (q.FieldbyName('Respuesta').AsString = '') or (q.FieldbyName('Respuesta').isNull) then
      begin
        gNovedades.AddButton(1,I,89,20,'Responder',TCellHAlign(haRight),TCellVAlign(vaTop));
        boFaltaRespuesta := True;
      end;
      gNovedades.Cells[2,I] := q.FieldbyName('IDNovedad').AsString;
      gNovedades.Cells[1, I] := q.FieldbyName('IDNovedad').AsString + ' - '+ q.FieldByName('Fecha').AsString +' - ' + q.FieldByName('Titulo').AsString;
      gNovedades.RowCount := I+1;
      gNovedades.AutoSizeRow(I);
      Inc(I);
      gNovedades.Cells[0, I] := 'Mensaje';
      gNovedades.CellProperties[0,I].FontStyle := [fsBold];
      gNovedades.Cells[1, I] := q.FieldbyName('Mensaje').AsString;
      gNovedades.Cells[2,I] := q.FieldbyName('IDNovedad').AsString;
      gNovedades.RowCount := I+1;
      gNovedades.AutoSizeRow(I);
      Inc(I);
      gNovedades.Cells[0, I] := 'U. Carga';
      gNovedades.CellProperties[0,I].FontStyle := [fsBold];
      gNovedades.Cells[1, I] := q.FieldbyName('UsuarioCarga').AsString;
      gNovedades.RowCount := I+1;
      gNovedades.AutoSizeRow(I);
      Inc(I);
      gNovedades.Cells[0, I] := 'Respuesta';
      gNovedades.CellProperties[0,I].FontStyle := [fsBold];
      gNovedades.Cells[1, I] := q.FieldbyName('Respuesta').AsString;
      gNovedades.RowCount := I+1;
      gNovedades.AutoSizeRow(I);
      Inc(I);
      gNovedades.Cells[0, I] := 'U. Respuesta';
      gNovedades.CellProperties[0,I].FontStyle := [fsBold];
      gNovedades.Cells[1, I] := q.FieldbyName('UsuarioRespuesta').AsString;
      gNovedades.RowCount := I+1;
      gNovedades.AutoSizeRow(I);
      Inc(I);
      q.Next;
    end;
    gNovedades.RowCount := I+1;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionInquilinos.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLiquidacionInquilinos.btnGrabarClick(Sender: TObject);
var
  qImpuestos: tFXQuery;
  I,J: Integer;
  stUbicacion: string;
  stInquilino: string;
  Letras: string;
  Resultado: Boolean;
  Estado: Boolean;
  Suma: DOuble;
  Importe: string;
  Recibo: String;
begin
  cdsAnomalias.EmptyDataSet;

  if boFaltaRespuesta then
  begin
    MostrarDialogoAceptar('No es posible cobrar a este inquilino, debido a que los mensajes a este, no tienen respuesta. Verifique por favor');
    Exit;
  end;

  Resultado := False;
  if fxExistenItemsEnCero(cdsDatos) then
  begin
    cdsAnomalias.Append;
    cdsAnomalias.FieldByName('Descripcion').AsString := 'ITEMS CON IMPORTE 0.00';
    cdsAnomalias.Post;
  end;
  if fxExistenMasDeDosExpensas(Expensas) then
  begin
    cdsAnomalias.Append;
    cdsAnomalias.FieldByName('Descripcion').AsString := 'El INQUILINO DEBE MAS DE 2 EXPENSAS. ESTO ES PRIORITARIO!!!';
    cdsAnomalias.Post;
  end;
//  if fxExistenItemsConDecimales(cdsDatos) then
//  begin
//    cdsAnomalias.Append;
//    cdsAnomalias.FieldByName('Descripcion').AsString := 'HAY ITEMS CON DECIMALES.';
//    cdsAnomalias.Post;
//  end;
  fxExistenItemsEnRecibos(cdsDatos, cdsAnomalias);
  if fxExistenPlanDeObrasEnRecibos(cdsDatos, Recibo) then
  begin
    cdsAnomalias.Append;
    cdsAnomalias.FieldByName('Descripcion').AsString := Recibo;
    cdsAnomalias.Post;
  end;

  if not cdsAnomalias.IsEmpty then
  if MostrarDialogoSiNo('ANOMALIA!!! '+ #13#10#13#10 + 'Si desea continuar deberá introducir su clave de autorización.'+#13#10+'¿Desea continuar?', mterror, mbNo)then
  begin
    if TFClaveCaja.Ejecutar(cdsAnomalias, Resultado) then
    begin
      if not Resultado then
        Exit;
    end
    else
      Exit;
  end
  else
    Exit;

  gImpresion.Vaciar;
  qImpuestos:= CrearQuery;
  try
    LiqinOrig.Close;
    LiqinOrig.Open;

    qImpuestos.SQL.Text := 'Select MailInquilino, PlantillaInquilino, EntregarImpuestos from Inmuebles where codinq =:codinq';
    qImpuestos.Parambyname('Codinq').AsString := LiqinOrig.FieldByName('Codinq').AsString;
    qImpuestos.Open;

    I := 1;

    Suma := 0;
    cdsDatos.First;
    while not cdsDatos.Eof do
    begin
      if cdsDatos.FieldbyName('Seleccionado').AsBoolean then
        Suma := Suma + cdsDatos.FieldbyName('Importe').AsFloat;

      cdsDatos.Next;
    end;
    Importe := FormatFloat('0.00', Suma);


    Letras := ImporteEnLetras(Importe);

    cdsDatos.First;
    LiqinOrig.First;
    gImpresion.Vaciar;
    while not LiqinOrig.eof do
    begin
      cdsDatos.First;

      while not cdsDatos.eof do
      begin
        if (LiqinOrig.FieldByName('Item').AsString = cdsDatos.FieldByName('Item').AsString) and
           (LiqinOrig.FieldByName('Periodo').AsString = cdsDatos.FieldByName('Descripcion').AsString) and
           (ToFloat(LiqinOrig.FieldByName('Importe').AsString) = ToFloat(cdsDatos.FieldByName('Importe').AsString)) and
           (LiqinOrig.FieldByName('coditem').AsString = cdsDatos.FieldByName('Coditem').AsString) and
           (cdsDatos.FieldByName('Seleccionado').AsBoolean) then
        begin
          gImpresion.Cells[0,I] := LiqinOrig.FieldByName('Codinq').AsString;
          gImpresion.Cells[1,I] := LiqinOrig.FieldByName('Inquilino').AsString;
          gImpresion.Cells[2,I] := LiqinOrig.FieldByName('Fecha').AsString;
          gImpresion.Cells[3,I] := LiqinOrig.FieldByName('Direccion').AsString;
          gImpresion.Cells[4,I] := LiqinOrig.FieldByName('Iva').AsString;
          gImpresion.Cells[5,I] := LiqinOrig.FieldByName('Item').AsString;
          gImpresion.Cells[6,I] := LiqinOrig.FieldByName('Periodo').AsString;
          gImpresion.Cells[7,I] := LiqinOrig.FieldByName('Importe').AsString;
          gImpresion.Cells[8,I] := FormatFloat('0.00', Suma) + '.-)';
          gImpresion.Cells[9,I] := Letras;
          gImpresion.Cells[10,I] := LiqinOrig.FieldByName('Coditem').AsString;
          gImpresion.Cells[11,I] := LiqinOrig.FieldByName('DniPropietario').AsString;
          gImpresion.Cells[12,I] := LiqinOrig.FieldByName('Propietario').AsString;
          gImpresion.Cells[13,I] := LiqinOrig.FieldByName('IDMovimiento').AsString;
          Inc(i);
        end;
        cdsDatos.Next;
      end;
      LiqinOrig.Next;
    end;

    gImpresion.SortColumn(9,True, 'N');
    if i>2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;

    objMail := TMail.Create;
    objMail.idPlantilla := qImpuestos.FieldByName('PlantillaInquilino').AsInteger;
    objMail.DireccionMail := qImpuestos.FieldByName('MailInquilino').AsString;
    objMail.Titulo := 'Recibo para Inquilinos ';
    objMail.Asunto := 'Recibo para Inquilinos ';
    objMail.Mes := DevuelveMes(MonthOf(StrToDate(Edit8.Text)));
    objMail.Anio := YearOf(StrToDate(Edit8.Text));

    cdsDatos.First;
    gDetalleSeleccion.Vaciar;
    I := 1;
    while not cdsDatos.Eof do
    begin
      if cdsDatos.FieldByName('Seleccionado').AsBoolean then
      begin
        gDetalleSeleccion.Cells[0,I] := cdsDatos.FieldByName('Item').AsString;
        gDetalleSeleccion.Cells[1,I] := cdsDatos.FieldByName('Descripcion').AsString;
        gDetalleSeleccion.Cells[2,I] := cdsDatos.FieldByName('Importe').AsString;
        gDetalleSeleccion.Cells[3,I] := cdsDatos.FieldByName('Coditem').AsString;
        Inc(I);
      end;
      cdsDatos.Next;
    end;

    if I > 2  then
      gDetalleSeleccion.RowCount := I + 1
    else
      gDetalleSeleccion.RowCount := 2;

    ImprimirReporte ( ReporteFijo, objMail,  plReporte,  gDetalleSeleccion ) ;
    ImprimirReporte ( ReporteFijoDuplicado, objMail, plReporte,  gDetalleSeleccion ) ;

//    actListadoRecibos.Execute;
    stUbicacion := Edit5.Text;
    Edit5.Properties.OnChange := nil;
    stInquilino := Edit2.Text;

    actPoneMesPagado.Execute;

    if qImpuestos.Fieldbyname('EntregarImpuestos').AsInteger = 1 then
      actImpuestosAlPropietario.Execute;

    if fConfirmacionRecibos = nil then
      Application.CreateForm(TFConfirmacionRecibos, FConfirmacionRecibos)
    else
      FConfirmacionRecibos.Show;

    fConfirmacionRecibos.EsLiquidacion := False;
    fConfirmacionRecibos.FormStyle := fsNormal;
    fConfirmacionRecibos.VIsible := False;
    fConfirmacionRecibos.FCodinq := Edit1.text;
    fConfirmacionRecibos.FGrilla := gIMpresion;
    fConfirmacionRecibos.ClaveAnomalia := Resultado;
    fConfirmacionRecibos.cdsAnomalias := cdsAnomalias;

    Edit2.Text := stInquilino;
    Edit5.Text := stUbicacion;
    fConfirmacionRecibos.ShowModal;

    Edit5.Properties.OnChange := Edit5PropertiesChange;
  finally
    FreeAndNil(qImpuestos);
  end;
end;

procedure TFrmLiquidacionInquilinos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLiquidacionInquilinos.Columna_ImporteGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := FormatFloat('$ #,##0.00', ToFloat(AText));
end;

procedure TFrmLiquidacionInquilinos.aclCalculoItemsExecute(
  Sender: TObject);
var
  DiaPago: string;
  Dia:     string;
  Fecha:   string;

 z,i,j,L,di,fe:integer;
 alq,a,c,co,dias,inq,pro,fli,fde,fha:string;
 num1,letras,suma,tots,tot,fech,mes,ano:string;
 alqu,total:real;
 hacha:string;
 centavos:string;
 cob:extended;
 IMP:STRING;
 MasItems: TClientDataSet;
 dspMasItems: TDataSetProvider;
 MasItemsa: TClientDataSet;
 dspMasItemsa: TDataSetProvider;
 ibqConsulta: tFXQuery;
 q: tFXQuery;
 qryConsulta: tFXQuery;
 ibqConsulta2: tFXQuery;
 Importe: string;
 Valor: Double;
 QpUNITORIOS: tFXQuery;
 Resto: Double;
 qRegistro: tFXQuery;
 idMovimiento: Integer;
 ndTotal: Double;
 qGastoBancario: TFxQuery;
 cents: Double;
begin
  MasItems := TClientDataSet.Create(nil);
  dspMasItems := TDatasetProvider.Create(nil);
  MasItemsa := TClientDataSet.Create(nil);
  dspMasItemsa := TDatasetProvider.Create(nil);
  ibqConsulta := CrearQuery;
  qPunitorios := CrearQuery;
  ibqConsulta2 := CrearQuery;
  q := CrearQuery;
  qryConsulta := CrearQuery;
  Total := 0;
  try
    inq:=Edit1.Text;
    pro:=Edit4.Text;
    fde:=Edit6.Text;
    fha:=Edit8.Text;
    fde:=FechaAlReves(fde);
    fha:=FechaAlReves(fha);


    try
      with ibqConsulta do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select i.*, M.DNIPROPIETARIO, M.REFERENTE from itemautom I INNER JOIN INMUEBLES M ON I.CODINQ=M.CODINQ where I.codinq=:codinq and I.tipoingreso <> 2');
        Sql.Add('and fecha>=:fechad and fecha <=:fechah order by coditem,registro asc');
        Parambyname('codinq').AsString:=Inq;
        Parambyname('fechad').AsString:=Fde;
        Parambyname('fechah').AsString:=Fha;
        Open;
      end;

      with qPunitorios do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select i.* from itemautom I INNER JOIN INMUEBLES M ON I.CODINQ=M.CODINQ where I.codinq=:codinq and I.tipoingreso <> 2');
        Sql.Add('and fecha>=:fechad and fecha <=:fechah and coditem IN (:Coditem1,:Coditem20,:Coditem30, :Coditem8) order by coditem, fecha, registro asc');
        Parambyname('codinq').AsString:=Inq;
        Parambyname('coditem1').AsString:='01';
        Parambyname('coditem20').AsString:='20';
        Parambyname('coditem30').AsString:='30';
        Parambyname('coditem8').AsString:='08';
        Parambyname('fechad').AsString:=Fde;
        Parambyname('fechah').AsString:=Fha;
        Open;
      end;

      dspMasItems.DataSet := ibqConsulta;
      MasItems.Data := dspMasItems.Data;
    Except
      Exit;
    end;

    c:=Edit1.Text;
    with ibqConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.add('select * from inmuebles where codinq=:codinq');
      Parambyname('codinq').AsString:=Inq;
      Open;
      DiaPago := Fields[10].AsString;
    end;
    Delete (DiaPago,1,6);
    case StrToInt(DiaPago) of
      10: dia := '10';
      15: dia := '15';
      20: dia := '20';
      25: dia := '25';
      30: dia := '30';
    end;
    dias := dia;

     //UN INTENTO

    while NOT QPUNITORIOS.Eof do
    BEGIN
      Fecha :=FechaConBarras(qPunitorios.FieldbyName('Fecha').AsString);
      Delete(Fecha,1,2);
      Dia   := Dias + Fecha;
      Dia   := FechaAlReves(Dia);        //DIA DE PAGO ELEGIDO
      Fecha := Edit7.Text;
      Fecha := FechaAlReves(Fecha);   //FECHA DE LA LIQUIDACION
      if StrToInt(Fecha) > StrToInt(Dia) then
      begin
        hacha := FechaConBarras(qPunitorios.FieldbyName('Fecha').AsString);
        Delete(hacha,1,2);
        hacha := '01' + hacha;
        fecha := Edit7.Text;
        cob   := strtodate(fecha) - strtodate(hacha)+1;
        if (qPunitorios.IsEmpty) or (qPunitorios.fieldbyName('Importe').isNull) then
          total := tOTAL + cob * ibqConsulta.fieldbyName('Alquiler').AsFloat * 0.005
        else
          total := tOTAL + cob * qPunitorios.fieldbyName('Importe').AsFloat * 0.005;
      end;
      Resto := Total - Trunc(Total);
      if Resto <> 0 then
        Resto := (Resto - 1) * -1;
      Total := Total + Resto;
      tots := FormatFloat('0.00',total);
      QpUNITORIOS.NEXT;
    END;

    Punitorios := 0;
    if not FDeEnvioMails then
    begin
      if ToFloat(tots)<> 0 then
      begin
        if messagedlg('El inquilino tiene punitorios, por el valor de $ '+tots+#13+
         '¿Desea cobrarle?',mtwarning,[mbok,mbno],0)= mrOk then
        begin
          Punitorios := ToFloat(Tots);

          tot  := inputbox('Punitorios','Importe a Cobrar $',tots);
          tots := validarnumero(tot);
          fech := datetostr(date());
          fech := FechaAlReves(fech);
          Delete(fech,7,2);
          fech := fech+'05';

          qRegistro := CrearQuery;
          try
            qRegistro.SQL.Text := 'Select Gen_ID(GEN_ITEMAUTOM, 1) as ID from RDB$DATABASE ';
            qRegistro.Open;

            idMovimiento := qRegistro.FieldByName('ID').AsInteger;
          finally
            FreeAndNil(qRegistro);
          end;

          InsertarMasItem(MasItems,
            Edit1.Text,
            Fech,
            'PUNITORIOS',
            'SEGUN ART. 2DO. CONTRATO DE LOCACION',
            TOTS,
            Edit4.Text,
            '24',
            0,
            MasItems.recno,
            ibqConsulta.FIELDBYNAME('DNIPROPIETARIO').ASSTRING,
            ibqConsulta.FIELDBYNAME('referente').ASSTRING,
            idMovimiento
            );
        END;
      end;
    end;

    MasItems.First;

    suma:='0.00';
    while not MasItems.Eof do
    begin
      q.close;
      q.sql.clear;
      q.sql.add('Select c.* from conceptos c where c.codigo = :Coditem ');
      q.parambyname('Coditem').AsString := MasItems.FieldByName('Coditem').AsString;
      q.open;

      if (q.FieldByName('InqProp').AsString <> '2') and (q.FieldByName('Codigo').AsString <> '15') then
      begin
        num1:=MasItems.fields[4].AsString;
        Valor := ToFloat(num1);
        Suma := FormatFloat('0.00', ToFloat(Suma) + Valor);

        letras:=importeenletras(suma);
      end;
      MasItems.next;
    end;
    Edit10.Text := suma;

    Fecha := datetostr(date());
    Fecha := transformarfecha(Fecha);
    Fecha := 'Córdoba, ' + Fecha;
    for I := 1 to (130 - Length(letras)) do
      Letras := letras + '-';

    MasItems.First;
    q.close;
    q.sql.clear;
    q.sql.add('Select * from liqinOrig ');
    q.open;

    dspLiqinOrig.DataSet := q;
    LiqinOrig.Data := dspLiqinOrig.Data;
    LiqinOrig.EmptyDataSet;
//    LiqinOrig.Close;
//    LiqinOrig.FieldDefs.Add('Seleccionado', ftBoolean);
//    LiqinOrig.CreateDataSet;
    while not MasItems.Eof do
    begin
      q.close;
      q.sql.clear;
      q.sql.add('Select c.* from conceptos c where c.codigo = :Coditem ');
      q.parambyname('Coditem').AsString := MasItems.FieldByName('Coditem').AsString;
      q.open;

      if (q.FieldByName('InqProp').AsString <> '2') and (q.FieldByName('Codigo').AsString <> '15') then
      begin
        if MasItems.Fields[4].AsString='0.00' then
          Importe := ''
        else
          Importe := MasItems.Fields[4].AsString;

        InsertarLiqinOrig(LiqinOrig, MasItems.fields[0].AsString,
          Edit2.Text,
          Fecha,
          Edit5.Text,
          Edit9.Text,
          MasItems.fields[2].AsString,
          MasItems.fields[3].AsString,
          Importe,
          suma+'.-)',
          UPPERCASE(letras),
          MasItems.fields[6].AsString,
          MasItems.fieldBYNAME('DNIPROPIETARIO').AsString,
          MasItems.fieldBYNAME('referente').AsString,
          MasItems.fieldBYNAME('Registro').AsInteger);
      end;
      MasItems.next;
    end;
//    qGastoBancario := CrearQuery;
//    try
//      DM.IniciarTransaccion;
//      try
//        qGastoBancario.Sql.Text :=
//          ' Delete from ItemAutom ' +
//          '  Where Codinq = :Codinq '+
//          '    and Coditem = :Coditem '+
//          '    and Fecha = :Fecha ';
//         qGastoBancario.ParamByName('Codinq').AsString := Edit1.text;
//         qGastoBancario.ParamByName('Coditem').AsString := '933';
//         qGastoBancario.ParamByName('Fecha').AsString := FormatDateTime('yyyymm05', Date);
//         qGastoBancario.ExecSQL;
//         DM.ConfirmarTransaccion;
//      Except
//        DM.CancelarTransaccion;
//      end;
//    finally
//      qGastoBancario.Free;
//    end;

    ibqConsulta2.Close;
    ibqConsulta2.sql.Clear;
    ibqConsulta2.sql.add('Select fecha,periodo from itemautom where codinq=:codinq and coditem=15 and fecha>= :fechad and fecha <= :fechah');
    ibqConsulta2.parambyname('codinq').AsString:=inq;
    ibqConsulta2.parambyname('fechad').AsString:=fde;
    ibqConsulta2.parambyname('fechah').AsString:=fha;
    ibqConsulta2.open;

    if not ibqConsulta2.IsEmpty then
    begin
      Dm.IniciarTransaccion;
      q.SQL.Text := ' DELETE from notas';
      q.ExecSql;
      DM.ConfirmarTransaccion;

      while not ibqConsulta2.Eof do
      begin
        fecha:=ibqConsulta2.fields[0].AsString;
        dia:=fecha;
        Delete(fecha,5,4);
        ano:=fecha;
        fecha:=dia;
        Delete(fecha,1,4);
        Delete(fecha,3,2);
        mes:=fecha;
        fecha:=dia;
        Delete(fecha,1,6);
        dia:=fecha;
        fecha:=dia+'/'+mes+'/'+ano;
        Dm.IniciarTransaccion;
        q.SQL.Text := ' Insert into notas values(:Fecha, :nota)';
        q.ParamByName('Fecha').AsString := Fecha;
        q.ParamByName('Nota').AsString := ibqConsulta2.fields[1].AsString;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        ibqConsulta2.next;
      end;

      ibqConsulta2.Close;
      ibqConsulta2.sql.Clear;
      ibqConsulta2.sql.add('Select * from notas ORDER BY codinq');
      ibqConsulta2.open;
      MEMO1.Lines.Clear;
      while not ibqConsulta2.eof do
      begin
        MEMO1.Lines.Add(ibqConsulta2.FIELDS[1].AsString);
        MEMO1.LINES.ADD(' ');
        ibqConsulta2.next;
      end;
    end;

    actExpensas.execute;
    actPlanesDePago.Execute;

    Edit12.Text:=suma;

    qryConsulta.Close;
    qryConsulta.SQL.Clear;
    qryConsulta.sql.add('Select m.* from masitems m,conceptos c where m.coditem=c.codigo and c.inqprop<>:InqProp and m.coditem<>:Coditem and m.importe<>:Importe and m.registro<>:registro and m.usuario = :usuario order by m.registro ');
    qryCOnsulta.parambyname('InqProp').AsString := '2';
    qryCOnsulta.parambyname('Coditem').AsString := '15';
    qryCOnsulta.parambyname('Importe').AsString := '0.00';
    qryCOnsulta.parambyname('Registro').AsString := '-1';
    qryCOnsulta.parambyname('Usuario').AsString := fPrincipal.fUsuario;

    qryConsulta.Open;

    dspMasItemsa.DataSet := qryConsulta;
    MasItemsa.Data := dspMasItemsa.Data;
    MasItemsa.EmptyDataSet;

    MasItems.First;

    while not MasItems.Eof do
    begin
      q.close;
      q.sql.clear;
      q.sql.add('Select c.* from conceptos c where c.codigo = :Coditem ');
      q.parambyname('Coditem').AsString := MasItems.FieldByName('Coditem').AsString;
      q.open;

      if (q.FieldByName('InqProp').AsString <> '2') and (q.FieldByName('Codigo').AsString <> '15') and
        (MasItems.FieldByName('Importe').AsFloat <> 0) and (MasItems.FieldByName('Registro').AsString <> '-1') then
      begin
        MasItemsA.Append;
        for I := 0 to 11 do
          MasItemsA.Fields[I].AsString := MasItems.Fields[I].AsString;
        MasItemsA.Post;
      end;

      if (q.FieldByName('InqProp').AsString <> '2') and (q.FieldByName('Codigo').AsString <> '15') and
        (MasItems.FieldByName('Importe').AsFloat <> 0) and (MasItems.FieldByName('Registro').AsString = '-1') then
      begin
        MasItemsA.Append;
        for I := 0 to MasItems.FieldCount - 1 do
          MasItemsA.Fields[I].AsString := MasItems.Fields[I].AsString;
        MasItemsA.Post;
      end;

      if (q.FieldByName('InqProp').AsString <> '2') and (q.FieldByName('Codigo').AsString <> '15') and
        (MasItems.FieldByName('Importe').AsFloat = 0) then
      begin
        MasItemsA.Append;
        for I := 0 to 11 do
          MasItemsA.Fields[I].AsString := MasItems.Fields[I].AsString;
        MasItemsA.Post;
      end;

      MasItems.next;
    end;

  i := 1;
  MasItemsA.First;
  while not MasItemsA.eof do
  begin
    cdsDatos.Append;
    cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
    cdsDatos.FieldByName('Item').AsString := MasItemsA.FieldByName('Item').AsString;
    cdsDatos.FieldByName('Descripcion').AsString := MasItemsA.FieldByName('Periodo').AsString;
    cdsDatos.FieldByName('Importe').AsString := FormatFloat('0.00', ToFloat(MasItemsA.FieldByName('Importe').AsString));
    ndTotal := ndTotal + ToFloat(MasItemsA.FieldByName('Importe').AsString);
    cdsDatos.FieldByName('CodItem').AsString := MasItemsA.FieldByName('CodItem').AsString;
    cdsDatos.Post;
    MasItemsA.Next;
    Inc(i);
  end;

  Cents := ToFloat(Copy(FormatFloat('0.00', ndTotal), Pos('.', FormatFloat('0.00', ndTotal))+1, 2));

//  qGastoBancario := CrearQuery;
//  try
//    DM.IniciarTransaccion;
//    try
//      qGastoBancario.Sql.Text :=
//        ' Delete from ItemAutom ' +
//        '  Where Codinq = :Codinq '+
//        '    and Coditem = :Coditem '+
//        '    and Fecha = :Fecha ';
//       qGastoBancario.ParamByName('Codinq').AsString := qryConsulta.FieldbyName('Codinq').AsString;
//       qGastoBancario.ParamByName('Coditem').AsString := '933';
//       qGastoBancario.ParamByName('Fecha').AsString := FormatDateTime('yyyymm05', Date);
//       qGastoBancario.ExecSQL;
//       DM.ConfirmarTransaccion;
//    Except
//      DM.CancelarTransaccion;
//    end;
//  finally
//    qGastoBancario.Free;
//  end;

//  if Cents <> 0 then
//  begin
//    cdsDatos.Append;
//    cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
//  //  cdsDatos.FieldByName('Codinq').AsString := qryConsulta.FieldByName('Codinq').AsString;
//    cdsDatos.FieldByName('Item').AsString := 'AJUSTE';
//    cdsDatos.FieldByName('Descripcion').AsString := 'POR REDONDEO';
//    cdsDatos.FieldByName('Importe').AsString := FormatFloat('0.00', Cents*-1/100);
//    cdsDatos.FieldByName('CodItem').AsString := '933';
//    cdsDatos.Post;
//    ndTotal := ndTotal + (Abs(Cents)*-1/100);
//
//    DM.IniciarTransaccion;
//    try
//      Letras := FormatFloat('0.00', ndTotal);
//      Letras := ImporteEnLetras(Letras);
//
//      InsertarItemAutom(
//        Edit1.text,
//        FormatDateTime('yyyymm05', Date),
//        'AJUSTE',
//        'POR REDONDEO',
//        FormatFloat('0.00', Abs(Cents/100)*-1),
//        Trim(pro),
//        '933',
//        3,
//        True);
//
//  //    InsertarLiqPrOrigBase(cdsDatos.FieldbyName('Codinq').AsString,
//  //      Edit4.Text,
//  //      Fecha,
//  //      noms,
//  //      '927',
//  //      'AJUSTE ',
//  //      'POR REDONDEO',
//  //      FormatFloat('0.00', Cents/100),
//  //      '$' + FormatFloat('0.00', ndTotal),
//  //      Uppercase(Letras),
//  //      999,
//  //      999,
//  //      999);
//
//       DM.ConfirmarTransaccion;
//    Except
//      DM.CancelarTransaccion;
//    end;
//  end;

  cdsDatos.First;

  edtTotal.Text := FormatFloat('0.00', ndTotal);
 finally
   FreeAndNil(MasItems);
   FreeAndNil(dspMasItems);
   FreeAndNil(MasItemsa);
   FreeAndNil(dspMasItemsa);
   FreeAndNil(ibqConsulta);
   FreeAndNil(qPunitorios);
   FreeAndNil(ibqConsulta2);
 end;
end;

procedure TFrmLiquidacionInquilinos.actExpensasExecute(Sender: TObject);
var
  I      :    Integer;
  Dato   :    string;
  MesDato:    string;
  AnoDato:    string;
  Mayor  :    Integer;
  periodo:    string;
  Fecha  :    string;
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
  Bandera:    Boolean;
  Posicion:   Integer;
  ibqConsulta2: tFXQuery;
  CantBorrar: Integer;
  Mes: String;
begin
  CantBorrar := 0;
  CantMeses := 0;
//  memo1.Text := '';
  Expensas := '';
  ibqConsulta2 := CrearQuery;
  try
    with ibqConsulta2 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('Select A.EXPENSAS14, A.EXPENSAS9, A.EXPENSAS27 FROM Automatizacion A WHERE A.Codinq=:CODINQ');
      ParamByName('CODINQ').AsString  := Edit1.Text;
      Open;

      if TOFLOAT(ibqConsulta2.FieldByName('expensas14').asstring) > 0 then
        Exit;
      if TOFLOAT(ibqConsulta2.FieldByName('expensas9').asstring) > 0 then
        Exit;
      if TOFLOAT(ibqConsulta2.FieldByName('expensas27').asstring) > 0 then
        Exit;
    end;

    Mayor := 0;

    with ibqConsulta2 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' Select Distinct I.*, A.* from ItemAutom I ');
      Sql.add(' Inner Join Automatizacion A on I.Codinq = A.Codinq ');
      Sql.add(' Where I.Codinq= :Codinq and I.Coditem= :Coditem and Periodo like :Periodo and ((EstadoExpensas <> :Estado) and (EstadoExpensas <> '''')) ORDER BY CLAVE ');
      ParamByName('coditem').AsString := '28';
      ParamByName('periodo').AsString := 'EXPS. COMUNES%';
      ParamByName('CODINQ').AsString  := Edit1.Text;
      ParamByName('Estado').AsString  := 'NO TIENE';
      Open;
    end;

    if not ibqConsulta2.isEmpty then
    begin
      Bandera := False;
      while not ibqConsulta2.eof do
      begin
        Dato := ibqConsulta2.fields[3].AsString;
        if Pos('AORDINARIAS', Dato) = 0 then
        begin
          if pos('COMUNES', Dato)> 0 then
            CantBorrar := 14;

          if pos('COMUNES PER.', Dato)> 0 then
            CantBorrar := 19;

          Bandera := False;
          Delete(Dato,1,CantBorrar);
          MesDato := Dato;
          Delete(MesDato,4,50);
          AnoDato := Dato;
          Posicion := Pos('20', AnoDato);
          Delete(AnoDato,1,Posicion -1);
          MesDato := MesExpensas(MesDato);
          Dato := AnoDato + MesDato;
          if Mayor < StrToInt(Dato) then
            Mayor := StrToInt(Dato);
        end
        else
          Bandera := True;
        ESTADO     := ibqConsulta2.FieldbyName('EstadoExpensas').AsString;

        ibqConsulta2.Next;
      end;

      if not Bandera then
      begin
        Dato           := IntToStr(Mayor);
        Delete(Dato,1,4);
        AnoDato        := IntToStr(Mayor);
        Delete(AnoDato,5,2);
        if Dato = '' then
          Exit;
        Dato           := DaMes(Dato);
        Dato           := Dato + '/' + AnoDato;

 //       ESTADO     := ibqConsulta2.Fields[23].AsString;
        Periodo    := Dato;//CALCULO Periodo mmm/aaaa
        Delete(Dato,4,5);
        mesPeriodo := MesExpensas(Dato); //CALCULO EL MES Periodo (99);
        Delete(Periodo,1,4);
        anoPeriodo := Periodo; //CALCULO DEL AÑO DEL Periodo (9999);
        Fecha      := DateToStr(Date());
        Delete(Fecha,1,6);
        anohoy     := Fecha;
        Fecha      := DateToStr(date());
        Delete(Fecha,1,3);
        Delete(Fecha,3,5);
        meshoy     := Fecha; //CALCULO MES Y AÑO DE LA Fecha DE HOY
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
          Expensas := Expensas + mesPeriodo+'/'+anoPeriodo+ '   ';
        end;
      end;
    end;

    with ibqConsulta2 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' Select Distinct I.*, A.* from ItemAutom I ');
      Sql.add(' Inner Join Automatizacion A on I.Codinq = A.Codinq ');
      Sql.add(' Where I.Codinq= :Codinq and ((EstadoExpensas <> :Estado) and (EstadoExpensas <> '''')) AND NOT EXISTS(SELECT ii.CODITEM FROM ITEMAUTOM ii WHERE ii.cODINQ = i.cODINQ and II.CODITEM = :CODITEM) ORDER BY CLAVE ');
      ParamByName('coditem').AsString := '28';
      ParamByName('CODINQ').AsString  := Edit1.Text;
      ParamByName('Estado').AsString  := 'NO TIENE';
      Open;

      if not ibqConsulta2.IsEmpty then
      begin
        Mes := FormatDatetime('MM', Date -30);
        Expensas := Dames(Mes) + '/' + FormatDatetime('YYYY', Date -30);
      end;
    end;
  finally
    memo1.Lines.Add('Expensas a reclamar: ' + Expensas);

    MEMO1.SelsTART := 0;
    MEMO1.SelLength := 0;

    FreeAndNil(ibqConsulta2);
  end;
end;

procedure TFrmLiquidacionInquilinos.actFechaMesSiguienteExecute(
  Sender: TObject);
var
  ADate: TDateTime;
  days: array[1..7] of string;
  D,a,f,m,ano,FECHA,C:string;
  anoi,mi:integer;
  query10: tFXQuery;
  query12: tFXQuery;

begin
  query10 := CrearQuery;
  query12 := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      FECHA:=Edit8.Text;
      FECHA:=FechaAlReves(FECHA);
      Delete(FECHA,7,2);
      FECHA:=FECHA+'05';
      a:=Edit1.Text;
      query10.close;
      query10.sql.Text := 'select * from itemautom where codinq=:codinq and fecha=:fec and periodo like :dia';
      query10.parambyname('codinq').AsString:=a;
      query10.parambyname('fec').AsString:=fecha;
      query10.parambyname('dia').AsString:='DIA DE PAGO MES%';
      query10.open;

      IF Query10.IsEmpty THEN
      BEGIN
        days[1] := 'Domingo';
        days[2] := 'Lunes';
        days[3] := 'Martes';
        days[4] := 'Miercoles';
        days[5] := 'Jueves';
        days[6] := 'Viernes';
        days[7] := 'Sabado';

        query10.close;
        query10.sql.Text := 'select * from inmuebles where codinq=:codinq';
        query10.parambyname('codinq').AsString:=a;
        query10.open;

        f:=query10.Fields[10].AsString;
        Delete(f,1,6);
        m:=datetostr(date());
        Delete(m,1,3);
        Delete(m,3,5);
        ano:=datetostr(date());
        Delete(ano,1,6);
        mi:=StrToInt(m);
        anoi:=StrToInt(ano);

        if mi=12 then
        begin
         mi:=1;
         anoi:=anoi+1;
        end
        else
         mi:=mi+1;
        ano:=IntToStr(anoi);
        m:=IntToStr(mi);
        if Length(m)=1 then m:='0'+m;
        f:=f+'/'+m+'/'+ano;
        ADate :=strtodate(f);
        C:=FECHA+Edit1.Text+'46';

        query12.close;
        query12.sql.Text := 'select * from itemautom where clave=:clave';
        query12.parambyname('clave').AsString:=c;
        query12.open;

        if query12.IsEmpty then
        begin
        D:=days[DayOfWeek(ADate)];
        if (days[DayOfWeek(ADate)]='Sabado')or (days[DayOfWeek(ADate)]='Domingo') then
        begin
           InsertarITemAutom(Edit1.Text,
             Fecha,
             'SE DEJA CONSTANCIA',
             'MES PROXIMO FECHA DE PAGO ELEGIDA TIENE VTO. ',
             '0.00',
             Edit4.Text,
             '46',
             3);
           C:=FECHA+Edit1.Text+'67';

           InsertarITemAutom(Edit1.Text,
             Fecha,
             '',
             'DIA NO HABIL. ANITICIPESE EVITE PUNITORIOS',
             '0.00',
             Edit4.Text,
             '67',
             3);
         END;
      END;
     end;
     DM.ConfirmarTransaccion;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(Query10);
    FreeAndNil(Query12);
  end;
end;


procedure TFrmLiquidacionInquilinos.actPlanesdePagoExecute(
  Sender: TObject);
var
  a:string;
  aguad,aguah,dgrd,dgrh,munid,munih,ban:integer;
  q: tFXQuery;
  qUpdate: tFXQuery;

begin
  a:=Edit1.Text;
  q := CrearQuery;
  qUpdate := CrearQuery;
  DM.IniciarTransaccion;
  try
  try
    q.SQL.Text := 'Select * from automatizacion where codinq = :Codinq';
    q.ParamByName('Codinq').AsString := a;
    q.Open;
    Ban := 0;
    dgrd:=StrToInt(q.Fields[21].AsString);
    dgrH:=StrToInt(q.Fields[22].AsString);
    munid:=StrToInt(q.Fields[24].AsString);
    muniH:=StrToInt(q.Fields[25].AsString);
    aguad:=StrToInt(q.Fields[44].AsString);
    aguah:=StrToInt(q.Fields[45].AsString);

    if (dgrd>0) and (dgrh>0) then
      ban:=1;
    if (munid>0) and (munih>0) then
      ban:=1;
    if (aguad>0) and (aguah>0) then
      ban:=1;
    if ban=1 then
    begin
      if messagedlg('El inquilino posee planes de pago vigentes... ¿Desea Automatizarlos?',mtconfirmation,[mbok,mbno],0)=mrok then
      begin
        if (dgrd<>0) and (dgrh<>0) then
        begin
         if dgrd<=dgrh then
           dgrd:=dgrd+1
         else
         begin
           dgrd:=0;
           dgrh:=0;
           qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPDGRI=:ppdgri where codinq =:Codinq';
           qUpdate.ParamByName('ppdgri').AsString := '0.00';
           qUpdate.ParamByName('Codinq').AsString := a;
           qUpdate.ExecSQL;
         end;
       end;
       if dgrd>dgrh then
       begin
         dgrd:=0;
         dgrh:=0;
         qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPDGRI=:ppdgri where codinq =:Codinq';
         qUpdate.ParamByName('ppdgri').AsString := '0.00';
         qUpdate.ParamByName('Codinq').AsString := a;
         qUpdate.ExecSQL;
       end;
       qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPDGRD=:ppdgrd, ppdgrih=:ppdgrh where codinq =:Codinq';
       qUpdate.ParamByName('ppdgrd').AsString := IntToStr(dgrd);;
       qUpdate.ParamByName('ppdgrh').AsString := IntToStr(dgrh);
       qUpdate.ParamByName('Codinq').AsString := a;
       qUpdate.ExecSQL;

       munid:=StrToInt(q.Fields[24].AsString);
       muniH:=StrToInt(q.Fields[25].AsString);
       if (munid<>0) and (munih<>0) then
       begin
         if munid<=munih then
           munid:=munid+1
         else
         begin
           munid:=0;
           munih:=0;
           qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPDGRI=:pptmuni where codinq =:Codinq';
           qUpdate.ParamByName('ppdgri').AsString := '0.00';
           qUpdate.ParamByName('Codinq').AsString := a;
           qUpdate.ExecSQL;
         end;
      end;
      if munid>munih then
      begin
        munid:=0;
        munih:=0;
       qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPDGRI=:pptmuni where codinq =:Codinq';
       qUpdate.ParamByName('ppdgri').AsString := '0.00';
       qUpdate.ParamByName('Codinq').AsString := a;
       qUpdate.ExecSQL;
      end;
       qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPTMUNID=:ppTMUNID, ppTMUNIH=:ppTMUNIH where codinq =:Codinq';
       qUpdate.ParamByName('ppTMUNID').AsString := IntToStr(MUNId);;
       qUpdate.ParamByName('ppTMUNIh').AsString := IntToStr(MUNIh);
       qUpdate.ParamByName('Codinq').AsString := a;
       qUpdate.ExecSQL;

      aguad:=StrToInt(Q.Fields[44].AsString);
      aguah:=StrToInt(Q.Fields[45].AsString);
      if (aguad<>0) and (aguah<>0) then
      begin
        if aguad<=aguah then
          aguad:=aguad+1
        else
        begin
          aguad:=0;
          aguah:=0;
         qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPAGUAI=:ppAGUAi where codinq =:Codinq';
         qUpdate.ParamByName('ppAGUAi').AsString := '0.00';
         qUpdate.ParamByName('Codinq').AsString := a;
         qUpdate.ExecSQL;
        end;
      end;
      if aguad>aguah then
      begin
         qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPAGUAI=:ppAGUAi where codinq =:Codinq';
         qUpdate.ParamByName('ppAGUAi').AsString := '0.00';
         qUpdate.ParamByName('Codinq').AsString := a;
         qUpdate.ExecSQL;
      end;
      qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPTAGUAID=:ppAGUAID, ppAGUAIH=:ppAGUAIH where codinq =:Codinq';
      qUpdate.ParamByName('ppAGUAID').AsString := IntToStr(MUNId);;
      qUpdate.ParamByName('ppAGUAIh').AsString := IntToStr(MUNIh);
      qUpdate.ParamByName('Codinq').AsString := a;
      qUpdate.ExecSQL;
    end;
  end;
  DM.ConfirmarTransaccion;
  except
    DM.CancelarTransaccion;
  end;
  finally
    FreeAndNil(q);
    FreeAndNil(qUpdate);
  end;
end;


procedure TFrmLiquidacionInquilinos.AdvGlowButton1Click(Sender: TObject);
var
  qImpuestos: tFXQuery;
  I,J: Integer;
  stUbicacion: string;
  stInquilino: string;
  Letras: string;
  Resultado: Boolean;
  Estado: Boolean;
  Suma: DOuble;
  Importe: string;
  Recibo: String;
begin
(*
  gImpresion.Vaciar;
  qImpuestos:= CrearQuery;
  try
    LiqinOrig.Close;
    LiqinOrig.Open;

    qImpuestos.SQL.Text := 'Select MailInquilino, PlantillaInquilino, EntregarImpuestos from Inmuebles where codinq =:codinq';
    qImpuestos.Parambyname('Codinq').AsString := LiqinOrig.FieldByName('Codinq').AsString;
    qImpuestos.Open;

    I := 1;

    Suma := 0;
    cdsDatos.First;
    while not cdsDatos.Eof do
    begin
      if cdsDatos.FieldbyName('Seleccionado').AsBoolean then
        Suma := Suma + cdsDatos.FieldbyName('Importe').AsFloat;

      cdsDatos.Next;
    end;
    Importe := FormatFloat('0.00', Suma);
    Letras := ImporteEnLetras(Importe);

    LiqinOrig.First;
    while not LiqinOrig.eof do
    begin
      gImpresion.Cells[0,I] := LiqinOrig.FieldByName('Codinq').AsString;
      gImpresion.Cells[1,I] := LiqinOrig.FieldByName('Inquilino').AsString;
      gImpresion.Cells[2,I] := LiqinOrig.FieldByName('Fecha').AsString;
      gImpresion.Cells[3,I] := LiqinOrig.FieldByName('Direccion').AsString;
      gImpresion.Cells[4,I] := LiqinOrig.FieldByName('Iva').AsString;
      gImpresion.Cells[5,I] := LiqinOrig.FieldByName('Item').AsString;
      gImpresion.Cells[6,I] := LiqinOrig.FieldByName('Periodo').AsString;
      gImpresion.Cells[7,I] := LiqinOrig.FieldByName('Importe').AsString;
      gImpresion.Cells[8,I] := FormatFloat('0.00', Suma) + '.-)';
      gImpresion.Cells[9,I] := Letras;
      gImpresion.Cells[10,I] := LiqinOrig.FieldByName('Coditem').AsString;
      gImpresion.Cells[11,I] := LiqinOrig.FieldByName('DniPropietario').AsString;
      gImpresion.Cells[12,I] := LiqinOrig.FieldByName('Propietario').AsString;
      gImpresion.Cells[13,I] := LiqinOrig.FieldByName('IDMovimiento').AsString;
      LiqinOrig.Next;
      Inc(i);
    end;

    if i>2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;

    gImpresion.SortColumn(9,True, 'N');

    objMail := TMail.Create;
    objMail.idPlantilla := 3;
    objMail.DireccionMail := qImpuestos.FieldByName('MailInquilino').AsString;
    objMail.Titulo := 'Recibo para Inquilinos ';
    objMail.Asunto := 'Recibo para Inquilinos ';
    objMail.Mes := DevuelveMes(MonthOf(StrToDate(Edit8.Text)));
    objMail.Anio := YearOf(StrToDate(Edit8.Text));

    cdsDatos.First;
    I := 1;
    while not cdsDatos.Eof do
    begin
      if cdsDatos.FieldByName('Seleccionado').AsBoolean then
      begin
        gDetalleSeleccion.Cells[0,I] := cdsDatos.FieldByName('Item').AsString;
        gDetalleSeleccion.Cells[1,I] := cdsDatos.FieldByName('Descripcion').AsString;
        gDetalleSeleccion.Cells[2,I] := cdsDatos.FieldByName('Importe').AsString;
        gDetalleSeleccion.Cells[3,I] := cdsDatos.FieldByName('Coditem').AsString;
        Inc(I);
      end;
      cdsDatos.Next;
    end;

    if I > 2  then
      gDetalleSeleccion.RowCount := I + 1
    else
      gDetalleSeleccion.RowCount := 2;

    ImprimirReporte ( Reporte, objMail,  plReporte,  gDetalleSeleccion ) ;

//    Edit5.Properties.OnChange := Edit5PropertiesChange;
  finally
    FreeAndNil(qImpuestos);
  end;
  *)
    cdsAnomalias.EmptyDataSet;

  Resultado := False;

  gImpresion.Vaciar;
  qImpuestos:= CrearQuery;
  try
    LiqinOrig.Close;
    LiqinOrig.Open;

    qImpuestos.SQL.Text := 'Select MailInquilino, PlantillaInquilino, EntregarImpuestos from Inmuebles where codinq =:codinq';
    qImpuestos.Parambyname('Codinq').AsString := LiqinOrig.FieldByName('Codinq').AsString;
    qImpuestos.Open;

    I := 1;

    Suma := 0;
    cdsDatos.First;
    while not cdsDatos.Eof do
    begin
      if cdsDatos.FieldbyName('Seleccionado').AsBoolean then
        Suma := Suma + cdsDatos.FieldbyName('Importe').AsFloat;

      cdsDatos.Next;
    end;
    Importe := FormatFloat('0.00', Suma);
    Letras := ImporteEnLetras(Importe);

    cdsDatos.First;
    LiqinOrig.First;
    gImpresion.Vaciar;
    while not LiqinOrig.eof do
    begin
      cdsDatos.First;

      while not cdsDatos.eof do
      begin
        if (LiqinOrig.FieldByName('Item').AsString = cdsDatos.FieldByName('Item').AsString) and
           (LiqinOrig.FieldByName('Periodo').AsString = cdsDatos.FieldByName('Descripcion').AsString) and
           (ToFloat(LiqinOrig.FieldByName('Importe').AsString) = ToFloat(cdsDatos.FieldByName('Importe').AsString)) and
           (LiqinOrig.FieldByName('coditem').AsString = cdsDatos.FieldByName('Coditem').AsString) and
           (cdsDatos.FieldByName('Seleccionado').AsBoolean) then
        begin
          gImpresion.Cells[0,I] := LiqinOrig.FieldByName('Codinq').AsString;
          gImpresion.Cells[1,I] := LiqinOrig.FieldByName('Inquilino').AsString;
          gImpresion.Cells[2,I] := LiqinOrig.FieldByName('Fecha').AsString;
          gImpresion.Cells[3,I] := LiqinOrig.FieldByName('Direccion').AsString;
          gImpresion.Cells[4,I] := LiqinOrig.FieldByName('Iva').AsString;
          gImpresion.Cells[5,I] := LiqinOrig.FieldByName('Item').AsString;
          gImpresion.Cells[6,I] := LiqinOrig.FieldByName('Periodo').AsString;
          gImpresion.Cells[7,I] := LiqinOrig.FieldByName('Importe').AsString;
          gImpresion.Cells[8,I] := FormatFloat('0.00', Suma) + '.-)';
          gImpresion.Cells[9,I] := Letras;
          gImpresion.Cells[10,I] := LiqinOrig.FieldByName('Coditem').AsString;
          gImpresion.Cells[11,I] := LiqinOrig.FieldByName('DniPropietario').AsString;
          gImpresion.Cells[12,I] := LiqinOrig.FieldByName('Propietario').AsString;
          gImpresion.Cells[13,I] := LiqinOrig.FieldByName('IDMovimiento').AsString;
          Inc(i);
        end;
        cdsDatos.Next;
      end;
      LiqinOrig.Next;
    end;

    gImpresion.SortColumn(9,True, 'N');
    if i>2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;

    objMail := TMail.Create;
    objMail.idPlantilla := 3;
    objMail.DireccionMail := qImpuestos.FieldByName('MailInquilino').AsString;
    objMail.Titulo := 'Recibo para Inquilinos ';
    objMail.Asunto := 'Recibo para Inquilinos ';
    objMail.Mes := DevuelveMes(MonthOf(StrToDate(Edit8.Text)));
    objMail.Anio := YearOf(StrToDate(Edit8.Text));

    cdsDatos.First;
    gDetalleSeleccion.Vaciar;
    I := 1;
    while not cdsDatos.Eof do
    begin
      if cdsDatos.FieldByName('Seleccionado').AsBoolean then
      begin
        gDetalleSeleccion.Cells[0,I] := cdsDatos.FieldByName('Item').AsString;
        gDetalleSeleccion.Cells[1,I] := cdsDatos.FieldByName('Descripcion').AsString;
        gDetalleSeleccion.Cells[2,I] := cdsDatos.FieldByName('Importe').AsString;
        gDetalleSeleccion.Cells[3,I] := cdsDatos.FieldByName('Coditem').AsString;
        Inc(I);
      end;
      cdsDatos.Next;
    end;

    if I > 2  then
      gDetalleSeleccion.RowCount := I + 1
    else
      gDetalleSeleccion.RowCount := 2;

    if FDeEnvioMails then
      ImprimirReporte ( False, ReporteFijo, objMail,  plReporte,  gDetalleSeleccion )
    else
      ImprimirReporte ( ReporteFijo, objMail,  plReporte,  gDetalleSeleccion ) ;

    stUbicacion := Edit5.Text;
    Edit5.Properties.OnChange := nil;
    stInquilino := Edit2.Text;

    Edit5.Properties.OnChange := Edit5PropertiesChange;
  finally
    FreeAndNil(qImpuestos);
  end;

end;

procedure TFrmLiquidacionInquilinos.actImpuestosAlPropietarioExecute(
  Sender: TObject);
var
 cod,E:string;
 f,fd,D:string;
 c,cd:string;
 Query12: tFXQuery;

begin
 Query12 := CrearQuery;
 DM.IniciarTransaccion;
 try
   try
     cod:=Edit1.Text;
     f:=Edit6.Text;
     fd:=Edit8.Text;
     f:=FechaAlReves(f);
     fd:=FechaAlReves(fd);
     Delete(f,7,2);
     Delete(fd,7,2);
     f:=f+'05';
     fd:=fd+'10';
     c:=f+cod+'09';
     E:=f+cod+'28';
     cd:=fd+cod+'29';
     query12.close;
     query12.sql.Text := 'select * from itemautom where clave=:clave';
     query12.parambyname('clave').AsString:=cd;
     query12.open;

     if Query12.isEmpty then
     begin
       query12.close;
       query12.sql.Text := 'select * from itemautom where clave=:clave or clave=:clave2';
       query12.parambyname('clave').AsString:=c;
       query12.parambyname('clave2').AsString:=e;
       query12.open;

       while not query12.eof do
       begin
         D:=QUERY12.FIELDS[3].AsString;
         f:=Edit8.Text;
         f:=FechaAlReves(f);
         Delete(f,7,2);
         f:=f+'10';
         c:=f+cod+'29';

         InsertarItemautom(Edit1.Text, f, 'SE ENTREGA COMPROB. ABONADO DE', D, '0.00', Edit4.text, '29', 3);

         query12.Next;
       end;
     end;

     f:=Edit6.Text;
     fd:=Edit8.Text;
     f:=FechaAlReves(f);
     fd:=FechaAlReves(fd);
     Delete(f,7,2);
     Delete(fd,7,2);
     f:=f+'10';
     fd:=fd+'10';
     c:=f+cod+'27';
     cd:=fd+cod+'29';
     query12.close;
     query12.sql.Text := 'select * from itemautom where clave=:clave';
     query12.parambyname('clave').AsString:=cd;
     query12.Open;

     if Query12.IsEmpty then
     begin
       query12.close;
       query12.sql.Text := 'select * from itemautom where clave=:clave';
       query12.parambyname('clave').AsString:=c;
       query12.Open;

       while not query12.Eof do
       begin
         D:=QUERY12.FIELDS[3].AsString;
         f:=Edit8.Text;
         f:=FechaAlReves(f);
         Delete(f,7,2);
         f:=f+'10';
         c:=f+cod+'29';

         InsertarItemautom(Edit1.Text, f, 'SE ENTREGA COMPROB. ABONADO DE', D, '0.00', Edit4.text, '29', 3);

         query12.Next;
       end;
     end;
     Dm.ConfirmarTransaccion;
   except
     DM.CancelarTransaccion;
   end;
 finally
   FreeAndNIl(query12);
 end;
end;

procedure TFrmLiquidacionInquilinos.actNotaCercanaFechaExecute(
  Sender: TObject);
var
  a,f,m,ano,FECHA,C:string;
  fi,fechai:integer;
  query10: tFXQuery;
  query12: tFXQuery;

begin
  query10 := CrearQuery;
  query12 := CrearQuery;
  try
    try
      FECHA:=Edit8.Text;
      FECHA:=FechaAlReves(FECHA);
      Delete(FECHA,7,2);
      FECHA:=FECHA+'05';
      a:=Edit1.Text;
      query10.close;
      query10.Sql.Text := 'select * from inmuebles where codinq=:codinq';
      query10.parambyname('codinq').AsString:=a;
      query10.open;
      f:=query10.Fields[10].AsString;
      Delete(f,1,6);
      m:=datetostr(date());
      Delete(m,1,3);
      Delete(m,3,5);
      ano:=datetostr(date());
      Delete(ano,1,6);
      if Length(m)=1 then m:='0'+m;
      f:=ano+m+f;
      FECHA:=datetostr(date());
      FECHA:=FechaAlReves(FECHA);
      fi:=StrToInt(f);
      fechai:=StrToInt(fecha);
      fi:=fi-fechai;
      if (fi=0) or (Fi=1) then
      begin
      FECHA:=Edit8.Text;
      FECHA:=FechaAlReves(FECHA);
      Delete(FECHA,7,2);
      FECHA:=FECHA+'05';

      C:=FECHA+Edit1.Text+'211';
      query12.close;
      query12.sql.Text := ' Select * from itemautom where clave=:clave';
      query12.parambyname('clave').AsString:=c;
      query12.open;
      if Query12.IsEmpty then
      begin
        InsertarItemAutom(Edit1.Text,
          Fecha,
          'INMOBILIARIA ACONSEJA',
          'NO ESPERAR A ULTIMO MOMENTO PARA PAGAR',
          '0.00',
          Edit4.Text,
          '211',
          3);

        InsertarItemAutom(Edit1.Text,
          Fecha,
          '',
          'EL ALQUILER. EVITE PUNITORIOS. ABONANDOLOS ',
          '0.00',
          Edit4.Text,
          '212',
          3);

        InsertarItemAutom(Edit1.Text,
          Fecha,
          '',
          'RECUERDE UD. QUE FUE ADVERTIDO.',
          '0.00',
          Edit4.Text,
          '213',
          3);
        END;
      END;
      DM.ConfirmarTransaccion;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(query10);
    FreeAndNil(query12);
  end;
end;

procedure TFrmLiquidacionInquilinos.actListadoRecibosExecute(
  Sender: TObject);
var
  l,i:integer;
  r,imp:string;
  f:string;
  c:string;
  Query12: tFXQuery;
  Query13: tFXQuery;
  Recibos: tFXQuery;

begin
  Query12 := CrearQuery;
  Query13 := CrearQuery;
  Recibos := CrearQuery;

  try
    f:=Edit7.Text;
    f:=FechaAlReves(f);
    query12.close;
    query12.sql.clear;
    query12.sql.add('select * from recibos');
    query12.open;
    if not Query12.IsEmpty then
      r:=query12.fieldbyname('recibo').AsString
    else
      r:='0';
    i:=StrToInt(r);
    i:=i+1;
    r:=IntToStr(i);
    r:=inputbox('REGISTRACION DE RECIBOS','Introduzca N° de recibo','');
    query13.close;
    query13.sql.clear;
    query13.sql.add('select * from liqinorig where coditem=:Coditem');
    query13.Parambyname('Coditem').AsString := '40';
    query13.open;
    if not Query13.IsEmpty then
      c:=query13.fieldbyname('Importe').AsString
    else
      c:='0.00';
    query13.close;
    query13.sql.clear;
    query13.sql.add('select * from liqinorig');
    query13.open;
    imp:=query13.Fieldbyname('total').AsString;
    l:=Length(imp);
    Delete(imp,l-2,3);
    if r<>'' then
    begin
      DM.IniciarTransaccion;
      try
        Recibos.SQL.Text := ' Insert into recibos (Fecha,Recibo, Importe, Comision, Condicion) ' +
                            ' values(:fecha, :Recibo, :Importe, :Comision, :Condicion)';
        Recibos.ParamByName('Fecha').AsString := f;
        Recibos.ParamByName('Recibo').AsString := r;
        Recibos.ParamByName('Importe').AsString := Imp;
        Recibos.ParamByName('Comision').AsString := C;
        Recibos.ParamByName('Condicion').AsString := '';
        Recibos.ExecSQL;
        DM.ConfirmarTransaccion;
      Except
        DM.CancelarTransaccion;
      end;
    end;
  finally
    FreeAndNil(query12);
    FreeAndNil(query13);
    FreeAndNil(Recibos);
  end;
end;

end.
