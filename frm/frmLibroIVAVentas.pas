unit frmLibroIVAVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, Spin, ppDesignLayer, fxQuery, AdvGlowButton;

type
  TfLibroIVAVentas = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
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
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
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
    plReporteppField5: TppField;
    Panel2: TPanel;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    plReporteppField1: TppField;
    plReporteppField6: TppField;
    Reporte2: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppRegion1: TppRegion;
    ppLabel14: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLabel19: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppParameterList2: TppParameterList;
    plReporte2: TppJITPipeline;
    ppField1: TppField;
    ppField6: TppField;
    plReporte2ppField1: TppField;
    plReporte2ppField2: TppField;
    plReporteppField7: TppField;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppDBText12: TppDBText;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppLabel18: TppLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    TNeto: TLabel;
    tiva: TLabel;
    ttotal: TLabel;
    TituloppField2: TppField;
    TituloppField3: TppField;
    TituloppField5: TppField;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    Panel4: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edDesde: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    chDiscriminar: TCheckBox;
    TodosFPago: TCheckBox;
    edtFecha: TEdit;
    edFechaHasta: TEdit;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaChange(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnGrabarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtFechaChange(Sender: TObject);
    procedure TodosFPagoClick(Sender: TObject);
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure edtFechaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLibroIVAVentas: TfLibroIVAVentas;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMContratos;

{$R *.dfm}

procedure TfLibroIVAVentas.ActualizarClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I: Integer;
  FechaDesde, FechaHasta: TDatetime;
  Neto, IVa, Total: Double;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  GdETALLE.Vaciar;

  try
    if chDiscriminar.Checked then
    begin
      q.SQL.Text := ' select distinct C.TipoComprobante, c.numero, c.fecha, I.Propietario, C.Neto, C.IVA, C.Total '+
                  ' from Facturas C '+
                  ' inner join INMUEBLES I on I.CODINQ = C.CODINQ '+
                  ' Where 1=1 ';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and c.Codinq >=:desde and c.Codinq <=:Hasta ');
        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
      end;
      if not TodosFPago.Checked then
      begin
        q.SQL.Add(' and c.Fecha >= :FechaDesde and c.Fecha <=:FechaHasta ');
        q.ParamByName('FechaDesde').AsDateTime := StrToDatetime(edtFecha.Text);
        q.ParamByName('FechaHasta').AsDateTime := StrToDatetime(edFechaHasta.Text);
      end;
    end
    else
    begin
      q.SQL.Text := ' select distinct C.TipoComprobante, c.numero, c.fecha, I.Propietario, Sum(C.Neto) as Neto, Sum(C.IVA) as IVA, Sum(C.Total) as Total '+
                  ' from Facturas C '+
                  ' inner join INMUEBLES I on I.CODINQ = C.CODINQ '+
                  ' Where 1=1 ';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and c.Codinq >=:desde and c.Codinq <=:Hasta ');
        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
      end;
      if not TodosFPago.Checked then
      begin
        q.SQL.Add(' and c.Fecha >= :FechaDesde and c.Fecha <=:FechaHasta ');
        q.ParamByName('FechaDesde').AsDateTime := StrToDatetime(edtFecha.Text);
        q.ParamByName('FechaHasta').AsDateTime := StrToDatetime(edFechaHasta.Text);
      end;
      q.SQL.Add('Group by 1,2,3,4 ');
    end;
(*                  ' where C.TIPO = :TIPO and         '+
                  '       C.PERIODO like :PERIODO    ';
    q.ParamByName('TIPO').AsString := 'LI';
    q.ParamByName('Periodo').AsString := '%' + Combobox1.Text + '/'+ Inttostr(SpinEdit1.Value) + '%';;

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

    q.SQL.Add(' order by I.PROPIETARIO, C.CODINQ '); *)
    q.Open;

    gDetalle.Vaciar;
    I := 1;

    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('TipoComprobante').AsString;
      gDetalle.Cells[1,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
      gDetalle.Cells[2,I] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[4,I] := q.FieldByName('Propietario').AsString;
      gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldByName('Neto').AsFloat);
      gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldByName('IVA').AsFloat);
      gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldByName('Total').AsFloat);

(*      if Pos('ENERO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'ENERO';
        gDetalle.Cells[6,I] := '1';
      end
      else if Pos('FEBRERO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'FEBRERO';
        gDetalle.Cells[6,I] := '2';
      end
      else if Pos('MARZO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'MARZO';
        gDetalle.Cells[6,I] := '3';
      end
      else if Pos('ABRIL', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'ABRIL';
        gDetalle.Cells[6,I] := '4';
      end
      else if Pos('MAYO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'MAYO';
        gDetalle.Cells[6,I] := '5';
      end
      else if Pos('JUNIO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'JUNIO';
        gDetalle.Cells[6,I] := '6';
      end
      else if Pos('JULIO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'JULIO';
        gDetalle.Cells[6,I] := '7';
      end
      else if Pos('AGOSTO', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'AGOSTO';
        gDetalle.Cells[6,I] := '8';
      end
      else if Pos('SETIEMBRE', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'SETIEMBRE';
        gDetalle.Cells[6,I] := '9';
      end
      else if Pos('OCTUBRE', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'OCTUBRE';
        gDetalle.Cells[6,I] := '10';
      end
      else if Pos('NOVIEMBRE', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'NOVIEMBRE';
        gDetalle.Cells[6,I] := '11';
      end
      else if Pos('DICIEMBRE', q.FieldByName('Periodo').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'DICIEMBRE';
        gDetalle.Cells[6,I] := '12';
      end;
 *)

      Inc(I);

      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    Neto := 0;
    IVA := 0;
    Total := 0;

    for I := 1 to gDetalle.RowCount - 1 do
    begin
      Neto := Neto + ToFloat(gDetalle.Cells[5, I]);
      IVA := IVA + ToFloat(gDetalle.Cells[6, I]);
      Total := Total + ToFloat(gDetalle.Cells[7, I]);
    end;

    TNeto.Caption := FormatFloat('0.00', neto);
    TIVA.Caption := FormatFloat('0.00', IVA);
    TTotal.Caption := FormatFloat('0.00', Total);
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

function TfLibroIVAVentas.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Fecha' then
  begin
    if TodosFPago.Checked then
      Result := 'Todos'
    else
      Result := 'Desde: ' + edtFecha.Text + ' Hasta: ' + edFechaHasta.Text;
  end
  else if aFieldName = 'Total Neto' then
    Result := TNeto.Caption
  else if aFieldName = 'Total IVA' then
    Result := TIVA.Caption
  else if aFieldName = 'Total General' then
    Result := TTotal.Caption;


end;

procedure TfLibroIVAVentas.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfLibroIVAVentas.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
  begin
    edtFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edtFecha.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfLibroIVAVentas.BitBtn1Click(Sender: TObject);
begin
//    ImprimirReporte ( Reporte2,  plReporte2,  gDetalle1 ) ;
end;

procedure TfLibroIVAVentas.btnGrabarClick(Sender: TObject);
begin
    ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfLibroIVAVentas.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfLibroIVAVentas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfLibroIVAVentas.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfLibroIVAVentas.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfLibroIVAVentas.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfLibroIVAVentas.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
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
  end;
end;

procedure TfLibroIVAVentas.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfLibroIVAVentas.edtFechaChange(Sender: TObject);
begin
  TodosFPago.checked := Trim(edtFecha.Text) = '';
  edFechaHasta.Text := edtfecha.text;
end;

procedure TfLibroIVAVentas.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfLibroIVAVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fLibroIVAVentas := nil;
end;

procedure TfLibroIVAVentas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfLibroIVAVentas.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfLibroIVAVentas.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 2 then
    gDetalle.SortColumn(5, True,'N')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

end.
