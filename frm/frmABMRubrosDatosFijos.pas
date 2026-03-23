unit frmABMRubrosDatosFijos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxCheckBox, AdvGlowButton, cxGroupBox,
  AdvPanel, ppDesignLayer, dbClient, Provider, fxQuery, uImpresion;

type
  TfAbmRubrosDatosFijos = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    TituloppField2: TppField;
    TituloppField3: TppField;
    pnlFondo: TAdvPanel;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TcxCheckBox;
    TodosDescripcion: TcxCheckBox;
    btnActualizar: TAdvGlowButton;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
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
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    procedure prPrepararDataset;
  public
    { Public declarations }
  end;

var
  fAbmRubrosDatosFijos: TfAbmRubrosDatosFijos;

implementation

uses frmDatosFijos, frmPrincipal, frmABMDatosFijos, frmRazonesSociales,
  frmABMRazonesSociales, frmRubrosDatosFIjos;

{$R *.dfm}

procedure TfAbmRubrosDatosFijos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  gDatos.DataController.BeginFullUpdate;
  try
    q.SQL.Text := 'Select * from RubrosDatosFijos where 1=1';
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

    q.SQL.Add(' order by Descripcion ');
    q.Open;
    cdsDatos.EmptyDataSet;
    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldByName('Codigo').AsString := q.FieldByName('Codigo').AsString;
      cdsDatos.FieldByName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.Post;
      q.Next;
    end;
    cdsDatos.First;
 finally
    gDatos.DataController.EndFullUpdate;
    FreeAndNil(q);
  end;
end;

function TfAbmRubrosDatosFijos.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfAbmRubrosDatosFijos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmRubrosDatosFijos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmRubrosDatosFijos.btnEliminarClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if cdsDatos.FieldbyName('Codigo').AsInteger = 1 then
  begin
    MostrarDIalogoAceptar('Este Rubro no puede ser eliminado');
    Exit;
  end;

  if FRubroDatosFijos = nil then
    Application.CreateForm(TFRubroDatosFijos, FRubroDatosFijos)
  else
    FRubroDatosFijos.Show;

  FRubroDatosFijos.Cargar(cdsDatos.FieldbyName('Codigo').AsString,toEliminar);
end;

procedure TfAbmRubrosDatosFijos.btnImprimirClick(Sender: TObject);
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

procedure TfAbmRubrosDatosFijos.btnModificarClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if cdsDatos.FieldbyName('Codigo').AsInteger = 1 then
  begin
    MostrarDIalogoAceptar('Este Rubro no se puede modificar');
    Exit;
  end;

  if FRubroDatosFijos = nil then
    Application.CreateForm(TFRubroDatosFijos, FRubroDatosFijos)
  else
    FRubroDatosFijos.Show;

  FRubroDatosFijos.Cargar(cdsDatos.FieldbyName('Codigo').AsString,toModificar);
end;

procedure TfAbmRubrosDatosFijos.btnNuevoClick(Sender: TObject);
begin
  if FRubroDatosFijos = nil then
    Application.CreateForm(TFRubroDatosFijos, FRubroDatosFijos)
  else
    FRubroDatosFijos.Show;
  FRubroDatosFijos.Cargar('',toNuevo);
end;

procedure TfAbmRubrosDatosFijos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmRubrosDatosFijos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmRubrosDatosFijos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfAbmRubrosDatosFijos.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;

procedure TfAbmRubrosDatosFijos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmRubrosDatosFijos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfAbmRubrosDatosFijos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fAbmRubrosDatosFijos := nil;
end;

procedure TfAbmRubrosDatosFijos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
end;

procedure TfAbmRubrosDatosFijos.gDetalleDblClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if FRubroDatosFijos = nil then
    Application.CreateForm(TFRubroDatosFijos, FRubroDatosFijos)
  else
    FRubroDatosFijos.Show;
  FRubroDatosFijos.Cargar(cdsDatos.FieldByName('Codigo').AsString, toMostrar);
end;

procedure TfAbmRubrosDatosFijos.prPrepararDataset;
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

end.
