unit frmABMComisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, FXQuery, ppDesignLayer, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, AdvGlowButton, cxCheckBox, cxGroupBox;

type
  TfAbmComisionesEscalonadas = class(TForm)
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
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    plReporteppField5: TppField;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    VerDatosInmueblwe1: TMenuItem;
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
    gDetalle: TStringAlignGrid;
    cxGroupBox1: TcxGroupBox;
    Shape1: TShape;
    Label4: TLabel;
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
    procedure VerContratoEscalonado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbmComisionesEscalonadas: TfAbmComisionesEscalonadas;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmComisionesEscalonadas;

{$R *.dfm}

procedure TfAbmComisionesEscalonadas.ActualizarClick(Sender: TObject);
var
  q, qContratos: TFXQuery;
  I: Integer;
  FechaDesde, FechaHasta: TDatetime;

begin
  q := CrearQuery;
  qContratos := CrearQuery;
  try
    q.SQL.Text := 'Select I.Codinq as Codigo, I.Inquilino, I.Propietario, I.FechaFin,  C.* from Inmuebles I inner join Comisiones C on I.Codinq = C.Codinq where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and C.Codinq >=:desde and C.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by C.Codinq ');
    q.Open;
    gDetalle.Vaciar;
    I := 1;


    while not q.Eof do
    begin
      FechaDesde     := Date();
      FechaHasta     := q.FieldbyName('FechaFin').AsDatetime;

      if FechaDesde > FechaHasta then
      begin
        gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString +  '    -- CONTRATO VENCIDO -- ';
        gDetalle.Cells[5,I] := q.FieldByName('Propietario').AsString;
        gDetalle.ColorRow[I] := clyellow;
      end
      else
      begin
        gDetalle.ColorRow[I] := clSkyBlue;
        gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString;
        gDetalle.Cells[5,I] := q.FieldByName('Propietario').AsString;
      end;

      Inc(I);

      qContratos.Close;
      qContratos.SQL.Text := 'Select * from comisiones where codinq=:Codinq';
      qContratos.ParamByName('Codinq').AsString := q.FieldByName('Codigo').AsString;
      qContratos.Open;

      while not qContratos.Eof do
      begin
        if ToFloat(qContratos.FieldByName('I1').AsString) > 0 then
        begin
          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F1D').AsString);
          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F1H').AsString);
          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I1').AsString));
          Inc(I);
        end;
        if ToFloat(qContratos.FieldByName('I2').AsString) > 0 then
        begin
          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F2D').AsString);
          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F2H').AsString);
          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I2').AsString));
          Inc(I);
        end;
        if ToFloat(qContratos.FieldByName('I3').AsString) > 0 then
        begin
          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F3D').AsString);
          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F3H').AsString);
          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I3').AsString));
          Inc(I);
        end;
        if ToFloat(qContratos.FieldByName('I4').AsString) > 0 then
        begin
          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F4D').AsString);
          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F4H').AsString);
          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I4').AsString));
          Inc(I);
        end;
        if ToFloat(qContratos.FieldByName('I5').AsString) > 0 then
        begin
          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F5D').AsString);
          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F5H').AsString);
          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I5').AsString));
          Inc(I);
        end;
        if ToFloat(qContratos.FieldByName('I6').AsString) > 0 then
        begin
          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F6D').AsString);
          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F6H').AsString);
          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I6').AsString));
          Inc(I);
        end;
        qContratos.Next;
      end;
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
  finally
    FreeAndNil(q);
    FreeAndNil(qContratos);
  end;
end;

function TfAbmComisionesEscalonadas.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Inmueble' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Inquilino' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end
end;

procedure TfAbmComisionesEscalonadas.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmComisionesEscalonadas.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmComisionesEscalonadas.VerContratoEscalonado1Click(Sender: TObject);
var
  Tecla: Char;
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FrmContratos = nil then
    Application.CreateForm(TFrmContratos, FrmContratos)
  else
    FrmContratos.Show;
  frmContratos.Edit1.Text := gDetalle.Cells[0,gDetalle.Row];
  Tecla := #13;
  frmContratos.Edit1.OnKeyPress(nil, Tecla);
end;

procedure TfAbmComisionesEscalonadas.btnEliminarClick(Sender: TObject);
var
  Tecla: Char;
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if frmComisiones = nil then
    Application.CreateForm(TfrmComisiones, frmComisiones)
  else
    frmComisiones.Show;
  frmComisiones.Edit1.Text := gDetalle.Cells[0,gDetalle.Row];
  Tecla := #13;
  frmComisiones.Edit1.OnKeyPress(nil, Tecla);
  frmComisiones.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar);

end;

procedure TfAbmComisionesEscalonadas.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfAbmComisionesEscalonadas.btnModificarClick(Sender: TObject);
var
  Tecla: Char;
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if frmComisiones = nil then
    Application.CreateForm(TfrmComisiones, frmComisiones)
  else
    frmComisiones.Show;
  frmComisiones.Edit1.Text := gDetalle.Cells[0,gDetalle.Row];
  Tecla := #13;
  frmComisiones.Edit1.OnKeyPress(nil, Tecla);
end;

procedure TfAbmComisionesEscalonadas.btnNuevoClick(Sender: TObject);
begin
  if frmComisiones = nil then
    Application.CreateForm(TfrmComisiones, frmComisiones)
  else
    frmComisiones.Show;
end;

procedure TfAbmComisionesEscalonadas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmComisionesEscalonadas.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmComisionesEscalonadas.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmComisionesEscalonadas.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfAbmComisionesEscalonadas.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmComisionesEscalonadas.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmComisionesEscalonadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMComisionesEscalonadas := nil;
end;

procedure TfAbmComisionesEscalonadas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmComisionesEscalonadas.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmComisionesEscalonadas.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
