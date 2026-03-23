unit frmCubrirVales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, strUtils, FXQuery, ppDesignLayer, AdvGlowButton;

type
  TfCubrirVales = class(TForm)
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
    { Public declarations }
  end;

var
  fCubrirVales: TfCubrirVales;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos;

{$R *.dfm}

procedure TfCubrirVales.ActualizarClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  gDetalle.BeginUpdate;
  try
 q.SQL.Text :=
    '  SELECT DISTINCT CU.CODINQ, CU.CODIGOITEM, CU.ENTRA, CU.Sale, sum(ca.entra) as Importe, CU.DESCRIPCION, CU.CODIGO as CodigoVale, CU.LINEA, c.Descripcion as Vale, M.Inquilino '+
    '    FROM CUERPOVALES CU '+
    '   inner join inmuebles M on M.codinq = CU.Codinq '+
    '   inner join cabezavales c on c.codigo = cu.codigo '+
    '   INNER JOIN CAJADETALLES CA ON CA.codinq = CU.CODINQ '+
    '                             AND CA.coditem = CU.codigoitem '+
    '                             and cu.descripcion = ca.item || '' ''||replace(CA.PERIODO, ''DIFERENCIA '','''') '+
    '                             AND CA.entra <> 0 '+
    '                             and ca.sale = 0 '+
    '   WHERE Cu.ENTRA-cu.sale > 0 '+
    '     and ca.sale = 0 '+
    '     and ca.entra > 0 '+
    '     and c.cerrado = 0 '+
    '     and c.codigoempresa in (1,2,3) '+
    '     and CA.Coditem in (''09'', ''27'') '+
    '     and CU.Codigoitem in (''09'', ''27'') ';
    if not Todos.Checked then
    begin
      q.SQL.Add(' and CU.Fecha >=:desde and CU.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and CU.Codinq >=:desde and CU.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;
//    if not TodosPropietarios.Checked then
//    begin
//      q.SQL.Add(' and CA.Propietario Like :Propietario ');
//      q.ParamByName('Propietario').AsString := edPropietario.text + '%';
//    end;
    q.SQL.Add(
      '   group by 1,2,3,4,6,7,8,9,10 '+
      '  HAVING CU.SALE<>SUM(CA.ENTRA) ');



//    q.SQL.Text :=
//      ' Select DIstinct CU.*, R.Inquilino, R.Importe, V.Codigo as CodigoVale, v.Descripcion as Vale ' +
//      '   from cuerpovales cu '+
//      '  Inner Join CabezaVales V on V.Codigo = CU.Codigo '+
//      '  Inner Join CuerpoRecibos R on R.codinq = CU.Codinq '+
//  //    '                           and R.coditem = CU.Codigoitem '+
//      '                      and CU.descripcion like ''%''||r.periodo||''%'' ';
//    if not TodosPropietarios.Checked then
//    begin
//      q.SQL.Add(
//        ' Inner Join CabezaRecibos CA on CA.codinq = R.codinq '+
//        '                            and CA.Tipo = R.Tipo '+
//        '                            and CA.Letra = R.Letra '+
//        '                            and CA.numero = R.Numero ');
//    end;
//
//    q.SQL.Add(
//      ' where CU.sale = 0 '+
//      '   and  V.CodigoCategoria = 2 '+
//      '   and  V.Cerrado = 0 '+
//      '   and  V.CodigoEmpresa is not null '+
//      '   and R.Coditem in (''09'', ''27'') '+
//      '   and CU.Codigoitem in (''09'', ''27'') ');
//
//
//    if not Todos.Checked then
//    begin
//      q.SQL.Add(' and CU.Fecha >=:desde and CU.Fecha <=:Hasta ');
//      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
//      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
//    end;
//
//    if not TodosCodigos.Checked then
//    begin
//      q.SQL.Add(' and CU.Codinq >=:desde and CU.Codinq <=:Hasta ');
//      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
//      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
//    end;
//    if not TodosPropietarios.Checked then
//    begin
//      q.SQL.Add(' and CA.Propietario Like :Propietario ');
//      q.ParamByName('Propietario').AsString := edPropietario.text + '%';
//    end;
//
//    q.SQL.Add(' order by Fecha ');
    q.Open;

    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      if ToFloat(q.FieldByName('Importe').AsString) <> 0 then
      begin
//        gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
        gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldByName('Linea').AsString;
        gDetalle.Cells[3,I] := q.FieldByName('Inquilino').AsString;
        gDetalle.Cells[4,I] := q.FieldByName('CodigoItem').AsString;
        gDetalle.Cells[5,I] := q.FieldByName('Descripcion').AsString;
        gDetalle.Cells[6,I] := FormatFloat('0.00', ToFloat(q.FieldByName('Importe').AsString));
        gDetalle.Cells[7,I] := q.FieldByName('CodigoVale').AsString;
        gDetalle.Cells[8,I] := q.FieldByName('Vale').AsString;
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

function TfCubrirVales.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfCubrirVales.TodosAfectaClick(Sender: TObject);
begin
(*
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
*)
end;

procedure TfCubrirVales.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todos.Checked := True;
end;

procedure TfCubrirVales.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfCubrirVales.TodosDescripcionClick(Sender: TObject);
begin
(*
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
*)
end;

procedure TfCubrirVales.TodosDestinoClick(Sender: TObject);
begin
(*
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
*)
end;

procedure TfCubrirVales.btnEliminarClick(Sender: TObject);
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

procedure TfCubrirVales.btnImprimirClick(Sender: TObject);
var
  I,j: Integer;
  idTransaccion: INteger;
  q, qVale: tFXQuery;

begin
  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.ColorRow[I] = clYellow then
        begin
          q.SQL.Text :=
            ' Update CuerpoVales '+
            '    Set Sale = Sale + :Sale '+
            '  Where Codigo = :Codigo '+
            '    and Linea = :Linea ';
          q.ParamByName('Sale').AsFloat := Abs(ToFloat(gDetalle.Cells[6, I]));
          q.ParamByName('Codigo').AsInteger := ToInt(gDetalle.Cells[7, I]);
          q.ParamByName('Linea').AsInteger := ToInt(gDetalle.Cells[2, I]);
          q.ExecSql;
        end;
      end;
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

procedure TfCubrirVales.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfCubrirVales.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfCubrirVales.cbDestinoChange(Sender: TObject);
begin
//  TodosDestino.Checked := False;
end;

procedure TfCubrirVales.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.ColorRow[i] := gDetalle.Color;
end;

procedure TfCubrirVales.TodosPropietariosClick(Sender: TObject);
begin
  if todosPropietarios.Checked then
    edPropietario.Text:='';

  if Trim(edPropietario.Text) = ''  then
    todosPropietarios.Checked := True;
end;

procedure TfCubrirVales.edDescripcionChange(Sender: TObject);
begin
(*
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
*)
end;

procedure TfCubrirVales.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfCubrirVales.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  edHasta.Text := edDesde.text;
end;


procedure TfCubrirVales.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfCubrirVales.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfCubrirVales.Edit6Change(Sender: TObject);
begin
  edit8.Text:=edit6.Text;

  if edit6.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfCubrirVales.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TfCubrirVales.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfCubrirVales.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfCubrirVales.edPropietarioChange(Sender: TObject);
begin
  todosPropietarios.Checked:=edPropietario.Text = '';
end;

procedure TfCubrirVales.EliminarRecibo1Click(Sender: TObject);
begin
  if MostrarDialogoSiNo('¿Esta seguro de eliminar el recibo?') then
  begin
//    EliminarRecibo(gDetalle.Cells[1, gDetalle.Row],gDetalle.Cells[3, gDetalle.Row],gDetalle.Cells[4, gDetalle.Row], gDetalle.Cells[5, gDetalle.Row]);
//    ActualizarClick(nil);
  end;
end;

procedure TfCubrirVales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fCubrirVales := nil;
end;

procedure TfCubrirVales.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfCubrirVales.gDetalleDblClick(Sender: TObject);
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

procedure TfCubrirVales.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 0 then
    gDetalle.SortColumn(Col, True,'D')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfCubrirVales.SeleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.ColorRow[i] := clYellow;
end;

end.
