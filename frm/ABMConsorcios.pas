unit ABMConsorcios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  ppDesignLayer, FXQuery;

type
  TfABMConsorcios = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    Actualizar: TBitBtn;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    gDetalle: TStringAlignGrid;
    Panel2: TPanel;
    btnSalir: TBitBtn;
    btnEliminar: TBitBtn;
    btnModificar: TBitBtn;
    btnNuevo: TBitBtn;
    btnImprimir: TBitBtn;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
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
  fABMConsorcios: TfABMConsorcios;

implementation

uses frmDatosFijos, frmPrincipal, frmNuevoConsorcio;

{$R *.dfm}

procedure TfABMConsorcios.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from Consorcios where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and Codigo >=:desde and Codigo <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Nombre) like :descripcion ');
      q.ParamByName('Nombre').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by Codigo ');
    q.Open;
    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codigo').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Nombre').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Direccion').AsString;
      gDetalle.Cells[3,I] := q.FieldByName('CodigoPostal').AsString;
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

function TfABMConsorcios.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Nombre' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end
end;

procedure TfABMConsorcios.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfABMConsorcios.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfABMConsorcios.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;
  if FNuevoCOnsorcio = nil then
    Application.CreateForm(TFNuevoConsorcio, FNuevoConsorcio)
  else
    FNuevoConsorcio.Show;
  FNuevoCOnsorcio.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar);

end;

procedure TfABMConsorcios.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfABMConsorcios.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;
  if FNuevoCOnsorcio = nil then
    Application.CreateForm(TFNuevoConsorcio, FNuevoConsorcio)
  else
    FNuevoConsorcio.Show;
  FNuevoCOnsorcio.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);

end;

procedure TfABMConsorcios.btnNuevoClick(Sender: TObject);
begin
  if FNuevoConsorcio = nil then
    Application.CreateForm(TFNuevoConsorcio, FNuevoCOnsorcio)
  else
    FNuevoConsorcio.Show;
  FNuevoConsorcio.Cargar('',toNuevo);
end;

procedure TfABMConsorcios.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfABMConsorcios.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfABMConsorcios.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfABMConsorcios.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfABMConsorcios.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfABMConsorcios.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfABMConsorcios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMConsorcios := nil;
end;

procedure TfABMConsorcios.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfABMConsorcios.gDetalleDblClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;
  if FNuevoCOnsorcio = nil then
    Application.CreateForm(TFNuevoConsorcio, FNuevoConsorcio)
  else
    FNuevoConsorcio.Show;
  FNuevoCOnsorcio.Cargar(gDetalle.Cells[0,gDetalle.Row],toMostrar);
end;

procedure TfABMConsorcios.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
