unit frmABMVales;

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
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Menus, FxConnection, cxProgressBar, cxLabel;

type
  TProcesoThread = class(TThread)
  private
    FEnProceso: Boolean;
    FMaximo: Integer;
    Conn: TFXConnection; // Si usas FireDAC
    Query: TFXQuery;
    SP: TFXQuery;

    procedure MostrarEnMemo;
    procedure MostrarEnGrilla;
    procedure AgregarFila;
    procedure ActualizarProgreso;
    procedure PrepararProgreso;
  protected
    procedure Execute; override;
    function ConectarBD(RutaBD:string): Boolean;
  public
    function EstaEnProceso: Boolean;
    constructor Create;
  end;


  TfABMVales = class(TForm)
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
    Columna_Monto: TcxGridDBColumn;
    Columna_Pendiente: TcxGridDBColumn;
    Label4: TLabel;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    chTodosMeses: TcxCheckBox;
    Columna_Mes: TcxGridDBColumn;
    Columna_Anio: TcxGridDBColumn;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    chCerrados: TcxCheckBox;
    Label5: TLabel;
    cbCategoria: TcxLookupComboBox;
    popEliminar: TPopupMenu;
    GenerarMovimientoenlaCaja1: TMenuItem;
    Columna_Categoria: TcxGridDBColumn;
    N1: TMenuItem;
    NuevoValecopiaFIELdelSeleccionado1: TMenuItem;
    Label6: TLabel;
    edCodinqDesde: TEdit;
    Label7: TLabel;
    edCodinqHasta: TEdit;
    chTodosCodinq: TcxCheckBox;
    Columna_Codinq: TcxGridDBColumn;
    N2: TMenuItem;
    NuevoValeCOPIALIMPIA1: TMenuItem;
    Columna_Recuperar: TcxGridDBColumn;
    chRecuperar: TcxCheckBox;
    lbTarea: TcxLabel;
    Progreso: TcxProgressBar;
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
    procedure gDatosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure GenerarMovimientoenlaCaja1Click(Sender: TObject);
    procedure NuevoValecopiaFIELdelSeleccionado1Click(Sender: TObject);
    procedure edCodinqDesdeChange(Sender: TObject);
    procedure chTodosCodinqClick(Sender: TObject);
    procedure edCodinqHastaChange(Sender: TObject);
    procedure NuevoValeCOPIALIMPIA1Click(Sender: TObject);
    procedure chRecuperarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    dsCategorias: TDataSource;
    qCategorias: TFXQuery;
    procedure prActualizar;
    procedure prPrepararDataset;
  public
    HiloEnProceso: Boolean;
    Categoria: Integer;
    procedure prControlarBotones(pboEnabled: Boolean);
  end;

var
  fABMVales: TfABMVales;
  fABMValesImpuestos: TfABMVales;
  fABMValesArreglos: TfABMVales;
  fABMValesPersonales: TfABMVales;
  fABMValesOtros: TfABMVales;
  fABMValesGastos: TfABMVales;
  fABMValesCuentasBancarias: TfABMVales;
  fABMValesComplejos: TfABMVales;
  fABMValesConsorcioEstudiantina: TfABMVales;
  fABMValesConsorcioEugenio: TfABMVales;
  fABMValesExpensas: TfABMVales;
  fABMValesBalanceMensual: TfABMVales;
  fABMValesPresupuestos: TfABMVales;
  fABMValesLocatarioSaliente: TfABMVales;
  fABMValesSaldoAlquiler: TfABMVales;
  FABMValesCajaFuerte: TFABMVales;


implementation

uses frmprincipal, frmNuevaCatetgoriaVale, frmNuevoIndicador, frmVales;

{$R *.dfm}

procedure TfABMVales.prControlarBotones(pboEnabled: Boolean);
begin
  btnImprimir.Enabled := pboEnabled;
  Actualizar.Enabled := pboEnabled;
  btnModificar.Enabled := pboEnabled;
  btnEliminar.Enabled := pboEnabled;
  btnNuevo.Enabled := pboEnabled;
  btnSalir.Enabled := pboEnabled;

end;

procedure TfABMVales.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select CA.*, V.Descripcion as Categoria,Sum(CU.Entra - CU.Sale) as MontoPendiente, '+
    '                 sum(case when cu.entra - cu.sale > 0 then cu.entra - cu.sale else 0 end) as RECUPERAR ' +
    '                from CabezaVales CA ' +
    '               Inner Join CategoriasVales V on V.Codigo = CA.CodigoCategoria '+
    '               Inner Join CuerpoVales CU on CA.Codigo = Cu.Codigo '+
    ' where 1=1 ' ;

    if Categoria > 0 then
      q.SQL.Add(' and ca.CodigoCategoria=:Categoria ');

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and ca.Codigo >=:desde and ca.Codigo <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not chTodosCodinq.Checked then
    begin
      q.SQL.Add(' and CA.Codinq >=:desdeCodinq and CA.Codinq <=:HastaCodinq ');
      q.ParamByName('DesdeCodinq').AsString := edCodinqDesde.Text;
      q.ParamByName('HastaCodinq').AsString := edCOdinqHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(ca.Descripcion) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;
    if not chTodosMeses.Checked then
    begin
      q.SQL.Add(' and ca.Mes = :Mes and ca.anio = :anio');
      q.ParamByName('Mes').AsInteger := edMes.ItemIndex + 1;
      q.ParamByName('Anio').AsInteger := ToInt(spAnio.text);
    end;

    if not chCerrados.Checked then
      q.SQL.Add(' and ca.Cerrado = 0 ');

    q.SQL.Add(' Group by 1,2,3,4,5,6,7,8,9,10,11,12 ');
    q.SQL.Add(' order by Codigo ');
    if Categoria > 0 then
      q.ParambyName('Categoria').AsInteger := Categoria;
    q.Open;

    cdsDatos.EmptyDataset;
    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldbyName('Codigo').AsInteger := q.FieldByName('Codigo').AsInteger;
      cdsDatos.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.FieldbyName('Monto').AsFloat := q.FieldByName('MontoPendiente').AsFloat;
      cdsDatos.FieldbyName('Pendiente').AsFloat := q.FieldByName('MontoPendiente').AsFloat;
      cdsDatos.FieldbyName('Recuperar').AsFloat := q.FieldByName('Recuperar').AsFloat;
      cdsDatos.FieldbyName('Mes').AsString := DevuelveMes(q.FieldByName('Mes').AsInteger);
      cdsDatos.FieldbyName('Anio').AsInteger := q.FieldByName('Anio').AsInteger;
      cdsDatos.FieldbyName('Categoria').AsString := q.FieldByName('Categoria').AsString;
      cdsDatos.FieldbyName('Codinq').AsString := q.FieldByName('Codinq').AsString;
      cdsDatos.Post;
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfABMVales.btnEliminarClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toEliminar);
end;

procedure TfABMVales.btnImprimirClick(Sender: TObject);
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

procedure TfABMVales.btnModificarClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toModificar);
end;

procedure TfABMVales.btnNuevoClick(Sender: TObject);
begin
  if Assigned(FVales) then
    FreeAndNil(FVales);

  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Categoria := Categoria;
  fVales.Cargar(0, toNuevo);
end;

procedure TfABMVales.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMVales.chRecuperarClick(Sender: TObject);
begin
  Columna_Recuperar.Visible := chRecuperar.Checked;
end;

procedure TfABMVales.chTodosCodinqClick(Sender: TObject);
begin
  if chtodosCodinq.Checked then
  begin
    edCodinqDesde.Text:='';
    edCodinqHasta.Text:='';
  end;

  if Trim(edCodinqDesde.Text) = ''  then
    chtodosCodinq.Checked := True;
end;

procedure TfABMVales.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMVales.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfABMVales.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfABMVales.edCodinqDesdeChange(Sender: TObject);
begin
  edCodinqHasta.Text:=edCodinqdesde.Text;

  if edCodinqDesde.Text <> '' then
    chtodoscodinq.Checked:=False
  else
    chtodoscodinq.Checked:=True;
end;

procedure TfABMVales.edCodinqHastaChange(Sender: TObject);
begin
  if edCodinqHasta.Text <> '' then
    chtodoscodinq.Checked:=False
  else
    chtodoscodinq.Checked:=True;
end;

procedure TfABMVales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(fABMValesArreglos) then
    fABMValesArreglos := nil;
  if Assigned(fABMValesPersonales) then
    fABMValesPersonales := nil;
  if Assigned(fABMValesOtros) then
    fABMValesOtros := nil;
  if Assigned(fABMValesGastos) then
    fABMValesGastos := nil;
  if Assigned(fABMValesCuentasBancarias) then
    fABMValesCuentasBancarias := nil;
  if Assigned(fABMValesComplejos) then
    fABMValesComplejos := nil;
  if Assigned(fABMValesConsorcioEstudiantina) then
    fABMValesConsorcioEstudiantina := nil;
  if Assigned(fABMValesConsorcioEugenio) then
    fABMValesConsorcioEugenio := nil;
  if Assigned(fABMValesExpensas) then
    fABMValesExpensas := nil;
  if Assigned(fABMValesImpuestos) then
    fABMValesImpuestos := nil;
  if Assigned(fABMValesPresupuestos) then
    fABMValesPresupuestos := nil;
  if Assigned(fABMValesBalanceMensual) then
    fABMValesBalanceMensual := nil;
  if Assigned(fABMValesLocatarioSaliente) then
    fABMValesLocatarioSaliente := nil;
  if Assigned(fABMValesCajaFuerte) then
    fABMValesCajaFuerte := nil;
  if Assigned(fABMValesSaldoAlquiler) then
    fABMValesSaldoAlquiler := nil;
  if Assigned(fABMVales) then
    fABMVales := nil;
end;

procedure TfABMVales.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not HiloEnProceso;
end;

procedure TfABMVales.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
  edMes.ItemIndex := ToInt(FormatDatetime('mm', DAte)) - 1;
  spAnio.Value := ToInt(FormatDatetime('YYYY', DAte));


  dsCategorias := TDatasource.Create(nil);
  qCategorias := CrearQuery;

  qCategorias.sql.text := 'Select * from CategoriasVales';
  qCategorias.Open;

  dsCategorias.DataSet := qCategorias;
  cbCategoria.Properties.ListSource := dsCategorias;
  cbCategoria.EditValue := -1;

end;

procedure TfABMVales.FormShow(Sender: TObject);
begin
  if Self = fABMValesImpuestos then
    TProcesoThread.Create;
end;

procedure TfABMVales.gDatosCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, Columna_Pendiente.Index) > 0) then
    ACanvas.Font.Color := clRed
  else
    ACanvas.Font.Color := clGreen;
end;

procedure TfABMVales.GenerarMovimientoenlaCaja1Click(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if FValesCopia = nil then
    Application.CreateForm(TFVales, FValesCopia)
  else
    FValesCopia.Show;

  fValesCopia.OnActualizar := prActualizar;
  fValesCopia.Columna_Seleccionado.Visible := True;
  fValesCopia.Columna_Seleccionado.Caption := '';
  fValesCopia.Columna_Manual.Visible := False;
  fValesCopia.Columna_PasadoACaja.Visible := False;
  fValesCopia.btnModificar.Visible := False;
  fValesCopia.gDatos.PopupMenu := fValesCopia.popSeleccion;
  fValesCopia.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toCopia);
end;

procedure TfABMVales.NuevoValecopiaFIELdelSeleccionado1Click(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if FValesCopia = nil then
    Application.CreateForm(TFVales, FValesCopia)
  else
    FValesCopia.Show;

  fValesCopia.OnActualizar := prActualizar;
  fValesCopia.Columna_Seleccionado.Visible := True;
  fValesCopia.Columna_Seleccionado.Caption := '';
  fValesCopia.Columna_Manual.Visible := False;
  fValesCopia.Columna_PasadoACaja.Visible := False;
  fValesCopia.btnModificar.Visible := False;
  fValesCopia.gDatos.PopupMenu := fValesCopia.popSeleccion;
  fValesCopia.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toCopiafiel);
end;

procedure TfABMVales.NuevoValeCOPIALIMPIA1Click(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if FValesCopia = nil then
    Application.CreateForm(TFVales, FValesCopia)
  else
    FValesCopia.Show;

  fValesCopia.OnActualizar := prActualizar;
  fValesCopia.Columna_Seleccionado.Visible := True;
  fValesCopia.Columna_Seleccionado.Caption := '';
  fValesCopia.Columna_Manual.Visible := False;
  fValesCopia.Columna_PasadoACaja.Visible := False;
  fValesCopia.btnModificar.Visible := False;
  fValesCopia.gDatos.PopupMenu := fValesCopia.popSeleccion;
  fValesCopia.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toCopiaLimpia);

end;

procedure TfABMVales.prActualizar;
begin
  ActualizarClick(nil);
end;

procedure TfABMVales.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codigo', ftInteger);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.FieldDefs.Add('Monto', ftFloat);
  cdsDatos.FieldDefs.Add('Pendiente', ftFloat);
  cdsDatos.FieldDefs.Add('Recuperar', ftFloat);
  cdsDatos.FieldDefs.Add('Mes', ftString, 15);
  cdsDatos.FieldDefs.Add('Anio', ftInteger);
  cdsDatos.FieldDefs.Add('Categoria', ftString, 100);
  cdsDatos.FieldDefs.Add('Codinq', ftString, 5);
  cdsDatos.CreateDataset;

  Columna_Codigo.DataBinding.FieldName := 'Codigo';
  Columna_Descripcion.DataBinding.FieldName := 'Descripcion';
  Columna_Monto.DataBinding.FieldName := 'Monto';
  Columna_Pendiente.DataBinding.FieldName := 'Pendiente';
  Columna_Recuperar.DataBinding.FieldName := 'Recuperar';
  Columna_Mes.DataBinding.FieldName := 'Mes';
  Columna_Anio.DataBinding.FieldName := 'Anio';
  Columna_Categoria.DataBinding.FieldName := 'Categoria';
  Columna_Codinq.DataBinding.FieldName := 'Codinq';

  TFloatField(cdsDatos.FieldByname('Monto')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsDatos.FieldByname('Pendiente')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsDatos.FieldByname('Recuperar')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';

  dsDatos.DataSet := cdsDatos;
  gDatos.DataController.DataSource := dsDatos;
end;

function TfABMVales.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfABMVales.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMVales.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

{ TProcesoThread }

constructor TProcesoThread.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TProcesoThread.ActualizarProgreso;
begin
  fABMValesImpuestos.Progreso.Position := fABMValesImpuestos.Progreso.Position + 1;
  if fABMValesImpuestos.Progreso.Position = fABMValesImpuestos.Progreso.Properties.Max then
  begin
    fABMValesImpuestos.Progreso.Visible := False;
    fABMValesImpuestos.lbTarea.Visible := False;
  end;
end;

procedure TProcesoThread.AgregarFila;
begin

end;

function TProcesoThread.ConectarBD(RutaBD:string): Boolean;
begin
  with Conn do
  begin
    Connected := False;
    Params.Clear;
    Params.Add('DriverName=Firebird');
    Params.Add('Database=' + RutaBD);
    Params.Add('DriverID=FB');
    Params.Add('RoleName=RoleName');
    Params.Add('User_Name=sysdba');
    Params.Add('Password=masterkey');
    Params.Add('ServerCharSet=');
    Params.Add('SQLDialect=3');
    Params.Add('ErrorResourceFile=');
    Params.Add('LocaleCode=0000');
    Params.Add('BlobSize=-1');
    Params.Add('CommitRetain=False');
    Params.Add('WaitOnLocks=True');
    Params.Add('IsolationLevel=ReadCommitted');
    Params.Add('Trim Char=False');
    Params.Add('VendorLib=FBClient.dll');
    Connected := True;
  end;
  Result := Conn.Connected;
end;

function TProcesoThread.EstaEnProceso: Boolean;
begin
  Result := FEnProceso;
end;

procedure TProcesoThread.Execute;
var
  I, J, K: Integer;
  vBarraLarga, vBarraInterna: string;
  Ruta: String;
  Key: char;
begin
  TThread.Synchronize(nil, procedure
  begin
    fABMValesImpuestos.HiloEnProceso := True;
    fABMValesImpuestos.prControlarBotones(False);
    PrepararProgreso;
  end);

  // --- 1. CONFIGURACIÓN INICIAL DE BASE DE DATOS ---
  // Al iniciar, marcamos que el proceso está activo
//  TThread.Synchronize(nil, procedure
//  begin
//    fLecturaIA.EstaEnProceso := True;
//    FEmpresa := fLecturaIA.Empresa;
//    case FEmpresa of
//      2: Synchronize(procedure begin
//        FLecturaIA.gDetalle.Cells[2, 0] := 'U. Funcional';
//       end);
//    end;
//  end);

  Conn := TFxConnection.Create(nil);
  Query := TFxQuery.Create(nil);
  SP := TFxQuery.Create(nil);
  Ruta := ObtenerRutaBD;
  try
    try
      if ConectarBD(Ruta) then
      begin
        Query.Connection := Conn;
        SP.Connection := Conn;
      end;
    except
      on E: Exception do
      begin
//        FTextoAMostrar := 'Error de DB: ' + E.Message;
//        Synchronize(MostrarEnMemo);
        Exit; // Si no hay DB, no podemos seguir con la lógica de cruce
      end;
    end;

    Query.SQL.Text := 'Select Codigo from CabezaVales where Codigoempresa in (1,2,3) and Cerrado = 0 ';
    Query.Open;

    FMaximo := Query.RecordCount;
    Synchronize(PrepararProgreso);
    Conn.StartTransaction;
    try
      while not Query.eof do
      begin
        Sp.SQL.Text := 'Execute procedure SP_EnderezarVale('+Query.FieldByName('Codigo').AsString + ');';
        SP.ExecSQL;
        Conn.Commit;
        Query.Next;
        Synchronize(ActualizarProgreso);
      end;
    Except
      Conn.Rollback;
    end;
//    case FEmpresa of
//      1,3: prObtenerParametrosCodigoBarras;
//      2: Synchronize(procedure begin
//        FLecturaIA.gDetalle.Cells[2, 0] := 'U. Funcional';
//       end);
//    end;


//    if FindFirst(FCarpeta + '*.pdf', faAnyFile, SR) = 0 then
//    begin
//      FTextoAMostrar := 'Procesando: por favor espere.';
//      Synchronize(MostrarEnMemo);
//      try
//        repeat
//          if Terminated then Break;
//
//          PathPDF := FCarpeta + SR.Name;
//          NomBase := 'session_' + FormatDateTime('hhmmsszzz', Now);
//          PathIMG := FPathApp + NomBase + '.png';
//          PathTXT := FPathApp + NomBase;
//
//         // 1. Generar Imagen
//  //        if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
//  //           '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
//          begin
//            Sleep(300);
//
//            FEnteDetectado := fLecturaIA.ClasificarDocumento(PathPDF);
//            FTextoAMostrar := FEnteDetectado;
//            FColumna := 1;
//            Synchronize(MostrarEnGrilla);
//            if FEnteDetectado = 'AGUAS' then
//            begin
//              if FEmpresa <> 2 then
//              begin
//                FTextoAMostrar := 'CEDULON INCORRECTO';
//                FColumna := 2;
//                Synchronize(MostrarEnGrilla);
//                Synchronize(ActualizarProgreso);
//                Continue;
//              end;
//
//              UnidadFact := fLecturaIA.ObtenerUnidadConPDFToText(PathPdf);
//              FTextoAMostrar := UnidadFact;
//              FColumna := 2;
//              Synchronize(MostrarEnGrilla);
//
//              Query.Close;
//              Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE UNIDADFUNCIONAL = :unidad';
//              Query.ParamByName('unidad').AsString := UnidadFact;
//              Query.Open;
//
//              if not Query.IsEmpty then
//              begin
//                FTextoAMostrar := Query.FieldByName('Codinq').AsString;
//                FColumna := 0;
//                Synchronize(MostrarEnGrilla);
//                FTextoAMostrar := 'ENCONTRADO';
//                FColumna := 5;
//                Synchronize(MostrarEnGrilla);
//              end
//              else
//              begin
//                FTextoAMostrar := '';
//                FColumna := 0;
//                Synchronize(MostrarEnGrilla);
//                FTextoAMostrar := 'NO ENCONTRADO';
//                FColumna := 5;
//                Synchronize(MostrarEnGrilla);
//              end;
//
//              CodigosBarras := fLecturaIA.ExtraerCodigosBarrasFiel(PathPDF);
//              try
//                if CodigosBarras.Count > 0 then
//                begin
//                  for i := 0 to CodigosBarras.Count - 1 do
//                  begin
//                    FTextoAMostrar := CodigosBarras[i];
//                    FColumna := 3;
//                    Synchronize(MostrarEnGrilla);
//                    TThread.Synchronize(nil,
//                      procedure
//                      var J: Integer;
//                      begin
//                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
//                        begin
//                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
//                          begin
//                            FAsignacionBoletas.gDetalle.Cells[2, J] := CodigosBarras[0];
//                            FAsignacionBoletas.gDetalle.Col := 2;
//                            FAsignacionBoletas.gDetalle.Row := j;
//                            FAsignacionBoletas.gDetalleKeyPress(nil, Key);
//                            FTextoAMostrar := 'ACTUALIZO';
//                            FColumna := 5;
//                            Synchronize(MostrarEnGrilla);
//
//                          end
//                        end;
//                      end);
//                  end;
//                end
//                else
//                begin
//                  // 2. SI FALLA EL MÉTODO FIEL, RECURRIMOS AL OCR (Tu proceso actual)
//                  FTextoAMostrar := 'Aviso: No se halló texto digital, usando OCR para barras...';
//                  Synchronize(MostrarEnMemo);
//
//                  // Aquí ejecutas tu pdftocairo + tesseract actual
//                end;
//              finally
//                CodigosBarras.Free;
//                Inc(FFila);
//                Synchronize(AgregarFila);
//              end;
//            end;
//
//            if FEnteDetectado = 'MUNICIPALIDAD' then
//            begin
//              try
//                if FEmpresa <> 3 then
//                begin
//                  FTextoAMostrar := 'CEDULON INCORRECTO';
//                  FColumna := 2;
//                  Synchronize(MostrarEnGrilla);
//                  Synchronize(ActualizarProgreso);
//                  Continue;
//                end;
//
//                FCodigoBarras1 := '';
//                FCodigoBarras2 := '';
//
//                UnidadFact := fLecturaIA.ExtraerNomenclaturaMuniFiel(PathPdf);
//                FTextoAMostrar := UnidadFact;
//                FColumna := 2;
//                Synchronize(MostrarEnGrilla);
//
//                Query.Close;
//                Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE NOMENCLATURACATASTRAL = :unidad';
//                Query.ParamByName('unidad').AsString := UnidadFact;
//                Query.Open;
//
//                if not Query.IsEmpty then
//                begin
//                  FTextoAMostrar := Query.FieldByName('Codinq').AsString;
//                  FColumna := 0;
//                  Synchronize(MostrarEnGrilla);
//                  FTextoAMostrar := 'ENCONTRADO';
//                  FColumna := 5;
//                  Synchronize(MostrarEnGrilla);
//                end
//                else
//                begin
//                  FTextoAMostrar := '';
//                  FColumna := 0;
//                  Synchronize(MostrarEnGrilla);
//                  FTextoAMostrar := 'NO ENCONTRADO';
//                  FColumna := 5;
//                  Synchronize(MostrarEnGrilla);
//                end;
//
//                fLecturaIA.ExtraerBarrasMunicipales(PathPDF, vBarraLarga, vBarraInterna);
//
//                if vBarraLarga <> '' then
//                begin
//                  FTextoAMostrar := vBarraLarga;
//                  FColumna := 3;
//                  Synchronize(MostrarEnGrilla);
//                end;
//
//                if vBarraInterna <> '' then
//                begin
//                  FTextoAMostrar := vBarraInterna;
//                  FColumna := 4;
//                  Synchronize(MostrarEnGrilla);
//                end;
//
//                if (Trim(vBarraLarga) <> '') and (Trim(vBarraInterna) <> '') then
//                begin
//                  FCodigoBarras1 := vBarraLarga;
//                  FCodigoBarras2 := vBarraInterna;
//                  try
//                    TThread.Synchronize(nil,
//                      procedure
//                      var J: Integer;
//                      begin
//                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
//                        begin
//                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
//                          begin
//                            prTraducirCodigoBarras(J);
//                            FTextoAMostrar := 'ACTUALIZO';
//                            FColumna := 5;
//                            Synchronize(MostrarEnGrilla);
//                            Break;
//                          end
//                        end;
//                      end);
//                  finally
//                    CodigosBarras.Free;
//                  end;
//                end;
//              finally
//                Inc(FFila);
//                Synchronize(AgregarFila);
//              end;
//            end;
//
//            if FEnteDetectado = 'RENTAS' then
//            begin
//              if FEmpresa <> 1 then
//              begin
//                FTextoAMostrar := 'CEDULON INCORRECTO';
//                FColumna := 2;
//                Synchronize(MostrarEnGrilla);
//                Synchronize(ActualizarProgreso);
//                Continue;
//              end;
//
//              UnidadFact := fLecturaIA.ExtraerCuentaRentas(PathPdf);
//              FTextoAMostrar := UnidadFact;
//              FColumna := 2;
//              Synchronize(MostrarEnGrilla);
//
//  //            fLecturaIA.VerificarZBarListo;
//  //
//  //            fLecturaIA.ExtraerBarrasRapido(PathPdf, vBarraLarga, vBarraInterna);
//  //            FTextoAMostrar := 'Codigo 1: ' + vBarraLarga;
//  //            Synchronize(MostrarEnMemo);
//  //            FTextoAMostrar := 'Codigo 2: ' + vBarraInterna;
//  //
//  //            fLecturaIA.VerificarZBarListo;
//
//              if fLecturaIA.EjecutarInvisible(FPathApp + 'pdftocairo.exe',
//                 '-png -singlefile -r 800 "' + PathPDF + '" "' + FPathApp + NomBase + '"') then
//              begin
//                Sleep(300);
//
//                fLecturaIA.EjecutarInvisible(FPathApp + 'tesseract.exe',
//                   '"' + PathIMG + '" "' + PathTXT + '" --psm 6 --oem 3 --tessdata-dir "' + FPathApp + 'tessdata" -c tessedit_char_whitelist=0123456789');
//                Query.Close;
//                Query.SQL.Text := 'SELECT CODINQ FROM INMUEBLES WHERE NUMEROCUENTA = :unidad';
//                Query.ParamByName('unidad').AsString := UnidadFact;
//                Query.Open;
//
//                if not Query.IsEmpty then
//                begin
//                  FTextoAMostrar := Query.FieldByName('Codinq').AsString;
//                  FColumna := 0;
//                  Synchronize(MostrarEnGrilla);
//                  FTextoAMostrar := 'ENCONTRADO';
//                  FColumna := 5;
//                  Synchronize(MostrarEnGrilla);
//                end
//                else
//                begin
//                  FTextoAMostrar := '';
//                  FColumna := 0;
//                  Synchronize(MostrarEnGrilla);
//                  FTextoAMostrar := 'NO ENCONTRADO';
//                  FColumna := 5;
//                  Synchronize(MostrarEnGrilla);
//                end;
//
//                FCodigoBarras1 := '';
//                FCodigoBarras2 := '';
//                // Procesar y limpiar (dentro de ProcesarSoloNumeros se debe usar Synchronize si escribe al memo)
//                ProcesarSoloNumeros(PathTXT + '.txt', FEnteDetectado);
//                FColumna := 3;
//                FTextoAMostrar := FCodigoBarras1;
//                Synchronize(MostrarEnGrilla);
//                FColumna := 4;
//                FTextoAMostrar := FCodigoBarras2;
//                Synchronize(MostrarEnGrilla);
//
//                if (Trim(FCodigoBarras1) <> '') and (Trim(FCodigoBarras2) <> '') then
//                begin
//                  try
//                    TThread.Synchronize(nil,
//                      procedure
//                      var J: Integer;
//                      begin
//                        for J := 1 to FAsignacionBoletas.gDetalle.RowCount -1 do
//                        begin
//                          if FAsignacionBoletas.gDetalle.Cells[0, J] = Query.FieldByName('Codinq').AsString then
//                          begin
//                            prTraducirCodigoBarras(J);
//                            FTextoAMostrar := 'ACTUALIZO';
//                            FColumna := 5;
//                            Synchronize(MostrarEnGrilla);
//                            Break;
//                          end
//                        end;
//                      end);
//                  finally
//                    CodigosBarras.Free;
//                  end;
//                end;
//                Inc(FFila);
//                Synchronize(AgregarFila);
//              end;
//            end;
//          end;
//
//          if FileExists(PathIMG) then DeleteFile(PChar(PathIMG));
//          if FileExists(PathTXT + '.txt') then DeleteFile(PChar(PathTXT + '.txt'));
//          Synchronize(ActualizarProgreso);
//        until FindNext(SR) <> 0;
//      finally
//        FindClose(SR);
//      end;
//    end;

//    FTextoAMostrar := '--- PROCESO DE CARPETA FINALIZADO ---';
//    Synchronize(MostrarEnMemo);

    // Reactivar botón al finalizar
//    TThread.Synchronize(nil, procedure begin fLecturaIA.btnProcesarCedulon.Enabled := True; end);
  finally
    Query.Free;
    SP.Free;
    Conn.Connected := False;
    Conn.Free;
    TThread.Synchronize(nil, procedure
    begin
      fABMValesImpuestos.HiloEnProceso := False;
      fABMValesImpuestos.prControlarBotones(True);
      fABMValesImpuestos.ActualizarClick(nil);
    end);
  end;
end;

procedure TProcesoThread.MostrarEnGrilla;
begin

end;

procedure TProcesoThread.MostrarEnMemo;
begin

end;

procedure TProcesoThread.PrepararProgreso;
begin
  fABMValesImpuestos.Progreso.Properties.Min := 0;
  fABMValesImpuestos.Progreso.Properties.Max := FMaximo;
  fABMValesImpuestos.Progreso.Position := 0;
  fABMValesImpuestos.Progreso.Visible := True;
  fABMValesImpuestos.lbTarea.Visible := True;
end;

end.
