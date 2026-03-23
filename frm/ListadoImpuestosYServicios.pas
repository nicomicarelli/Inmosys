unit ListadoImpuestosYServicios;

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
  ppDesignLayer, fxQuery, Data.DB, cxGroupBox, AdvPanel, cxSpinEdit;

type
  TfListadoImpuestos = class(TForm)
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
    edDescripcion: TcxTextEdit;
    chAgrupar: TcxCheckBox;
    gDetalle: TAdvStringGrid;
    edDesde: TcxTextEdit;
    edHasta: TcxTextEdit;
    cbGrupos: TcxComboBox;
    Label3: TLabel;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    chTodosMeses: TcxCheckBox;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    btnBuscar: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
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
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure fAsignacionBoletasNuevoCopiadelSeleccionado1Click(
      Sender: TObject);
  private
    procedure prPonerTitulosGrilla(pGrilla: TAdvStringGrid);
    function fxValidarPorcentajesPago: Boolean;
    { Private declarations }
  public
    boAgrupado: Boolean;{ Public declarations }
    PantallaActiva: TPantallaActiva;
  end;

var
  fListadoImpuestos: TfListadoImpuestos;


implementation

uses frmDatosFijos, frmPrincipal,
  frmNuevoImpuesto, ABMImpuestosYServicios, frmNuevoCedulon,
  frmNuevoCedulonPagado, frmNuevaDevolucionDinero, frmListadoImpuestosFiltrados;

{$R *.dfm}

procedure TfListadoImpuestos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  gDetalle.Clear;
  if gDetalle.GroupColumn > -1 then
  begin
    gDetalle.ExpandAll;
    for i := 1 to gDetalle.RowCount - 1 do
    begin
      if gDetalle.IsNode(i) then
        gDetalle.SplitCells(1,i);   // split cells again
    end;
    gDetalle.UnGroup;
    gDetalle.RemoveCols(0,1);  // remove the place holder column for group nodes again
  end;
  prPonerTitulosGrilla(gDetalle);

  q := CrearQuery;
  try
    q.SQL.Text :=
      ' Select C.*, E.Descripcion '+
      '   from CabezaCedulones C '+
      '  Inner join EmpresasImpuestos E on E.Codigo = C.Codigo '+
      '  where 1=1';
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
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codigo').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Descripcion').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Mes').AsString;
      gDetalle.Cells[3,I] := q.FieldByName('Anio').AsString;
      if q.FieldByName('Cuota50').AsInteger = 1 then
        gDetalle.Cells[4,I] := 'SI'
      else
        gDetalle.Cells[4,I] := 'NO';
      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    if chAgrupar.Checked then
    begin
      gDetalle.InsertCols(0,1); // insert a new column to place the grouping nodes in
      gDetalle.ColWidths[0] := 20; // make this a small column, just wide enough to fit the node graphic
      gDetalle.Group(cbGrupos.ItemIndex + 2); // perform grouping based on column 1
      for i := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.IsNode(i) then
          gDetalle.MergeCells(1,i,gDetalle.ColCount,1); // Merge the full row
      end;
      boAgrupado := True; // remove the place holder column for group nodes again
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TfListadoImpuestos.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfListadoImpuestos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfListadoImpuestos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfListadoImpuestos.AdvGlowButton1Click(Sender: TObject);
begin
  gDetalle.SearchFooter.Visible := not gdetalle.SearchFooter.Visible;
end;

procedure TfListadoImpuestos.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;


  if FAsignacionBoletas = nil then
    Application.CreateForm(TFAsignacionBoletas, FAsignacionBoletas)
  else
    FAsignacionBoletas.Show;

  fAsignacionBoletas.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar, gDetalle.Cells[2,gDetalle.Row], gDetalle.Cells[3,gDetalle.Row], gDetalle.Cells[4,gDetalle.Row]= 'SI');

end;

procedure TfListadoImpuestos.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

//  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfListadoImpuestos.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;

  if fNuevoCedulonPagado = nil then
    Application.CreateForm(TfNuevoCedulonPagado, fNuevoCedulonPagado)
  else
    fNuevoCedulonPagado.Show;

  fNuevoCedulonPagado.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar, gDetalle.Cells[2,gDetalle.Row], gDetalle.Cells[3,gDetalle.Row], gDetalle.Cells[4,gDetalle.Row]);

end;

procedure TfListadoImpuestos.btnNuevoClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;

  if fListadoImpuestosFiltrados = nil then
    Application.CreateForm(TfListadoImpuestosFiltrados, fListadoImpuestosFiltrados)
  else
    fListadoImpuestosFiltrados.Show;

  fListadoImpuestosFiltrados.PantallaActiva := PantallaActiva;
  fListadoImpuestosFiltrados.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar,
    gDetalle.Cells[2,gDetalle.Row], gDetalle.Cells[3,gDetalle.Row],
    gDetalle.Cells[4,gDetalle.Row]);
end;

procedure TfListadoImpuestos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfListadoImpuestos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfListadoImpuestos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfListadoImpuestos.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfListadoImpuestos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfListadoImpuestos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfListadoImpuestos.fAsignacionBoletasNuevoCopiadelSeleccionado1Click(
  Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if not fxValidarPorcentajesPago then
    Exit;

  if fNuevoCedulonPagado = nil then
    Application.CreateForm(TfAsignacionBoletas, fNuevoCedulonPagado)
  else
    fNuevoCedulonPagado.Show;

  fNuevoCedulonPagado.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar, gDetalle.Cells[2,gDetalle.Row], gDetalle.Cells[3,gDetalle.Row], gDetalle.Cells[4,gDetalle.Row], True);
end;

procedure TfListadoImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fListadoImpuestos := nil;
end;

procedure TfListadoImpuestos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);

  prPonerTitulosGrilla(gDetalle);
  gDetalle.SearchPanel.EditControl.Text := '';
  gDetalle.SortSettings.Direction := sdDescending;
//  gDetalleCanSort(Sender, 1, RunOnceABM);
  edMes.ItemIndex := ToInt(FormatDatetime('mm', DAte)) - 1;
  spAnio.Value := ToInt(FormatDatetime('YYYY', DAte));
  gDetalle.SearchFooter.Visible := False;
  boAgrupado := False;

end;

procedure TfListadoImpuestos.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
//  gDetalle.SortColumn(Col, True,'S');
end;

procedure TfListadoImpuestos.prPonerTitulosGrilla(pGrilla: TAdvStringGrid);
var
  colHeaders: TStringList;

begin
  colHeaders := TStringList.Create;
  colHeaders.Add('Código');
  colHeaders.Add('Empresa');
  colHeaders.Add('Mes');
  colHeaders.Add('Año');
  colHeaders.Add('Cuota Excepcional');

  pGrilla.ColumnHeaders := colHeaders;
end;

function TfListadoImpuestos.fxValidarPorcentajesPago: Boolean;
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
    q.ParambyName('Codigo').AsInteger := ToInt(gDetalle.Cells[0,gDetalle.Row]);
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
