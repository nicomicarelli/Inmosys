unit frmPasarHistoricoVales;

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
  Vcl.Menus, frmDatos, Provider;

type
  TFPasarHistoricoVales = class(TForm)
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
    btnImprimir: TAdvGlowButton;
    chCerrados: TcxCheckBox;
    Label5: TLabel;
    cbCategoria: TcxLookupComboBox;
    popEliminar: TPopupMenu;
    Columna_Categoria: TcxGridDBColumn;
    Label6: TLabel;
    edCodinqDesde: TEdit;
    Label7: TLabel;
    edCodinqHasta: TEdit;
    chTodosCodinq: TcxCheckBox;
    Columna_Codinq: TcxGridDBColumn;
    btnModificar: TAdvGlowButton;
    Columna_Seleccionado: TcxGridDBColumn;
    Seleccionartodos1: TMenuItem;
    Deseleccionartodos1: TMenuItem;
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
    procedure Seleccionartodos1Click(Sender: TObject);
    procedure Deseleccionartodos1Click(Sender: TObject);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    dsCategorias: TDataSource;
    qCategorias: TFXQuery;
    procedure prActualizar;
    procedure prPrepararDataset;
  public
    Categoria: Integer;
  end;

var
  FPasarHistoricoVales: TFPasarHistoricoVales;

implementation

uses frmprincipal, frmNuevaCatetgoriaVale, frmNuevoIndicador, frmVales;

{$R *.dfm}

procedure TFPasarHistoricoVales.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select CA.*, V.Descripcion as Categoria,Sum(CU.Entra - CU.Sale) as MontoPendiente '+
    '                from CabezaVales CA ' +
    '               Inner Join CategoriasVales V on V.Codigo = CA.CodigoCategoria '+
    '               Inner Join CuerpoVales CU on CA.Codigo = Cu.Codigo '+
    ' where 1=1 ' ;

    if cbCategoria.EditValue > 0 then
      q.SQL.Add(' and CodigoCategoria=:Categoria ');

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and Codigo >=:desde and Codigo <=:Hasta ');
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
      q.SQL.Add(' and Upper(Descripcion) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;
    if not chTodosMeses.Checked then
    begin
      q.SQL.Add(' and Mes = :Mes and anio = :anio');
      q.ParamByName('Mes').AsInteger := edMes.ItemIndex + 1;
      q.ParamByName('Anio').AsInteger := ToInt(spAnio.text);
    end;

    if not chCerrados.Checked then
      q.SQL.Add(' and Cerrado = 0 ');

    q.SQL.Add(' Group by 1,2,3,4,5,6,7,8,9,10,11,12 ');
    q.SQL.Add(' order by Codigo ');
    if cbCategoria.EditValue > 0 then
      q.ParambyName('Categoria').AsInteger := cbCategoria.EditValue;
    q.Open;

    cdsDatos.EmptyDataset;
    while not q.Eof do
    begin
      cdsDatos.Append;
      cdsDatos.FieldbyName('Seleccionado').AsBoolean := False;
      cdsDatos.FieldbyName('Codigo').AsInteger := q.FieldByName('Codigo').AsInteger;
      cdsDatos.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsDatos.FieldbyName('Monto').AsFloat := q.FieldByName('Monto').AsFloat;
      cdsDatos.FieldbyName('Pendiente').AsFloat := q.FieldByName('MontoPendiente').AsFloat;
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

procedure TFPasarHistoricoVales.btnEliminarClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toEliminar);
end;

procedure TFPasarHistoricoVales.btnImprimirClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I: Integer;
  CDS: TClientDataset;
  dsp: TDataSetProvider;
  Cantidad: Integer;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  CDS := TClientDataSet.Create(nil);
  DSP := TDataSetProvider.Create(Nil);
  DM.IniciarTransaccion;
  try
    try
      cdsDatos.First;
      while not cdsDatos.eof do
      begin
        if not cdsDatos.FieldByName('Seleccionado').AsBoolean then
        begin
          cdsDatos.Next;
          Continue;
        end;

        q.SQL.Text := ' Insert into HistoricoCabezaVales '+
                      ' Select C.* From CabezaVales C ';
        q.SQL.Add(    '  Where C.Codigo = :InqDesde');
        q.SQL.Add(    '    and not exists (Select Codigo from Historicocabezavales h1 where h1.codigo = c.codigo)');
        q.ParambyName('InqDesde').AsInteger := cdsDatos.FieldByName('Codigo').AsInteger;
        q.ExecSql;

        q1.SQL.Text := 'Insert into HistoricoCuerpovales  '+
                      ' Select * From CuerpoVales C ';
        q1.SQL.Add(   '  Where Codigo = :InqDesde ');
        q1.ParambyName('InqDesde').AsInteger :=cdsDatos.FieldByName('Codigo').AsInteger;
        q1.ExecSql;


        q1.SQL.Text := ' Select C.Codigo From CabezaVales C ';
        q1.SQL.Add(    '  Where C.Codigo = :InqDesde');
        q1.ParambyName('InqDesde').AsInteger := cdsDatos.FieldByName('Codigo').AsInteger;
        q1.Open;

        while not q1.eof do
        begin
          q.SQL.Text := ' delete From Cabezavales Where Codigo = :ID';
          q.ParambyName('ID').AsInteger := ToInt(q1.FieldByName('Codigo').AsString);
          q.ExecSql;

          q.SQL.Text := ' delete From CuerpoVales Where Codigo = :ID';
          q.ParambyName('ID').AsInteger := ToInt(q1.FieldByName('Codigo').AsString);
          q.ExecSql;

          q1.Next;
        end;
        cdsDatos.Next;
      end;
      DM.ConfirmarTransaccion;

      MostrarDialogoAceptar('Datos pasados del histórico satisfactoriamente.');
      Close;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

procedure TFPasarHistoricoVales.btnModificarClick(Sender: TObject);
begin
  if FVales = nil then
    Application.CreateForm(TFVales, FVales)
  else
    FVales.Show;

  fVales.OnActualizar := prActualizar;
  fVales.Cargar(cdsDatos.FieldbyName('Codigo').asInteger, toModificar);
  fVales.btnEliminar.Visible := False;
  fVales.btnModificar.Visible := False;
  fVales.btnNuevo.Visible := False;
  fVales.Actualizar.Visible := False;
  fVales.btnGrabar.Visible := False;
end;

procedure TFPasarHistoricoVales.btnNuevoClick(Sender: TObject);
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

procedure TFPasarHistoricoVales.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFPasarHistoricoVales.chTodosCodinqClick(Sender: TObject);
begin
  if chtodosCodinq.Checked then
  begin
    edCodinqDesde.Text:='';
    edCodinqHasta.Text:='';
  end;

  if Trim(edCodinqDesde.Text) = ''  then
    chtodosCodinq.Checked := True;
end;

procedure TFPasarHistoricoVales.Deseleccionartodos1Click(Sender: TObject);
begin
  cdsDatos.First;
  while not cdsDatos.eof do
  begin
    cdsDatos.Edit;
    cdsDatos.FieldByName('Seleccionado').AsBoolean := False;
    cdsDatos.Post;
    cdsDatos.Next;
  end;
  cdsDatos.First;
end;

procedure TFPasarHistoricoVales.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TFPasarHistoricoVales.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TFPasarHistoricoVales.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TFPasarHistoricoVales.edCodinqDesdeChange(Sender: TObject);
begin
  edCodinqHasta.Text:=edCodinqdesde.Text;

  if edCodinqDesde.Text <> '' then
    chtodoscodinq.Checked:=False
  else
    chtodoscodinq.Checked:=True;
end;

procedure TFPasarHistoricoVales.edCodinqHastaChange(Sender: TObject);
begin
  if edCodinqHasta.Text <> '' then
    chtodoscodinq.Checked:=False
  else
    chtodoscodinq.Checked:=True;
end;

procedure TFPasarHistoricoVales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(fPasarHistoricoVales) then
    fPasarHistoricoVales := nil;
end;

procedure TFPasarHistoricoVales.FormCreate(Sender: TObject);
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

procedure TFPasarHistoricoVales.gDatosCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, Columna_Pendiente.Index) > 0) then
    ACanvas.Font.Color := clRed
  else
    ACanvas.Font.Color := clGreen;
end;

procedure TFPasarHistoricoVales.GenerarMovimientoenlaCaja1Click(Sender: TObject);
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

procedure TFPasarHistoricoVales.NuevoValecopiaFIELdelSeleccionado1Click(Sender: TObject);
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

procedure TFPasarHistoricoVales.prActualizar;
begin
  ActualizarClick(nil);
end;

procedure TFPasarHistoricoVales.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Seleccionado', ftBoolean);
  cdsDatos.FieldDefs.Add('Codigo', ftInteger);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.FieldDefs.Add('Monto', ftFloat);
  cdsDatos.FieldDefs.Add('Pendiente', ftFloat);
  cdsDatos.FieldDefs.Add('Mes', ftString, 15);
  cdsDatos.FieldDefs.Add('Anio', ftInteger);
  cdsDatos.FieldDefs.Add('Categoria', ftString, 100);
  cdsDatos.FieldDefs.Add('Codinq', ftString, 5);
  cdsDatos.CreateDataset;

  Columna_Codigo.DataBinding.FieldName := 'Codigo';
  Columna_Seleccionado.DataBinding.FieldName := 'Seleccionado';
  Columna_Descripcion.DataBinding.FieldName := 'Descripcion';
  Columna_Monto.DataBinding.FieldName := 'Monto';
  Columna_Pendiente.DataBinding.FieldName := 'Pendiente';
  Columna_Mes.DataBinding.FieldName := 'Mes';
  Columna_Anio.DataBinding.FieldName := 'Anio';
  Columna_Categoria.DataBinding.FieldName := 'Categoria';
  Columna_Codinq.DataBinding.FieldName := 'Codinq';

  TFloatField(cdsDatos.FieldByname('Monto')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsDatos.FieldByname('Pendiente')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';

  dsDatos.DataSet := cdsDatos;
  gDatos.DataController.DataSource := dsDatos;
  Columna_Seleccionado.Caption := '';

end;

procedure TFPasarHistoricoVales.Seleccionartodos1Click(Sender: TObject);
begin
  cdsDatos.First;
  while not cdsDatos.eof do
  begin
    cdsDatos.Edit;
    cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
    cdsDatos.Post;
    cdsDatos.Next;
  end;
  cdsDatos.First;
end;

function TFPasarHistoricoVales.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TFPasarHistoricoVales.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TFPasarHistoricoVales.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

end.
