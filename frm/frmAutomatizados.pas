unit frmAutomatizados;

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
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBJIT, cxSpinEdit,
  cxMaskEdit, cxDropDownEdit;

type
  TfAutomatizados = class(TForm)
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
    Columna_Inquilino: TcxGridDBColumn;
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
    Label4: TLabel;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    Columna_Propietario: TcxGridDBColumn;
    Columna_Mes: TcxGridDBColumn;
    Columna_Anio: TcxGridDBColumn;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActualizarClick(Sender: TObject);
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
    procedure prActualizar;
    procedure prPrepararDataset;
  public
    { Public declarations }
  end;

var
  fAutomatizados: TfAutomatizados;

implementation

uses frmprincipal, frmNuevaCatetgoriaVale, frmNuevoIndicador, frmVales;

{$R *.dfm}

procedure TfAutomatizados.ActualizarClick(Sender: TObject);
var
  q,q1: TFXQuery;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  cdsDatos.DisableControls;
  try
    q.Sql.text := ' Select I.* '+
                  '   From Inmuebles I '+
                  '  where 1=1 ';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;
    q.SQL.Add(' order by I.Codinq ');
    q.Open;

    q1.SQL.Text := ' Select A.Codinq '+
                   '   From ItemAutom A '+
                   '  Where (A.Fecha=:FeCHA OR A.Fecha=:FeCHA2) and Codinq = :Codinq AND CODITEM IN (01,20,30)';

    cdsDatos.EmptyDataset;
    while not q.eof do
    begin
      q1.Close;
      q1.ParamByName('fECHA').AssTRING := spAnio.Text + fORMATfLOAT('00', edMes.ItemIndex + 1) + '05';
      q1.ParamByName('fECHA2').AssTRING := spAnio.Text + fORMATfLOAT('00', edMes.ItemIndex + 1) + '06';
      q1.ParamByName('Codinq').AsString := q.FieldByName('Codinq').AsString;
      q1.Open;

      if q1.IsEmpty then
      begin
        cdsDatos.Append;
        cdsDatos.FieldbyName('Codigo').AsString := q.FieldByName('Codinq').AsString;
        cdsDatos.FieldbyName('Inquilino').AsString := q.FieldByName('Inquilino').AsString;
        cdsDatos.FieldbyName('Propietario').AsString := q.FieldByName('Propietario').AsString;
        cdsDatos.FieldbyName('Mes').AsString := edMes.text;
        cdsDatos.FieldbyName('Anio').AsString := spAnio.Text;
        cdsDatos.Post;
      end;
      Q.Next;
    end;
  finally
    cdsDatos.EnableControls;
    FreeAndNil(q);
  end;
end;

procedure TfAutomatizados.btnEliminarClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toEliminar);
end;

procedure TfAutomatizados.btnImprimirClick(Sender: TObject);
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

procedure TfAutomatizados.btnModificarClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toModificar);
end;

procedure TfAutomatizados.btnNuevoClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(0, toNuevo);
end;

procedure TfAutomatizados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAutomatizados.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAutomatizados.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfAutomatizados.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfAutomatizados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fAutomatizados := nil;
end;

procedure TfAutomatizados.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
  edMes.ItemIndex := ToInt(FormatDatetime('mm', DAte)) - 1;
  spAnio.Value := ToInt(FormatDatetime('YYYY', DAte));
end;

procedure TfAutomatizados.prActualizar;
begin
  ActualizarClick(nil);
end;

procedure TfAutomatizados.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codigo', ftString, 5);
  cdsDatos.FieldDefs.Add('Inquilino', ftString, 200);
  cdsDatos.FieldDefs.Add('Propietario', ftString, 200);
  cdsDatos.FieldDefs.Add('Mes', ftString, 30);
  cdsDatos.FieldDefs.Add('Anio', ftString, 4);
  cdsDatos.CreateDataset;

  Columna_Codigo.DataBinding.FieldName := 'Codigo';
  Columna_Inquilino.DataBinding.FieldName := 'Inquilino';
  Columna_Propietario.DataBinding.FieldName := 'Propietario';
  Columna_Mes.DataBinding.FieldName := 'Mes';
  Columna_Anio.DataBinding.FieldName := 'Anio';

  dsDatos.DataSet := cdsDatos;
  gDatos.DataController.DataSource := dsDatos;
end;

function TfAutomatizados.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfAutomatizados.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAutomatizados.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

end.
