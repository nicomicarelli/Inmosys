unit ABMImpuestosYServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  AdvObj, BaseGrid, AdvGrid, ImgList, AdvGlowButton, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCheckBox,
  cxTextEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, ppDesignLayer, fxQuery, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, AdvPanel, dbClient;

type
  TfABMImpuestosyServicios = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
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
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppLabel8: TppLabel;
    ImageList1: TImageList;
    pnlFondo: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TodosCodigos: TcxCheckBox;
    TodosDescripcion: TcxCheckBox;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    Columna_Identificacion: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    edDesde: TcxTextEdit;
    edHasta: TcxTextEdit;
    edDescripcion: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Actualizar: TAdvGlowButton;
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
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;

    procedure prPrepararDataset;
  public
    { Public declarations }
  end;

var
  fABMImpuestosyServicios: TfABMImpuestosyServicios;

implementation

uses frmDatosFijos, frmPrincipal,
  frmNuevoImpuesto;

{$R *.dfm}

procedure TfABMImpuestosyServicios.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  cdsDatos.DisableControls;
  gDatos.DataController.BeginFullUpdate;
  try
    q.SQL.Text := 'Select * from EmpresasImpuestos where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and Codigo >=:desde and Codigo <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Descripcion) like :descripcion ');
      q.ParamByName('Nombre').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by Codigo ');
    q.Open;

    cdsDatos.EmptyDataSet;

    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldByName('COdigo').AsString := q.FieldByName('Codigo').AsString;
      cdsDatos.FieldByName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.FieldByName('Identificacion').AsString := q.FieldByName('Identificacion').AsString;
      cdsDatos.Post;
      q.Next;
    end;
  finally
    FreeAndNil(q);
    cdsDatos.EnableControls;
    gDatos.DataController.EndFullUpdate;
  end;
end;

function TfABMImpuestosyServicios.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Descripción' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end
end;

procedure TfABMImpuestosyServicios.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMImpuestosyServicios.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfABMImpuestosyServicios.btnEliminarClick(Sender: TObject);
begin
  if cdsDatos.FieldByName('Codigo').AsString = '' then
    Exit;

  if FNuevoImpuesto = nil then
    Application.CreateForm(TFNuevoImpuesto, FNuevoImpuesto)
  else
    FNuevoImpuesto.Show;
  FNuevoImpuesto.Cargar(cdsDatos.FieldByName('Codigo').AsString,toEliminar);

end;

procedure TfABMImpuestosyServicios.btnImprimirClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

//  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfABMImpuestosyServicios.btnModificarClick(Sender: TObject);
begin
  if cdsDatos.FieldByName('Codigo').AsString = '' then
    Exit;

  if FNuevoImpuesto = nil then
    Application.CreateForm(TFNuevoImpuesto, FNuevoImpuesto)
  else
    FNuevoImpuesto.Show;
  FNuevoImpuesto.Cargar(cdsDatos.FieldByName('Codigo').AsString,toModificar);

end;

procedure TfABMImpuestosyServicios.btnNuevoClick(Sender: TObject);
begin
  if FNuevoImpuesto = nil then
    Application.CreateForm(TFNuevoImpuesto, FNuevoImpuesto)
  else
    FNuevoImpuesto.Show;
  FNuevoImpuesto.Cargar('',toNuevo);
end;

procedure TfABMImpuestosyServicios.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMImpuestosyServicios.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMImpuestosyServicios.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfABMImpuestosyServicios.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfABMImpuestosyServicios.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfABMImpuestosyServicios.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfABMImpuestosyServicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMImpuestosyServicios := nil;
end;

procedure TfABMImpuestosyServicios.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
end;

procedure TfABMImpuestosyServicios.prPrepararDataset;
var
  I: Integer;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codigo', ftString, 10);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 200);
  cdsDatos.FieldDefs.Add('Identificacion', ftString, 100);
  cdsDatos.CreateDataset;

  for I := 0 to gDatos.ColumnCount - 1 do
    gDatos.Columns[I].DataBinding.FieldName := cdsDatos.Fields[I].FieldName;

  dsDatos.DataSet := cdsDatos;
  gDatos.DataController.DataSource := dsDatos;

end;


end.
