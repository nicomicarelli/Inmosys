unit ABMIdentificacionImpuestos;

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
  cxTextEdit, Menus, cxMaskEdit, cxDropDownEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  ppDesignLayer, fxQuery, Data.DB, cxGroupBox, AdvPanel, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dbCLient, cxSpinEdit;

type
  TfABMIdentificacionImpuestos = class(TForm)
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
    popOpciones: TPopupMenu;
    pnlFondo: TAdvPanel;
    gbxBotones: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TodosCodigos: TcxCheckBox;
    TodosDescripcion: TcxCheckBox;
    edDesde: TcxTextEdit;
    edHasta: TcxTextEdit;
    edDescripcion: TcxTextEdit;
    cbGrupos: TcxComboBox;
    chAgrupar: TcxCheckBox;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Empresa: TcxGridDBColumn;
    Columna_Mes: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Columna_Anio: TcxGridDBColumn;
    Columna_Cuota: TcxGridDBColumn;
    Label3: TLabel;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    chTodosMeses: TcxCheckBox;
    Actualizar: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
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
    procedure fAsignacionBoletasNuevoCopiadelSeleccionado1Click(
      Sender: TObject);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    procedure prPrepararDataset;

    function fxValidarPorcentajesPago: Boolean;
    { Private declarations }
  public
    boAgrupado: Boolean;{ Public declarations }
  end;

var
  fABMIdentificacionImpuestos: TfABMIdentificacionImpuestos;

implementation

uses frmDatosFijos, frmPrincipal,
  frmNuevoImpuesto, ABMImpuestosYServicios, frmNuevoCedulon;

{$R *.dfm}

procedure TfABMIdentificacionImpuestos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  gDatos.DataController.BeginFullUpdate;
  cdsDatos.DisableControls;
  cdsDatos.EmptyDataSet;
  q := CrearQuery;
  try
    q.SQL.Text := 'Select C.*, E.Descripcion from CabezaCedulones C Inner join EmpresasImpuestos E on E.Codigo = C.Codigo where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and E.Codigo >=:desde and E.Codigo <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;
    if not chTodosMeses.Checked then
    begin
      q.SQL.Add(' and C.Mes =:Mes and C.Anio =:Anio ');
      q.ParamByName('Mes').AsString := edmes.Text;
      q.ParamByName('Anio').AsInteger := spAnio.Value;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(E.Descripcion) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by E.Codigo ');
    q.Open;
    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldByName('Codigo').AsString := q.FieldByName('Codigo').AsString;
      cdsDatos.FieldByName('Empresa').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.FieldByName('Mes').AsString := q.FieldByName('Mes').AsString;
      cdsDatos.FieldByName('Anio').AsString := q.FieldByName('Anio').AsString;
      cdsDatos.FieldByName('Cuota').AsBoolean :=  q.FieldByName('Cuota50').AsInteger = 1;
      cdsDatos.Post;
      q.Next;
    end;

    gDatos.Controller.ClearGrouping;
    if chAgrupar.Checked then
      gDatos.Columns[cbGrupos.ItemIndex + 1].GroupIndex := 0;
  finally
    FreeAndNil(q);
    gDatos.DataController.EndFullUpdate;
    cdsDatos.EnableControls;
  end;
end;

function TfABMIdentificacionImpuestos.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfABMIdentificacionImpuestos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMIdentificacionImpuestos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfABMIdentificacionImpuestos.btnEliminarClick(Sender: TObject);
begin
  if cdsDatos.FieldByName('Codigo').AsString = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;


  if FAsignacionBoletas = nil then
    Application.CreateForm(TFAsignacionBoletas, FAsignacionBoletas)
  else
    FAsignacionBoletas.Show;

  fAsignacionBoletas.Cargar(cdsDatos.FieldByName('Codigo').AsString,toEliminar, cdsDatos.FieldByName('Mes').AsString, cdsDatos.FieldByName('Anio').AsString, cdsDatos.FieldByName('Cuota').AsBoolean);

end;

procedure TfABMIdentificacionImpuestos.btnImprimirClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

//  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfABMIdentificacionImpuestos.btnModificarClick(Sender: TObject);
begin
  if cdsDatos.FieldByName('Codigo').AsString = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;

  if fAsignacionBoletas = nil then
    Application.CreateForm(TfAsignacionBoletas, fAsignacionBoletas)
  else
    fAsignacionBoletas.Show;

  fAsignacionBoletas.Cargar(cdsDatos.FieldByName('Codigo').AsString,toModificar, cdsDatos.FieldByName('Mes').AsString, cdsDatos.FieldByName('Anio').AsString, cdsDatos.FieldByName('Cuota').AsBoolean);

end;

procedure TfABMIdentificacionImpuestos.btnNuevoClick(Sender: TObject);
begin
  if fAsignacionBoletas = nil then
    Application.CreateForm(TfAsignacionBoletas, fAsignacionBoletas)
  else
    fAsignacionBoletas.Show;

end;

procedure TfABMIdentificacionImpuestos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMIdentificacionImpuestos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMIdentificacionImpuestos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfABMIdentificacionImpuestos.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfABMIdentificacionImpuestos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfABMIdentificacionImpuestos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfABMIdentificacionImpuestos.fAsignacionBoletasNuevoCopiadelSeleccionado1Click(
  Sender: TObject);
begin
  if cdsDatos.FieldByName('Codigo').AsString = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;

  if fAsignacionBoletas = nil then
    Application.CreateForm(TfAsignacionBoletas, fAsignacionBoletas)
  else
    fAsignacionBoletas.Show;

  fAsignacionBoletas.Cargar(cdsDatos.FieldByName('Codigo').AsString,toModificar, cdsDatos.FieldByName('Mes').AsString, cdsDatos.FieldByName('Anio').AsString, cdsDatos.FieldByName('Cuota').AsBoolean, True);
end;

procedure TfABMIdentificacionImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMIdentificacionImpuestos := nil;
end;

procedure TfABMIdentificacionImpuestos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
  edMes.ItemIndex := ToInt(FormatDatetime('mm', DAte)) - 1;
  spAnio.Value := ToInt(FormatDatetime('YYYY', DAte));
end;

procedure TfABMIdentificacionImpuestos.prPrepararDataset;
var
  I: Integer;

begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codigo', ftString, 10);
  cdsDatos.FieldDefs.Add('Empresa', ftString, 100);
  cdsDatos.FieldDefs.Add('Mes', ftString, 100);
  cdsDatos.FieldDefs.Add('Anio', ftString, 100);
  cdsDatos.FieldDefs.Add('Cuota', ftBoolean);
  cdsDatos.CreateDataset;

  for I := 0 to gDatos.ColumnCount - 1 do
    gDatos.Columns[I].DataBinding.FieldName := cdsDatos.Fields[I].FieldName;

  dsDatos.DataSet := cdsDatos;
  gDatos.DataController.DataSource := dsDatos;


end;

function TfABMIdentificacionImpuestos.fxValidarPorcentajesPago: Boolean;
var
  q: TFXQuery;
begin
  Result := True;
  q := CrearQuery;
  try
    q.Sql.Text :=
      ' Select I.Codinq, I.Inquilino, P.PorcentajeInquilino, P.PorcentajePropietario ' +
      '   from Inmuebles I' +
      '   Left Join PorcentajeCobro P on P.Codinq = I.Codinq ' +
      '  where P.Codigo = :Codigo';
    q.ParambyName('Codigo').AsInteger := ToInt(cdsDatos.FieldByName('Codigo').AsString);
    q.Open;

    if q.IsEmpty then
    begin
      MostrarDialogoAceptar('Debe definir los porcentajes de pago de cada propiedad.');
      Result := False;
      Exit;
    end;
  finally
    FreeAndNil(q);
  end;
end;

end.
