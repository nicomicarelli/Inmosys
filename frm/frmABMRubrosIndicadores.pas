unit frmABMRubrosIndicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Grids, ALIGRID, cxCheckBox, StdCtrls, AdvGlowButton,
  ExtCtrls, AdvPanel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Declaraciones, sqlExpr, Funciones, dbClient, ImgList, cxGroupBox,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, fxQuery, uImpresion, ppParameter,
  ppDesignLayer, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBJIT;

type
  TfABMRubrosIndicadores = class(TForm)
    ImageList1: TImageList;
    AdvPanel2: TAdvPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TcxCheckBox;
    TodosDescripcion: TcxCheckBox;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    TituloppField2: TppField;
    TituloppField3: TppField;
    Reporte: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
    ppLabel8: TppLabel;
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
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edHastaChange(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    procedure prPrepararDataset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fABMRubrosIndicadores: TfABMRubrosIndicadores;

implementation

uses frmprincipal, frmNuevaCaja, frmNuevoIndicador, frmNuevoRubroIndicador;

{$R *.dfm}

procedure TfABMRubrosIndicadores.btnActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from RubrosIndicadores where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and Codigo >=:desde and Codigo <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Descripcion) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by Codigo ');
    q.Open;

    cdsDatos.EmptyDataset;
    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldbyName('Codigo').AsInteger := q.FieldByName('Codigo').AsInteger;
      cdsDatos.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.Post;
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfABMRubrosIndicadores.btnEliminarClick(Sender: TObject);
begin
  if FNuevoIndicador = nil then
    Application.CreateForm(TFNuevoRubroIndicador, FNuevoRubroIndicador)
  else
    FNuevoRubroIndicador.Show;

  FNuevoRubroIndicador.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toEliminar);
end;

procedure TfABMRubrosIndicadores.btnImprimirClick(Sender: TObject);
var
  objImpresion: TImpresion;
begin
  gDatos.DataController.BeginFullUpdate;
  objImpresion := TImpresion.Create;
  try
    if cdsDatos.IsEmpty then
      Exit;

    objImpresion.cdsDatos := cdsDatos;
    objImpresion.Vista := gDatos;
    objImpresion.prGenerarImpresion;

    ImprimirReporte ( Reporte,  plReporte,  objImpresion.gDetalle ) ;
  finally
    gDatos.DataController.EndFullUpdate;
    objImpresion.Liberar;
  end;
end;

procedure TfABMRubrosIndicadores.btnModificarClick(Sender: TObject);
begin
  if FNuevoRubroIndicador = nil then
    Application.CreateForm(TFNuevoRubroIndicador, FNuevoRubroIndicador)
  else
    FNuevoRubroIndicador.Show;

  FNuevoRubroIndicador.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toModificar);
end;

procedure TfABMRubrosIndicadores.btnNuevoClick(Sender: TObject);
begin
  if FNuevoRubroIndicador = nil then
    Application.CreateForm(TFNuevoRubroIndicador, FNuevoRubroIndicador)
  else
    FNuevoRubroIndicador.Show;

  FNuevoRubroIndicador.Cargar(0, toNuevo);
end;

procedure TfABMRubrosIndicadores.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMRubrosIndicadores.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMRubrosIndicadores.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfABMRubrosIndicadores.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfABMRubrosIndicadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fABMRubrosIndicadores := nil;
  Action := caFree;
end;

procedure TfABMRubrosIndicadores.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
end;

procedure TfABMRubrosIndicadores.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codigo', ftInteger);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.CreateDataset;

  Columna_Codigo.DataBinding.FieldName := 'Codigo';
  Columna_Descripcion.DataBinding.FieldName := 'Descripcion';

  dsDatos.DataSet := cdsDatos;
  gDatos.DataController.DataSource := dsDatos;
end;

function TfABMRubrosIndicadores.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Articulo' then
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
  end;
end;

procedure TfABMRubrosIndicadores.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMRubrosIndicadores.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

end.
