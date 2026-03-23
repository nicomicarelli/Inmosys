unit ABMPorcentajesCobro;

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
  dxSkinWhiteprint, ppDesignLayer, fxQuery, Data.DB, DBClient, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox, AdvPanel;

type
  TfABMPorcentajeCobroImpuestos = class(TForm)
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
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    Columna_Identificacion: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TodosCodigos: TcxCheckBox;
    TodosDescripcion: TcxCheckBox;
    edDesde: TcxTextEdit;
    edHasta: TcxTextEdit;
    edDescripcion: TcxTextEdit;
    Actualizar: TAdvGlowButton;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
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
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;

    procedure prPrepararDataset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fABMPorcentajeCobroImpuestos: TfABMPorcentajeCobroImpuestos;

implementation

uses frmDatosFijos, frmPrincipal, frmNuevoImpuesto, ABMImpuestosYServicios, frmNuevoCedulon,
  ABMIdentificacionImpuestos, frmNuevaAsignacionPorcentajes;

{$R *.dfm}

procedure TfABMPorcentajeCobroImpuestos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  cdsDatos.EmptyDataSet;
  cdsDatos.DisableControls;
  gDatos.DataController.BeginFullUpdate;

  q := CrearQuery;
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

function TfABMPorcentajeCobroImpuestos.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfABMPorcentajeCobroImpuestos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMPorcentajeCobroImpuestos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfABMPorcentajeCobroImpuestos.btnEliminarClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if fPorcentajesCobro = nil then
    Application.CreateForm(TfPorcentajesCobro, fPorcentajesCobro)
  else
    fPorcentajesCobro.Show;

  fPorcentajesCobro.Cargar(cdsDatos.FieldByName('Codigo').AsString,toEliminar);

end;

procedure TfABMPorcentajeCobroImpuestos.btnImprimirClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

//  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfABMPorcentajeCobroImpuestos.btnModificarClick(Sender: TObject);
begin
  if cdsDatos.IsEmpty then
    Exit;

  if fPorcentajesCobro = nil then
    Application.CreateForm(TfPorcentajesCobro, fPorcentajesCobro)
  else
    fPorcentajesCobro.Show;

  fPorcentajesCobro.Cargar(cdsDatos.FieldByName('Codigo').AsString,toModificar);

end;

procedure TfABMPorcentajeCobroImpuestos.btnNuevoClick(Sender: TObject);
var
  q: TFXQuery;
begin
  if cdsDatos.IsEmpty then
    Exit;

  q := CrearQuery;
  try
    q.Sql.Text :=
      ' Select * from PorcentajeCobro Where Codigo = :Codigo';
    q.ParambyName('Codigo').AsString := cdsDatos.FieldByName('Codigo').AsString;
    q.Open;

    if not q.IsEmpty then
    begin
      MostrarDialogoAceptar('Ya existe la asignacion de porcentajes para esta empresa. Verifique por favor.');
      Exit;
    end;
  finally
    FreeAndNil(q);
  end;

  if fPorcentajesCobro = nil then
    Application.CreateForm(TfPorcentajesCobro, fPorcentajesCobro)
  else
    fPorcentajesCobro.Show;
  fPorcentajesCobro.Cargar(cdsDatos.FieldByName('Codigo').AsString,toNuevo);
end;

procedure TfABMPorcentajeCobroImpuestos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMPorcentajeCobroImpuestos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMPorcentajeCobroImpuestos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfABMPorcentajeCobroImpuestos.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfABMPorcentajeCobroImpuestos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfABMPorcentajeCobroImpuestos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfABMPorcentajeCobroImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMPorcentajeCobroImpuestos := nil;
end;

procedure TfABMPorcentajeCobroImpuestos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prPrepararDataset;
end;

procedure TfABMPorcentajeCobroImpuestos.prPrepararDataset;
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
