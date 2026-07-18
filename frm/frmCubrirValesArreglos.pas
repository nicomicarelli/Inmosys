unit frmCubrirValesArreglos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, strUtils, FXQuery, ppDesignLayer, AdvGlowButton;

type
  TfCubrirValesArreglos = class(TForm)
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
    gDetalle: TStringAlignGrid;
    popEliminar: TPopupMenu;
    Panel3: TPanel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Shape1: TShape;
    Label4: TLabel;
    btnEliminar: TAdvGlowButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit8: TEdit;
    Todos: TCheckBox;
    Edit6: TEdit;
    edDesde: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    edPropietario: TEdit;
    TodosPropietarios: TCheckBox;
    Actualizar: TAdvGlowButton;
    SeleccionarTodos1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Change(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure TodosAfectaClick(Sender: TObject);
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
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Change(Sender: TObject);
    procedure EliminarRecibo1Click(Sender: TObject);
    procedure edHastaChange(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure TodosPropietariosClick(Sender: TObject);
    procedure edPropietarioChange(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure DeseleccionarTodos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FSoloPendientes : Boolean;
    boVieneDeHilo: Boolean;
    { Public declarations }
  end;

var
  fCubrirValesArreglos: TfCubrirValesArreglos;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos;

{$R *.dfm}

procedure TfCubrirValesArreglos.ActualizarClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  gDetalle.BeginUpdate;
  try
    q.SQL.Text :=
      ' Select DIstinct CA.Fecha as FechaRecibo, R.*, V.Codigo as CodigoVale, v.Descripcion as Vale ' +
      '   from CuerpoRecibos R '+
      '  Inner Join CabezaVales V on V.Codinq = R.Codinq and V.Coditem = R.Coditem '+
      ' Inner Join CabezaRecibos CA on CA.codinq = R.codinq '+
      '                            and CA.Tipo = R.Tipo '+
      '                            and CA.Letra = R.Letra '+
      '                            and CA.numero = R.Numero ';

    q.SQL.Add(
      ' where V.CodigoCategoria = 10 '+
      '   and V.Cerrado = 0 '+
      '   and V.Codinq = R.Codinq '+
      '   and R.Coditem in (''95'') '+
      '   and V.Coditem in (''95'') '+
      '   and not exists (Select Codinq from CuerpoVales '+
      '   where DESCRIPCION = R.Tipo || '' '' || R.Letra || '' '' || Substring(lpad(substring(R.Numero from 1 for Position(''.'', r.numero)-1),12,''0'') '+
      '    from 1 for 4)||''-''||Substring(lpad(substring(R.Numero from 1 for Position(''.'', r.numero)-1),12,''0'') from 5 for 8) || '' - '' || R.Periodo) ');
    if not Todos.Checked then
    begin
      q.SQL.Add(' and V.Fecha >=:desde and V.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and V.Codinq >=:desde and V.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;
    if not TodosPropietarios.Checked then
    begin
      q.SQL.Add(' and R.Propietario Like :Propietario ');
      q.ParamByName('Propietario').AsString := edPropietario.text + '%';
    end;

    q.SQL.Add(' order by Fecha ');
    q.Open;

    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      if ToFloat(q.FieldByName('Importe').AsString) <> 0 then
      begin
        gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('FechaRecibo').AsDatetime);
        gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldByName('Linea').AsString;
        gDetalle.Cells[3,I] := q.FieldByName('Inquilino').AsString;
        gDetalle.Cells[4,I] := q.FieldByName('Tipo').AsString;
        gDetalle.Cells[5,I] := q.FieldByName('Letra').AsString;
        gDetalle.Cells[6,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
        gDetalle.Cells[7,I] := q.FieldByName('Coditem').AsString;
        gDetalle.Cells[8,I] := q.FieldByName('Periodo').AsString;
        gDetalle.Cells[9,I] := FormatFloat('0.00', ToFloat(q.FieldByName('Importe').AsString));
        gDetalle.Cells[10,I] := q.FieldByName('CodigoVale').AsString;
        gDetalle.Cells[11,I] := q.FieldByName('Vale').AsString;
        Inc(I);
      end;
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    gDetalle.Row := 1;
  finally
    FreeAndNil(q);
    gDetalle.EndUpdate;
  end;
end;

function TfCubrirValesArreglos.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfCubrirValesArreglos.TodosAfectaClick(Sender: TObject);
begin
(*
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
*)
end;

procedure TfCubrirValesArreglos.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todos.Checked := True;
end;

procedure TfCubrirValesArreglos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfCubrirValesArreglos.TodosDescripcionClick(Sender: TObject);
begin
(*
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
*)
end;

procedure TfCubrirValesArreglos.TodosDestinoClick(Sender: TObject);
begin
(*
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
*)
end;

procedure TfCubrirValesArreglos.btnEliminarClick(Sender: TObject);
var
  Codinq: string;
  Tipo: string;
  Letra: string;
  numero: string;
  q: tFXQuery;
begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' DELETE FROM CABEZARECIBOS  WHERE tipo=:tipo and LETRA=:LETRA AND NUMERO=:NUMERO';
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsString :=  numero;
      q.ExecSql;

      q.SQL.Text := ' DELETE FROM CUERPORECIBOS  WHERE tipo=:tipo and LETRA=:LETRA AND NUMERO=:NUMERO';
      q.ParamByName('Tipo').AsString :=  Tipo;
      q.ParamByName('letra').AsString :=  letra;
      q.ParamByName('numero').AsString :=  numero;
      q.ExecSql;
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

procedure TfCubrirValesArreglos.btnImprimirClick(Sender: TObject);
var
  niLinea, I,j: Integer;
  idTransaccion: INteger;
  q, qVale: tFXQuery;
  ndEntra, ndSale: Double;
begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.ColorRow[I] = clYellow then
        begin
          q.SQL.Text := ' Select Max(Linea) as Linea from CuerpoVales where codigo=:Codigo';
          Q.ParamByName('CODIGO').AsInteger := ToInt(gDetalle.Cells[10, I]);
          q.Open;

          niLinea  := q.FieldByName('Linea').AsInteger + 1;
          ndSale   := ToFloat(gDetalle.Cells[9, I]);
          ndEntra  := 0;

          InsertarCuerpoVale(ToInt(gDetalle.Cells[10, I]),
                             niLinea,
                             gDetalle.Cells[1, I],
                             '95',
                             gDetalle.Cells[4, I] + ' ' + gDetalle.Cells[5, I] + ' ' + gDetalle.Cells[6, I] + ' - ' + gDetalle.Cells[8, I],
                             StrToDate(gDetalle.Cells[0, I]),
                             ndEntra, ndSale, '0', 1, 1);
        end;
      end;
      DM.ConfirmarTransaccion;
      if not boVieneDeHilo then
      begin
        MostrarDialogoAceptar( 'Datos grabados correctamente.');
        ActualizarClick(nil);
      end;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;

end;

procedure TfCubrirValesArreglos.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfCubrirValesArreglos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfCubrirValesArreglos.cbDestinoChange(Sender: TObject);
begin
//  TodosDestino.Checked := False;
end;

procedure TfCubrirValesArreglos.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.ColorRow[i] := gDetalle.Color;
end;

procedure TfCubrirValesArreglos.TodosPropietariosClick(Sender: TObject);
begin
  if todosPropietarios.Checked then
    edPropietario.Text:='';

  if Trim(edPropietario.Text) = ''  then
    todosPropietarios.Checked := True;
end;

procedure TfCubrirValesArreglos.edDescripcionChange(Sender: TObject);
begin
(*
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
*)
end;

procedure TfCubrirValesArreglos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfCubrirValesArreglos.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  edHasta.Text := edDesde.text;
end;


procedure TfCubrirValesArreglos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfCubrirValesArreglos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfCubrirValesArreglos.Edit6Change(Sender: TObject);
begin
  edit8.Text:=edit6.Text;

  if edit6.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfCubrirValesArreglos.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TfCubrirValesArreglos.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfCubrirValesArreglos.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfCubrirValesArreglos.edPropietarioChange(Sender: TObject);
begin
  todosPropietarios.Checked:=edPropietario.Text = '';
end;

procedure TfCubrirValesArreglos.EliminarRecibo1Click(Sender: TObject);
begin
  if MostrarDialogoSiNo('¿Esta seguro de eliminar el recibo?') then
  begin
//    EliminarRecibo(gDetalle.Cells[1, gDetalle.Row],gDetalle.Cells[3, gDetalle.Row],gDetalle.Cells[4, gDetalle.Row], gDetalle.Cells[5, gDetalle.Row]);
//    ActualizarClick(nil);
  end;
end;

procedure TfCubrirValesArreglos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fCubrirValesArreglos := nil;
end;

procedure TfCubrirValesArreglos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  boVieneDeHilo := False;
end;

procedure TfCubrirValesArreglos.gDetalleDblClick(Sender: TObject);
begin
  if gDetalle.ColorRow[gDetalle.Row] = gDetalle.Color then
  begin
    gDetalle.ColorRow[gDetalle.Row] := clYellow;
    Exit;
  end;
  if gDetalle.ColorRow[gDetalle.Row] = clYellow then
  begin
    gDetalle.ColorRow[gDetalle.Row] := gDetalle.Color;

    Exit;
  end;
end;

procedure TfCubrirValesArreglos.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 0 then
    gDetalle.SortColumn(Col, True,'D')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfCubrirValesArreglos.SeleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.ColorRow[i] := clYellow;
end;

end.
