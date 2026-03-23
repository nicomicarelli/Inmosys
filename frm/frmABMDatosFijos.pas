unit frmABMDatosFijos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxLookAndFeels, FXQuery, ppDesignLayer, cxGraphics,
  cxControls, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  AdvGlowButton, cxGroupBox;

type
  TfAbmDatosFijos = class(TForm)
    gDetalle: TStringAlignGrid;
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
    Reporte: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppLabel8: TppLabel;
    cxGroupBox2: TcxGroupBox;
    Actualizar: TAdvGlowButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    cbAfecta: TComboBox;
    cbDestino: TComboBox;
    TodosAfecta: TCheckBox;
    TodosDestino: TCheckBox;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    chInactivos: TCheckBox;
    plReporteppField5: TppField;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    chSoloInactivos: TCheckBox;
    Shape2: TShape;
    Label9: TLabel;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaChange(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure TodosAfectaClick(Sender: TObject);
    procedure cbAfectaClick(Sender: TObject);
    procedure TodosDestinoClick(Sender: TObject);
    procedure cbDestinoChange(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure btnNuevoClick(Sender: TObject);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbmDatosFijos: TfAbmDatosFijos;

implementation

uses frmDatosFijos, frmPrincipal;

{$R *.dfm}

procedure TfAbmDatosFijos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select CO.*, S.Descripcion as DescripcionSobre from conceptos CO inner join Sobres S on S.Codigo = CO.Sobre where 1=1';

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and CO.Codigo >=:desde and CO.Codigo <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(CO.Descripcion) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    if not TodosAfecta.Checked then
    begin
      q.SQL.Add(' and CO.InqProp = :Afecta ');
      q.ParamByName('Afecta').AsInteger := cbAfecta.ItemIndex;
    end;

    if not TodosDestino.Checked then
    begin
      q.SQL.Add(' and CO.Listado = :Listado ');
      q.ParamByName('Listado').AsInteger := cbDestino.ItemIndex;
    end;
    if chSoloInactivos.Checked then
      q.SQL.Add(' and CO.Activo = 0 ')
    else
      if not chInactivos.Checked then
        q.SQL.Add(' and CO.Activo = 1 ');

    q.SQL.Add(' order by CO.Codigo ');
    q.Open;
    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codigo').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Descripcion').AsString;
      case q.FieldByName('InqProp').AsInteger of
        0: gDetalle.Cells[2,I] := 'Ambos';
        1: gDetalle.Cells[2,I] := 'Inquilino';
        2: gDetalle.Cells[2,I] := 'Propietario';
      end;
      case q.FieldByName('Listado').AsInteger of
        0: gDetalle.Cells[3,I] := 'Todos';
        1: gDetalle.Cells[3,I] := 'Propietario';
        2: gDetalle.Cells[3,I] := 'Inquilino';
        3: gDetalle.Cells[3,I] := 'Estudio';
      end;
      gDetalle.Cells[4,I] := q.FieldByName('DescripcionSobre').AsString;

      if q.FieldByName('Activo').AsInteger = 0 then
        gDetalle.ColorRow[I] := RGB(255,185,185);

      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
  finally
    FreeAndNil(q);
  end;
end;

function TfAbmDatosFijos.TituloGetFieldValue(aFieldName: string): Variant;
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
  end

  else if aFieldName = 'Filtro por Afecta a' then
  begin
    if todosAfecta.Checked then
      Result := 'Todos'
    else
      Result := cbAfecta.Text;
  end
  else if aFieldName = 'Filtro por Destino' then
  begin
    if todosDestino.Checked then
      Result := 'Todos'
    else
      Result := cbDestino.Text;
  end;
end;

procedure TfAbmDatosFijos.TodosAfectaClick(Sender: TObject);
begin
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
end;

procedure TfAbmDatosFijos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmDatosFijos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmDatosFijos.TodosDestinoClick(Sender: TObject);
begin
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
end;

procedure TfAbmDatosFijos.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar);

end;

procedure TfAbmDatosFijos.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfAbmDatosFijos.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfAbmDatosFijos.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfAbmDatosFijos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmDatosFijos.cbAfectaClick(Sender: TObject);
begin
  todosafecta.Checked := False;
end;

procedure TfAbmDatosFijos.cbDestinoChange(Sender: TObject);
begin
  TodosDestino.Checked := False;
end;

procedure TfAbmDatosFijos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmDatosFijos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmDatosFijos.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfAbmDatosFijos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmDatosFijos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmDatosFijos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMDatosFijos := nil;
end;

procedure TfAbmDatosFijos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmDatosFijos.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmDatosFijos.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 0 then
    gDetalle.SortColumn(Col, True,'N')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

end.
