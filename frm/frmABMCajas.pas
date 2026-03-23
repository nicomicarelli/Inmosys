unit frmABMCajas;

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
  TfABMCajas = class(TForm)
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
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    cxGrid1: TcxGrid;
    gCajas: TcxGridDBTableView;
    Cajas_Codigo: TcxGridDBColumn;
    Cajas_Descripcion: TcxGridDBColumn;
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
    btnActualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
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
    procedure FormShow(Sender: TObject);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    procedure prPrepararDataset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fABMCajas: TfABMCajas;

implementation

uses frmprincipal, frmNuevaCaja;

{$R *.dfm}

procedure TfABMCajas.btnActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from Cajas where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and CodigoCaja >=:desde and CodigoCaja <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Descripcion) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by CodigoCaja ');
    q.Open;

    cdsDatos.EmptyDataset;
    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldbyName('CodigoCaja').AsInteger := q.FieldByName('CodigoCaja').AsInteger;
      cdsDatos.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.Post;
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfABMCajas.btnEliminarClick(Sender: TObject);
begin
  if cdsDatos.FieldbyName('CodigoCaja').asInteger = 1 then
  begin
    MostrarDialogoAceptar('No es posible eliminar la Caja General. Verifique por favor.');
    Exit;
  end;

  if FNuevaCaja = nil then
    Application.CreateForm(TFNuevaCaja, FNuevaCaja)
  else
    FNuevaCaja.Show;

  FNuevaCaja.Cargar(cdsDatos.FieldbyName('CodigoCaja').asInteger, toEliminar);
end;

procedure TfABMCajas.btnImprimirClick(Sender: TObject);
var
  objImpresion: TImpresion;
begin
  gCajas.DataController.BeginFullUpdate;
  objImpresion := TImpresion.Create;
  try
    if cdsDatos.IsEmpty then
      Exit;

    objImpresion.cdsDatos := cdsDatos;
    objImpresion.Vista := gCajas;
    objImpresion.prGenerarImpresion;

    ImprimirReporte ( Reporte,  plReporte,  objImpresion.gDetalle ) ;
  finally
    gCajas.DataController.EndFullUpdate;
    objImpresion.Liberar;
  end;
end;

procedure TfABMCajas.btnModificarClick(Sender: TObject);
begin
  if FNuevaCaja = nil then
    Application.CreateForm(TFNuevaCaja, FNuevaCaja)
  else
    FNuevaCaja.Show;

  FNuevaCaja.Cargar(cdsDatos.FieldbyName('CodigoCaja').asInteger, toModificar);
end;

procedure TfABMCajas.btnNuevoClick(Sender: TObject);
begin
  if FNuevaCaja = nil then
    Application.CreateForm(TFNuevaCaja, FNuevaCaja)
  else
    FNuevaCaja.Show;

  FNuevaCaja.Cargar(0, toNuevo);
end;

procedure TfABMCajas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMCajas.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMCajas.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfABMCajas.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfABMCajas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fABMCajas := nil;
  Action := caFree;
end;

procedure TfABMCajas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
end;

procedure TfABMCajas.FormShow(Sender: TObject);
begin
  cxGrid1.SetFocus;
end;

procedure TfABMCajas.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('CodigoCaja', ftInteger);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.CreateDataset;

  Cajas_Codigo.DataBinding.FieldName := 'CodigoCaja';
  Cajas_Descripcion.DataBinding.FieldName := 'Descripcion';

  dsDatos.DataSet := cdsDatos;
  gCajas.DataController.DataSource := dsDatos;
end;

function TfABMCajas.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfABMCajas.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMCajas.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

end.
