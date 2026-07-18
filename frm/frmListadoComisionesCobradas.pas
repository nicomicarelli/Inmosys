unit frmListadoComisionesCobradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, frmMovimientos, strUtils, AdvObj, BaseGrid,
  AdvGrid, FXQuery, ppDesignLayer, cxGraphics, cxControls, cxLookAndFeels,
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
  TfListadoComisionesCobradas = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    edtTotal: TEdit;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    TituloppField5: TppField;
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
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    TituloppField2: TppField;
    TituloppField6: TppField;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    TituloppField3: TppField;
    ppSummaryBand1: TppSummaryBand;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    plReporteppField5: TppField;
    plReporteppField6: TppField;
    plReporteppField7: TppField;
    plReporteppField8: TppField;
    plReporteppField9: TppField;
    plReporteppField10: TppField;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppLabel13: TppLabel;
    ppDBText2: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    gDetalle: TAdvStringGrid;
    gImpresion: TStringAlignGrid;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Actualizar: TAdvGlowButton;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    TodosFPago: TCheckBox;
    edtFecha: TEdit;
    edFechaHasta: TEdit;
    edtItemDesde: TEdit;
    edItemHasta: TEdit;
    TodosItems: TCheckBox;
    cboRazonSocial: TComboBox;
    Panel3: TPanel;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaChange(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure TodosFPagoClick(Sender: TObject);
    procedure cbFechaPagoClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure btnNuevoClick(Sender: TObject);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure VerContratoEscalonado1Click(Sender: TObject);
    procedure edtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure edtFechaChange(Sender: TObject);
    procedure edtFechaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFechaHastaChange(Sender: TObject);
    procedure edtItemDesdeChange(Sender: TObject);
    procedure edtItemDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edItemHastaChange(Sender: TObject);
    procedure TodosItemsClick(Sender: TObject);
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaKeyPress(Sender: TObject; var Key: Char);
    procedure edDescripcionKeyPress(Sender: TObject; var Key: Char);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnGrabarClick(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListadoComisionesCobradas: TfListadoComisionesCobradas;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMMovimientos,
  frmMovimientosCtacte, frmABMCtaCteInquilinos;

{$R *.dfm}

procedure TfListadoComisionesCobradas.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  qMovimientos: TFXQuery;
  I: Integer;
  Total: Double;
begin
  if (TodosCodigos.Checked) and (todosFPago.Checked) and (TodosDescripcion.Checked) then
  begin
    if not MostrarDialogoSiNo('Esta operacion puede demorar varios minutos. ¿Desea Continuar?') then
      Exit;
  end;

  q := CrearQuery;
  qMovimientos := CrearQuery;
  try
    try
      q.SQL.Text :=
        ' Select I.Codinq, ' +
        '        I.Inquilino, ' +
        '        I.Propietario, ' +
        '        I.Razonsocial, ' +
        '        F.Fecha, ' +
        '        F.TipoComprobante, ' +
        '        F.Letra, ' +
        '        F.Numero, ' +
        '        F.Total ' +
        '   From Facturas F '+
        '  Inner Join Inmuebles I on I.Codinq = F.Codinq '+
        '  Where I.RazonSocial = :RazonSocial ';
        q.ParamByName('RazonSocial').AsInteger := cboRazonSocial.ItemIndex;

      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and Codinq >=:desde and Codinq <=:Hasta ');
        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
      end;

      if not TodosItems.Checked then
      begin
        q.SQL.Add(' and Coditem >=:desdeI and Coditem <=:HastaI ');
        q.ParamByName('DesdeI').AsString := edtItemDesde.Text;
        q.ParamByName('HastaI').AsString := edItemHasta.Text;
      end;

      if not TodosDescripcion.Checked then
      begin
        q.SQL.Add(' and Upper(Inquilino) like :descripcion ');
        q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
      end;

      if not TodosFPago.Checked then
      begin
        q.SQL.Add(' and Fecha >= :FechaDesde and Fecha <=:FechaHasta ');
        q.ParamByName('FechaDesde').AsDateTime := StrToDatetime(edtFecha.Text);
        q.ParamByName('FechaHasta').AsDateTime := StrToDatetime(edFechaHasta.Text);
      end;

  //    q.SQL.Add(' Group by I.Codinq, I.Inquilino ');
      q.SQL.Add(' order by Fecha, Codinq ');

      q.Open;

      gDetalle.Clear;
      gDetalle.Cells[1, 0] := 'Fecha';
      gDetalle.Cells[2, 0] := 'Código';
      gDetalle.Cells[3, 0] := 'Propietario';
      gDetalle.Cells[4, 0] := 'Inquilino';
      gDetalle.Cells[5, 0] := 'Item';
      gDetalle.Cells[6, 0] := 'Descripcion';
      gDetalle.Cells[7, 0] := 'Total';
      gDetalle.Cells[8, 0] := 'Tipo';
      gDetalle.Cells[9, 0] := 'Letra';
      gDetalle.Cells[10, 0] := 'Numero';


      I := 1;
      Total := 0;

      while not q.Eof do
      begin
        gDetalle.AddCheckBox(0,I,True,false);
        gDetalle.Cells[1,I] := FormatDateTime('dd/mm/yyyy', q.FieldByName('Fecha').AsDateTime);
        gDetalle.Cells[2,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[3,I] := q.FieldByName('Propietario').AsString;
        gDetalle.Cells[4,I] := q.FieldByName('Inquilino').AsString;
        gDetalle.Cells[5,I] := '12';
        gDetalle.Cells[6,I] := 'COMISION POR ADMINISTRACION';
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldByName('tOTAL').AsFloat);
        gDetalle.Cells[8,I] := q.FieldByName('TipoComprobante').AsString;
        gDetalle.Cells[9,I] := q.FieldByName('Letra').AsString;
        gDetalle.Cells[10,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
        Total := Total + q.FieldByName('Total').AsFloat;
        Inc(I);
        gDetalle.RowCount := gDetalle.RowCount +1;
        q.Next;
      end;
      if i>2 then
        gDetalle.RowCount := I
      else
        gDetalle.RowCount := 2;
      edtTotal.Text := FormatFloat('0.00', Total);
    except
      MostrarDialogoAceptar('Hay algun problema con las opciones de filtrado. Verifique por favor.');
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qMovimientos);
  end;
end;

procedure TfListadoComisionesCobradas.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
  begin
    edtFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edtFecha.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfListadoComisionesCobradas.TodosItemsClick(Sender: TObject);
begin
  if todosItems.Checked then
  begin
    edtItemDesde.Text:='';
    edItemHasta.Text:='';
  end;

  if Trim(edtItemDesde.Text) = ''  then
    todosItems.Checked := True;
end;

function TfListadoComisionesCobradas.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := 'Desde: ' + edDesde.Text + ' Hasta: ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Fecha' then
  begin
    if TodosFPago.Checked then
      Result := 'Todos'
    else
      Result := 'Desde: ' + edtFecha.Text + ' Hasta: ' + edFechaHasta.Text;
  end
  else if aFieldName = 'Filtro por Item' then
  begin
    if TodosItems.Checked then
      Result := 'Todos'
    else
      Result := 'Desde: ' + edtItemDesde.Text + ' Hasta: ' + edItemHasta.Text;
  end
  else if aFieldName = 'Total' then
    Result := edtTotal.Text;



end;

procedure TfListadoComisionesCobradas.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfListadoComisionesCobradas.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfListadoComisionesCobradas.VerContratoEscalonado1Click(Sender: TObject);
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

procedure TfListadoComisionesCobradas.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientosCtaCte = nil then
    Application.CreateForm(TFMovimientosCtaCte, FMovimientosCtaCte)
  else
    FMovimientosCtaCte.Show;
  FMovimientosCtaCte.Cargar(gDetalle.Cells[9,gDetalle.Row],toEliminar);
end;

procedure TfListadoComisionesCobradas.btnGrabarClick(Sender: TObject);
var
  I, J: Integer;
  Estado: Boolean;
begin
 // gImpresion := TStringAlignGrid.Create(nil);
  try
    gImpresion.ColCount := gDetalle.ColCount;

    if gDetalle.Cells[1,1] = '' then
      Exit;

    for I := 0 to gDetalle.ColCount - 1 do
      gImpresion.Cells[I,0] := gDetalle.Cells[I,0];

    J := 1;
    for I := 1 to gDetalle.RowCount - 1 do
    begin
      if gDetalle.GetCheckBoxState(0,I,Estado) then
        if not Estado then
          Continue;

      gImpresion.Rows[J] := gDetalle.Rows[I];
      gImpresion.RowCount := J+1;
      J := J+1;
    end;

    ImprimirReporte (Reporte, plReporte, gImpresion);
  finally
   // FreeAndNil(gImpresion);
  end;
end;

procedure TfListadoComisionesCobradas.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientosCtaCte = nil then
    Application.CreateForm(TFMovimientosCtaCte, FMovimientosCtaCte)
  else
    FMovimientosCtaCte.Show;
  FMovimientosCtaCte.Cargar(gDetalle.Cells[9,gDetalle.Row],toModificar);
end;

procedure TfListadoComisionesCobradas.btnNuevoClick(Sender: TObject);
begin
  if FMovimientosCtaCte = nil then
    Application.CreateForm(TFMovimientosCtaCte, FMovimientosCtaCte)
  else
    FMovimientosCtaCte.Show;
  FMovimientosCtaCte.Cargar('',toNuevo);
end;

procedure TfListadoComisionesCobradas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfListadoComisionesCobradas.cbFechaPagoClick(Sender: TObject);
begin
  todosFPago.Checked := False;
end;

procedure TfListadoComisionesCobradas.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfListadoComisionesCobradas.edDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    edtFecha.SetFocus;

end;

procedure TfListadoComisionesCobradas.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfListadoComisionesCobradas.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edHasta.SetFocus;
end;


procedure TfListadoComisionesCobradas.edFechaHastaChange(Sender: TObject);
begin
//  TodosFPago.checked := Trim(edFechaHasta.Text) = '';
end;

procedure TfListadoComisionesCobradas.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
var
  Dia:   string;
  Fecha: string;

begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    Dia := edFechaHasta.Text;
    if Length(Dia) = 0 then
      Dia := '5';
    if Length(Dia) = 10 then
      Fecha := Dia;
    if length(Dia) <> 10 then
    begin
      Fecha := FormatDatetime('dd/mm/yyyy', Date());
      Delete(Fecha, 1, 2);
      if Dia = '5' then
        Fecha := '05' + Fecha;
      if Dia = '10' then
        Fecha := '10' + Fecha;
      if (Dia <> '5') and (Dia <> '10') then
        Fecha := TransformaFecha(Dia);
    end;
    edFechaHasta.Text := Fecha;
    TodosFPago.checked := False;
    edtItemDesde.SetFocus;
  end;
end;

procedure TfListadoComisionesCobradas.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfListadoComisionesCobradas.edHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edDescripcion.SetFocus;

end;

procedure TfListadoComisionesCobradas.edItemHastaChange(Sender: TObject);
begin
  if edItemHasta.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfListadoComisionesCobradas.edtFechaChange(Sender: TObject);
begin
  TodosFPago.checked := Trim(edtFecha.Text) = '';
//  edFechahasta.Text:=edtfecha.Text;
end;

procedure TfListadoComisionesCobradas.edtFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edFechaHasta.Text := edtfecha.text;
end;

procedure TfListadoComisionesCobradas.edtFechaKeyPress(Sender: TObject; var Key: Char);
var
  Dia:   string;
  Fecha: string;

begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    Dia := edtFecha.Text;
    if Length(Dia) = 0 then
      Dia := '5';
    if Length(Dia) = 10 then
      Fecha := Dia;
    if length(Dia) <> 10 then
    begin
      Fecha := FormatDatetime('dd/mm/yyyy', Date());
      Delete(Fecha, 1, 2);
      if Dia = '5' then
        Fecha := '05' + Fecha;
      if Dia = '10' then
        Fecha := '10' + Fecha;
      if (Dia <> '5') and (Dia <> '10') then
        Fecha := TransformaFecha(Dia);
    end;
    edtFecha.Text := Fecha;
    TodosFPago.checked := False;
    edFechaHasta.SetFocus;
  end;
end;

procedure TfListadoComisionesCobradas.edtItemDesdeChange(Sender: TObject);
begin
//  edItemhasta.Text:=edtItemdesde.Text;

  if edtItemdesde.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;

end;

procedure TfListadoComisionesCobradas.edtItemDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edItemHasta.Text := edtItemDesde.text;
end;

procedure TfListadoComisionesCobradas.edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edItemHasta.SetFocus;

end;

procedure TfListadoComisionesCobradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fListadoComisionesCobradas := nil;
end;

procedure TfListadoComisionesCobradas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfListadoComisionesCobradas.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfListadoComisionesCobradas.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
//  gDetalle.SortColumn(Col, True,'S');
end;

procedure TfListadoComisionesCobradas.gDetalleGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ACol = 1 then
    HAlign := taCenter
  else if ACol = 7 then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;
 end;

end.









