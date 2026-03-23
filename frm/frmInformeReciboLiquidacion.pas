unit frmInformeReciboLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, Spin, FXQuery, ppDesignLayer, cxGraphics, cxControls, cxLookAndFeels,
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
  AdvGlowButton, cxGroupBox, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxClasses,
  cxGridLevel, cxGrid, cxTextEdit, Data.DB, cxDBData, cxGridDBTableView,
  cxGridDBBandedTableView, dbClient, Vcl.ComCtrls,cxCheckBox;

type
  TfInformeReciboLiquidacion = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
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
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppLabel8: TppLabel;
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    plReporteppField5: TppField;
    VerDatosInmueblwe1: TMenuItem;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    TituloppField5: TppField;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    plReporteppField1: TppField;
    plReporteppField6: TppField;
    Reporte2: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppRegion1: TppRegion;
    ppLabel14: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLabel19: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppParameterList2: TppParameterList;
    plReporte2: TppJITPipeline;
    ppField1: TppField;
    ppField6: TppField;
    plReporte2ppField1: TppField;
    plReporte2ppField2: TppField;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    Actualizar: TAdvGlowButton;
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label5: TLabel;
    Edit1: TEdit;
    chTodosPropietarios: TCheckBox;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    Label7: TLabel;
    SpinEdit2: TSpinEdit;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    gDetalle: TcxGridDBBandedTableView;
    AdvGlowButton1: TAdvGlowButton;
    ProgressBar1: TProgressBar;
    cxStyleRepository1: TcxStyleRepository;
    cxAmarillo: TcxStyle;
    cxRojo: TcxStyle;
    cxMoneyGreen: TcxStyle;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
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
    procedure Edit1Change(Sender: TObject);
    procedure chTodosPropietariosClick(Sender: TObject);
    procedure gDetalleColumn1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure gDetalleStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    procedure prPrepararPantalla(Anodesde, anohasta: Integer);
  public

    FSoloNoLiquidados: Boolean;
    FTipo: String;
    cdsDatos: TClientDataset;
    dsDatos: TDataSource;
    FCodigo: string;
  end;

var
  fInformeReciboLiquidacion: TfInformeReciboLiquidacion;
  fListadoUltimoPagados: TfInformeReciboLiquidacion;
  fInformeRecibo: TfInformeReciboLiquidacion;
  fInformeRecuperoGastos: TfInformeReciboLiquidacion;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMContratos;

{$R *.dfm}

procedure TfInformeReciboLiquidacion.ActualizarClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I, J: Integer;
  Existe: Boolean;
  AnoDesde, AnoHasta: Integer;
  Registros: Integer;

begin
  AnoDesde := ToInt(spinEdit1.Text);
  AnoHasta := ToInt(spinEdit2.Text);
  prPrepararPantalla(AnoDesde, AnoHasta);



  q := CrearQuery;
  q1 := CrearQuery;
//  GdETALLE.Vaciar;

  try
    q.SQL.Text := ' Select Codinq, Inquilino, Propietario' +
                  '   From Inmuebles Where 1 = 1';

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and Codinq >=:desde and Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    if not chTodosPropietarios.Checked then
    begin
      q.SQL.Add(' and Upper(Propietario) like :propietario ');
      q.ParamByName('Propietario').AsString := edit1.Text  + '%';
    end;
    q.SQL.Add('  Order by Codinq ');
    q.Open;

    cdsDatos.DisableControls;
    q.DisableControls;
    try
      while not q.eof do
      begin
        cdsDatos.Append;
        cdsDatos.FieldByName('Codinq').AsString := q.FieldByName('Codinq').AsString;
        cdsDatos.FieldByName('Inquilino').AsString := q.FieldByName('Inquilino').AsString;
        cdsDatos.FieldByName('Propietario').AsString := q.FieldByName('Propietario').AsString;
        cdsDatos.Post;

        q.Next;
      end;
    finally
      cdsDatos.EnableControls;
      q.EnableControls;
    end;

    cdsDatos.DisableControls;
    q.DisableControls;
    try
      q.SQL.Text :=
      '   SELECT CODINQ, INQUILINO, PROPIETARIO, ANIO||''|''||LPAD(MES,2,''0'') AS FECHA, PENDIENTE, PENDIENTERETIRAR, MAX(CODITEM) AS CODITEM FROM ( '+
      '   select distinct C.CODINQ, I.INQUILINO, i.PROPIETARIO, C.ITEM, C.PERIODO, C.CODITEM, C.IVA, CA.PENDIENTE, CA.PENDIENTERETIRAR, '+
      ' CASE WHEN POSITION(''ENE'', C.PERIODO) > 0 THEN 01 '+
      '      WHEN POSITION(''FEB'', C.PERIODO) > 0 THEN 02 '+
      '      WHEN POSITION(''MAR'', C.PERIODO) > 0 THEN 03 '+
      '      WHEN POSITION(''ABR'', C.PERIODO) > 0 THEN 04 '+
      '      WHEN POSITION(''MAY'', C.PERIODO) > 0 THEN 05 '+
      '      WHEN POSITION(''JUN'', C.PERIODO) > 0 THEN 06 '+
      '      WHEN POSITION(''JUL'', C.PERIODO) > 0 THEN 07 '+
      '      WHEN POSITION(''AGO'', C.PERIODO) > 0 THEN 08 '+
      '      WHEN POSITION(''SEPT'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''SET'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''OCT'', C.PERIODO) > 0 THEN 10 '+
      '      WHEN POSITION(''NOV'', C.PERIODO) > 0 THEN 11 '+
      '      WHEN POSITION(''DIC'', C.PERIODO) > 0 THEN 12 '+
      '      WHEN POSITION(''11/'', C.PERIODO) > 0 THEN 11 '+
      '      WHEN POSITION(''12/'', C.PERIODO) > 0 THEN 12 '+
      '      WHEN POSITION(''1/'', C.PERIODO) > 0 THEN 01 '+
      '      WHEN POSITION(''2/'', C.PERIODO) > 0 THEN 02 '+
      '      WHEN POSITION(''3/'', C.PERIODO) > 0 THEN 03 '+
      '      WHEN POSITION(''4/'', C.PERIODO) > 0 THEN 04 '+
      '      WHEN POSITION(''5/'', C.PERIODO) > 0 THEN 05 '+
      '      WHEN POSITION(''6/'', C.PERIODO) > 0 THEN 06 '+
      '      WHEN POSITION(''7/'', C.PERIODO) > 0 THEN 07 '+
      '      WHEN POSITION(''8/'', C.PERIODO) > 0 THEN 08 '+
      '      WHEN POSITION(''9/'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''10/'', C.PERIODO) > 0 THEN 10 '+
      '      ELSE 00 '+
      ' END AS MES, '+
      ' SUBSTRING(C.PERIODO FROM CHAR_LENGTH(C.PERIODO) - 3 FOR 4 )AS ANIO '+
      '  from CUERPORECIBOS C '+
      ' inner join cabezarecibos ca on ca.tipo = c.tipo and ca.numero = c.numero and ca.letra = c.letra and ca.codinq = c.codinq '+
      ' inner join INMUEBLES I on I.CODINQ = C.CODINQ '+
      ' where C.TIPO = :Tipo '+
      '   and ca.fecha >= I.fechainicio '+
      '   AND POSITION(''20'' , C.PERIODO) = (CHAR_LENGTH(C.PERIODO) -3) ';
      if FCodigo = '01' then
        q.SQL.Add('   AND C.ITEM LIKE ''%ALQUILER%'' ')
      else
        if FCodigo = '90' then
          q.SQL.Add('   AND C.CODITEM = ''90'' ');
    q.SQL.Add('   and (C.PERIODO like ''CORRESPONDE %/%'' or C.PERIODO like ''%__/____%'') ');

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and C.Codinq >=:desde and C.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;
    if not chTodosPropietarios.Checked then
    begin
      q.SQL.Add(' and Upper(i.Propietario) like :propietario ');
      q.ParamByName('Propietario').AsString := edit1.Text  + '%';
    end;

    q.SQL.Add(
      ' GROUP BY 1,2,3,4,5,6,7,8,9 '+
      '        order by C.CODINQ, ANIO DESC , MES DESC '+
      ') WHERE ANiO >= :anodesde and anio <= :anohasta GROUP BY 1,2,3,4,5,6 ');

    q.ParambyName('Tipo').AsString := FTipo;
    q.ParamByName('ANODesde').AsInteger := ANODESDE;
    q.ParamByName('ANOHasta').AsInteger := ANOHASTA;
    q.Open;

    Progressbar1.Max := q.RecordCount;
    Progressbar1.Min := 0;

    cdsDatos.First;

    while not q.eof do
    begin
      cdsDatos.Locate('CODINQ', VarArrayOF( [Q.fIELDBYnAME('codinq').AsString]),[]);

//      cdsDatos.Filtered := False;
//      cdsDatos.Filter := ' CODINQ = ' + '''' +  Q.fIELDBYnAME('codinq').AsString + '''';
//      cdsDatos.Filtered := True;

      inc(registros);

      if Copy(q.Fieldbyname('Fecha').AsString, 6, 2) = '00' then
      begin
        q.Next;
        Continue;
      end;

      cdsDatos.Edit;
      if q.Fieldbyname('Pendiente').AsInteger = 1 then
        cdsDatos.FieldByName(q.Fieldbyname('Fecha').AsString).AsString := 'P'
      else
      begin
        if q.Fieldbyname('Coditem').AsString = '01' then
          cdsDatos.FieldByName(q.Fieldbyname('Fecha').AsString).AsString := 'X'
        else if q.Fieldbyname('Coditem').AsString = '08' then
          cdsDatos.FieldByName(q.Fieldbyname('Fecha').AsString).AsString := 'A'
        else if q.Fieldbyname('Coditem').AsString = '30' then
          cdsDatos.FieldByName(q.Fieldbyname('Fecha').AsString).AsString := 'S';
      end;
      if q.Fieldbyname('PendienteRetirar').AsInteger = 1 then
        cdsDatos.FieldByName(q.Fieldbyname('Fecha').AsString).AsString := 'N';
      if (q.Fieldbyname('Pendiente').AsInteger = 1) and (q.Fieldbyname('PendienteRetirar').AsInteger = 1) then
        cdsDatos.FieldByName(q.Fieldbyname('Fecha').AsString).AsString := 'NP';

      cdsDatos.Post;

      q.Next;
      if Registros Mod 100 = 0 then
      begin
        Progressbar1.Position := Registros;
        Application.ProcessMessages;
      end;
    end;
    finally
      Progressbar1.Position := 0;
      cdsDatos.EnableControls;
      cdsDatos.Filtered := False;
      q.EnableControls;
      cdsDatos.IndexFieldNames := 'CODINQ';
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

function TfInformeReciboLiquidacion.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfInformeReciboLiquidacion.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfInformeReciboLiquidacion.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfInformeReciboLiquidacion.btnGrabarClick(Sender: TObject);
begin
//  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfInformeReciboLiquidacion.btnImprimirClick(Sender: TObject);
begin
//  if gDetalle.Cells[0,1] = '' then
//    Exit;
//
//  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfInformeReciboLiquidacion.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfInformeReciboLiquidacion.chTodosPropietariosClick(Sender: TObject);
begin
  if chTodosPropietarios.Checked then
    Edit1.Text:='';

  if Trim(Edit1.Text) = ''  then
     chTodosPropietarios.Checked := True;
end;

procedure TfInformeReciboLiquidacion.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfInformeReciboLiquidacion.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfInformeReciboLiquidacion.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfInformeReciboLiquidacion.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfInformeReciboLiquidacion.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfInformeReciboLiquidacion.Edit1Change(Sender: TObject);
begin
  if eDIT1.Text <> '' then
    chTodosPropietarios.Checked:=False
  else
    chTodosPropietarios.Checked:=True;
end;

procedure TfInformeReciboLiquidacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  if Assigned(fInformeReciboLiquidacion) then
    fInformeReciboLiquidacion := nil;
  if Assigned(fInformeRecibo) then
    fInformeRecibo := nil;
  if Assigned(fInformeRecuperoGastos) then
    fInformeRecuperoGastos := nil;
end;

procedure TfInformeReciboLiquidacion.FormCreate(Sender: TObject);
var
  ano, anodesde, anohasta: Integer;
begin
  fPrincipal.Center(Self);
  ano := ToInt(FormatDatetime('YYYY', DATE));
  AnoDesde := ano - 1;
  AnoHasta := ano;
  SpinEdit1.Text := Inttostr(ano - 1);
  SpinEdit2.Text := Inttostr(ano);
  FSoloNoLiquidados := False;
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDataSource.Create(nil);
  prPrepararPantalla(AnoDesde, AnoHasta);

end;

procedure TfInformeReciboLiquidacion.gDetalleColumn1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  I: Integer;
begin
  for I := 4 to gDetalle.ColumnCount - 1 do
  begin
    if not VarIsNull(Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, I)) then
      if Trim(Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, I)) <> 'X' then
      begin
        ACanvas.Brush.Color := clRed;
      end
  end;
end;

procedure TfInformeReciboLiquidacion.gDetalleDblClick(Sender: TObject);
begin
//  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
//    Exit;
//  if FInmuebles = nil then
//    Application.CreateForm(TFInmuebles, FInmuebles)
//  else
//    FInmuebles.Show;
//  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfInformeReciboLiquidacion.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
//  if Col in [3,4] then
//    gDetalle.SortColumn(5, True,'S')
//  else
//    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfInformeReciboLiquidacion.gDetalleStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
 AColumn: TcxCustomGridTableItem;
 I: Integer;
begin
 for I := 0 to cdsDatos.FieldDefs.Count - 1 do
 begin
   AColumn := (Sender as TcxGridDBBandedTableView).GetColumnByFieldName(cdsDatos.FieldDefs[I].Name);
   if VarToStr(ARecord.Values[AColumn.Index]) = 'P' then
     AStyle := cxRojo;
   if VarToStr(ARecord.Values[AColumn.Index]) = 'N' then
     AStyle := cxAmarillo;
   if VarToStr(ARecord.Values[AColumn.Index]) = 'NP' then
     AStyle := cxMoneyGreen;
 end;
end;

procedure TfInformeReciboLiquidacion.prPrepararPantalla(Anodesde, anohasta: Integer);
var
  I, J: Integer;
begin
  cdsDatos.Close;
  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codinq', ftString, 5);
  cdsDatos.FieldDefs.Add('Inquilino', ftString, 100);
  cdsDatos.FieldDefs.Add('Propietario', ftString, 100);

  gDetalle.ClearItems;
  gDetalle.Bands.Clear;
  gDetalle.Bands.Add;
  gDetalle.Bands[0].Caption := 'Datos de la propiedad';
  gDetalle.Bands[0].Width := 363;
  gDetalle.Bands[0].FixedKind := fkleft;
  with gDetalle.CreateColumn do
  begin
    Caption := 'Código';
    Position.BandIndex := 0;
    Options.Editing := False;
    HeaderAlignmentHorz := taCenter;
    Width := 60;
    Name := 'Columna_Codinq';
    Databinding.FieldName := 'Codinq';
  end;

  with gDetalle.CreateColumn do
  begin
    Caption := 'Inquilino';
    Position.BandIndex := 0;
    Options.Editing := False;
    HeaderAlignmentHorz := taCenter;
    Width := 150;
    Name := 'Columna_Inquilino';
    Databinding.FieldName := 'Inquilino';
  end;

  with gDetalle.CreateColumn do
  begin
    Caption := 'Propietario';
    Position.BandIndex := 0;
    Options.Editing := False;
    HeaderAlignmentHorz := taCenter;
    Width := 150;
    Name := 'Columna_Propietario';
    Databinding.FieldName := 'Propietario';
  end;

  for I := 0 to Anohasta - anodesde do
  begin
    gDetalle.Bands.Add;
    gDetalle.Bands[I + 1].Caption := Inttostr(AnoDesde + I);
    gDetalle.Bands[I + 1].Width := 360;

    for J := 1 to 12 do
    begin
      with gDetalle.CreateColumn do
      begin
        Caption := DaMes(IntToStr(J));
        Position.BandIndex := I + 1;
        Options.Editing := False;
        HeaderAlignmentHorz := taCenter;
        PropertiesClass := TcxTextEditProperties;
        Properties.Alignment.Horz := taCenter;
        cdsDatos.FieldDefs.Add(Inttostr(AnoDesde + I)+ '|' + FormatFloat('00' ,J), ftString, 2);
        Databinding.FieldName := Inttostr(AnoDesde + I)+ '|' + FormatFloat('00' ,J);
//        onCustomDrawCell := gDetalleColumn1CustomDrawCell;
//        Styles.OnGetContentStyle := gDetalleColumn1StylesGetContentStyle;
      end;
    end;
  end;
  cdsDatos.CreateDataset;
  dsDatos.DataSet := cdsDatos;
  gDetalle.DataController.DataSource := dsDatos;

end;

end.
