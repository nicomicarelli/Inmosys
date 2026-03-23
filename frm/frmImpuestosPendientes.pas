unit frmImpuestosPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, ComCtrls, FXQuery, ppDesignLayer, System.UITypes, AdvGlowButton, strUtils;

type
  TfImpuestosPendientes = class(TForm)
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
    popEliminar: TPopupMenu;
    EliminarRecibo1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Pagados: TTabSheet;
    gDetalle: TStringAlignGrid;
    gPagado: TStringAlignGrid;
    Panel1: TPanel;
    Label2: TLabel;
    edtTotal: TEdit;
    Panel3: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    Seleccionartodos1: TMenuItem;
    Deseleccionartodos1: TMenuItem;
    Panel2: TPanel;
    Shape1: TShape;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    Label4: TLabel;
    Panel4: TPanel;
    Edit6: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Edit8: TEdit;
    TodosCodigos: TCheckBox;
    Label7: TLabel;
    Edit3: TEdit;
    TodosPeriodos: TCheckBox;
    Actualizar: TAdvGlowButton;
    Label8: TLabel;
    edItem: TEdit;
    TodosItems: TCheckBox;
    SeleccionartodoExceptoPendientes1: TMenuItem;
    Label9: TLabel;
    Edit4: TEdit;
    Label10: TLabel;
    Edit5: TEdit;
    TodosInquilinos: TCheckBox;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Change(Sender: TObject);
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
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Change(Sender: TObject);
    procedure EliminarRecibo1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TodosPeriodosClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Seleccionartodos1Click(Sender: TObject);
    procedure Deseleccionartodos1Click(Sender: TObject);
    procedure TodosItemsClick(Sender: TObject);
    procedure edItemChange(Sender: TObject);
    procedure SeleccionartodoExceptoPendientes1Click(Sender: TObject);
    procedure TodosInquilinosClick(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure gPagadoFixedColClick(Sender: TObject; col: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImpuestosPendientes: TfImpuestosPendientes;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos;

{$R *.dfm}

procedure TfImpuestosPendientes.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  Suma: Double;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select R.* from Impuestos R where pagado = 0';

    if not TodosPeriodos.Checked then
    begin
      q.SQL.Add(' and R.Periodo like :Periodo  ');
      q.ParamByName('Periodo').AsString := Edit3.Text + '%';
    end;
    if not TodosItems.Checked then
    begin
      q.SQL.Add(' and R.Item  like :Item ');
      q.ParamByName('Item').AsString := EdItem.Text+ '%';
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and R.Fecha >=:desde and R.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;
    if not TodosInquilinos.Checked then
    begin
      q.SQL.Add(' and Cast(R.Codinq as Integer)>=:COdigodesde and Cast(R.Codinq as Integer) <=:CodigoHasta ');
      q.ParamByName('COdigoDesde').AsInteger := ToInt(edit4.Text);
      q.ParamByName('COdigoHasta').AsInteger := ToInt(edit5.Text);
    end;

    q.SQL.Add(' order by Fecha ');
    q.Open;

    gDetalle.Vaciar;
    I := 1;
    Suma := 0;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Tipo').AsString;
      gDetalle.Cells[3,I] := q.FieldByName('Letra').AsString;
      gDetalle.Cells[4,I] := FormatFloat('0000-00000000',q.FieldByName('Numero').AsFloat);
      gDetalle.Cells[5,I] := q.FieldByName('Item').AsString;
      gDetalle.Cells[6,I] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[7,I] := FormatFloat('0.00',ToFloat(q.FieldByName('Importe').AsString));
      gDetalle.Cells[8,I] := q.FieldByName('Usuario').AsString;
      gDetalle.Cells[10,I] := q.FieldByName('IDMovimiento').AsString;
      if q.FieldByName('Letra').AsString = 'P' then
      begin
        gDetalle.Cells[11,I] := '1';
        gDetalle.ColorRow[I] := clMoneyGreen;
      end
      else
        gDetalle.Cells[11,I] := '0';

      Suma := Suma + ToFloat(q.FieldByName('Importe').AsString);

      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    gDetalle.Row := 1;
    edtTotal.Text := FormatFloat('0.00', Suma);

    q.SQL.Text := 'Select R.* from Impuestos R where pagado = 1';

    if not TodosPeriodos.Checked then
    begin
      q.SQL.Add(' and R.Periodo like :Periodo  ');
      q.ParamByName('Periodo').AsString := Edit3.Text + '%';
    end;
    if not TodosItems.Checked then
    begin
      q.SQL.Add(' and R.Item  like :Item ');
      q.ParamByName('Item').AsString := EdItem.Text+ '%';
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and R.Fecha >=:desde and R.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;
    if not TodosInquilinos.Checked then
    begin
      q.SQL.Add(' and Cast(R.Codinq as Integer)>=:COdigodesde and Cast(R.Codinq as Integer) <=:CodigoHasta ');
      q.ParamByName('COdigoDesde').AsInteger := ToInt(edit4.Text);
      q.ParamByName('COdigoHasta').AsInteger := ToInt(edit5.Text);
    end;

    q.SQL.Add(' order by Fecha ');
    q.Open;

    gPagado.Vaciar;
    I := 1;
    Suma := 0;
    while not q.Eof do
    begin
      gPagado.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      gPagado.Cells[1,I] := q.FieldByName('Codinq').AsString;
      gPagado.Cells[2,I] := q.FieldByName('Tipo').AsString;
      gPagado.Cells[3,I] := q.FieldByName('Letra').AsString;
      gPagado.Cells[4,I] := FormatFloat('0000-00000000',q.FieldByName('Numero').AsFloat);
      gPagado.Cells[5,I] := q.FieldByName('Item').AsString;
      gPagado.Cells[6,I] := q.FieldByName('Periodo').AsString;
      gPagado.Cells[7,I] := FormatFloat('0.00',q.FieldByName('Importe').AsFloat);
      gPagado.Cells[8,I] := q.FieldByName('Usuario').AsString;
      gPagado.Cells[10,I] := q.FieldByName('IDMovimiento').AsString;
      Suma := Suma + q.FieldByName('Importe').AsFloat;
      Inc(I);
      q.Next;
    end;
    if i>2 then
      gPagado.RowCount := I
    else
      gPagado.RowCount := 2;

    gPagado.Row := 1;
    edit1.Text := FormatFloat('0.00', Suma);
  finally
    FreeAndNil(q);
  end;
end;

function TfImpuestosPendientes.TituloGetFieldValue(aFieldName: string): Variant;
begin
(*
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
*)
end;

procedure TfImpuestosPendientes.TodosAfectaClick(Sender: TObject);
begin
(*
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
*)
end;

procedure TfImpuestosPendientes.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfImpuestosPendientes.TodosDescripcionClick(Sender: TObject);
begin
(*
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
*)
end;

procedure TfImpuestosPendientes.TodosDestinoClick(Sender: TObject);
begin
(*
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
*)
end;

procedure TfImpuestosPendientes.TodosPeriodosClick(Sender: TObject);
begin
  if todosPeriodos.Checked then
  begin
    edit3.Text:='';
  end;

  if Trim(edit3.Text) = ''  then
    todosPeriodos.Checked := True;
end;

procedure TfImpuestosPendientes.BitBtn1Click(Sender: TObject);
var
  suma: Double;
  I: Integer;
begin
  Suma := 0;
  for I := 0 to gDetalle.RowCount - 1 do
    if gDetalle.ColorRow[I] = clYellow then
      Suma := Suma + ToFloat(gDetalle.Cells[7,I]);

      edit2.Text := FormatFloat('0.00', Suma);
end;

procedure TfImpuestosPendientes.btnEliminarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  if not MostrarDialogoSino('¿Esta Seguro de eliminar el Impuesto?') then
    Exit;

  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      for I := 0 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.ColorRow[I] = clYellow then
        begin
          q.sql.text := ' Delete from impuestos '+
                        '  Where IDMovimiento = :ID '+
                        '    and Codinq = :Codinq '+
                        '    and Tipo = :Tipo '+
                        '    and Letra = :Letra '+
                        '    and Numero = :Numero '+
                        '    and Item = :Item '+
                        '    and Periodo = :Periodo '+
                        '    and Importe = :Importe '+
                        '    and Usuario = :Usuario ';

          q.ParamByName('ID').AsFloat := ToFloat(gDetalle.Cells[10, I]);
          q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
          q.ParamByName('Tipo').AsString := gDetalle.Cells[2, I];
          q.ParamByName('Letra').AsString := gDetalle.Cells[3, I];
          q.ParamByName('Numero').AsFloat := ToFloat(AnsiReplaceStr(gDetalle.Cells[4, I], '-',''));
          q.ParamByName('Item').AsString :=gDetalle.Cells[5, I];
          q.ParamByName('Periodo').AsString := gDetalle.Cells[6, I];
          q.ParamByName('Importe').AsString := gDetalle.Cells[7, I];
          q.ParamByName('Usuario').AsString := gDetalle.Cells[8, I];
          q.ExecSQL;
        end;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos eliminados correctamente.');

      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfImpuestosPendientes.btnImprimirClick(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.ColorRow[I] = shape1.Brush.Color then
        begin
          q.sql.text := ' Update impuestos set pagado = :pagado, Usuario=:Usuario where codinq=:codinq and tipo=:tipo and letra=:letra and numero=:numero and periodo=:periodo';
          q.ParamByName('Pagado').AsInteger := 1;
          q.ParamByName('Codinq').AsString := gDetalle.Cells[1,I];
          q.ParamByName('Tipo').AsString := gDetalle.Cells[2,I];
          q.ParamByName('Letra').AsString := gDetalle.Cells[3,I];
          q.ParamByName('Periodo').AsString := gDetalle.Cells[6,I];
          q.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
          q.ParamByName('Numero').AsFloat := ToFloat(Copy(gDetalle.Cells[4,I],1,4) + Copy(gDetalle.Cells[4,I],6,8));
          q.ExecSQL;

          q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
          Q.Open;

          idtransaccion := q.fieldbyname('id').AsInteger;

          InsertarCaja(IDTransaccion,
                       FormatDateTime('dd/mm/yyyy', now),
                       gDetalle.Cells[1,I],
                       'MA',
                       'M',
                       Inttostr(IDTransaccion));

          InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1,I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       gDetalle.Cells[5,I],
                       gDetalle.Cells[6,I],
                       '0.00',
                       FormatFloat('0.00', TOFloat(gDetalle.Cells[7,I])),
                       ToInt(gDetalle.Cells[10,I]));
        end;

       end;
       DM.ConfirmarTransaccion;
       MostrarDialogoAceptar( 'Datos grabados correctamente.');
       ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    edit2.Text := FormatFloat('0.00', 0);
    FreeAndNil(q);
  end;
end;

procedure TfImpuestosPendientes.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfImpuestosPendientes.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfImpuestosPendientes.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfImpuestosPendientes.cbAfectaClick(Sender: TObject);
begin
//  todosafecta.Checked := False;
end;

procedure TfImpuestosPendientes.cbDestinoChange(Sender: TObject);
begin
//  TodosDestino.Checked := False;
end;

procedure TfImpuestosPendientes.TodosInquilinosClick(Sender: TObject);
begin
  if todosInquilinos.Checked then
  begin
    edit4.Text:='';
    edit5.Text:='';
  end;

  if Trim(edit4.Text) = ''  then
    todosInquilinos.Checked := True;
end;

procedure TfImpuestosPendientes.TodosItemsClick(Sender: TObject);
begin
  if TodosItems.Checked then
  begin
    edItem.Text:='';
  end;

  if Trim(edItem.Text) = ''  then
    TodosItems.Checked := True;
end;

procedure TfImpuestosPendientes.Deseleccionartodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount-1 do
  begin
    if gDetalle.Cells[11, I] = '1' then
      gDetalle.ColorRow[I] := clMoneyGreen
    else
      gDetalle.ColorRow[I] := gDetalle.Color;
  end;
  bitbtn1Click(nil);
end;

procedure TfImpuestosPendientes.edDescripcionChange(Sender: TObject);
begin
(*
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
*)
end;

procedure TfImpuestosPendientes.edDesdeChange(Sender: TObject);
begin
(*
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
*)
end;


procedure TfImpuestosPendientes.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  edHasta.Text := edDesde.text;
end;


procedure TfImpuestosPendientes.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfImpuestosPendientes.Edit3Change(Sender: TObject);
begin
  if edit3.Text <> '' then
    todosPeriodos.Checked:=False
  else
    todosPeriodos.Checked:=True;
end;

procedure TfImpuestosPendientes.Edit4Change(Sender: TObject);
begin
  edit5.Text:=edit4.Text;

  if edit4.Text <> '' then
    todosInquilinos.Checked:=False
  else
    todosInquilinos.Checked:=True;
end;

procedure TfImpuestosPendientes.Edit5Change(Sender: TObject);
begin
  if edit5.Text <> '' then
    todosInquilinos.Checked:=False
  else
    todosInquilinos.Checked:=True;
end;

procedure TfImpuestosPendientes.Edit6Change(Sender: TObject);
begin
  edit8.Text:=edit6.Text;

  if edit6.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfImpuestosPendientes.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit6.Text;
  if Key = #13 then
  begin
    if Length(Edit6.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit6.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit6.Text := Fecha;
    Edit8.setfocus;
  end;
end;

procedure TfImpuestosPendientes.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfImpuestosPendientes.Edit8KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit8.Text;
  if Key = #13 then
  begin
    if Length(Edit8.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit8.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit8.Text := Fecha;
    Actualizar.setfocus;
  end;
end;

procedure TfImpuestosPendientes.edItemChange(Sender: TObject);
begin
  todosItems.Checked:= edItem.Text = '';
end;

procedure TfImpuestosPendientes.EliminarRecibo1Click(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;

begin
  if not MostrarDialogoSino('¿Esta Seguro de marcar como Pendiente el Impuesto?', mbYes) then
    Exit;

  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.sql.text := ' Update impuestos set pagado = :pagado where codinq=:codinq and tipo=:tipo and letra=:letra and numero=:numero and periodo=:periodo';
      q.ParamByName('Pagado').AsInteger := 0;
      q.ParamByName('Codinq').AsString := gPagado.Cells[1,gPagado.Row];
      q.ParamByName('Tipo').AsString := gPagado.Cells[2,gPagado.Row];
      q.ParamByName('Letra').AsString := gPagado.Cells[3,gPagado.Row];
      q.ParamByName('Periodo').AsString := gPagado.Cells[6,gPagado.Row];
      q.ParamByName('Numero').AsFloat := ToFloat(Copy(gPagado.Cells[4,gPagado.Row],1,4) + Copy(gPagado.Cells[4,gPagado.Row],6,8));
      q.ExecSQL;

      q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
      Q.Open;

      idtransaccion := q.fieldbyname('id').AsInteger;

      InsertarCaja(IDTransaccion,
                   FormatDateTime('dd/mm/yyyy', now),
                   gpAGADO.Cells[1,gpAGADO.rOW],
                   'MA',
                   'M',
                   Inttostr(IDTransaccion));

      InsertarCajaDetalles(IDTransaccion,
                   gpAGADO.Cells[1,gpAGADO.ROW],
                   '09',
                   FormatDateTime('dd/mm/yyyy', now),
                   '1',
                   gpAGADO.Cells[5,gpAGADO.ROW],
                   gpAGADO.Cells[6,gpAGADO.ROW],
                   FormatFloat('0.00', TOFloat(gpAGADO.Cells[7,gpAGADO.rOW])),
                   '0.00',
                   ToInt(gDetalle.Cells[10,I]));

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfImpuestosPendientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fImpuestosPendientes := nil;
end;

procedure TfImpuestosPendientes.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfImpuestosPendientes.gDetalleDblClick(Sender: TObject);
begin
  if gDetalle.ColorRow[gDetalle.Row] = gDetalle.Color then
  begin
    gDetalle.ColorRow[gDetalle.Row] := clYellow;
    bitbtn1Click(nil);
    Exit;
  end;
  if gDetalle.ColorRow[gDetalle.Row] = clYellow then
  begin
    gDetalle.ColorRow[gDetalle.Row] := gDetalle.Color;
    bitbtn1Click(nil);
    Exit;
  end;
end;

procedure TfImpuestosPendientes.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

procedure TfImpuestosPendientes.gPagadoFixedColClick(Sender: TObject;
  col: Integer);
begin
  gPagado.SortColumn(Col, True,'S');
end;

procedure TfImpuestosPendientes.MenuItem1Click(Sender: TObject);
var
  q: TFXQuery;

begin
  if not MostrarDialogoSino('¿Esta Seguro de eliminar el Impuesto?') then
    Exit;

  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.sql.text := ' Delete from impuestos Where IDMovimiento = :ID';
      q.ParamByName('ID').AsFloat := ToFloat(gDetalle.Cells[10,gDetalle.Row]);
      q.ExecSQL;

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos eliminados correctamente.');
      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfImpuestosPendientes.PageControl1Change(Sender: TObject);
begin
  btnEliminar.Visible := pageControl1.ActivePageIndex = 0;
end;

procedure TfImpuestosPendientes.SeleccionartodoExceptoPendientes1Click(
  Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount-1 do
  begin
    if gDetalle.ColorRow[I] = gDetalle.Color then
      if gDetalle.ColorRow[I] <> clmoneyGreen then
        gDetalle.ColorRow[I] := clYellow;
  end;
  bitbtn1Click(nil);
end;

procedure TfImpuestosPendientes.Seleccionartodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount-1 do
  begin
    gDetalle.ColorRow[I] := clYellow;
  end;
  bitbtn1Click(nil);
end;

end.
