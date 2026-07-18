unit FrmLiquidacionParaPropietarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  CheckLst, IBCustomDataSet, IBTable,
  ActnList, ImgList, ToolWin,Declaraciones, funciones, FrmDatos,
  SqlExpr, ALIGRID, FMTBcd, ppDBPipe, ppDB, ppDBJIT, ppParameter, ppModule,
  raCodMod, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, strUtils, DBClient, Provider, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxMaskEdit, cxDropDownEdit, cxTextEdit, AdvObj, BaseGrid,
  AdvGrid, voDispositivos, DateUtils, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  ppDesignLayer, System.Actions, AdvGlowButton, cxGroupBox, AdvPanel, cxCheckBox, FXQuery,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ppStrtch, ppSubRpt,
  dxGDIPlusClasses;

type
  TFrmLiquidacionPropietarios = class(TForm)
    DataSource1: TDataSource;
    Button2: TButton;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    aclAcciones: TActionList;
    ImageList1: TImageList;
    actSalir: TAction;
    actImprimir: TAction;
    actPlanesDePago: TAction;
    actCargarInmuebles: TAction;
    actCalculoExpensas: TAction;
    actCalculoDeItemsALiquidar: TAction;
    actCaja: TAction;
    Reporte: TppReport;
    ppParameterList1: TppParameterList;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plTitulo: TppJITPipeline;
    plLiqPro: TppDBPipeline;
    plReporteppField4: TppField;
    plTituloppField1: TppField;
    Documentacion: TppField;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppVariable1: TppVariable;
    ppDetailBand1: TppDetailBand;
    ppVariable8: TppVariable;
    ppVariable6: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppVariable3: TppVariable;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppVariable9: TppVariable;
    raCodeModule1: TraCodeModule;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppVariable2: TppVariable;
    ppDetailBand2: TppDetailBand;
    ppVariable4: TppVariable;
    ppVariable5: TppVariable;
    ppSummaryBand2: TppSummaryBand;
    ppVariable7: TppVariable;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppVariable10: TppVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    qLiqPro: TFXQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit9: TEdit;
    gImpresion: TStringAlignGrid;
    gPendiente: TStringAlignGrid;
    chlista: TCheckListBox;
    Edit1: TcxTextEdit;
    Edit4: TcxTextEdit;
    Edit2: TcxComboBox;
    Edit3: TcxTextEdit;
    Edit7: TcxMaskEdit;
    Edit6: TcxMaskEdit;
    Edit8: TcxMaskEdit;
    Edit12: TcxTextEdit;
    Edit10: TcxTextEdit;
    Edit5: TcxComboBox;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    CheckBox1: TCheckBox;
    chUbicacion: TCheckBox;
    AdvGlowButton1: TAdvGlowButton;
    PageControl1: TPageControl;
    tbPropiedades: TTabSheet;
    tbItems: TTabSheet;
    gLista: TAdvStringGrid;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    cxGrid1: TcxGrid;
    gItems: TcxGridDBTableView;
    Columna_Seleccion: TcxGridDBColumn;
    Columna_Item: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    Columna_Importe: TcxGridDBColumn;
    Columna_coditem: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Columna_Codinq: TcxGridDBColumn;
    TabSheet1: TTabSheet;
    gLiqPrOrig: TStringAlignGrid;
    Columna_Ingreso: TcxGridDBColumn;
    chGastoBancario: TCheckBox;
    chRedondeo: TCheckBox;
    ReporteFijo: TppReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppShape2: TppShape;
    ppVariable11: TppVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppVariable13: TppVariable;
    ppImage2: TppImage;
    ppHeaderBand3: TppHeaderBand;
    ppVariable14: TppVariable;
    ppVariable15: TppVariable;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    raCodeModule4: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppLabel18: TppLabel;
    ppVariable18: TppVariable;
    ppVariable19: TppVariable;
    ppDBText6: TppDBText;
    plTituloppField2: TppField;
    ppReport1: TppReport;
    ppTitleBand3: TppTitleBand;
    ppVariable12: TppVariable;
    ppVariable20: TppVariable;
    ppShape3: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText7: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppShape4: TppShape;
    ppVariable21: TppVariable;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppVariable22: TppVariable;
    ppImage3: TppImage;
    ppHeaderBand4: TppHeaderBand;
    ppImage4: TppImage;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppVariable23: TppVariable;
    ppVariable24: TppVariable;
    ppSummaryBand5: TppSummaryBand;
    raCodeModule5: TraCodeModule;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppLabel32: TppLabel;
    ppVariable25: TppVariable;
    ppVariable26: TppVariable;
    ppDBText8: TppDBText;
    raCodeModule6: TraCodeModule;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList4: TppParameterList;
    ppVariable16: TppVariable;
    ppVariable17: TppVariable;
    ppPageStyle1: TppPageStyle;
    ppDesignLayer3: TppDesignLayer;
    ppImage1: TppImage;
    ReporteFDuplicado: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand5: TppHeaderBand;
    ppShape5: TppShape;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText9: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppShape6: TppShape;
    ppVariable29: TppVariable;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppVariable30: TppVariable;
    ppImage5: TppImage;
    ppDetailBand3: TppDetailBand;
    ppVariable31: TppVariable;
    ppVariable32: TppVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLabel46: TppLabel;
    ppVariable33: TppVariable;
    ppVariable34: TppVariable;
    ppDBText10: TppDBText;
    ppPageStyle2: TppPageStyle;
    ppImage6: TppImage;
    raCodeModule3: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppDesignLayer8: TppDesignLayer;
    ppParameterList5: TppParameterList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure checkListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure actImprimirExecute(Sender: TObject);
    procedure actCalculoExpensasExecute(Sender: TObject);
    procedure actCalculoDeItemsALiquidarExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    function plTituloGetFieldValue(aFieldName: string): Variant;
    procedure BitBtn1Click(Sender: TObject);
//    procedure gDetalle11DblClick(Sender: TObject);
    procedure Edit5PropertiesChange(Sender: TObject);
    procedure Edit7PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Edit6PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Edit8PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure gListaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    LiqPrOrig: TClientDataSet;
    dspLiqPrOrig: TDataSetProvider;
    sMail: string;
    objMail: TMail;
    boHayAlquilerACuenta:Boolean;
    cdsAnomalias: TClientDataset;
    cdsDatos: TClientDataSet;
    dsDatos: TDataSource;

    procedure prCalcularItems;
    function fxBuscarLiquidacionesPendientes(pCodinq: string): Boolean;
    function fxExistenItemsEnCero(cdsDatos:TClientDataSet): Boolean;
    function fxExistenItemsConDecimales(cdsDatos:TClientDataSet): Boolean;
    function fxExistenItemsEnRecibos(cdsDatos:TClientDataSet; var Recibo: String): Boolean;
    procedure prPrepararDataset;
    procedure prValidarIngresoDinero;

  end;

var
  FrmLiquidacionPropietarios: TFrmLiquidacionPropietarios;

implementation

uses frmprincipal, frmConfirmacionRecibos, frmclavecaja;

{$R *.DFM}

procedure TFrmLiquidacionPropietarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(LiqPrOrig) then
    FreeAndNil(LiqPrOrig);
  if Assigned(dspLiqPrOrig) then
    FreeAndNil(dspLiqPrOrig);

  FrmLiquidacionPropietarios := nil;
  Action := caFree;

end;

procedure TFrmLiquidacionPropietarios.FormActivate(Sender: TObject);
var
 q: TFXQuery;

begin
  q := CrearQuery;
  try
    With q do
    begin
      Close;
      Sql.Text := 'select ubicacion from inmuebles order by ubicacion';
      Open;
      Edit5.Properties.Items.Clear;
      while not eof do
      begin
        Edit5.Properties.items.add(Fields[0].AsString);
        Next;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo:      string;
  I:           Integer;
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    if Key = #13  then
    begin
      Codigo     := Edit1.Text;
      Codigo     := LargoCodigo(Codigo);
      Edit1.Text := Codigo;
      With q do
      begin
        Close;
        Sql.Text := 'select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and a.codinq=:codinq';
        ParamByName('Codinq').AsString := Codigo;
        Open;

        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
        end
        else
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where codinq=:codinq');
          ParamByName('Codinq').AsString := Codigo;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit9.Text := Fields[14].AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino ' + Codigo + ' No cargado');
          end;
        end;
      end;
      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select codpro,propietario from inmuebles where propietario=:propietario');
        ParamByName('propietario').AsString:=Trim(Edit4.Text);
        Open;
        Edit4.Text := Fields[1].AsString;
      end;

      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from inmuebles where propietario=:propietario ORDER BY CODINQ');
        ParamByName('propietario').AsString:=Trim(Edit4.Text);
        Open;
  //      Edit4.Text := Fields[1].AsString;
        gLista.Clear;
        gLista.Cells[0, 0] := 'Seleccionar';
        gLista.Cells[1, 0] := 'Código';
        gLista.Cells[2, 0] := 'Inmueble';
        gLista.Cells[3, 0] := 'Estado';
        I := 1;
        While not eof do
        begin
          gLista.RowCount := gLista.RowCount + 1;
          gLista.AddCheckBox(0,I,false,false);
          gLista.Cells[1, I] := FieldByName('Codinq').AsString;
          gLista.Cells[2, I] := Fields[8].AsString;
          if FieldbyName('Desocupado').AsInteger = 1 then
          begin
            gLista.Cells[3, I] := 'DESOCUPADO';
            gLista.FontColors[3,I] := clRed;
            gLista.FontStyles[3, I] := gLista.FontStyles[3, I] + [fsBold];
            gLista.FontNames[3, I] := 'SEGOE UI';
          end
          else if FieldbyName('Prelegales').AsInteger = 1 then
          begin
            gLista.Cells[3, I] := 'EN PRELEGALES';
            gLista.FontColors[3,I] := clRed;
            gLista.FontStyles[3, I] := gLista.FontStyles[3, I] + [fsBold];
            gLista.FontNames[3, I] := 'SEGOE UI';
          end
          else if FieldbyName('Legales').AsInteger = 1 then
          begin
            gLista.Cells[3, I] := 'EN LEGALES';
            gLista.FontColors[3,I] := clRed;
            gLista.FontStyles[3, I] := gLista.FontStyles[3, I] + [fsBold];
            gLista.FontNames[3, I] := 'SEGOE UI';
          end
          else if FieldbyName('JuicioDesalojo').AsInteger = 1 then
          begin
            gLista.Cells[3, I] := 'EN JUICIO DESALOJO';
            gLista.FontColors[3,I] := clRed;
            gLista.FontStyles[3, I] := gLista.FontStyles[3, I] + [fsBold];
            gLista.FontNames[3, I] := 'SEGOE UI';
          end
          else if FieldbyName('JuicioPVE').AsInteger = 1 then
          begin
            gLista.Cells[3, I] := 'EN JUICIO PVE';
            gLista.FontColors[3,I] := clRed;
            gLista.FontStyles[3, I] := gLista.FontStyles[3, I] + [fsBold];
            gLista.FontNames[3, I] := 'SEGOE UI';
          end
          else
            gLista.Cells[3, I] := 'SIN NOVEDAD';

          gLista.Readonly[1,I] := True;
          gLista.Readonly[2,I] := True;
          gLista.Readonly[3,I] := True;
          Inc(I);
          Next;
        end;
        if I < 2 then
          gLista.RowCount := 2
        else
          gLista.RowCount := I;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  if Key = #13  then
  begin
    Edit8.SetFocus;
    Fecha := Edit6.Text;
    if Fecha = '  /  /    ' then
    begin
      Fecha := FormatDateTime('dd/mm/yyyy',Date());
      Delete(Fecha, 3, 8);
      if (Fecha = '30') or (Fecha = '28') then
        Fecha := FormatDateTime('dd/mm/yyyy',Date() - 30)
      else
        Fecha := FormatDateTime('dd/mm/yyyy',Date() - 31);
      Delete(Fecha, 1, 2);
      Fecha      := '15' + Fecha;
      Edit6.Text := Fecha;
    end;
    if Length(Fecha) = 6 then
    begin
      Fecha      := TransformaFecha(Fecha);
      Edit6.Text := Fecha;
    end;
    Edit6.Text := FormatDateTime('dd/mm/yyyy', StrToDate(Edit6.Text));
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit6PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TFrmLiquidacionPropietarios.Edit7KeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmLiquidacionPropietarios.Edit7PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TFrmLiquidacionPropietarios.Edit8KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
  Dia:   string;
  Mes:   string;
  Ano:   string;

begin
  if Key = #13  then
  begin
    Edit10.SetFocus;
    Fecha := Edit8.Text;
    if Fecha = '  /  /    ' then
    begin
      Fecha := Edit6.Text;
      Delete(Fecha, 3, 8);
      Dia := Fecha;
      Fecha := Edit6.Text;
      Delete(Fecha, 1, 3);
      Delete(Fecha, 3, 5);
      Mes := Fecha;
      Fecha := Edit6.Text;
      Delete(Fecha, 1, 6);
      Ano := Fecha;
      if Length(Mes) = 1 then
        Mes := '0' + Mes;
      if Mes = '12' then
      begin
        Mes := '01';
        Ano := Inttostr(StrToInt(Ano)+1);
      end
      else
      begin
        Mes := IntToStr(StrToInt(Mes) + 1);
        if Length(Mes)=1 then
          Mes := '0' + Mes;
      end;
      Fecha      := Dia + '/' + Mes + '/' + Ano;
      Edit8.Text := Fecha;
    end;
    if Length(Fecha) = 6 then
    begin
      Fecha      := TransformaFecha(Fecha);
      Edit8.Text := Fecha;
    end;
    Edit8.Text := FormatDateTime('dd/mm/yyyy', StrToDate(Edit8.Text));
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit8PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TFrmLiquidacionPropietarios.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 q: TFXQuery;
 Tecla: Char;
begin
  q := CrearQuery;
  try
    if Key = #13  then
    begin
      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a,inmuebles i where a.codinq=i.codinq and a.inquilino=:inquilino');
        ParamByName('inquilino').AsString := Trim(Edit2.Text);
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
          Tecla := #13;
          Edit1KeyPress(nil, Tecla);

        end
        else
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where inquilino=:inquilino');
          ParamByName('inquilino').AsString := Trim(Edit2.Text);
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino ' + Edit4.Text +' No cargado');
          end;
        end;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: TFXQuery;
  qColor: TFXQuery;

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
          Hoy        := FormatDateTime('dd/mm/yyyy',Date());
          Hoy        := FechaAlReves(Hoy);
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[2].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := FieldByName('CodPro').AsString;
          Edit2.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
          if StrToInt(Fecha) < StrToInt(hoy) then
          begin
            fecha := FieldbyName('FechaFin').AsString;
            SHOWMESSAGE('CONTRATO DE LOCACION VENCIDO');
            Edit1.SETFOCUS;
          end;
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
            Edit2.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
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
//      Memo1.Lines.Clear;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit5PropertiesChange(Sender: TObject);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: TFXQuery;
  qColor: TFXQuery;
  I: Integer;
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
        Hoy        := FormatDateTime('dd/mm/yyyy',Date());
        Hoy        := FechaAlReves(Hoy);
        Edit1.Text := Fields[0].AsString;
        Edit2.Text := Fields[1].AsString;
        Edit3.Text := Fields[2].AsString;
        Edit4.Text := Fields[3].AsString;
        Edit5.Text := Fields[4].AsString;
        Edit9.Text := FieldByName('CodPro').AsString;
        if StrToInt(Fecha) < StrToInt(hoy) then
        begin
          fecha := FieldbyName('FechaFin').AsString;
          Edit1.SETFOCUS;
        end;

        With q do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select codpro,propietario from inmuebles where propietario=:propietario');
          ParamByName('propietario').AsString:=Trim(Edit4.Text);
          Open;
          Edit4.Text := Fields[1].AsString;
        end;

        With q do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where propietario=:propietario ORDER BY CODINQ');
          ParamByName('propietario').AsString:=Trim(Edit4.Text);
          Open;
    //      Edit4.Text := Fields[1].AsString;
          gLista.Clear;
          gLista.Cells[0, 0] := 'Seleccionar';
          gLista.Cells[1, 0] := 'Código';
          gLista.Cells[2, 0] := 'Inmueble';
          gLista.Cells[3, 0] := 'Estado';
          I := 1;
          While not eof do
          begin
            gLista.RowCount := gLista.RowCount + 1;
            gLista.AddCheckBox(0,I,false,false);
            gLista.Cells[1,I] := FieldByName('Codinq').AsString;
            gLista.Cells[2,I] := Fields[8].AsString;
            gLista.Readonly[1,I] := True;
            gLista.Readonly[2,I] := True;
            gLista.Readonly[3,I] := True;
            Inc(I);
            Next;
          end;
          if I < 2 then
            gLista.RowCount := 2
          else
            gLista.RowCount := I;
        end;
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
          Edit2.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
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
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFrmLiquidacionPropietarios.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13  then
 begin
   PageControl1.ActivePage := tbPropiedades;
   BitBtn5.SetFocus;
 end;
end;

procedure TFrmLiquidacionPropietarios.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLiquidacionPropietarios.Edit4KeyPress(Sender: TObject; var Key: Char);
var
 q: TFXQuery;

begin
  q := CrearQuery;
  try
    if Key = #13  then
    begin
      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from inmuebles where propietario=:propietario');
        ParamByName('Propietario').AsString := Trim(Edit4.Text);
        Open;

        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[4].AsString;
          Edit5.Text := Fields[8].AsString;
  //        Edit9.Text := Fields[45].AsString;
        end
        else
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where inquilino=:Propietario');
          ParamByName('Propietario').AsString := Trim(Edit4.Text);
          Open;

          if isEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al Propietario ' + Edit4.Text +' No cargado');
          end;
        end;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionPropietarios.BitBtn5Click(Sender: TObject);
var
  I: Integer;
begin
  boHayAlquilerACuenta:= False;
  PageControl1.ActivePage := tbPropiedades;

  for I := 1 to gLista.RowCount - 1 do
    gLista.SetCheckboxState(0, I, True);
  if fxBuscarLiquidacionesPendientes(Edit1.Text) then
  begin
    if not MostrarDialogoSiNO('Hay liquidaciones pendientes para este propietario.' + #13#10 + '¿Desea liquidar de todos modos?') then
      Exit;
  end;
  prCalcularItems;
end;

procedure TFrmLiquidacionPropietarios.BitBtn1Click(Sender: TObject);
begin
  PageControl1.ActivePage := tbPropiedades;
  prCalcularItems;
end;

procedure TFrmLiquidacionPropietarios.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  fPrincipal.center(self);
  LiqPrOrig := TClientDataSet.Create(nil);
  dspLiqPrOrig := TDataSetProvider.Create(nil);

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
  prPrepararDataset;
end;

function TFrmLiquidacionPropietarios.fxBuscarLiquidacionesPendientes(pCodinq: string): Boolean;
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from cabezarecibos where tipo =:Tipo and letra = :Letra and Codinq = :Codinq and Pendiente = 1';
    q.ParamByName('Tipo').AsString := 'LI';
    q.ParamByName('Letra').AsString := 'P';
    q.ParamByName('Codinq').asString := pCodinq;
    q.Open;

    Result := not q.IsEmpty;
  finally
    q.Free;
  end;
end;

(*
procedure TFrmLiquidacionPropietarios.gDetalle11DblClick(Sender: TObject);
  procedure prRecalcularTotal;
  var
    ndTotal: Double;
    I: Integer;
  begin
    ndTotal := 0;
    for I := 1 to gDetalle.RowCount - 1 do
      if gDetalle.ColorRow[I] <> RGB(255,185,185) then
        ndTotal := ndTotal + ToFloat(gDetalle.Cells[5,  I]);

    Edit12.Text := FormatFloat('0.00', ndTotal);
  end;
begin
  if gDetalle.ColorRow[gDetalle.Row] <> RGB(255,185,185) then
  begin
    gDetalle.ColorRow[gDetalle.Row] := RGB(255,185,185);
    prRecalcularTotal;
    Exit;
  end;

  if gDetalle.ColorRow[gDetalle.Row] = RGB(255,185,185) then
  begin
    gDetalle.ColorRow[gDetalle.Row] := clWhite;
    prRecalcularTotal;
    Exit;
  end;
end;
*)

procedure TFrmLiquidacionPropietarios.gListaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2: HAlign := taLeftJustify;
  end;
end;

function TFrmLiquidacionPropietarios.plTituloGetFieldValue(
  aFieldName: string): Variant;
VAR
  Q:tfxqUERY;
begin
  if aFieldName='Total' then
    Result := Edit12.Text
  else if aFieldName = 'Numero' then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select Count(*) + 1 as Cantidad from Cabezarecibos where Tipo = ''LI'' ';
      q.Open;

      Result := q.FieldByName('Cantidad').AsInteger;
    finally
      FreeAndNil(q);
    end;
  end
   else if aFieldName='Documentacion' then
  begin
    if checkbox1.Checked then
      Result := 'DOCUMENTACION ADICIONAL ENTREGADA'
    else
      Result := '';
  end;
end;

procedure TFrmLiquidacionPropietarios.checkListBox1KeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actCalculodeitemsaliquidar.Execute;
end;

function TFrmLiquidacionPropietarios.fxExistenItemsConDecimales(cdsDatos:TClientDataSet): Boolean;
var
  I:Integer;
  Importe: String;
begin
  Result := False;
  cdsDatos.First;
  while not cdsDatos.eof do
  begin
    Importe := FormatFloat('0.00', cdsDatos.FieldByName('Importe').asFloat);

    if (Copy(Importe, Pos('.', Importe) + 2,1) <> '0') and (Copy(Importe, Pos('.', Importe) + 2,1) <> '5') then
    begin
      Result := True;
      Break;
    end;
    cdsDatos.Next;
  end;
end;


function TFrmLiquidacionPropietarios.fxExistenItemsEnRecibos(
  cdsDatos:TClientDataSet; var Recibo: String): Boolean;
var
  q: TFXQuery;
  I: Integer;
begin
  Result := False;
  q := CrearQuery;
  try
    cdsDatos.First;
    while not cdsDatos.eof do
    begin
      if not cdsDatos.FieldbyName('Seleccionado').AsBoolean then
      begin
        cdsDatos.Next;
        Continue;
      end;

      if (cdsDatos.FieldbyName('Coditem').AsString = '12') or
      (cdsDatos.FieldbyName('Coditem').AsString = '28') or
      (cdsDatos.FieldbyName('Coditem').AsString = '41') or
      (cdsDatos.FieldbyName('Coditem').AsString = '58') or
      (cdsDatos.FieldbyName('Coditem').AsString = '46') or
      (cdsDatos.FieldbyName('Coditem').AsString = '67') or
      (cdsDatos.FieldbyName('Coditem').AsString = '121') or
      (cdsDatos.FieldbyName('Coditem').AsString = '503') then
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
                    '   and CA.Tipo = :Tipo ';
      q.ParamByName('Codinq').AsString := cdsDatos.FieldbyName('Codinq').AsString;
      q.ParamByName('Tipo').AsString := 'LI';
      q.ParamByName('Item').AsString := cdsDatos.FieldbyName('Item').AsString;
      q.ParamByName('Periodo').AsString := cdsDatos.FieldbyName('Descripcion').AsString;
      q.Open;

      if not q.IsEmpty then
      begin
        Recibo := ' LA LIQUIDACION YA FUE HECHA O HAY ITEMS PRESENTES YA COBRADOS, EN LA LIQ.  '+
                  q.FieldByName('Letra').AsString + ' ' +
                  FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat) + ' ' +
                  q.FieldByName('Item').AsString + ' ' + q.FieldByName('Periodo').AsString;
        Result := True;
        Break;
      end;
      cdsDatos.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFrmLiquidacionPropietarios.actImprimirExecute(Sender: TObject);
var
  q: TFXQuery;
  qLiqPrOrig: TFXQuery;
  qRepProp: TFXQuery;
  qRepProp2: TFXQuery;
  codi, nom: string;
  ci, se, si: string;
  I: Integer;
  num1, Suma, Ant, Act, gil: string;
  registro: Integer;
  Saltar: Boolean;
  boSubtotal: Boolean;
  Resultado: Boolean;
  Recibo: string;
  ndTotal: Currency;
  boEncontro: Boolean;
  Letras: String;
begin
  q := CrearQuery;
  qLiqPrOrig := CrearQuery;
  qRepProp := CrearQuery;
  qRepProp2:= CrearQuery;

  cdsDatos.DisableControls;

  try
    Dm.IniciarTransaccion;
    q.SQL.Text := ' Delete from repprop where usuario = :usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    LiqPrOrig.Close;
    LiqPrOrig.Open;

    Dm.IniciarTransaccion;
    q.SQL.Text := ' ALTER SEQUENCE GEN_repprop RESTART WITH 0';
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    nom := '';

    codi := '';
    ndTotal := 0;
    while not LiqPrOrig.eof do
    begin
      boEncontro := False;
      cdsDatos.First;

      while not cdsDatos.eof do
      begin
        if (LiqPrOrig.FieldByName('Registro').AsString = cdsDatos.FieldByName('Registro').AsString) and
           (not cdsDatos.FieldByName('Seleccionado').AsBoolean) then
        begin
          boEncontro := True;
          Break;
        end;
        cdsDatos.Next;
      end;
      if boEncontro then
      begin
        LiqPrOrig.Next;
        Continue;
      end
      else
      begin
        ndTotal := ndTotal + ToFloat(LiqPrOrig.FieldByName('Importe').AsString);
        LiqPrOrig.Next;
      end;
    end;

    Suma := FormatFloat('0.00', ndTotal);
    letras := ImporteEnLetras(ndTotal);
    Edit12.Text := Suma;
    LiqPrOrig.First;
    while not LiqPrOrig.eof do
    begin
      boEncontro := False;
      cdsDatos.First;

      while not cdsDatos.eof do
      begin
        if (LiqPrOrig.FieldByName('Registro').AsString = cdsDatos.FieldByName('Registro').AsString) and
           (not cdsDatos.FieldByName('Seleccionado').AsBoolean) then
        begin
          boEncontro := True;
          Break;
        end;
        cdsDatos.Next;
      end;

      if boEncontro then
      begin
        LiqPrOrig.Next;
        Continue;
      end;

      (*
      Saltar := False;
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if (LiqPrOrig.FieldbyName('Registro').AsString = gDetalle.Cells[6,I]) and
          (gDetalle.ColorRow[I] = RGB(255,185,185)) then
        begin
          Saltar := True;
          Break;
        end;
      end;

      if Saltar then
      begin
        LiqPrOrig.Next;
        Continue;
      end;
      *)
      if (LiqPrOrig.Fields[4].AsString = '58') then
      begin
        LiqPrOrig.Next;
        Continue;
      end;

      if LiqPrOrig.FieldbyName('Codinq').AsString <> Trim(Codi) then
      begin

        insertarrepprop('','','','','','','','', '$' + FormatFloat('0.00', ndTotal), '', LiqPrOrig.Fields[3].AsString, LiqPrOrig.Fields[1].AsString);
        if chUbicacion.Checked then
        begin
          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            'INQUILINO: ' + LiqPrOrig.Fields[3].AsString + '  (' + LiqPrOrig.Fields[0].AsString+')',
            LiqPrOrig.Fields[4].AsString,
            '','','', '$' + FormatFloat('0.00', ndTotal), Letras,
            nom+'         ('+codi+')', LiqPrOrig.Fields[1].AsString);

          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            LiqPrOrig.FieldbyName('Ubicacion').AsString,
            LiqPrOrig.Fields[4].AsString,
            '','','', '$' + FormatFloat('0.00', ndTotal), Letras,
            nom+'         ('+codi+')', LiqPrOrig.Fields[1].AsString);

        end
        else
        begin
          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            'INQUILINO: ' + LiqPrOrig.Fields[3].AsString + '  (' + LiqPrOrig.Fields[0].AsString+')',
            LiqPrOrig.Fields[4].AsString,
            '','','', '$' + FormatFloat('0.00', ndTotal), Letras,
            nom+'         ('+codi+')', LiqPrOrig.Fields[1].AsString);
        end;



        ci := LiqPrOrig.Fields[5].AsString;
        se := LiqPrOrig.Fields[6].AsString;
        si := LiqPrOrig.Fields[7].AsString;
        if (LiqPrOrig.Fields[4].AsString = '02') or
           (LiqPrOrig.Fields[4].AsString = '04') or
           (LiqPrOrig.Fields[4].AsString = '05') or
           (LiqPrOrig.Fields[4].AsString = '09') or
           (LiqPrOrig.Fields[4].AsString = '27') then
        begin
          if si= '0.00' then si := '0.00'
        end
        else
        begin
          if si= '0.00' then si := '';
        end;

        insertarrepprop(LiqPrOrig.Fields[0].AsString,
          LiqPrOrig.Fields[3].AsString,
          LiqPrOrig.Fields[2].AsString,
          ci,
          LiqPrOrig.Fields[4].AsString,
          ci,se,si,
          '$' + FormatFloat('0.00', ndTotal),
          Letras,
          ci, LiqPrOrig.Fields[1].AsString);
      end
      else
      begin
        if (i=1) and (nom='') then
        begin
          ci := LiqPrOrig.Fields[5].AsString;
          se := LiqPrOrig.Fields[6].AsString;
          si := LiqPrOrig.Fields[7].AsString;
          if si = '0.00' then
            si := '';

          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            ci,
            LiqPrOrig.Fields[4].AsString,
            ci,se,si,
            '$' + FormatFloat('0.00', ndTotal),
            Letras,
            ci, LiqPrOrig.Fields[1].AsString);
        end;

        ci := LiqPrOrig.Fields[5].AsString;
        se := LiqPrOrig.Fields[6].AsString;
        si := LiqPrOrig.Fields[7].AsString;
        if si='0.00' then
          si := '';

        insertarrepprop(LiqPrOrig.Fields[0].AsString,
          LiqPrOrig.Fields[3].AsString,
          LiqPrOrig.Fields[2].AsString,
          ci,
          LiqPrOrig.Fields[4].AsString,
          ci,se,si,
          '$' + FormatFloat('0.00', ndTotal),
          Letras,
          ci, LiqPrOrig.Fields[1].AsString);
      end;
      nom := LiqPrOrig.FieldbyName('Codinq').AsString;
      codi := LiqPrOrig.FieldbyName('Codinq').AsString;
      LiqPrOrig.Next;
    end;

    Dm.IniciarTransaccion;
    q.SQL.Text := ' Delete from repprop2 where usuario = :Usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    qRepProp.SQL.Text := 'Select * from repprop where usuario = :Usuario order by registro';
    qRepProp.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    qRepProp.Open;

    suma := '0.00';
    Dm.IniciarTransaccion;
    q.SQL.Text := ' ALTER SEQUENCE GEN_repprop RESTART WITH 0';
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    insertarrepprop2('',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '', '', '');

    ant:='';
    boSubtotal := False;

    while not qRepProp.Eof do
    begin
      act:=qRepProp.Fields[0].AsString;
      if ((ant<>act) and (ant<>'')) then
      begin
        insertarrepprop2('',
            '',
            '',
            'Subtotal:',
            '',
            '',
            '',
            '',
            '',
            '','', '');

        insertarrepprop2('',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '','', '');
        suma:='0.00';
        boSubtotal := True;
      end
      else
      begin
        insertarrepprop2(qRepProp.Fields[0].AsString,
          qRepProp.Fields[1].AsString,
          qRepProp.Fields[2].AsString,
          qRepProp.Fields[3].AsString,
          qRepProp.Fields[4].AsString,
          qRepProp.Fields[5].AsString,
          qRepProp.Fields[6].AsString,
          qRepProp.Fields[7].AsString,
          qRepProp.Fields[8].AsString,
          qRepProp.Fields[9].AsString,
          qRepProp.Fields[10].AsString,
          qRepProp.FieldByName('Propietario').AsString);

          boSubtotal := False;
      end;
      ant:=qRepProp.Fields[0].AsString;
      qRepProp.Next;
    end;

    if (not boSubtotal) then
    begin
      insertarrepprop2('',
          '',
          '',
          'Subtotal:',
          '',
          '',
          '',
          '',
          '',
          '','', '');

      insertarrepprop2('',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '','', '');
      suma:='0.00';
    end;

    qRepProp2.sql.text := 'Select * from repprop2 where usuario = :usuario';
    qRepProp2.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    qRepProp2.open;

    num1:=qRepProp2.Fields[7].AsString;

    suma:='0.00';

    while not qRepProp2.eof do
    begin
      num1:=qRepProp2.Fields[7].AsString;
      if Trim(num1)='' then
      begin
        gil:=qRepProp2.Fields[3].AsString;
        Registro:=qRepProp2.Fields[11].AsInteger;
        Delete(gil,9,100);
        if Trim(gil)='Subtotal' then
        begin
          DM.IniciarTransaccion;
          q.SQL.Text := 'UPDATE REPPROP2 SET IMPORTE=:iMPORTE WHERE  REGISTRO=:REGISTRO and usuario = :Usuario';
          q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
          Q.ParamByName('iMPORTE').aSString := Suma;
          Q.ParamByName('registro').aSInteger := Registro;
          q.execsql;
          suma:='0.00';
          DM.ConfirmarTransaccion;
        end;
      end
      else
      begin
        num1:=conversion(num1);
        suma:=conversion(suma);
        suma:=sumar(suma,num1);
        if suma='0' then suma:='000';
          suma:=agregarpunto2(suma);
      end;
      qRepProp2.next;
    end;

    qLiqPro.Sql.text := 'Select * from LiqPrOrig where usuario = :usuario ORDER BY Codinq, Orden, PrioridadFecha, Direccion Asc';
    qLiqPro.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
    qLiqPro.Open;

    q.SQL.text := 'Select * from repprop2 where usuario = :Usuario order by registro';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.Open;

    cdsAnomalias.EmptyDataSet;

    Resultado := False;
    if fxExistenItemsEnCero(cdsDatos) then
    begin
      cdsAnomalias.Append;
      cdsAnomalias.FieldByName('Descripcion').AsString := 'ITEMS CON IMPORTE 0.00';
      cdsAnomalias.Post;
    end;
//    if fxExistenItemsConDecimales(cdsDatos) then
//    begin
//      cdsAnomalias.Append;
//      cdsAnomalias.FieldByName('Descripcion').AsString := 'HAY ITEMS CON DECIMALES.';
//      cdsAnomalias.Post;
//    end;
    if fxExistenItemsEnRecibos(cdsDatos, Recibo) then
    begin
      cdsAnomalias.Append;
      cdsAnomalias.FieldByName('Descripcion').AsString := Recibo;
      cdsAnomalias.Post;
    end;
//    if boHayAlquilerACuenta then
//    begin
//      cdsAnomalias.Append;
//      cdsAnomalias.FieldByName('Descripcion').AsString := 'HAY ALQUILER A CUENTA, SALDO ALQUILER O ART. 7MO.';
//      cdsAnomalias.Post;
//    end;

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

    I := 1;

    while not q.eof do
    begin
      gImpresion.Cells[0,I] := q.FieldByName('Direccion').AsString;
      gImpresion.Cells[1,I] := q.FieldByName('Periodo').AsString;
      gImpresion.Cells[2,I] := q.FieldByName('Importe').AsString;
      gImpresion.Cells[3,I] := q.FieldByName('iva').AsString;
      Inc(I);
      q.Next;
    end;
    if I> 2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;


    q.SQL.Text := 'Select * from repprop2 where usuario = :Usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.Open;

    I := 1;
    gPendiente.Vaciar;
    while not q.Eof do
    begin
      //if (q.Fieldbyname('Importe').AsString='0.00') or (q.Fieldbyname('Importe').AsString='') or (q.Fieldbyname('Inquilino').AsString='') then
      if (q.Fieldbyname('Inquilino').AsString='') then
      begin
        q.Next;
        Continue;
      end;
      gPendiente.Cells[0, I] := q.FieldByName('Codinq').AsString;
      gPendiente.Cells[1, I] := q.FieldByName('Inquilino').AsString;
      gPendiente.Cells[2, I] := q.FieldByName('Fecha').AsString;
      gPendiente.Cells[3, I] := q.FieldByName('Direccion').AsString;
      gPendiente.Cells[4, I] := q.FieldByName('IVa').AsString;
      gPendiente.Cells[5, I] := q.FieldByName('Item').AsString;
      gPendiente.Cells[6, I] := q.FieldByName('Periodo').AsString;
      gPendiente.Cells[7, I] := q.FieldByName('Importe').AsString;
      gPendiente.Cells[8, I] := q.FieldByName('Total').AsString;
      gPendiente.Cells[9, I] := q.FieldByName('Letras').AsString;
      gPendiente.Cells[12, I] := q.FieldByName('Propietario').AsString;
      Inc(I);
      q.Next;
    end;
    if I>2 then
      gPendiente.RowCount := I
    else
      gPendiente.RowCount := 2;

    q.SQL.text := 'Select MailPropietario, PlantillaPropietario from Inmuebles Where Propietario = :Propietario ';
    q.ParamByName('Propietario').AsString := Edit4.Text;
    q.Open;

    objMail := TMail.Create;

    objMail.Mes := DevuelveMes(MonthOf(StrToDate(Edit8.Text)));
    objMail.Anio := YearOf(StrToDate(Edit8.Text));
    objMail.Titulo := 'Liquidación para propietarios';
    objMail.Asunto := 'Liquidación para propietarios';
    objMail.DireccionMail := q.FieldbyName('MailPropietario').AsString;
    objMail.idPlantilla := q.FieldbyName('PlantillaPropietario').AsInteger;

    ImprimirReporte(ReporteFijo, objMail, plReporte, gimpresion, '0', False, sMail);
    ImprimirReporte(ReporteFDuplicado, objMail, plreporte,gimpresion, '0', False, sMail);


    if fConfirmacionRecibos = nil then
      Application.CreateForm(TFConfirmacionRecibos, FConfirmacionRecibos)
    else
      FConfirmacionRecibos.Show;
    fConfirmacionRecibos.cbTipo.ItemIndex := 1;
    fConfirmacionRecibos.cbTipoClick(nil);
    fConfirmacionRecibos.EsLiquidacion := True;
    fConfirmacionRecibos.FormStyle := fsNormal;
    fConfirmacionRecibos.VIsible := False;
    fConfirmacionRecibos.FCodinq := Edit1.text;
    fConfirmacionRecibos.FGrilla := gPendiente;
    fConfirmacionRecibos.ClaveAnomalia := Resultado;
    fConfirmacionRecibos.cdsAnomalias := cdsAnomalias;
    fConfirmacionRecibos.ShowModal;

  finally
    cdsDatos.EnableControls;
    FreeAndNil(q);
    FreeAndNil(qLiqPrOrig);
    FreeAndNil(qRepProp);
    FreeAndNil(qRepProp2);

  end;
end;

procedure TFrmLiquidacionPropietarios.AdvGlowButton1Click(Sender: TObject);
var
  q: TFXQuery;
  qLiqPrOrig: TFXQuery;
  qRepProp: TFXQuery;
  qRepProp2: TFXQuery;
  codi, nom: string;
  ci, se, si: string;
  I: Integer;
  num1, Suma, Ant, Act, gil: string;
  registro: Integer;
  Saltar: Boolean;
  boSubtotal: Boolean;
  Resultado: Boolean;
  Recibo: string;
  ndTotal: Currency;
  boEncontro: Boolean;
  Letras: String;
begin
  q := CrearQuery;
  qLiqPrOrig := CrearQuery;
  qRepProp := CrearQuery;
  qRepProp2:= CrearQuery;
  cdsDatos.DisableControls;
  try
    Dm.IniciarTransaccion;
    q.SQL.Text := ' Delete from repprop where usuario = :Usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.ExecSQL;

    Dm.ConfirmarTransaccion;

    LiqPrOrig.Close;
    LiqPrOrig.Open;

    Dm.IniciarTransaccion;
    q.SQL.Text := ' ALTER SEQUENCE GEN_repprop RESTART WITH 0';
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    nom := '';

    codi := '';
    ndTotal := 0;
    while not LiqPrOrig.eof do
    begin
      boEncontro := False;
      cdsDatos.First;

      while not cdsDatos.eof do
      begin
        if (LiqPrOrig.FieldByName('Registro').AsString = cdsDatos.FieldByName('Registro').AsString) and
           (not cdsDatos.FieldByName('Seleccionado').AsBoolean) then
        begin
          boEncontro := True;
          Break;
        end;
        cdsDatos.Next;
      end;
      if boEncontro then
      begin
        LiqPrOrig.Next;
        Continue;
      end
      else
      begin
        ndTotal := ndTotal + ToFloat(LiqPrOrig.FieldByName('Importe').AsString);
        LiqPrOrig.Next;
      end;
    end;

    Suma := FormatFloat('0.00', ndTotal);
    letras := ImporteEnLetras(ndTotal);
    Edit12.Text := Suma;
    LiqPrOrig.First;
    while not LiqPrOrig.eof do
    begin
      boEncontro := False;
      cdsDatos.First;

      while not cdsDatos.eof do
      begin
        if (LiqPrOrig.FieldByName('Registro').AsString = cdsDatos.FieldByName('Registro').AsString) and
           (not cdsDatos.FieldByName('Seleccionado').AsBoolean) then
        begin
          boEncontro := True;
          Break;
        end;
        cdsDatos.Next;
      end;

      if boEncontro then
      begin
        LiqPrOrig.Next;
        Continue;
      end;

      (*
      Saltar := False;
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if (LiqPrOrig.FieldbyName('Registro').AsString = gDetalle.Cells[6,I]) and
          (gDetalle.ColorRow[I] = RGB(255,185,185)) then
        begin
          Saltar := True;
          Break;
        end;
      end;

      if Saltar then
      begin
        LiqPrOrig.Next;
        Continue;
      end;
      *)

      if LiqPrOrig.FieldbyName('Codinq').AsString <> Trim(Codi) then
      begin
        insertarrepprop('','','','','','','','', '$' + FormatFloat('0.00', ndTotal), '', LiqPrOrig.Fields[3].AsString, LiqPrOrig.Fields[1].AsString);
        if chUbicacion.Checked then
        begin
          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            'INQUILINO: ' + LiqPrOrig.Fields[3].AsString + '  (' + LiqPrOrig.Fields[0].AsString+')',
            LiqPrOrig.Fields[4].AsString,
            '','','', '$' + FormatFloat('0.00', ndTotal), Letras,
            nom+'         ('+codi+')', LiqPrOrig.Fields[1].AsString);

          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            LiqPrOrig.FieldbyName('Ubicacion').AsString,
            LiqPrOrig.Fields[4].AsString,
            '','','', '$' + FormatFloat('0.00', ndTotal), Letras,
            nom+'         ('+codi+')', LiqPrOrig.Fields[1].AsString);

        end
        else
        begin
          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            'INQUILINO: ' + LiqPrOrig.Fields[3].AsString + '  (' + LiqPrOrig.Fields[0].AsString+')',
            LiqPrOrig.Fields[4].AsString,
            '','','', '$' + FormatFloat('0.00', ndTotal), Letras,
            nom+'         ('+codi+')', LiqPrOrig.Fields[1].AsString);
        end;

        ci := LiqPrOrig.Fields[5].AsString;
        se := LiqPrOrig.Fields[6].AsString;
        si := LiqPrOrig.Fields[7].AsString;
        if (LiqPrOrig.Fields[4].AsString = '02') or
           (LiqPrOrig.Fields[4].AsString = '04') or
           (LiqPrOrig.Fields[4].AsString = '05') or
           (LiqPrOrig.Fields[4].AsString = '09') or
           (LiqPrOrig.Fields[4].AsString = '27') then
        begin
          if si= '0.00' then si := '0.00'
        end
        else
        begin
          if si= '0.00' then si := '';
        end;

        insertarrepprop(LiqPrOrig.Fields[0].AsString,
          LiqPrOrig.Fields[3].AsString,
          LiqPrOrig.Fields[2].AsString,
          ci,
          LiqPrOrig.Fields[4].AsString,
          ci,se,si,
          '$' + FormatFloat('0.00', ndTotal),
          Letras,
          ci, LiqPrOrig.Fields[1].AsString);
      end
      else
      begin
        if (i=1) and (nom='') then
        begin
          ci := LiqPrOrig.Fields[5].AsString;
          se := LiqPrOrig.Fields[6].AsString;
          si := LiqPrOrig.Fields[7].AsString;
          if si = '0.00' then
            si := '';

          insertarrepprop(LiqPrOrig.Fields[0].AsString,
            LiqPrOrig.Fields[3].AsString,
            LiqPrOrig.Fields[2].AsString,
            ci,
            LiqPrOrig.Fields[4].AsString,
            ci,se,si,
            '$' + FormatFloat('0.00', ndTotal),
            Letras,
            ci, LiqPrOrig.Fields[1].AsString);
        end;

        ci := LiqPrOrig.Fields[5].AsString;
        se := LiqPrOrig.Fields[6].AsString;
        si := LiqPrOrig.Fields[7].AsString;
        if si='0.00' then
          si := '';

        insertarrepprop(LiqPrOrig.Fields[0].AsString,
          LiqPrOrig.Fields[3].AsString,
          LiqPrOrig.Fields[2].AsString,
          ci,
          LiqPrOrig.Fields[4].AsString,
          ci,se,si,
          '$' + FormatFloat('0.00', ndTotal),
          Letras,
          ci, LiqPrOrig.Fields[1].AsString);
      end;
      nom := LiqPrOrig.FieldbyName('Codinq').AsString;
      codi := LiqPrOrig.FieldbyName('Codinq').AsString;
      LiqPrOrig.Next;
    end;

    Dm.IniciarTransaccion;
    q.SQL.Text := ' Delete from repprop2 where usuario = :Usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.ExecSQL;

    Dm.ConfirmarTransaccion;

    qRepProp.SQL.Text := 'Select * from repprop where usuario = :Usuario order by registro';
    qRepProp.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    qRepProp.Open;

    suma := '0.00';
    Dm.IniciarTransaccion;
    q.SQL.Text := ' ALTER SEQUENCE GEN_repprop RESTART WITH 0';
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    insertarrepprop2('',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '', '', '');

    ant:='';
    boSubtotal := False;

    while not qRepProp.Eof do
    begin
      act:=qRepProp.Fields[0].AsString;
      if ((ant<>act) and (ant<>'')) then
      begin
        insertarrepprop2('',
            '',
            '',
            'Subtotal:',
            '',
            '',
            '',
            '',
            '',
            '','', '');

        insertarrepprop2('',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '','', '');
        suma:='0.00';
        boSubtotal := True;
      end
      else
      begin
        insertarrepprop2(qRepProp.Fields[0].AsString,
          qRepProp.Fields[1].AsString,
          qRepProp.Fields[2].AsString,
          qRepProp.Fields[3].AsString,
          qRepProp.Fields[4].AsString,
          qRepProp.Fields[5].AsString,
          qRepProp.Fields[6].AsString,
          qRepProp.Fields[7].AsString,
          qRepProp.Fields[8].AsString,
          qRepProp.Fields[9].AsString,
          qRepProp.Fields[10].AsString,
          qRepProp.FieldByName('Propietario').AsString);

          boSubtotal := False;
      end;
      ant:=qRepProp.Fields[0].AsString;
      qRepProp.Next;
    end;

    if (not boSubtotal) then
    begin
      insertarrepprop2('',
          '',
          '',
          'Subtotal:',
          '',
          '',
          '',
          '',
          '',
          '','', '');

      insertarrepprop2('',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '','', '');
      suma:='0.00';
    end;

    qRepProp2.sql.text := 'Select * from repprop2 where usuario = :usuario';
    qRepProp2.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    qRepProp2.open;

    num1:=qRepProp2.Fields[7].AsString;

    suma:='0.00';

    while not qRepProp2.eof do
    begin
      num1:=qRepProp2.Fields[7].AsString;
      if Trim(num1)='' then
      begin
        gil:=qRepProp2.Fields[3].AsString;
        Registro:=qRepProp2.Fields[11].AsInteger;
        Delete(gil,9,100);
        if Trim(gil)='Subtotal' then
        begin
          DM.IniciarTransaccion;
          q.SQL.Text := 'UPDATE REPPROP2 SET IMPORTE=:iMPORTE WHERE  REGISTRO=:REGISTRO and usuario = :usuario';
          q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
          Q.ParamByName('iMPORTE').aSString := Suma;
          Q.ParamByName('registro').aSInteger := Registro;
          q.execsql;
          suma:='0.00';
          DM.ConfirmarTransaccion;
        end;
      end
      else
      begin
        num1:=conversion(num1);
        suma:=conversion(suma);
        suma:=sumar(suma,num1);
        if suma='0' then suma:='000';
          suma:=agregarpunto2(suma);
      end;
      qRepProp2.next;
    end;

    qLiqPro.Sql.text := 'Select * from LiqPrOrig where usuario = :usuario ORDER BY Codinq, Orden, PrioridadFecha, Direccion Asc';
    qLiqPro.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
    qLiqPro.Open;

    q.SQL.text := 'Select * from repprop2 where usuario = :usuario order by registro';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.Open;

    I := 1;

    while not q.eof do
    begin
      gImpresion.Cells[0,I] := q.FieldByName('Direccion').AsString;
      gImpresion.Cells[1,I] := q.FieldByName('Periodo').AsString;
      gImpresion.Cells[2,I] := q.FieldByName('Importe').AsString;
      gImpresion.Cells[3,I] := q.FieldByName('iva').AsString;
      Inc(I);
      q.Next;
    end;
    if I> 2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;


    q.SQL.Text := 'Select * from repprop2 where usuario = :usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.Open;

    I := 1;
    gPendiente.Vaciar;
    while not q.Eof do
    begin
      //if (q.Fieldbyname('Importe').AsString='0.00') or (q.Fieldbyname('Importe').AsString='') or (q.Fieldbyname('Inquilino').AsString='') then
      if (q.Fieldbyname('Inquilino').AsString='') then
      begin
        q.Next;
        Continue;
      end;
      gPendiente.Cells[0, I] := q.FieldByName('Codinq').AsString;
      gPendiente.Cells[1, I] := q.FieldByName('Inquilino').AsString;
      gPendiente.Cells[2, I] := q.FieldByName('Fecha').AsString;
      gPendiente.Cells[3, I] := q.FieldByName('Direccion').AsString;
      gPendiente.Cells[4, I] := q.FieldByName('IVa').AsString;
      gPendiente.Cells[5, I] := q.FieldByName('Item').AsString;
      gPendiente.Cells[6, I] := q.FieldByName('Periodo').AsString;
      gPendiente.Cells[7, I] := q.FieldByName('Importe').AsString;
      gPendiente.Cells[8, I] := q.FieldByName('Total').AsString;
      gPendiente.Cells[9, I] := q.FieldByName('Letras').AsString;
      gPendiente.Cells[12, I] := q.FieldByName('Propietario').AsString;
      Inc(I);
      q.Next;
    end;
    if I>2 then
      gPendiente.RowCount := I
    else
      gPendiente.RowCount := 2;

    q.SQL.text := 'Select MailPropietario, PlantillaPropietario from Inmuebles Where Propietario = :Propietario ';
    q.ParamByName('Propietario').AsString := Edit4.Text;
    q.Open;

    objMail := TMail.Create;

    objMail.Mes := DevuelveMes(MonthOf(StrToDate(Edit8.Text)));
    objMail.Anio := YearOf(StrToDate(Edit8.Text));
    objMail.Titulo := 'Liquidación para propietarios';
    objMail.Asunto := 'Liquidación para propietarios';
    objMail.DireccionMail := q.FieldbyName('MailPropietario').AsString;
    objMail.idPlantilla := q.FieldbyName('PlantillaPropietario').AsInteger;


    ImprimirReporte(Reporte, objMail, plReporte, gimpresion, '0', False, sMail);
  finally
    FreeAndNil(q);
    FreeAndNil(qLiqPrOrig);
    FreeAndNil(qRepProp);
    FreeAndNil(qRepProp2);
    cdsDatos.EnableControls;
  end;
end;

procedure TFrmLiquidacionPropietarios.actCalculoExpensasExecute(
  Sender: TObject);
var
 i:integer;
 cod,E:string;
 f,fd,fda,D:string;
 c,cd:string;
 ibqConsulta: TFXQuery;
 qImpuestos: TFXQuery;
 q: TFXQuery;
 Estado: Boolean;
begin
  ProgressBar1.Min := 0;
  ProgressBar1.Max := gLista.RowCount - 1;
  ibqConsulta := CrearQuery;
  qImpuestos := CrearQuery;
  q := CrearQuery;
  qImpuestos := CrearQuery;

  DM.IniciarTransaccion;
  try
    try
      for I := 1 to gLista.RowCount - 1 do
      begin
        ProgressBar1.Position := I;
        gLista.GetCheckboxState(0, I, Estado);
        if not Estado then
          Continue;
        cod := gLista.Cells[1, I];
        f   := Edit8.Text;
        fd  := Edit8.Text;
        f   := FechaAlReves(f);
        fd  := FechaAlReves(fd);
        Delete(f,7,2);
        Delete(fd,7,2);
        f   := f + '05';
        fda := fd + '05';
        fd  := fd + '10';
        c   := f + cod + '09';
        E   := fda + cod + '28';
        cd  := fd + cod + '29';

        With ibqConsulta do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from itemautom where CLAVE=:clave and PERIODO like :PERIODO');
          ParamByName('clave').AsString:=cd;
          ParamByName('PERIODO').AsString:='EXPS. COMUNES%';
          Open;
        end;

        if not ibqConsulta.IsEmpty then
        begin
          q.Close;
          Q.SQL.Text := 'delete from itemautom where CLAVE=:clave and PERIODO like :PERIODO';
          q.ParamByName('clave').AsString:=cd;
          q.ParamByName('PERIODO').AsString:='EXPS. COMUNES%';
          q.ExecSql;
        end;

      //  if DM.ibqConsulta.RecordCount = 0 then
      //  begin
        ibqConsulta.Close;
        ibqConsulta.Sql.Clear;
        ibqConsulta.Sql.Add('select * from itemautom where CLAVE=:clave and PERIODO like :PERIODO');
        ibqConsulta.ParamByName('clave').AsString:=e;
        ibqConsulta.ParamByName('PERIODO').AsString:='EXPS. COMUNES%';
        ibqConsulta.Open;

        while not ibqConsulta.Eof do
        begin
          D := ibqConsulta.Fields[3].AsString;
          f := Edit8.Text;
          f := FechaAlReves(f);
          Delete(f,7,2);
          f := f + '10';
          c := f + cod + '29';

          InsertarItemautom(Cod, F, 'SE ENTREGA COMPROB. ABONADO DE', AnsiReplaceStr(D, 'PER. ', ''), '0.00', Edit4.Text, '29', 3);
          ibqConsulta.Next;
        end;
      end;
      dm.ConfirmarTransaccion;
    except
      dm.CancelarTransaccion;
    end;
  Finally
    FreeAndNil(ibqConsulta);
    FreeAndNil(qImpuestos);
    FreeAndNil(q);
    ProgressBar1.Position := 0;
  end;
end;

procedure TFrmLiquidacionPropietarios.actCalculoDeItemsALiquidarExecute(
  Sender: TObject);
var
 i,L:integer;
 a,calle,fecha,inq,pro,fde,fha:string;
 noms,cods,num1,letras,suma, cos:string;
 q: TFXQuery;
 qImpuestos: TFXQuery;
 ibqConsulta: TFXQuery;
 qryConsulta: TFXQuery;
 Estado: Boolean;
begin
  actCalculoExpensas.Execute;
  q := CrearQuery;
  qImpuestos := CrearQuery;
  ibqConsulta := CrearQuery;
  qryConsulta := CrearQuery;
  DM.iniciarTransaccion;
  try
    try
      noms:='';
      cos:='';

      q.SQL.Text := 'Delete from Masitems where usuario= :USUARIO';
      Q.ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
      q.ExecSQL;

      inq := Edit1.Text;
      a   := Edit1.Text;
      pro := Edit4.Text;
      fde := Edit6.Text;
      fha := Edit8.Text;
      fde := FechaAlReves(fde);
      fha := FechaAlReves(fha);

      With ibqConsulta do
      begin
        Close;
        Sql.Clear;
        Sql.Text :=
         ' Select I.Codinq, I.Fecha, I.Item, I.Periodo, I.Importe, '+
         ' I.CodPro, I.Coditem, I.Clave, I.TipoIngreso, I.Registro, '+
         ' case when I.Periodo Like ''%ENERO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO) + 1 FOR 4)||''01'' '+
         ' when I.Periodo Like ''%FEBRERO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''02'''+
         ' when I.Periodo Like ''%MARZO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''03'''+
         ' when I.Periodo Like ''%ABRIL/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''04'''+
         ' when I.Periodo Like ''%MAYO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''05'''+
         ' when I.Periodo Like ''%JUNIO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''06'''+
         ' when I.Periodo Like ''%JULIO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''07'''+
         ' when I.Periodo Like ''%AGOSTO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''08'''+
         ' when I.Periodo Like ''%SEPTIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''09'''+
         ' when I.Periodo Like ''%OCTUBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''10'''+
         ' when I.Periodo Like ''%NOVIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''11'''+
         ' when I.Periodo Like ''%DICIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''12'''+
         ' when I.Periodo Like ''%01/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO) + 1 FOR 4)||''01'''+
         ' when I.Periodo Like ''%02/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''02'''+
         ' when I.Periodo Like ''%03/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''03'''+
         ' when I.Periodo Like ''%04/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''04'''+
         ' when I.Periodo Like ''%05/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''05'''+
         ' when I.Periodo Like ''%06/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''06'''+
         ' when I.Periodo Like ''%07/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''07'''+
         ' when I.Periodo Like ''%08/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''08'''+
         ' when I.Periodo Like ''%09/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''09'''+
         ' when I.Periodo Like ''%10/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''10'''+
         ' when I.Periodo Like ''%11/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''11'''+
         ' when I.Periodo Like ''%12/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''12'''+
         ' else -1 end as Mes, '+
         '  C.orden '+
         '   From ItemAutom I'+
         '   Inner join Conceptos C on C.codigo = I.coditem' +
         '   Where i.codpro=:codpro '+
         '     and i.tipoingreso <> 1 '+
         '     and i.fecha>=:fechad '+
         '     and i.fecha <=:fechah '+
         '     and (c.inqprop<>1)'+
         '   Order by 1 asc, 12 asc, 11 asc ';

        ParamByName('codpro').AsString:=Trim(pro);
        ParamByName('fechad').AsString:=fde;
        ParamByName('fechah').AsString:=fha;
        Open;

        while not ibqConsulta.Eof do
        begin
         qImpuestos.SQL.Text := 'Select entregarImpuestos from Inmuebles where codinq=:Codinq';
         qImpuestos.ParamByName('codInq').AsString:=Fieldbyname('Codinq').AsString;
         qImpuestos.Open;

         if (ibqConsulta.fieldbyname('Coditem').AsString = '29') and (qImpuestos.fieldbyname('EntregarImpuestos').AsInteger = 0) then
         else
           InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
              ibqConsulta.fieldbyname('Fecha').AsString,
              ibqConsulta.fieldbyname('Item').AsString,
              ibqConsulta.fieldbyname('Periodo').AsString,
              FormatFloat('0.00', ToFloat(ibqConsulta.fieldbyname('Importe').AsString)),
              ibqConsulta.fieldbyname('CodPro').AsString,
              ibqConsulta.fieldbyname('Coditem').AsString,
              ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
              ibqConsulta.Recno,
              '','',
              ibqConsulta.fieldbyname('Orden').AsInteger,
              ibqConsulta.fieldbyname('Mes').AsInteger);
          ibqConsulta.Next;
        end;
      end;

      q.SQL.Text := 'Delete from MasitemsR where usuario = :USUARIO';
      Q.ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
      q.ExecSQL;

      for I := 1 to gLista.RowCount - 1 do
      begin
        if gLista.GetCheckboxState(0, I, Estado) then
        begin
          with qryConsulta do
          begin
            Calle := gLista.Cells[2, I];
            Close;
            Sql.clear;
            Sql.Add('select * from masitems m, inmuebles i where usuario =:Usuario and m.codinq=i.codinq and i.ubicacion=:ubicacion order by m.codinq, m.Orden, m.PrioridadFecha, M.ITEM, M.PERIODO');
            ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
            ParamByName('ubicacion').AsString:=calle;
            Open;

            while not eof do
            begin
              InsertarMasItemR(Fields[0].AsString,
                Fields[1].AsString,
                Fields[2].AsString,
                Fields[3].AsString,
                Fields[4].AsString,
                Fields[5].AsString,
                Fields[6].AsString,
                3,
                Fields[8].AsInteger,
                '','',
                FieldbyName('Orden').AsInteger,
                FieldbyName('PrioridadFecha').AsInteger);
              Next;
            end;
          end;
        end;
      end;

      suma := '0.00';
      with qryConsulta do
      begin
        Close;
        Sql.clear;
        Sql.Add('Select * from masitemsr where usuario = :usuario order by codinq,Orden, PrioridadFecha, item, PERIODO');
        ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;

        Open;

        while not eof do
        begin
          cods := Fields[6].AsString;
          num1 := Fields[4].AsString;
          if POS('-', num1) = 1 then
          else
          begin
            if (cods='12') or (cods='27') or (cods='121') then
              num1 :='-' + Fields[4].AsString
            else
              num1 := Fields[4].AsString;
          end;
          if num1 = '0.00' then
            num1 := '000'
          else
            num1 := Conversion(num1);
          suma := Conversion(suma);
          suma := Sumar(num1,suma);
          if suma = '0' then
            suma := '000';
          suma   := Agregarpunto2(suma);
          letras := ImporteEnLetras(suma);
          Next;
        end;

        q.SQL.Text := 'Delete from LiqPrOrig where usuario = :usuario';
        q.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
        q.ExecSQL;

        Close;
        Sql.clear;
        Sql.Add('Select * from masitemsr m, inmuebles i where m.usuario = :usuario and m.codinq=i.codinq order by m.codinq,m.Orden, m.PrioridadFecha, m.coditem,m.item, M.PERIODO');
        ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
        Open;

        Fecha := Edit7.Text;
        Fecha := FechaEnLetras(Fecha);
        Fecha := 'Córdoba, '+ Fecha;
        L := Length(letras);
        L := 116 - L;

        for I := 1 to L do
          Letras := Letras + '-';

        While not eof do
        begin
          cods := Fields[6].AsString;
          num1 := Fields[4].AsString;
          if num1[1] = '-' then
          else
          begin
            if (cods='12') or (cods='27') or (cods='121') then
              num1 := '-'+ Fields[4].AsString
            else
              num1 := Fields[4].AsString;
          end;
          if (Fields[15].AsString = noms) and (cos = Fields[0].AsString) then
            noms:=' '
          else
            noms := Fields[15].AsString;

          InsertarLiqPrOrigBase(Fields[0].AsString,
            Edit4.Text,
            Fecha,
            noms,
            Fields[6].AsString,
            Fields[2].AsString,
            Fields[3].AsString,
            num1,
            '$' + suma,
            Uppercase(Letras),
            FieldbyName('Orden').AsInteger,
            FieldbyName('PrioridadFecha').AsInteger,
            FieldbyName('Registro').AsInteger);
          noms := Fields[15].AsString;
          cos := Fields[0].AsString;
          Next;
        end;
        Edit12.Text:= suma;

        q.sql.text := 'UPDATE LIQPRORIG SET PERIODO = :PERIODO WHERE ITEM=:ITEM and usuario = :usuario';
        q.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
        q.ParamByName('Periodo').AsString := 'SEGUN RECIBO Nº: '+Edit10.Text;
        q.ParamByName('Item').AsString :=  'COMISION POR ADMINISTRACION';
        q.ExecSql;

        Close;
        Sql.Clear;
        Sql.add('Select * from masitemsr where usuario = :Usuario order by codinq,orden, prioridadfecha, coditem,item');
        ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;

        Open;
      end;

      q.SQL.Text := 'Select L.*, I.Ubicacion from LiqPrOrig L Inner Join Inmuebles I on I.Codinq = L.COdinq where L.usuario = :usuario Order by Codinq, Orden, PrioridadFecha ';
      q.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
      q.Open;

      dspLiqPrOrig.DataSet := q;
      LiqPrOrig.Data := dspLiqPrOrig.Data;
      DM.ConfirmarTransaccion;
    except
      DM.CancelarTransaccion;
    end;

  finally
    FreeAndNil(q);
    FreeAndNil(qImpuestos);
    FreeAndNil(ibqConsulta);
    FreeAndNil(qryConsulta);
  end;
end;

procedure TFrmLiquidacionPropietarios.prCalcularItems;
var
 cod,c,i,j,L,z,x:integer;
 a,calle,codi,fecha,inq,pro,fli,fde,fha:string;
 item,noms,cods,num1,letras,suma, cos:string;
 pun:string;
 q: TFXQuery;
 qImpuestos: TFXQuery;
 ibqConsulta: TFXQuery;
 qOrden: TFXQuery;
 qryConsulta: TFXQuery;
 boAbonaCompleto: Boolean;
 stPeriodo: String;
 stImporte: string;
 InquilinoAnt: string;
 Fila: Integer;
 slInquilinos: TStringList;
 boEncontrado: Boolean;
 Estado: Boolean;
 Resultado: Boolean;
 NDtOTAL, Cents: Double;
 qIngreso: TFXQuery;
 qGastoBancario, qBorraGastoBancario: TFXQuery;
 ndGastoBancario: Double;
 stPeriodoGasto: string;
 boExisteGasto: Boolean;
 boInserto: Boolean;
begin
  actCalculoExpensas.Execute;
  q := CrearQuery;
  qIngreso := CrearQuery;
  qImpuestos := CrearQuery;
  qGastoBancario := CrearQuery;
  qOrden := CrearQuery;
  ibqConsulta := CrearQuery;
  qryConsulta := CrearQuery;
  slInquilinos := TStringList.Create;
  try
    noms:='';
    cos:='';

    for i := 1 to gLista.RowCount - 1 do
      if gLista.GetCheckboxState(0, I, Estado) then
      begin
        inq := Edit1.Text;
        a   := Edit1.Text;
        pro := Edit4.Text;
        fde := Edit6.Text;
        fha := Edit8.Text;
        fde := FechaAlReves(fde);
        fha := FechaAlReves(fha);

        With ibqConsulta do
        begin
          Close;
          Sql.Clear;
          Sql.Text :=
           ' Select I.Codinq, I.Fecha, I.Item, I.Periodo, I.Importe, '+
           ' I.CodPro, I.Coditem, I.Clave, I.TipoIngreso, I.Registro, '+
           ' case when I.Periodo Like ''%ENERO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO) + 1 FOR 4)||''01'' '+
           ' when I.Periodo Like ''%FEBRERO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''02'''+
           ' when I.Periodo Like ''%MARZO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''03'''+
           ' when I.Periodo Like ''%ABRIL/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''04'''+
           ' when I.Periodo Like ''%MAYO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''05'''+
           ' when I.Periodo Like ''%JUNIO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''06'''+
           ' when I.Periodo Like ''%JULIO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''07'''+
           ' when I.Periodo Like ''%AGOSTO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''08'''+
           ' when I.Periodo Like ''%SEPTIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''09'''+
           ' when I.Periodo Like ''%OCTUBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''10'''+
           ' when I.Periodo Like ''%NOVIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''11'''+
           ' when I.Periodo Like ''%DICIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''12'''+
           ' when I.Periodo Like ''%01/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO) + 1 FOR 4)||''01'''+
           ' when I.Periodo Like ''%02/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''02'''+
           ' when I.Periodo Like ''%03/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''03'''+
           ' when I.Periodo Like ''%04/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''04'''+
           ' when I.Periodo Like ''%05/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''05'''+
           ' when I.Periodo Like ''%06/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''06'''+
           ' when I.Periodo Like ''%07/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''07'''+
           ' when I.Periodo Like ''%08/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''08'''+
           ' when I.Periodo Like ''%09/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''09'''+
           ' when I.Periodo Like ''%10/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''10'''+
           ' when I.Periodo Like ''%11/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''11'''+
           ' when I.Periodo Like ''%12/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''12'''+
           ' else -1 end as Mes, '+
           '  C.orden, M.Inquilino, M.MailPropietario '+
           '   From ItemAutom I ' +
           '   Inner Join Inmuebles M on I.Codinq = M.Codinq '+
           '   Inner join Conceptos C on C.codigo = I.coditem' +
           '   Where i.codinq=:codinq '+
           '     and i.tipoingreso <> 1 '+
           '     and C.Codigo = ''08'' '+
           '     and i.fecha>=:fechad '+
           '     and i.fecha <=:fechah '+
           '     and ((c.inqprop<>1) or ((c.inqprop=1)and (i.coditem = ''08'')))'+
           '   Order by 1 asc, 12 asc, 11 asc ';

          ParamByName('codinq').AsString:=Trim(gLista.Cells[1,I]);
          ParamByName('fechad').AsString:=fde;
          ParamByName('fechah').AsString:=fha;
          Open;

          if not ibqConsulta.IsEmpty then
          begin
            gLista.Cells[3,I] := 'TIENE ART. 7MO.';
            gLista.FontColors[3,I] := clRed;
            gLista.FontStyles[3, I] := gLista.FontStyles[3, I] + [fsBold];
            gLista.FontNames[3, I] := 'SEGOE UI';

            Estado := MostrarDialogoSiNo('¿Desea abonar el: ' + #13#10 +
               'ALQUILER' + ' CORRESPONDE ' +
               stPeriodo + #13#10 +
               'Del inquilino: ' + ibqConsulta.fieldbyname('Codinq').AsString + ' - ' + ibqConsulta.fieldbyname('Inquilino').AsString + #13#10 +
               'correspondiente a Articulo 7mo. contrato de locacion?');
          end;
//          else
//            Estado := True;

          gLista.SetCheckboxState(0, I, Estado);

          if Estado then
            slInquilinos.Add(gLista.Cells[1,I])
        end;
      end;

    DM.iniciarTransaccion;
    q.SQL.Text := 'Delete from Masitems where usuario = :USUARIO';
    Q.ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
    q.ExecSQL;
    DM.ConfirmarTransaccion;

    inq := Edit1.Text;
    a   := Edit1.Text;
    pro := Edit4.Text;
    fde := Edit6.Text;
    fha := Edit8.Text;
    fde := FechaAlReves(fde);
    fha := FechaAlReves(fha);

    With ibqConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.Text :=
       ' Select I.Codinq, I.Fecha, I.Item, I.Periodo, I.Importe, '+
       ' I.CodPro, I.Coditem, I.Clave, I.TipoIngreso, I.Registro, '+
       ' case when I.Periodo Like ''%ENERO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO) + 1 FOR 4)||''01'' '+
       ' when I.Periodo Like ''%FEBRERO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''02'''+
       ' when I.Periodo Like ''%MARZO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''03'''+
       ' when I.Periodo Like ''%ABRIL/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''04'''+
       ' when I.Periodo Like ''%MAYO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''05'''+
       ' when I.Periodo Like ''%JUNIO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''06'''+
       ' when I.Periodo Like ''%JULIO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''07'''+
       ' when I.Periodo Like ''%AGOSTO/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''08'''+
       ' when I.Periodo Like ''%SEPTIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''09'''+
       ' when I.Periodo Like ''%OCTUBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''10'''+
       ' when I.Periodo Like ''%NOVIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''11'''+
       ' when I.Periodo Like ''%DICIEMBRE/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''12'''+
       ' when I.Periodo Like ''%01/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO) + 1 FOR 4)||''01'''+
       ' when I.Periodo Like ''%02/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''02'''+
       ' when I.Periodo Like ''%03/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''03'''+
       ' when I.Periodo Like ''%04/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''04'''+
       ' when I.Periodo Like ''%05/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''05'''+
       ' when I.Periodo Like ''%06/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''06'''+
       ' when I.Periodo Like ''%07/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''07'''+
       ' when I.Periodo Like ''%08/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''08'''+
       ' when I.Periodo Like ''%09/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''09'''+
       ' when I.Periodo Like ''%10/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''10'''+
       ' when I.Periodo Like ''%11/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''11'''+
       ' when I.Periodo Like ''%12/20%'' THEN SUBSTRING(I.PERIODO FROM POSITION(''/20'', I.PERIODO)+1 FOR 4)||''12'''+
       ' else -1 end as Mes, '+
       '  C.orden, M.Inquilino, M.MailPropietario '+
       '   From ItemAutom I ' +
       '   Inner Join Inmuebles M on I.Codinq = M.Codinq '+
       '   Inner join Conceptos C on C.codigo = I.coditem' +
       '   Where i.codpro=:codpro '+
       '     and i.tipoingreso <> 1 '+
       '     and i.fecha>=:fechad '+
       '     and i.fecha <=:fechah '+
       '     and ((c.inqprop<>1) or ((c.inqprop=1)and (i.coditem = ''08'')))'+
       '   Order by 1 asc, 12 asc, 11 asc ';

      ParamByName('codpro').AsString:=Trim(pro);
      ParamByName('fechad').AsString:=fde;
      ParamByName('fechah').AsString:=fha;
      Open;

      InquilinoAnt := '';
      while not ibqConsulta.Eof do
      begin
        sMail := ibqConsulta.FieldByName('MailPropietario').AsString;

        boEncontrado := False;
        for I := 0 to slInquilinos.Count - 1 do
          if slInquilinos.Strings[I] = ibqConsulta.FieldByName('Codinq').AsString then
          begin
            boEncontrado := True;
            break;
          end;

        if not boEncontrado then
        begin
          ibqConsulta.Next;
          Continue;
        end;

        qImpuestos.SQL.Text := 'Select entregarImpuestos, Alquiler from Inmuebles where codinq=:Codinq';
        qImpuestos.ParamByName('codInq').AsString:=Fieldbyname('Codinq').AsString;
        qImpuestos.Open;

        if (ibqConsulta.fieldbyname('Coditem').AsString = '29') and (qImpuestos.fieldbyname('EntregarImpuestos').AsInteger = 0) then
        else
        begin
          if (ibqConsulta.fieldbyname('Coditem').AsString = '20') or (ibqConsulta.fieldbyname('Coditem').AsString = '30') or (ibqConsulta.fieldbyname('Coditem').AsString = '08') then
          begin
            if ibqConsulta.fieldbyname('Coditem').AsString = '20' then
            begin
              if Pos('CORRESPONDE', ibqConsulta.fieldbyname('Periodo').AsString) = 1 THEN
                stPeriodo := Copy(ibqConsulta.fieldbyname('Periodo').AsString, 13, 100)
              else
                stPeriodo := Copy(ibqConsulta.fieldbyname('Periodo').AsString, 19, 100);

              if MostrarDialogoSiNo('¿Desea abonar el: ' + #13#10 +
                 'ALQUILER' + ' CORRESPONDE ' +
                 stPeriodo + ' Por: $ ' +
                 FormatFloat('0.00', ToFloat(qImpuestos.fieldbyname('Alquiler').AsString))+ #13#10 +
                 'Del inquilino: ' + ibqConsulta.fieldbyname('Codinq').AsString + ' - ' + ibqConsulta.fieldbyname('Inquilino').AsString + #13#10 +
                 'en forma completa?') then
              begin
                boHayAlquilerACuenta := True;
                qOrden.SQL.Text :=
                  ' Select Orden '+
                  '   From Conceptos '+
                  '  Where Codigo = 01 ';
                qOrden.Open;

                stPeriodoGasto := 'CORRESPONDE ' + stPeriodo;

                InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
                  ibqConsulta.fieldbyname('Fecha').AsString,
                  'ALQUILER',
                  'CORRESPONDE ' + stPeriodo,
                  FormatFloat('0.00', ToFloat(qImpuestos.fieldbyname('Alquiler').AsString)),
                  ibqConsulta.fieldbyname('CodPro').AsString,
                  '01',
                  ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
                  ibqConsulta.Recno,
                  '','',
                  qOrden.fieldbyname('Orden').AsInteger,
                  ibqConsulta.fieldbyname('Mes').AsInteger);
              end
              else
              begin
                qOrden.SQL.Text :=
                  ' Select Orden '+
                  '   From Conceptos '+
                  '  Where Codigo = 20 ';
                qOrden.Open;

                InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
                  ibqConsulta.fieldbyname('Fecha').AsString,
                  ibqConsulta.fieldbyname('Item').AsString,
                  ibqConsulta.fieldbyname('Periodo').AsString,
                  FormatFloat('0.00', ToFloat(ibqConsulta.fieldbyname('Importe').AsString)),
                  ibqConsulta.fieldbyname('CodPro').AsString,
                  ibqConsulta.fieldbyname('Coditem').AsString,
                  ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
                  ibqConsulta.Recno,
                  '','',
                  qOrden.fieldbyname('Orden').AsInteger,
                  ibqConsulta.fieldbyname('Mes').AsInteger);
              end;
            end
            else if ibqConsulta.fieldbyname('Coditem').AsString = '08' then
            begin
              if Pos('CONTRATO DE LOCA', ibqConsulta.fieldbyname('Periodo').AsString) > 1 THEN
              begin
                stPeriodo := InputBox('Cambio de Articulo 7mo. por Alquiler', 'Mes Alquiler', '');
                stImporte := InputBox('Importe alquiler a abonar', 'Importe:', FormatFloat('0.00', ToFloat(qImpuestos.fieldbyname('Alquiler').AsString)));
                if MostrarDialogoSiNo('¿Desea abonar el: ' + #13#10 +
                   'ALQUILER' + ' CORRESPONDE ' +
                   stPeriodo + ' Por: $ ' +
                   FormatFloat('0.00', ToFloat(stImporte))+ #13#10 +
                   'Del inquilino: ' + ibqConsulta.fieldbyname('Codinq').AsString + ' - ' + ibqConsulta.fieldbyname('Inquilino').AsString + #13#10 +
                   'correspondiente a Articulo 7mo. contrato de locacion?') then
                begin
                  boHayAlquilerACuenta := True;
                  qOrden.SQL.Text :=
                    ' Select Orden '+
                    '   From Conceptos '+
                    '  Where Codigo = 01 ';
                  qOrden.Open;
                  stPeriodoGasto := 'CORRESPONDE ' + stPeriodo;

                  InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
                    ibqConsulta.fieldbyname('Fecha').AsString,
                   'ALQUILER',
                   'CORRESPONDE ' + STPERIODO,
                   FormatFloat('0.00', ToFloat(stImporte)),
                   ibqConsulta.fieldbyname('CodPro').AsString,
                   '01',
                   ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
                   ibqConsulta.Recno,
                   '','',
                   qOrden.fieldbyname('Orden').AsInteger,
                   ibqConsulta.fieldbyname('Mes').AsInteger);
                end
                ELSE
                BEGIN
                  InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
                   ibqConsulta.fieldbyname('Fecha').AsString,
                   ibqConsulta.fieldbyname('Item').AsString,
                   ibqConsulta.fieldbyname('Periodo').AsString,
                   FormatFloat('0.00', ToFloat(ibqConsulta.fieldbyname('Importe').AsString)),
                   ibqConsulta.fieldbyname('CodPro').AsString,
                   ibqConsulta.fieldbyname('Coditem').AsString,
                   ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
                   ibqConsulta.Recno,
                   '','',
                   ibqConsulta.fieldbyname('Orden').AsInteger,
                   ibqConsulta.fieldbyname('Mes').AsInteger);
                END;
              end
            end
            else
            begin
//              if not boAbonaCompleto then
//              begin
              if ibqConsulta.fieldbyname('Coditem').AsString = '30' then
              begin
                if MostrarDialogoSiNo('¿Desea abonar el: ' + #13#10 +
                   ibqConsulta.fieldbyname('Item').AsString + ' ' +
                   ibqConsulta.fieldbyname('Periodo').AsString + ' Por: $ ' +
                   FormatFloat('0.00', ToFloat(ibqConsulta.fieldbyname('Importe').AsString))+ #13#10 +
                   'Del inquilino: ' + ibqConsulta.fieldbyname('Codinq').AsString + ' - ' + ibqConsulta.fieldbyname('Inquilino').AsString +
                   '?') then
                   begin
                    boHayAlquilerACuenta := True;
                    InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
                     ibqConsulta.fieldbyname('Fecha').AsString,
                     ibqConsulta.fieldbyname('Item').AsString,
                     ibqConsulta.fieldbyname('Periodo').AsString,
                     FormatFloat('0.00', ToFloat(ibqConsulta.fieldbyname('Importe').AsString)),
                     ibqConsulta.fieldbyname('CodPro').AsString,
                     ibqConsulta.fieldbyname('Coditem').AsString,
                     ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
                     ibqConsulta.Recno,
                     '','',
                     ibqConsulta.fieldbyname('Orden').AsInteger,
                     ibqConsulta.fieldbyname('Mes').AsInteger);
                   end;
              end

            end;
          end
          else
          begin
            InsertarMasItemBase(ibqConsulta.fieldbyname('Codinq').AsString,
              ibqConsulta.fieldbyname('Fecha').AsString,
              ibqConsulta.fieldbyname('Item').AsString,
              ibqConsulta.fieldbyname('Periodo').AsString,
              FormatFloat('0.00', ToFloat(ibqConsulta.fieldbyname('Importe').AsString)),
              ibqConsulta.fieldbyname('CodPro').AsString,
              ibqConsulta.fieldbyname('Coditem').AsString,
              ibqConsulta.fieldbyname('TipoIngreso').AsInteger,
              ibqConsulta.Recno,
              '','',
              ibqConsulta.fieldbyname('Orden').AsInteger,
              ibqConsulta.fieldbyname('Mes').AsInteger);
          end;
        end;
        InquilinoAnt := ibqConsulta.fieldbyname('Codinq').AsString;

        ibqConsulta.Next;
      end;
    end;

    DM.iniciarTransaccion;
    q.SQL.Text := 'Delete from MasitemsR where usuario = :USUARIO';
      Q.ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
    q.ExecSQL;
    DM.ConfirmarTransaccion;

    for I := 1 to gLista.RowCount - 1 do
    begin
      if gLista.GetCheckboxState(0, I, Estado) and Estado then
      begin
        with qryConsulta do
        begin
          Calle := gLista.Cells[1,I];
          Close;
          Sql.clear;
          Sql.Add('select * from masitems m, inmuebles i where m.usuario = :usuario and m.codinq=i.codinq and i.codinq=:codinq order by m.codinq, m.Orden, m.PrioridadFecha, M.ITEM, M.PERIODO');
          ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
          ParamByName('Codinq').AsString:=calle;
          Open;

          while not eof do
          begin
            InsertarMasItemR(Fields[0].AsString,
              Fields[1].AsString,
              Fields[2].AsString,
              Fields[3].AsString,
              Fields[4].AsString,
              Fields[5].AsString,
              Fields[6].AsString,
              3,
              FieldbyName('Registro').AsInteger,
              '','',
              FieldbyName('Orden').AsInteger,
              FieldbyName('PrioridadFecha').AsInteger);
            Next;
          end;
        end;
      end;
    end;

    suma := '0.00';
    with qryConsulta do
    begin
      Close;
      Sql.clear;
      Sql.Add('Select * from masitemsr where usuario = :Usuario order by codinq,Orden, PrioridadFecha, item, PERIODO');
      ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
      Open;

      while not eof do
      begin
        cods := Fields[6].AsString;
        num1 := Fields[4].AsString;
        if POS('-', num1) = 1 then
        else
        begin
          if (cods='12') or (cods='27') or (cods='121') then
            num1 :='-' + Fields[4].AsString
          else
            num1 := Fields[4].AsString;
        end;
        if num1 = '0.00' then
          num1 := '000'
        else
          num1 := Conversion(num1);
        suma := Conversion(suma);
        suma := Sumar(num1,suma);
        if suma = '0' then
          suma := '000';
        suma   := Agregarpunto2(suma);
        letras := ImporteEnLetras(suma);
        Next;
      end;

      DM.iniciarTransaccion;
      q.SQL.Text := 'Delete from LiqPrOrig where usuario = :usuario';
      q.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
      q.ExecSQL;
      DM.ConfirmarTransaccion;

      Close;
      Sql.clear;
      Sql.Add('Select * from masitemsr m, inmuebles i where m.usuario = :usuario and m.codinq=i.codinq order by m.codinq,m.Orden, m.PrioridadFecha, m.coditem,m.item, M.PERIODO, m.registro');
      ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
      Open;

      Fecha := Edit7.Text;
      Fecha := FechaEnLetras(Fecha);
      Fecha := 'Córdoba, '+ Fecha;
      L := Length(letras);
      L := 116 - L;

      for I := 1 to L do
        Letras := Letras + '-';

      While not eof do
      begin
        cods := Fields[6].AsString;
        num1 := Fields[4].AsString;
        if num1[1] = '-' then
        else
        begin
          if (cods='12') or (cods='27') or (cods='121') then
            num1 := '-'+ Fields[4].AsString
          else
            num1 := Fields[4].AsString;
        end;
//        if (Fields[13].AsString = noms) and (cos = Fields[0].AsString) then
//          noms:=' '
//        else
          noms := Fields[14].AsString;

        InsertarLiqPrOrigBase(Fields[0].AsString,
          Edit4.Text,
          Fecha,
          noms,
          Fields[6].AsString,
          Fields[2].AsString,
          Fields[3].AsString,
          num1,
          '$' + suma,
          Uppercase(Letras),
          FieldbyName('Orden').AsInteger,
          FieldbyName('PrioridadFecha').AsInteger,
          FieldbyName('Registro').AsInteger);
        noms := Fields[14].AsString;
        cos := Fields[0].AsString;
        Next;
      end;
      Edit12.Text:= suma;

      DM.IniciarTransaccion;
      q.sql.text := 'UPDATE LIQPRORIG SET PERIODO = :PERIODO WHERE ITEM=:ITEM and usuario = :usuario';
      q.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
      q.ParamByName('Periodo').AsString := 'SEGUN RECIBO Nº: '+Edit10.Text;
      q.ParamByName('Item').AsString :=  'COMISION POR ADMINISTRACION';
      q.ExecSql;
      DM.ConfirmarTransaccion;

      Close;
      Sql.Clear;
      Sql.add('Select * from masitemsr where usuario = :usuario order by codinq,orden, prioridadfecha, coditem,item');
      ParamByName('uSUARIO').AsString := fPrincipal.fUsuario;
      Open;

      I := 1;

      cdsDatos.EmptyDataSet;

      qIngreso.SQL.Text :=
        ' Select CR.Importe '+
        '   from CuerpoRecibos CR '+
        '  Where CR.Item = :Item ' +
        '    and CR.Periodo = :Periodo '+
        '    and CR.Coditem = :Coditem '+
        '    and CR.Codinq = :Codinq ';
      qIngreso.Prepare;

      while not eof do
      begin
        cdsDatos.Append;
        cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
        cdsDatos.FieldByName('Codinq').AsString := qryConsulta.FieldByName('Codinq').AsString;
        cdsDatos.FieldByName('Coditem').AsString := qryConsulta.FieldByName('Coditem').AsString;
        cdsDatos.FieldByName('Item').AsString := qryConsulta.FieldByName('Item').AsString;
        cdsDatos.FieldByName('Descripcion').AsString := qryConsulta.FieldByName('Periodo').AsString;
        if (qryConsulta.FieldByName('Coditem').AsString ='12') or (qryConsulta.FieldByName('Coditem').AsString ='121') or (qryConsulta.FieldByName('Coditem').AsString ='27') then
          cdsDatos.FieldByName('Importe').AsString := FormatFloat('0.00', ABS(ToFloat(qryConsulta.FieldByName('Importe').AsString)*-1))
        else
          cdsDatos.FieldByName('Importe').AsString := FormatFloat('0.00', ToFloat(qryConsulta.FieldByName('Importe').AsString));

        if Pos('|'+qryConsulta.FieldByName('Coditem').AsString+'|', '|121|12|02|04|05|27|29|') <= 0 then
        begin
          qIngreso.Close;
          qIngreso.ParamByName('Codinq').AsString := qryConsulta.FieldByName('Codinq').AsString;
          qIngreso.ParamByName('Coditem').AsString := qryConsulta.FieldByName('Coditem').AsString;
          qIngreso.ParamByName('Item').AsString := qryConsulta.FieldByName('Item').AsString;
          qIngreso.ParamByName('Periodo').AsString := qryConsulta.FieldByName('Periodo').AsString;
          qIngreso.Open;

          cdsDatos.FieldByName('Ingreso').AsString := FormatFloat('$ #,##0.00', ToFloat(qIngreso.FieldByName('Importe').AsString));
        end;

        cdsDatos.FieldByName('Registro').AsString := qryConsulta.FieldByName('Registro').AsString;
        cdsDatos.Post;



        (*
        gDetalle.Cells[0,I] := qryConsulta.FieldByName('Codinq').AsString;
        gDetalle.Cells[1,I] := qryConsulta.FieldByName('Coditem').AsString;
        gDetalle.Cells[2,I] := qryConsulta.FieldByName('Item').AsString;
        gDetalle.Cells[3,I] := qryConsulta.FieldByName('Periodo').AsString;

        if (qryConsulta.FieldByName('Coditem').AsString ='12') or (qryConsulta.FieldByName('Coditem').AsString ='121') or (qryConsulta.FieldByName('Coditem').AsString ='27') then
          gDetalle.Cells[5,I] := FormatFloat('0.00', ABS(ToFloat(qryConsulta.FieldByName('Importe').AsString)*-1))
        else
          gDetalle.Cells[5,I] := FormatFloat('0.00', ToFloat(qryConsulta.FieldByName('Importe').AsString));

        gDetalle.Cells[6,I] := qryConsulta.FieldByName('Registro').AsString;

        gDetalle.ColorRow[I] := clWhite;
        *)
        Next;
        Inc(I);
      end;
    end;

    ndTotal := ToFloat(eDIT12.Text);

    if chGastoBancario.checked then
    begin
      qGastoBancario.Sql.Text :=
       ' Select I.Codinq, I.CodPro, I.Coditem, '+
       '  M.Inquilino, M.MailPropietario, M.DescuentaGastos, M.PorcentajeGastoBancario '+
       '   From ItemAutom I ' +
       '   Inner Join Inmuebles M on I.Codinq = M.Codinq '+
       '   Inner join Conceptos C on C.codigo = I.coditem' +
       '   Where i.codpro=:codpro '+
       '     and i.fecha>=:fechad '+
       '     and i.fecha <=:fechah '+
       '     and M.DescuentaGastos = 1 ';
      qGastoBancario.ParamByName('codpro').AsString:=Trim(pro);
      qGastoBancario.ParamByName('fechad').AsString:=fde;
      qGastoBancario.ParamByName('fechah').AsString:=fha;
      qGastoBancario.Open;

      boExisteGasto := False;
      while not qGastoBancario.eof do
      begin
        if qGastoBancario.FieldByName('Coditem').AsString = '97' then
        begin
          boExisteGasto := True;
          Break;
        end;
        qGastoBancario.Next;
      end;

      qGastoBancario.First;
      if (not qGastoBancario.IsEmpty) then
      begin
        cdsDatos.First;
        ndGastoBancario := 0;
        while not cdsDatos.eof do
        begin
          if cdsDatos.FieldbyName('Coditem').AsString <> '97' then
            if (cdsDatos.FieldbyName('Coditem').AsString = '12') OR
               (cdsDatos.FieldbyName('Coditem').AsString = '121') OR
               (cdsDatos.FieldbyName('Coditem').AsString = '77') OR
               (cdsDatos.FieldbyName('Coditem').AsString = '27') THEN
             ndGastoBancario := ndGastoBancario - Abs(ToFloat(cdsDatos.FieldbyName('Importe').AsString))
            else
             ndGastoBancario := ndGastoBancario + ToFloat(cdsDatos.FieldbyName('Importe').AsString);
          cdsDatos.Next;
        end;
          if boExisteGasto then
          begin
            qBorraGastoBancario := CrearQuery;
            try
              DM.IniciarTransaccion;
              try
                qBorraGastoBancario.Sql.Text :=
                  ' Delete from ItemAutom ' +
                  '  Where Codinq = :Codinq '+
                  '    and Coditem = :Coditem '+
                  '    and Fecha = :Fecha ';
                 qBorraGastoBancario.ParamByName('Codinq').AsString := cdsDatos.FieldbyName('Codinq').AsString;
                 qBorraGastoBancario.ParamByName('Coditem').AsString := '97';
                 qBorraGastoBancario.ParamByName('Fecha').AsString := FormatDateTime('yyyymm10', Date);
                 qBorraGastoBancario.ExecSQL;
                 DM.ConfirmarTransaccion;
              Except
                DM.CancelarTransaccion;
              end;
            finally
              qBorraGastoBancario.Free;
            end;
          end;
          DM.IniciarTransaccion;
          try
            InsertarItemAutom(
              cdsDatos.FieldbyName('Codinq').AsString,
              FormatDateTime('yyyymm10', Date),
              'COM. BANCO POR TRANSFERENCIA',
              stPeriodoGasto,
              FormatFloat('0.00', ABS(ndGastoBancario * qGastoBancario.FieldbyName('PorcentajeGastoBancario').AsFloat/100)*-1),
              Trim(pro),
              '97',
              3,
              True);

            ndTotal := ndTotal +  ABS(ndGastoBancario * qGastoBancario.FieldbyName('PorcentajeGastoBancario').AsFloat/100)*-1;
            Letras := FormatFloat('0.00', ndTotal);
            Letras := ImporteEnLetras(Letras);

            InsertarLiqPrOrigBase(cdsDatos.FieldbyName('Codinq').AsString,
              Edit4.Text,
              Fecha,
              noms,
              '97',
              'COM. BANCO POR TRANSFERENCIA',
              stPeriodoGasto,
              FormatFloat('0.00', ABS(ndGastoBancario * qGastoBancario.FieldbyName('PorcentajeGastoBancario').AsFloat/100)*-1),
              '$' + FormatFloat('0.00', ndTotal),
              Uppercase(Letras),
              -1,
              -1,
              998);

             DM.ConfirmarTransaccion;
          Except
            DM.CancelarTransaccion;
          end;

        cdsDatos.Append;
        cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
        cdsDatos.FieldByName('Codinq').AsString := qryConsulta.FieldByName('Codinq').AsString;
        cdsDatos.FieldByName('Coditem').AsString := '97';
        cdsDatos.FieldByName('Item').AsString := 'COM. BANCO POR TRANSFERENCIA';
        cdsDatos.FieldByName('Descripcion').AsString := 'CORRESPONDE ' + STPERIODO;
        cdsDatos.FieldByName('Importe').AsString := FormatFloat('0.00', ABS(ndGastoBancario * qGastoBancario.FieldbyName('PorcentajeGastoBancario').AsFloat/100)*-1);
        cdsDatos.FieldByName('Registro').AsString := qryConsulta.FieldByName('Registro').AsString;
        cdsDatos.Post;
        boInserto := True;
      //  BitBtn1Click(nil);
      end;
    end;

//    if chRedondeo.checked then
//    begin
//      Cents := 100 - ToFloat(Copy(FormatFloat('0.00', ndTotal), Pos('.', FormatFloat('0.00', ndTotal))+1, 2));
//
//      if Cents > 0 then
//      begin
//        qBorraGastoBancario := CrearQuery;
//        try
//          DM.IniciarTransaccion;
//          try
//            qBorraGastoBancario.Sql.Text :=
//              ' Delete from ItemAutom ' +
//              '  Where Codinq = :Codinq '+
//              '    and Coditem = :Coditem '+
//              '    and Fecha = :Fecha ';
//             qBorraGastoBancario.ParamByName('Codinq').AsString := qryConsulta.FieldbyName('Codinq').AsString;
//             qBorraGastoBancario.ParamByName('Coditem').AsString := '932';
//             qBorraGastoBancario.ParamByName('Fecha').AsString := FormatDateTime('yyyymm10', Date);
//             qBorraGastoBancario.ExecSQL;
//             DM.ConfirmarTransaccion;
//          Except
//            DM.CancelarTransaccion;
//          end;
//        finally
//          qBorraGastoBancario.Free;
//        end;

//        if (Cents > 0) and (Cents < 100) then
//        begin
//          cdsDatos.Append;
//          cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
//          cdsDatos.FieldByName('Codinq').AsString := qryConsulta.FieldByName('Codinq').AsString;
//          cdsDatos.FieldByName('Item').AsString := 'AJUSTE';
//          cdsDatos.FieldByName('Descripcion').AsString := 'POR REDONDEO';
//          cdsDatos.FieldByName('Importe').AsString := FormatFloat('0.00', Cents/100);
//          cdsDatos.FieldByName('CodItem').AsString := '932';
//          cdsDatos.Post;
//          ndTotal := ndTotal + (Cents/100);
//          boInserto := True;
//
//          DM.IniciarTransaccion;
//          try
//            ndTotal := ndTotal +  ABS(ndGastoBancario * qGastoBancario.FieldbyName('PorcentajeGastoBancario').AsFloat/100)*-1;
//            Letras := FormatFloat('0.00', ndTotal);
//            Letras := ImporteEnLetras(Letras);
//
//            InsertarItemAutom(
//              cdsDatos.FieldbyName('Codinq').AsString,
//              FormatDateTime('yyyymm10', Date),
//              'AJUSTE',
//              'POR REDONDEO',
//              FormatFloat('0.00', ABS(Cents)),
//              Trim(pro),
//              '932',
//              3,
//              True);
//
//            InsertarLiqPrOrigBase(cdsDatos.FieldbyName('Codinq').AsString,
//              Edit4.Text,
//              Fecha,
//              noms,
//              '932',
//              'AJUSTE ',
//              'POR REDONDEO',
//              FormatFloat('0.00', Cents/100),
//              '$' + FormatFloat('0.00', ndTotal),
//              Uppercase(Letras),
//              999,
//              999,
//              999);
//
//             DM.ConfirmarTransaccion;
//          Except
//            DM.CancelarTransaccion;
//          end;
//        end;
//      end;
//    end;

    Edit12.Text := FormatFloat('0.00', ndTotal);

    q.SQL.Text := 'Select L.*, I.Ubicacion from LiqPrOrig L Inner Join Inmuebles I on I.Codinq = L.COdinq where L.usuario = :usuario Order by Codinq, Orden, PrioridadFecha ';
    q.ParambyName('Usuario').AsString := fPrincipal.FUsuario;
    q.Open;

    dspLiqPrOrig.DataSet := q;
    LiqPrOrig.Data := dspLiqPrOrig.Data;
    LiqPrOrig.Open;

    Fila := 1;
    gLiqPrOrig.Vaciar;
    while not LiqPrOrig.Eof do
    begin
      gLiqPrOrig.Cells[0, Fila] := LiqPrOrig.Fields[0].AsString;
      gLiqPrOrig.Cells[1, Fila] := LiqPrOrig.Fields[1].AsString;
      gLiqPrOrig.Cells[2, Fila] := LiqPrOrig.Fields[2].AsString;
      gLiqPrOrig.Cells[3, Fila] := LiqPrOrig.Fields[3].AsString;
      gLiqPrOrig.Cells[4, Fila] := LiqPrOrig.Fields[4].AsString;
      gLiqPrOrig.Cells[5, Fila] := LiqPrOrig.Fields[5].AsString;
      gLiqPrOrig.Cells[6, Fila] := LiqPrOrig.Fields[6].AsString;
      gLiqPrOrig.Cells[7, Fila] := LiqPrOrig.Fields[7].AsString;
      gLiqPrOrig.Cells[8, Fila] := LiqPrOrig.Fields[8].AsString;
      gLiqPrOrig.Cells[9, Fila] := LiqPrOrig.Fields[9].AsString;
      gLiqPrOrig.Cells[10, Fila] := LiqPrOrig.Fields[10].AsString;
      gLiqPrOrig.Cells[11, Fila] := LiqPrOrig.Fields[11].AsString;
      LiqPrOrig.Next;
      Inc(Fila);
    end;
    if Fila > 2 then
      gLiqPrOrig.RowCount := Fila
    else
      gLiqPrOrig.RowCount := 2;

  finally
    FreeAndNil(q);
    FreeAndNil(qImpuestos);
    FreeAndNil(qOrden);
    FreeAndNil(ibqConsulta);
    FreeAndNil(qryConsulta);
    FreeAndNil(slInquilinos);

    pagecontrol1.ActivePage := tbItems;
  end;
//  prValidarIngresoDinero;
end;

procedure TFrmLiquidacionPropietarios.prValidarIngresoDinero;
var
  I: Integer;
  q: TFXQuery;
begin
  q := CrearQuery;

  q.SQL.Text :=
    ' Select C.* from Cajadetalles C '+
    '  Where C.Codinq = :Codinq '+
    '    and C.Coditem = :Coditem '+
    '    and C.Entra = :Entra '+
    '    and C.Item = :Item '+
    '    and C.Periodo = :Periodo ';

  try
    for I := 1 to gLista.RowCount - 1 do
    begin
      cdsDatos.Filtered := False;
      cdsDatos.Filter := 'Codinq = ' + gLista.Cells[1, I];
      cdsDatos.Filtered := True;

      while not cdsDatos.Eof do
      begin
        if (Pos('|'+cdsDatos.FieldByName('Coditem').AsString+'|', '|12|09|27|97|217|121|') > 0) then
        begin
          cdsDatos.Next;
          Continue;
        end;

        q.Close;
        q.ParamByName('Codinq').AsString := cdsDatos.FieldByName('Codinq').AsString;
        q.ParamByName('Coditem').AsString := cdsDatos.FieldByName('Coditem').AsString;
        q.ParamByName('Entra').AsFloat := cdsDatos.FieldByName('Importe').AsFloat;
        q.ParamByName('Item').AsString := cdsDatos.FieldByName('Item').AsString;
        q.ParamByName('Periodo').AsString := cdsDatos.FieldByName('Descripcion').AsString;
        q.Open;

        if q.IsEmpty then
        begin
          gLista.Cells[3, I] := 'COBRO INCOMPLETO';
          Break;
        end;
        cdsDatos.Next;
      end;
    end;
  finally
    cdsDatos.Filtered := False;
    q.Free;
  end;
end;
function TFrmLiquidacionPropietarios.fxExistenItemsEnCero(cdsDatos:TClientDataSet): Boolean;
var
  I:Integer;
begin
  Result := False;

  cdsDatos.First;
  while not cdsDatos.Eof do
  begin
    if cdsDatos.FieldByName('Coditem').AsInteger in [46,67, 23, 28, 29, 53, 58, 74] then
    begin
      cdsDatos.Next;
      Continue;
    end;

    if (cdsDatos.FieldByName('Importe').AsString = '0.00') or (cdsDatos.FieldByName('Importe').AsString = '-0.00') then
    begin
      Result := True;
      Break;
    end;
    cdsDatos.Next;
  end;
end;

procedure TFrmLiquidacionPropietarios.prPrepararDataset;
begin
  cdsAnomalias := TClientDataset.Create(nil);

  cdsAnomalias.FieldDefs.Clear;
  cdsAnomalias.FieldDefs.Add('Descripcion', ftString, 100);
  cdsAnomalias.CreateDataset;

  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Seleccionado', ftBoolean);
  cdsDatos.FieldDefs.Add('Item', ftString, 100);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.FieldDefs.Add('Importe', ftString, 15);
  cdsDatos.FieldDefs.Add('Ingreso', ftString, 15);
  cdsDatos.FieldDefs.Add('Coditem', ftString, 4);
  cdsDatos.FieldDefs.Add('Codinq', ftString, 4);
  cdsDatos.FieldDefs.Add('Registro', ftString, 15);
  cdsDatos.CreateDataset;

  Columna_Seleccion.DataBinding.FieldName := 'Seleccionado';
  Columna_Item.DataBinding.FieldName := 'Item';
  Columna_Descripcion.DataBinding.FieldName := 'Descripcion';
  Columna_Importe.DataBinding.FieldName := 'Importe';
  Columna_Coditem.DataBinding.FieldName := 'Coditem';
  Columna_Codinq.DataBinding.FieldName := 'Codinq';
  Columna_Ingreso.DataBinding.FieldName := 'Ingreso';

  dsDatos.DataSet := cdsDatos;
  gItems.DataController.DataSource := dsDatos;
end;

end.

