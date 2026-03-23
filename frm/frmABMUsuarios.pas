unit frmABMUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  FXQuery, ppDesignLayer, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  AdvGlowButton, cxGroupBox;

type
  TfAbmUsuarios = class(TForm)
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
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    Actualizar: TAdvGlowButton;
    Label2: TLabel;
    edDescripcion: TEdit;
    TodosDescripcion: TCheckBox;
    procedure ActualizarClick(Sender: TObject);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
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
  fAbmUsuarios: TfAbmUsuarios;

implementation

uses frmDatosFijos, frmPrincipal, frmABMDatosFijos, frmRazonesSociales,
  frmABMRazonesSociales, frmSobres, frmUsuarios;

{$R *.dfm}

procedure TfAbmUsuarios.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from Usuarios where 1=1';

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Nombre) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by Nombre ');
    q.Open;

    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := UpperCase(q.FieldByName('Nombre').AsString);
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

function TfAbmUsuarios.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Descripción' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end;
end;

procedure TfAbmUsuarios.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmUsuarios.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if fUsuarios = nil then
    Application.CreateForm(TfUsuarios, fUsuarios)
  else
    fUsuarios.Show;

  fUsuarios.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar);

end;

procedure TfAbmUsuarios.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfAbmUsuarios.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if fUsuarios = nil then
    Application.CreateForm(TfUsuarios, fUsuarios)
  else
    fUsuarios.Show;
  fUsuarios.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfAbmUsuarios.btnNuevoClick(Sender: TObject);
begin
  if FUsuarios = nil then
    Application.CreateForm(TFUsuarios, FUsuarios)
  else
    FUsuarios.Show;
  FUsuarios.Cargar('',toNuevo);
end;

procedure TfAbmUsuarios.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmUsuarios.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmUsuarios.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fAbmUsuarios := nil;
end;

procedure TfAbmUsuarios.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmUsuarios.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FUsuarios = nil then
    Application.CreateForm(TFUsuarios, FSobres)
  else
    FUsuarios.Show;
  FUsuarios.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmUsuarios.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
