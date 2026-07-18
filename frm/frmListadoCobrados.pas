unit frmListadoCobrados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, Spin, Math, StrUtils, FXQuery, ppDesignLayer, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox, Vcl.ComCtrls, frmDatos,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxCheckBox, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, AdvObj, BaseGrid, AdvGrid;

type
  TfListadoCobrados = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    Reporte: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppLabel8: TppLabel;
    gDetalle: TStringAlignGrid;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    reporte2: TppReport;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppParameterList2: TppParameterList;
    plreporte1: TppJITPipeline;
    plreporte2: TppField;
    ppField2: TppField;
    TituloppField5: TppField;
    plreporte1ppField1: TppField;
    plreporte1ppField2: TppField;
    plreporte1ppField3: TppField;
    plreporte1ppField4: TppField;
    ppDBText9: TppDBText;
    ppLabel16: TppLabel;
    ppDBText13: TppDBText;
    ppLabel18: TppLabel;
    ppDBText15: TppDBText;
    ppLabel20: TppLabel;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    cbFechaPago: TComboBox;
    chDesocupados: TCheckBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit6: TEdit;
    Edit8: TEdit;
    chFechas: TCheckBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edFechaDesde: TEdit;
    edFechaHasta: TEdit;
    CheckBox1: TCheckBox;
    Actualizar: TAdvGlowButton;
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    bitbtn1: TAdvGlowButton;
    gDetalle1: TStringAlignGrid;
    ProgressBar1: TProgressBar;
    gDeuda: TAdvStringGrid;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Seleccionado: TcxGridDBColumn;
    Columna_Vale: TcxGridDBColumn;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Nombre: TcxGridDBColumn;
    Columna_Cuenta: TcxGridDBColumn;
    Columna_Vencimiento: TcxGridDBColumn;
    Columna_Importe: TcxGridDBColumn;
    Columna_PorcentajeInquilino: TcxGridDBColumn;
    Columna_PorcentajePropietario: TcxGridDBColumn;
    Columna_ImporteInquilino: TcxGridDBColumn;
    Columna_ImportePropietario: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    popOpciones: TPopupMenu;
    BorrarCeduln1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    AdvGlowButton1: TAdvGlowButton;
    PanelMails: TPanel;
    chPrelegales: TCheckBox;
    ReporteBot: TppReport;
    ppTitleBand3: TppTitleBand;
    ppHeaderBand3: TppHeaderBand;
    ppLine2: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine7: TppLine;
    ppLabel28: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    Shape1: TShape;
    Label9: TLabel;
    Shape2: TShape;
    Label10: TLabel;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    plreporte1ppField5: TppField;
    plreporte1ppField6: TppField;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaChange(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnGrabarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure chFechasClick(Sender: TObject);
    procedure gDetalle1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edFechaDesdeChange(Sender: TObject);
    procedure edFechaHastaChange(Sender: TObject);
    procedure gDeudaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure gDeudaDblClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    FCancelado: Boolean;
    boMostrarMensaje: Boolean;
  end;

var
  fListadoCobrados: TfListadoCobrados;
  fListadoDeudaBot: TfListadoCobrados;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMContratos,
  frmABMCtaCteInquilinos, liqin, voDispositivos;

{$R *.dfm}

procedure TfListadoCobrados.ActualizarClick(Sender: TObject);
var
  q, q1, q2, q3, q4, Q5, qp, qInquilino: TFXQuery;
  I, J, K, Posicion: Integer;
  FechaDesde, FechaHasta: TDatetime;
  FechaDesdeDeuda, FechaHastaDeuda: TDatetime;
  Existe: Boolean;

begin
  if boMostrarMensaje then
    if not MostrarDialogoSiNo('Al seleccionar varios inquilinos o todos, el proceso puede demorar varios minutos. '+#13#10+'Se aconseja seleccionar de a UNO. ¿Desea Continuar?') then
      Exit;

  q := DM.FxCrearQuery(opOptimizaSelect);
  q1 := DM.FxCrearQuery(opOptimizaSelect);
  q2 := DM.FxCrearQuery(opOptimizaSelect);
  q3 := DM.FxCrearQuery(opOptimizaSelect);
  q4 := DM.FxCrearQuery(opOptimizaSelect);
  q5 := DM.FxCrearQuery(opOptimizaSelect);
  qP := DM.FxCrearQuery(opOptimizaSelect);
  qInquilino := DM.FxCrearQuery;

  GdETALLE.Vaciar;
  GdETALLE1.Vaciar;

  gDetalle.beginupdate;
  gDetalle1.beginupdate;
  gDEUDA.beginupdate;
  q.DisableControls;
  q1.DisableControls;
  q2.DisableControls;
  q3.DisableControls;
  q4.DisableControls;
  q5.DisableControls;
  qP.DisableControls;
  qInquilino.DisableControls;
  try
    FechaDesde := StrToDate(Edit6.Text);
    FechaHasta := StrToDate(Edit8.Text);
    FechaDesdeDeuda := StrToDate(edFechaDesde.Text);
    FechaHastaDeuda := StrToDate(edFechaHasta.Text);

    qInquilino.SQL.Text := ' Select i.Codinq, I.Inquilino, I.Propietario, I.MailInquilino, I.Prelegales, I.Desocupado, A.Pagare, I.Legales, I.JuicioDesalojo, I.JuicioPVE, I.DniInquilino as DNI ' +
                  '   from  Inmuebles I '+
                  '   Inner Join Automatizacion A on A.Codinq = I.Codinq '+
                  '  Where 1=1 ';
    if  chPrelegales.Checked then
    begin
      qInquilino.SQL.Add(' and i.Prelegales = 1 ');
    end;

    if not chDesocupados.Checked then
    begin
      qInquilino.SQL.Add(' and i.Desocupado = 0 ');
    end;

    if not TodosCodigos.Checked then
    begin
      qInquilino.SQL.Add(' and i.Codinq >=:desde and i.Codinq <=:Hasta ');
      qInquilino.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      qInquilino.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      qInquilino.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      qInquilino.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    if cbFechaPago.Text <> 'TODOS' then
    begin
      qInquilino.SQL.Add(' and I.FechaPago = :FechaPago');
      qInquilino.ParamByName('FechaPago').AsString := cbFechaPago.Text;
    end;

 //   qInquilino.SQL.Add('  Group by 1,2, 3,4,5,6,7,8,9,10');
    qInquilino.SQL.Add('  Order by 1');
    qInquilino.Open;

    gDetalle.Vaciar;
    I := 1;
    J := 1;
    Posicion := 0;
    if qInquilino.RecordCount > 0 then
    begin
      ProgressBar1.Min := 0;
      ProgressBar1.Max := qInquilino.RecordCount - 1;
    end;

      FormatSettings.DecimalSeparator := ',';
      FormatSettings.ThousandSeparator := '.';

      while not qInquilino.Eof do
      begin
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
          '     and I.CODITEM in (''01'') '+
          '     AND C.inqprop <> 2 '+
          '     AND NOT EXISTS(SELECT CU.CODITEM '+
          '                      FROM CUERPORECIBOS CU '+
          '                     INNER JOIN CABEZARECIBOS CA ON CA.CODINQ = CU.CODINQ '+
          '                     WHERE CA.CODINQ = i.CODINQ '+
          '                       AND CU.CODINQ = :CODINQ '+
          '                       AND CU.CODITEM = I.coditem '+
          '                       and cu.CODITEM in (''01'') '+
          '                       AND CU.TIPO = ''RE'' '+
          '                       and cu.item = i.item '+
          '                       and cu.periodo = i.periodo) ';
        q1.ParamByName('Codinq').AsString := qInquilino.FieldByName('Codinq').AsString;

        if not TodosDescripcion.Checked then
        begin
          q1.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
          q1.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
        end;

        if not chFechas.Checked then
        begin
          q1.SQL.Add(' and I.Fecha >=:FechaDesde and I.Fecha <=:FechaHasta ');
          q1.ParamByName('FechaDesde').AsString := FormatDatetime('YYYYMMDD',FechaDesdeDeuda);
          q1.ParamByName('FechaHasta').AsString := FormatDatetime('YYYYMMDD',FechaHastaDeuda);
        end;

        q1.Open;

        q5.SQL.Text :=
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
          '     and I.CODITEM in (''08'', ''20'', ''30'') '+
          '     AND C.inqprop <> 2 '+
          '     AND NOT EXISTS(SELECT CU.CODITEM '+
          '                      FROM CUERPORECIBOS CU '+
          '                     INNER JOIN CABEZARECIBOS CA ON CA.CODINQ = CU.CODINQ '+
          '                     WHERE CA.CODINQ = i.CODINQ '+
          '                       AND CU.CODINQ = :CODINQ '+
          '                       AND CU.CODITEM = I.coditem '+
          '                       and cu.CODITEM in (''08'', ''20'', ''30'') '+
          '                       AND CU.TIPO = ''RE'' '+
          '                       and cu.item = i.item '+
          '                       and cu.periodo = i.periodo) ';
        q5.ParamByName('Codinq').AsString := qInquilino.FieldByName('Codinq').AsString;

        if not TodosDescripcion.Checked then
        begin
          q5.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
          q5.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
        end;

        if not chFechas.Checked then
        begin
          q5.SQL.Add(' and I.Fecha >=:FechaDesde and I.Fecha <=:FechaHasta ');
          q5.ParamByName('FechaDesde').AsString := FormatDatetime('YYYYMMDD',FechaDesdeDeuda);
          q5.ParamByName('FechaHasta').AsString := FormatDatetime('YYYYMMDD',FechaHastaDeuda);
        end;

        q5.Open;


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

        q2.ParamByName('Codinq').AsString := qInquilino.FieldByName('Codinq').AsString;

        if not chFechas.Checked then
        begin
          q2.SQL.Add(' and I.Fecha >=:FechaDesde and I.Fecha <=:FechaHasta ');
          q2.ParamByName('FechaDesde').AsString := FormatDatetime('YYYYMMDD', FechaDesdeDeuda);
          q2.ParamByName('FechaHasta').AsString := FormatDatetime('YYYYMMDD', FechaHastaDeuda);
        end;

        if not TodosDescripcion.Checked then
        begin
          q2.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
          q2.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
        end;

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

        q3.ParamByName('Codinq').AsString := qInquilino.FieldByName('Codinq').AsString;

        if not TodosDescripcion.Checked then
        begin
          q3.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
          q3.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
        end;

        if not chFechas.Checked then
        begin
          q3.SQL.Add(' and I.Fecha >=:FechaDesde and I.Fecha <=:FechaHasta ');
          q3.ParamByName('FechaDesde').AsString := FormatDatetime('YYYYMMDD',FechaDesdeDeuda);
          q3.ParamByName('FechaHasta').AsString := FormatDatetime('YYYYMMDD',FechaHastaDeuda);
        end;
        q3.Open;

        qp.SQL.Text := ' select sum(cast(I.IMPORTE as double precision)) as DEUDA, '+
             ' SUM(CASE WHEN ((CURRENT_DATE - CAST(SUBSTRING(FECHA FROM 5 FOR 2)||''/''||''01''||''/''|| '+
             '   SUBSTRING(FECHA FROM 1 FOR 4) AS DATE) + 1) - cast(REPLACE(fechapago, ''1º al '', '''') as integer) > 0) THEN '+
             '   (CURRENT_DATE - CAST(SUBSTRING(FECHA FROM 5 FOR 2)||''/''||''01''||''/''||SUBSTRING(FECHA FROM 1 FOR 4) AS DATE) + 1) '+
             '   * 0.005 * cast(I.IMPORTE as double precision) else 0 END) AS PUNITORIOS '+
             ' from (select I.FECHA, I.CODINQ, I.CODITEM, I.ITEM, I.PERIODO, I.IMPORTE '+
             '       from ITEMAUTOM I                                                  '+
             '       where I.CODINQ = :CODINQ and                                      '+
             '             I.IMPORTE <> '''' and                                         '+
             '             cast(replace(I.IMPORTE, '', '', ''.'') as double precision) <> 0) I'+
             ' inner join(select CODIGO, INQPROP                                            '+
             '            from CONCEPTOS                                                      '+
             '            where INQPROP <> 2) C on C.CODIGO = I.CODITEM                         '+
             ' inner join(select A.CODINQ, A.FECHAINICIO, A.INQUILINO, A.MAILINQUILINO, A.fechapago '+
             '            from INMUEBLES A '+
             '            order by A.CODINQ) A on A.CODINQ = I.CODINQ '+
             ' where I.CODINQ = :CODINQ and '+
             '       cast(substring(I.FECHA from 5 for 2) || ''/'' || substring(I.FECHA from 7 for 2) || ''/'' || substring(I.FECHA from 1 for 4) as timestamp) >= A.FECHAINICIO and '+
             '       I.CODITEM in (''01'',''08'',''20'',''30'') and '+
             '       C.INQPROP <> 2 and '+
             '       not exists(select CU.CODITEM '+
             '                  from CUERPORECIBOS CU '+
             '                  inner join CABEZARECIBOS CA on CA.CODINQ = CU.CODINQ '+
             '                  where CA.CODINQ = I.CODINQ and '+
             '                        CU.CODINQ = :CODINQ and '+
             '                        CU.CODITEM = I.CODITEM and '+
             '                        CU.CODITEM in (''01'',''20'',''30'',''08'') and '+
             '                        CU.TIPO = ''RE'' and '+
             '                        CU.ITEM = I.ITEM and '+
             '                        CU.PERIODO = I.PERIODO) ';
            if not chFechas.Checked then
            begin
              qP.SQL.Add(' and I.Fecha >=:FechaDesde and I.Fecha <=:FechaHasta ');
              qP.ParamByName('FechaDesde').AsString := FormatDatetime('YYYYMMDD',FechaDesdeDeuda);
              qP.ParamByName('FechaHasta').AsString := FormatDatetime('YYYYMMDD',FechaHastaDeuda);
            end;
            qp.ParamByName('Codinq').AsString := qInquilino.FieldByName('Codinq').AsString;

            qP.Open;
        if J>1 then
        BEGIN
          gDetalle1.RowCount := J;
          gDeuda.RowCount := J + 1;
        END
        else
        begin
          gDetalle1.RowCount := 2;
          gDeuda.RowCount := 2;
        end;


        if (Abs(q1.FieldByName('Deuda').AsFloat) > 0.001) or
           (Abs(q2.FieldByName('Deuda').AsFloat) > 0.001) or
           (Abs(q5.FieldByName('Deuda').AsFloat) > 0.001) or
           (Abs(q3.FieldByName('Deuda').AsFloat) > 0.001) then
        begin
          gDetalle1.Cells[0,J] := qInquilino.FieldByName('Codinq').AsString;
          gDetalle1.Cells[1,J] := qInquilino.FieldByName('Inquilino').AsString +' || ' + qInquilino.FieldByName('Propietario').AsString;
          gDetalle1.Cells[2,J] := FormatFloat('0.00', q1.FieldByName('Deuda').AsFloat + q5.FieldByName('Deuda').AsFloat);
          gDetalle1.Cells[3,J] := FormatFloat('0.00', q2.FieldByName('Deuda').AsFloat);
          gDetalle1.Cells[4,J] := FormatFloat('0.00', q3.FieldByName('Deuda').AsFloat);
          gDetalle1.Cells[5,J] := FormatFloat('0.00', q1.FieldByName('Deuda').AsFloat + q2.FieldByName('Deuda').AsFloat + q3.FieldByName('Deuda').AsFloat + q5.FieldByName('Deuda').AsFloat);

          if ToFloat(gDetalle1.Cells[6,J]) <= 0 then
            gDetalle1.Cells[6,J] := '0.00';
          gDetalle1.Cells[7,J] := FormatFloat('0.00', q1.FieldByName('Deuda').AsFloat + q2.FieldByName('Deuda').AsFloat + q3.FieldByName('Deuda').AsFloat + ToFloat(gDetalle1.Cells[6,J]));
          gDetalle1.Cells[8,J] := qInquilino.FieldByName('MailInquilino').AsString;

          if (q5.FieldByName('Deuda').AsFloat > 0) then
          begin
            gDeuda.Colors[1,J] := clYellow;
            gDeuda.Colors[2,J] := clYellow;
            gDeuda.Colors[3,J] := clYellow;
            gDeuda.Colors[4,J] := clYellow;
            gDeuda.Colors[5,J] := clYellow;
            gDeuda.Colors[6,J] := clYellow;
            gDeuda.Colors[7,J] := clYellow;
            gDeuda.Colors[8,J] := clYellow;
            gDeuda.Colors[9,J] := clYellow;
            if (Self = fListadoDeudaBot) then
              gDeuda.AddCheckBox(0, J, True, True)
            else
              gDeuda.AddCheckBox(0, J, False, False);
          end
          ELSE
          if (qInquilino.FieldByName('Legales').AsInteger = 1) or
             (qInquilino.FieldByName('Prelegales').AsInteger = 1) or
             (qInquilino.FieldByName('JuicioDesalojo').AsInteger = 1) or
             (qInquilino.FieldByName('JuicioPVE').AsInteger = 1) or
             (qInquilino.FieldByName('Desocupado').AsInteger = 1) or
             (q5.FieldByName('Deuda').AsFloat > 0) OR
             (qInquilino.FieldByName('Pagare').AsInteger = 1) then
          begin
            if (Self = fListadoDeudaBot) then
            begin
              qInquilino.Next;
              Continue;
            end;
            gDeuda.Colors[1,J] := clRed;
            gDeuda.Colors[2,J] := clRed;
            gDeuda.Colors[3,J] := clRed;
            gDeuda.Colors[4,J] := clRed;
            gDeuda.Colors[5,J] := clRed;
            gDeuda.Colors[6,J] := clRed;
            gDeuda.Colors[7,J] := clRed;
            gDeuda.Colors[8,J] := clRed;
            gDeuda.Colors[9,J] := clRed;
            gDeuda.AddCheckBox(0, J, False, False);
          end
          else
          begin
            gDeuda.Colors[1,J] := clWhite;
            gDeuda.Colors[2,J] := clWhite;
            gDeuda.Colors[3,J] := clWhite;
            gDeuda.Colors[4,J] := clWhite;
            gDeuda.Colors[5,J] := clWhite;
            gDeuda.Colors[6,J] := clWhite;
            gDeuda.Colors[7,J] := clWhite;
            gDeuda.Colors[8,J] := clWhite;
            gDeuda.Colors[9,J] := clWhite;
            gDeuda.AddCheckBox(0, J, True, False);
          end;

          gDeuda.Cells[1,J] := qInquilino.FieldByName('Codinq').AsString;
          gDeuda.Cells[2,J] := qInquilino.FieldByName('Inquilino').AsString +' || ' + qInquilino.FieldByName('Propietario').AsString;
          gDeuda.Cells[3,J] := FormatFloat('$#,##0.00', q1.FieldByName('Deuda').AsFloat + q5.FieldByName('Deuda').AsFloat);
          gDeuda.Cells[4,J] := FormatFloat('$#,##0.00', q2.FieldByName('Deuda').AsFloat);
          gDeuda.Cells[5,J] := FormatFloat('$#,##0.00', q3.FieldByName('Deuda').AsFloat);
          gDeuda.Cells[6,J] := FormatFloat('$#,##0.00', q1.FieldByName('Deuda').AsFloat + q2.FieldByName('Deuda').AsFloat + q3.FieldByName('Deuda').AsFloat + q5.FieldByName('Deuda').AsFloat);
          gDeuda.Cells[7,J] := FormatFloat('$#,##0.00', Ceil(qp.FieldByName('Punitorios').AsFloat));

//          if ToFloat(gDeuda.Cells[7,J]) <= 0 then
//            gDeuda.Cells[7,J] := '0.00';
          gDeuda.Cells[8,J] := FormatFloat('$#,##0.00', q1.FieldByName('Deuda').AsFloat + q2.FieldByName('Deuda').AsFloat + q3.FieldByName('Deuda').AsFloat + q5.FieldByName('Deuda').AsFloat + ToFloat(gDetalle1.Cells[6,J])+Ceil(qp.FieldByName('Punitorios').AsFloat));
          gDeuda.Cells[9,J] := qInquilino.FieldByName('MailInquilino').AsString;
          gDeuda.Cells[10,J] := qInquilino.FieldByName('DNI').AsString;

          Inc(J);
        end;

      qInquilino.Next;
      Inc(Posicion);
      if Posicion <= ProgressBar1.Max then
        ProgressBar1.Position := Posicion;
      Application.ProcessMessages;
    end;
    if i>2 then
    begin
      gDetalle.RowCount := I;
    end
    else
    begin
      gDetalle.RowCount := 2;
    end;
    if J>2 then
    begin
      gDetalle1.RowCount := J;
      gDeuda.RowCount := J;
    end
    else
    begin
      gDeuda.RowCount := 2;
      gDetalle1.RowCount := 2;
    end;
  finally
    ProgressBar1.Position := 0;
    gDetalle.Endupdate;
    gDetalle1.Endupdate;
    gDeuda.Endupdate;
    FreeAndNil(q);
    FreeAndNil(q1);
    FreeAndNil(q2);
    FreeAndNil(q3);
    FreeAndNil(q4);
    FormatSettings.DecimalSeparator := '.';
    FormatSettings.ThousandSeparator := ',';
  end;
end;

function TfListadoCobrados.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Inquilino' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end
end;

procedure TfListadoCobrados.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfListadoCobrados.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfListadoCobrados.AdvGlowButton1Click(Sender: TObject);
var
  I: Integer;
  Estado: Boolean;
  Tecla: Char;
  Posicion: Integer;

    function fxContarMails: Integer;
    var
      Estado: Boolean;
      I: Integer;
    begin
      Result := 0;
      for I := 1 to gDeuda.RowCount - 1 do
      begin
        gDeuda.GetCheckBoxState(0, I, Estado);
        if Estado then
          INc(Result);
      end;
    end;
begin
  FCancelado := False;

  if not MostrarDialogoSiNO('Va a enviar masivamente ' + InttoStr(fxContarMails) + ' mails. El proceso NO PODRA SER CANCELADO UNA VEZ INICIADO. ¿Desea continuar?', mbNo) then
    Exit;

  Tecla := #13;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := gDeuda.RowCount - 1;
  Posicion := 0;
  PanelMails.Visible := True;
  try
    for I := 1 to gDeuda.RowCount - 1 do
    begin
      if FCancelado then
        Break;
      Application.ProcessMessages;
      Sleep(200);

      Inc(pOSICION);
      pROGRESSBAR1.Position := pOSICION;
      gDeuda.GetCheckBoxState(0, I, Estado);
      if not Estado then
        Continue;
      Application.ProcessMessages;

      if FrmLiquidacionInquilinos = nil then
        Application.CreateForm(TFrmLiquidacionInquilinos, FrmLiquidacionInquilinos)
      else
        FrmLiquidacionInquilinos.Show;
      FrmLiquidacionInquilinos.FDeEnvioMails := True;

      Application.ProcessMessages;
      if not Assigned(FrmLiquidacionInquilinos) then
        Exit;

      Application.ProcessMessages;
      with FrmLiquidacionInquilinos do
      begin
        FrmLiquidacionInquilinos.Height := 0;
        FrmLiquidacionInquilinos.Width := 0;

        edit1.Text := gDeuda.Cells[1, I];
        edit1KeyPress(Sender, Tecla);
        edit7KeyPress(Sender, Tecla);
        edit6.Text := edFechaDesde.Text;
        edit6KeyPress(Sender, Tecla);
        edit8.Text := edFechaHasta.Text;
        edit8KeyPress(Sender, Tecla);
        advGlowButton2Click(nil);
        Application.ProcessMessages;
        btnSalirClick(nil);
        Application.ProcessMessages;
      end;
      Inc(pOSICION);
      pROGRESSBAR1.Position := pOSICION;
    end;
  finally
    if FCancelado then
      MostrarDialogoAceptar('Proceso de envio de mails CANCELADO.')
    else
      MostrarDialogoAceptar('Proceso de envio de mails terminado.');
    PanelMails.Visible := False;
    pROGRESSBAR1.Position := 0;
  end;
end;

procedure TfListadoCobrados.AdvGlowButton2Click(Sender: TObject);
begin
  FCancelado := True;
  Application.ProcessMessages;
end;

procedure TfListadoCobrados.BitBtn1Click(Sender: TObject);
begin
    ImprimirReporte ( Reporte2,  plReporte1,  gDetalle1 ) ;
end;

procedure TfListadoCobrados.BorrarCeduln1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDeuda.RowCount - 1 do
    gDeuda.SetCheckboxState(0, I, True);
end;

procedure TfListadoCobrados.btnGrabarClick(Sender: TObject);
var
  I, J: Integer;
  Estado: boolean;
begin
  gDetalle1.Vaciar;
  J := 1;
  for I := 1 to gDeuda.RowCount - 1 do
  begin
    gDeuda.GetCheckBoxState(0, I, Estado);
    if not Estado then
      Continue;

    gDetalle1.Cells[0, J] := gDeuda.Cells[1, I];
    gDetalle1.Cells[1, j] := gDeuda.Cells[2, I];
    gDetalle1.Cells[2, j] := gDeuda.Cells[3, I];
    gDetalle1.Cells[3, j] := gDeuda.Cells[4, I];
    gDetalle1.Cells[4, j] := gDeuda.Cells[5, I];
    gDetalle1.Cells[5, j] := gDeuda.Cells[6, I];
    gDetalle1.Cells[6, j] := gDeuda.Cells[7, I];
    gDetalle1.Cells[7, j] := gDeuda.Cells[8, I];
    gDetalle1.Cells[8, j] := gDeuda.Cells[9, I];
    gDetalle1.Cells[9, j] := gDeuda.Cells[10, I];
    Inc(J);
    gDetalle1.RowCount := gDetalle1.RowCount + 1;
  end;

  if Self = fListadoDeudaBot then
    ImprimirReporte ( Reporte2,  plReporte1,  gDetalle1 )
  else
    ImprimirReporte ( Reporte,  plReporte,  gDetalle1 ) ;
end;

procedure TfListadoCobrados.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfListadoCobrados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfListadoCobrados.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    edFechaDesde.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edFechaDesde.Text) = ''  then
    Checkbox1.Checked := True;
end;

procedure TfListadoCobrados.chFechasClick(Sender: TObject);
begin
  if chFechas.Checked then
  begin
    Edit6.Text:='';
    Edit8.Text:='';
  end;

  if Trim(Edit6.Text) = ''  then
    chFechas.Checked := True;
end;

procedure TfListadoCobrados.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDeuda.RowCount - 1 do
  begin
    gDeuda.SetCheckboxState(0, I, False);
  end;
end;

procedure TfListadoCobrados.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfListadoCobrados.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfListadoCobrados.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfListadoCobrados.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfListadoCobrados.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfListadoCobrados.edFechaDesdeChange(Sender: TObject);
begin
  if edFechaDesde.Text <> '' then
    Checkbox1.Checked:=False
  else
    checkbox1.Checked:=True;

end;

procedure TfListadoCobrados.edFechaHastaChange(Sender: TObject);
begin
  if edFechaHasta.Text <> '' then
    Checkbox1.Checked:=False
  else
    Checkbox1.Checked:=True;

end;

procedure TfListadoCobrados.Edit6Change(Sender: TObject);
begin
  if edit6.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfListadoCobrados.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfListadoCobrados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  if Self = fListadoCobrados then
    fListadoCobrados := nil;

  if Self = fListadoDeudaBot then
    fListadoDeudaBot := nil;
end;

procedure TfListadoCobrados.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  FCancelado := False;
  Edit6.Text := '05/' + FormatDateTime('mm/yyyy',Date);
  Edit8.Text := '04/' + FormatDateTime('MM/YYYY', StrToDate(Edit6.text) + 30);
  Edit6.Text := '01/01/2000';

  edFechaDesde.Text := '05/' + FormatDateTime('mm/yyyy',Date);
  edFechaHasta.Text := '04/' + FormatDateTime('MM/YYYY', StrToDate(edFechaDesde.text) + 30);
  boMostrarMensaje := True;

  chDesocupados.Checked  := (Self <> fListadoDeudaBot);
  chPrelegales.Checked   := False;
  chDesocupados.Visible  := (Self <> fListadoDeudaBot);
  chPrelegales.Visible   := (Self <> fListadoDeudaBot);
  AdvGlowButton1.Visible := (Self <> fListadoDeudaBot);
  Label6.Visible := (Self <> fListadoDeudaBot);
  cbFechaPago.Visible := (Self <> fListadoDeudaBot);
  if (Self = fListadoDeudaBot) then
  begin
//    gDeuda.ColWidths[2] := gDeuda.ColWidths[2] + gDeuda.ColWidths[6] + gDeuda.ColWidths[7];
//    gDeuda.ColWidths[6] := -1;
//    gDeuda.ColWidths[7] := -1;
  end;
end;

procedure TfListadoCobrados.gDetalle1DblClick(Sender: TObject);
begin
  if gDeuda.Cells[1,1] = '' then
    Exit;

  if FABMCtaCteInquilinos = nil then
    Application.CreateForm(TFABMCtaCteInquilinos, FABMCtaCteInquilinos)
  else
    FABMCtaCteInquilinos.Show;

  FABMCtaCteInquilinos.edDesde.Text := gDeuda.Cells[1,gDeuda.Row];
  FABMCtaCteInquilinos.edHasta.Text := gDeuda.Cells[1,gDeuda.Row];
  FABMCtaCteInquilinos.edtFecha.Text := edFechaDesde.Text;
  FABMCtaCteInquilinos.edFechaHasta.Text := edFechaHasta.Text;

  FABMCtaCteInquilinos.boSoloImpagos := True;
  FABMCtaCteInquilinos.ActualizarClick(nil);
end;

procedure TfListadoCobrados.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfListadoCobrados.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 2 then
    gDetalle.SortColumn(5, True,'N')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfListadoCobrados.gDeudaDblClick(Sender: TObject);
begin
  if gDeuda.Cells[1,1] = '' then
    Exit;

  if FABMCtaCteInquilinos = nil then
    Application.CreateForm(TFABMCtaCteInquilinos, FABMCtaCteInquilinos)
  else
    FABMCtaCteInquilinos.Show;

  FABMCtaCteInquilinos.edDesde.Text := gDeuda.Cells[1,gDeuda.Row];
  FABMCtaCteInquilinos.edHasta.Text := gDeuda.Cells[1,gDeuda.Row];
  FABMCtaCteInquilinos.edtFecha.Text := edFechaDesde.Text;
  FABMCtaCteInquilinos.edFechaHasta.Text := edFechaHasta.Text;
  FABMCtaCteInquilinos.boSoloImpagos := True;
  FABMCtaCteInquilinos.ActualizarClick(nil);
end;

procedure TfListadoCobrados.gDeudaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    1,2, 9: HAlign := taLeftJustify;
    3, 4, 5,6,7,8: HAlign := taRightJustify;
  end;
end;

end.
