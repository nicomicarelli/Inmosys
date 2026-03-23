unit frmABMContratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, ppDesignLayer, FXQuery, cxGraphics,
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
  TfAbmContratosEscalonados = class(TForm)
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
    gDetalle: TStringAlignGrid;
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
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Shape1: TShape;
    Label4: TLabel;
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
  fAbmContratosEscalonados: TfAbmContratosEscalonados;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos;

{$R *.dfm}

procedure TfAbmContratosEscalonados.ActualizarClick(Sender: TObject);
var
  q, qContratos: TFXQuery;
  I: Integer;
  FechaDesde, FechaHasta: TDatetime;

begin
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.ThousandSeparator := '.';

  q := CrearQuery;
  qContratos := CrearQuery;
  try
    q.SQL.Text := 'Select I.Codinq, I.Inquilino, I.Propietario, I.FechaFin from Inmuebles I  where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by I.Codinq ');
    q.Open;
    gDetalle.Vaciar;
    I := 1;


    while not q.Eof do
    begin
      FechaDesde     := Date();
      FechaHasta     := q.FieldbyName('FechaFin').AsDatetime;

      qContratos.Close;
      qContratos.SQL.Text := 'Select * from contratosescalonados where codinq=:Codinq';
      qContratos.ParamByName('Codinq').AsString := q.FieldByName('Codinq').AsString;
      qContratos.Open;

      if qContratos.IsEmpty then
      begin
        q.Next;
        Continue;
      end;

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


      while not qContratos.Eof do
      begin
        gDetalle.Cells[2,I] := FormatDatetime('dd/mm/yyyy', qContratos.FieldByName('Fechadesde').AsDatetime);
        gDetalle.Cells[3,I] := FormatDatetime('dd/mm/yyyy', qContratos.FieldByName('FechaHasta').AsDatetime);
        gDetalle.Cells[4,I] := FormatFloat('$ #,##0.00', qContratos.FieldByName('Importe').AsFloat);
        Inc(I);

//        if ToFloat(qContratos.FieldByName('I1').AsString) > 0 then
//        begin
//          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F1D').AsString);
//          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F1H').AsString);
//          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I1').AsString));
//          Inc(I);
//        end;
//        if ToFloat(qContratos.FieldByName('I2').AsString) > 0 then
//        begin
//          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F2D').AsString);
//          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F2H').AsString);
//          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I2').AsString));
//          Inc(I);
//        end;
//        if ToFloat(qContratos.FieldByName('I3').AsString) > 0 then
//        begin
//          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F3D').AsString);
//          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F3H').AsString);
//          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I3').AsString));
//          Inc(I);
//        end;
//        if ToFloat(qContratos.FieldByName('I4').AsString) > 0 then
//        begin
//          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F4D').AsString);
//          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F4H').AsString);
//          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I4').AsString));
//          Inc(I);
//        end;
//        if ToFloat(qContratos.FieldByName('I5').AsString) > 0 then
//        begin
//          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F5D').AsString);
//          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F5H').AsString);
//          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I5').AsString));
//          Inc(I);
//        end;
//        if ToFloat(qContratos.FieldByName('I6').AsString) > 0 then
//        begin
//          gDetalle.Cells[2,I] := FechaConBarras(qContratos.FieldByName('F6D').AsString);
//          gDetalle.Cells[3,I] := FechaConBarras(qContratos.FieldByName('F6H').AsString);
//          gDetalle.Cells[4,I] := '$ ' +FormatFloat('0.00',ToFloat(qContratos.FieldByName('I6').AsString));
//          Inc(I);
//        end;
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
    FormatSettings.DecimalSeparator := '.';
    FormatSettings.ThousandSeparator := ',';

  end;
end;

function TfAbmContratosEscalonados.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfAbmContratosEscalonados.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmContratosEscalonados.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmContratosEscalonados.VerContratoEscalonado1Click(Sender: TObject);
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

procedure TfAbmContratosEscalonados.btnEliminarClick(Sender: TObject);
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
  FrmContratos.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar);

end;

procedure TfAbmContratosEscalonados.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfAbmContratosEscalonados.btnModificarClick(Sender: TObject);
var
  Tecla: Char;
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if frmContratos = nil then
    Application.CreateForm(TfrmContratos, frmContratos)
  else
    frmContratos.Show;
  frmContratos.Edit1.Text := gDetalle.Cells[0,gDetalle.Row];
  Tecla := #13;
  frmContratos.Edit1.OnKeyPress(nil, Tecla);
end;

procedure TfAbmContratosEscalonados.btnNuevoClick(Sender: TObject);
begin
  if FrmContratos = nil then
    Application.CreateForm(TFrmContratos, FrmContratos)
  else
    FrmContratos.Show;
end;

procedure TfAbmContratosEscalonados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmContratosEscalonados.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmContratosEscalonados.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmContratosEscalonados.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfAbmContratosEscalonados.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmContratosEscalonados.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmContratosEscalonados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMContratosEscalonados := nil;
end;

procedure TfAbmContratosEscalonados.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmContratosEscalonados.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmContratosEscalonados.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
