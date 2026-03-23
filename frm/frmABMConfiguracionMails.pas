unit frmABMConfiguracionMails;

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
  AdvGlowButton, cxCheckBox, cxGroupBox;

type
  TfAbmConfiguracionMails = class(TForm)
    gDetalle: TStringAlignGrid;
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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TcxCheckBox;
    TodosDescripcion: TcxCheckBox;
    Actualizar: TAdvGlowButton;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
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
  fAbmConfiguracionMails: TfAbmConfiguracionMails;

implementation

uses frmDatosFijos, frmPrincipal, frmConfiguracionMail;

{$R *.dfm}

procedure TfAbmConfiguracionMails.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from ConfiguracionMail where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and ID >=:desde and ID <=:Hasta ');
      q.ParamByName('Desde').AsString := edDesde.Text;
      q.ParamByName('Hasta').AsString := edHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Nombre) like :Nombre ');
      q.ParamByName('Nombre').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by ID ');
    q.Open;
    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('id').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Nombre').AsString;
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

function TfAbmConfiguracionMails.TituloGetFieldValue(aFieldName: string): Variant;
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
end;

procedure TfAbmConfiguracionMails.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmConfiguracionMails.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmConfiguracionMails.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;
  if FDatosFijos = nil then
    Application.CreateForm(TFConfiguracionMail, FConfiguracionMail)
  else
    FConfiguracionMail.Show;
  FConfiguracionMail.Cargar(gDetalle.Cells[0,gDetalle.Row], toEliminar);

end;

procedure TfAbmConfiguracionMails.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfAbmConfiguracionMails.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if fConfiguracionMail = nil then
    Application.CreateForm(TfConfiguracionMail, fConfiguracionMail)
  else
    fConfiguracionMail.Show;
  fConfiguracionMail.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfAbmConfiguracionMails.btnNuevoClick(Sender: TObject);
begin
  if fConfiguracionMail = nil then
    Application.CreateForm(TfConfiguracionMail, fConfiguracionMail)
  else
    fConfiguracionMail.Show;
  fConfiguracionMail.Cargar('',toNuevo);
end;

procedure TfAbmConfiguracionMails.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmConfiguracionMails.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmConfiguracionMails.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmConfiguracionMails.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfAbmConfiguracionMails.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmConfiguracionMails.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmConfiguracionMails.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fAbmConfiguracionMails := nil;
end;

procedure TfAbmConfiguracionMails.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmConfiguracionMails.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmConfiguracionMails.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 0 then
    gDetalle.SortColumn(Col, True,'N')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

end.
