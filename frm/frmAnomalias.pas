unit frmAnomalias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, strUtils, FXQuery, ppDesignLayer, AdvGlowButton, ppModule, raCodMod,
  DBClient, Provider, DateUtils, voDispositivos;

type
  TfAnomalias = class(TForm)
    gDetalle: TStringAlignGrid;
    gAnomalias: TStringAlignGrid;
    Panel3: TPanel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit8: TEdit;
    Todos: TCheckBox;
    Edit6: TEdit;
    cbTipo: TComboBox;
    cbLetra: TComboBox;
    edDesde: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    edPropietario: TEdit;
    TodosPropietarios: TCheckBox;
    Actualizar: TAdvGlowButton;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    Reporte: TppReport;
    ppParameterList1: TppParameterList;
    plTitulo: TppJITPipeline;
    plTituloppField1: TppField;
    plTituloppField2: TppField;
    plTituloppField3: TppField;
    plTituloppField4: TppField;
    plTituloppField5: TppField;
    plTituloppField6: TppField;
    plTituloppField7: TppField;
    plTituloppField8: TppField;
    plTituloppField9: TppField;
    ExpensasAReclamar: TppField;
    gImpresion: TStringAlignGrid;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppVariable1: TppVariable;
    ppDBText3: TppDBText;
    ppVariable2: TppVariable;
    ppDetailBand1: TppDetailBand;
    ppVariable3: TppVariable;
    ppVariable11: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppVariable9: TppVariable;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppLabel7: TppLabel;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppVariable4: TppVariable;
    ppDBText6: TppDBText;
    ppVariable5: TppVariable;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppVariable6: TppVariable;
    ppVariable7: TppVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppVariable8: TppVariable;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    raCodeModule2: TraCodeModule;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    popEliminar: TPopupMenu;
    EliminarRecibo1: TMenuItem;
    N1: TMenuItem;
    Marcarcomopendientederetirar1: TMenuItem;
    Marcarcomoretirada1: TMenuItem;
    ReciboControlado1: TMenuItem;
    chIncluirControlados: TCheckBox;
    gCuerpo: TStringAlignGrid;
    N2: TMenuItem;
    Seleccionartodas1: TMenuItem;
    DeseleccionarTodas1: TMenuItem;
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
    procedure gDetalleClick(Sender: TObject);
    procedure EliminarRecibo1Click(Sender: TObject);
    procedure cbTipoClick(Sender: TObject);
    procedure edHastaChange(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure TodosPropietariosClick(Sender: TObject);
    procedure edPropietarioChange(Sender: TObject);
    function plTituloGetFieldValue(aFieldName: string): Variant;
    procedure Marcarcomopendientederetirar1Click(Sender: TObject);
    procedure Marcarcomoretirada1Click(Sender: TObject);
    procedure popEliminarPopup(Sender: TObject);
    procedure ReciboControlado1Click(Sender: TObject);
    procedure Seleccionartodas1Click(Sender: TObject);
    procedure DeseleccionarTodas1Click(Sender: TObject);
  private
    objMail: TMail;
  public
    LiqinOrig: TClientDataSet;
    dspLiqinOrig: TDatasetProvider;
    FSoloPendientes : Boolean;
    FSoloClave : Boolean;
    { Public declarations }
  end;

var
  fAnomalias: TfAnomalias;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos, frmConfirmacionRecibos,
  frmRecibosHistoricos;

{$R *.dfm}

procedure TfAnomalias.ActualizarClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Distinct R.*, I.Inquilino, I.Propietario, A.ID  ' +
                  ' from CabezaRecibos R '+
                  ' Inner Join Anomalias A on R.Tipo = A.Tipo and R.Letra = A.Letra and R.Numero = A.Numero '+
                  ' inner join Inmuebles I on R.codinq=I.Codinq ';

//    if not FSoloClave then
//        q.SQL.Add('where R.Pendiente=0')
//    else
        q.SQL.Add('where 1=1');

    if not FSoloClave then
      if FSoloPendientes then
        q.SQL.Add(' and R.Letra = ''P'' ')
      else
        q.SQL.Add(' and R.Letra <> ''P'' ');

    if FSoloClave then
      q.SQL.Add(' and R.UsoClave=1 ');

    if not Todos.Checked then
    begin
      q.SQL.Add(' and R.Fecha >=:desde and R.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and R.Codinq >=:desde and R.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosPropietarios.Checked then
    begin
      q.SQL.Add(' and a.Usuario Like :Usuario ');
      q.ParamByName('Usuario').AsString := edPropietario.text + '%';
    end;

    if not chIncluirControlados.Checked then
    begin
      q.SQL.Add(' and Controlado = 0 ');
    end;

    if cbTipo.Text <> '' then
    begin
      if cbTipo.ItemIndex = 1 then
        q.SQL.Add(' and R.Tipo = ''RE'' ');
      if cbTipo.ItemIndex = 2 then
        q.SQL.Add(' and R.Tipo = ''LI'' ');
    end;

    if cbLetra.Text <> '' then
      q.SQL.Add(' and R.Letra = ' + QuotedStr(cbLetra.Text) );

    q.SQL.Add(' order by Fecha desc ');
    q.Open;

    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[3,I] := q.FieldByName('Tipo').AsString;
      gDetalle.Cells[4,I] := q.FieldByName('Letra').AsString;
      gDetalle.Cells[5,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
      gDetalle.Cells[6,I] := q.FieldByName('Numero').AsString;
      gDetalle.Cells[7,I] := q.FieldByName('Usuario').AsString;
      gDetalle.Cells[10,I] := q.FieldByName('ID').AsString;
      if q.FieldByName('Pendiente').AsInteger = 0 then
        gDetalle.Cells[8,I] := q.FieldByName('UsuarioCaja').AsString;
      gDetalle.Cells[9,I] := q.FieldByName('Propietario').AsString;
      if q.FieldByName('PendienteRetirar').AsInteger = 1 then
        gDetalle.ColorRow[I] := RGB(255,185,185);
      if FSoloClave then
        if q.FieldByName('Controlado').AsInteger = 0 then
          gDetalle.ColorRow[I] := RGB(251,254,214);

      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    gDetalle.Row := 1;

    q.SQL.Text := 'Select Distinct a.*, I.Inquilino, I.Propietario ' +
                  ' from  Anomalias A '+
                  ' inner join Inmuebles I on A.codinq=I.Codinq ';

    q.SQL.Add('where Tipo = '''' ');

    if not Todos.Checked then
    begin
      q.SQL.Add(' and A.Fecha >=:desde and A.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and A.Codinq >=:desde and A.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosPropietarios.Checked then
    begin
      q.SQL.Add(' and a.Usuario Like :Usuario ');
      q.ParamByName('Usuario').AsString := edPropietario.text + '%';
    end;

    q.SQL.Add(' order by Fecha desc ');
    q.Open;

    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[3,I] := q.FieldByName('Tipo').AsString;
      gDetalle.Cells[4,I] := q.FieldByName('Letra').AsString;
      gDetalle.Cells[5,I] := FormatFloat('0000-00000000', q.FieldByName('ID').AsFloat);
      gDetalle.Cells[6,I] := q.FieldByName('Numero').AsString;
      gDetalle.Cells[7,I] := q.FieldByName('Usuario').AsString;
      gDetalle.Cells[9,I] := q.FieldByName('Propietario').AsString;
      gDetalle.Cells[10,I] := q.FieldByName('ID').AsString;
      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    gDetalle.Row := 1;

    gDetalleCLick(nil);
  finally
    FreeAndNil(q);
  end;
end;

function TfAnomalias.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfAnomalias.TodosAfectaClick(Sender: TObject);
begin
(*
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
*)
end;

procedure TfAnomalias.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todos.Checked := True;
end;

procedure TfAnomalias.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAnomalias.TodosDescripcionClick(Sender: TObject);
begin
(*
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
*)
end;

procedure TfAnomalias.TodosDestinoClick(Sender: TObject);
begin
(*
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
*)
end;

procedure TfAnomalias.btnEliminarClick(Sender: TObject);
var
  Codinq: string;
  Tipo: string;
  Letra: string;
  numero: string;
  q: tFXQuery;
begin
  q := CrearQuery;
  Codinq := gDetalle.Cells[1, gDetalle.Row];
  Tipo := gDetalle.Cells[3, gDetalle.Row];
  Letra := gDetalle.Cells[4, gDetalle.Row];
  numero := AnsiReplaceStr(gDetalle.Cells[5, gDetalle.Row], '-','');
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
    gCuerpo.Vaciar;
  end;
end;

procedure TfAnomalias.btnImprimirClick(Sender: TObject);
var
  q, qImpuestos: tFXQuery;
  I, J: Integer;
  stUbicacion: string;
  stInquilino: string;
  Letras: string;
  Suma: Currency;
  Total: String;
  Fecha: string;
begin
  gImpresion.Vaciar;
  qImpuestos:= CrearQuery;
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from inmuebles where codinq = :Codinq';
    q.Parambyname('Codinq').AsString := gDetalle.Cells[1, gDetalle.Row];
    q.Open;

    qImpuestos.SQL.Text := 'Select MailInquilino, PlantillaInquilino, EntregarImpuestos from Inmuebles where codinq =:codinq';
    qImpuestos.Parambyname('Codinq').AsString := gDetalle.Cells[1, gDetalle.Row];
    qImpuestos.Open;

    I := 1;

    Suma := 0;

    for J := 1 to gCuerpo.RowCount - 1 do
      Suma := Suma + ToFloat(gCuerpo.Cells[5,J]);

    Total := FormatFloat('0.00', Suma);

    letras:=importeenletras(Suma);
    Fecha := gDetalle.Cells[0, gDetalle.Row];
    Fecha := transformarfecha(Fecha);
    Fecha := 'Córdoba, ' + Fecha;

    for J := 1 to gCuerpo.RowCount - 1 do
    begin
      gImpresion.Cells[0,I] := gDetalle.Cells[1, gDetalle.Row];
      gImpresion.Cells[1,I] := gDetalle.Cells[2, gDetalle.Row];
      gImpresion.Cells[2,I] := Fecha;
      gImpresion.Cells[3,I] := q.FieldByName('Ubicacion').AsString;
      gImpresion.Cells[4,I] := '';
      gImpresion.Cells[5,I] := gCuerpo.Cells[3,J];
      gImpresion.Cells[6,I] := gCuerpo.Cells[4,J];
      gImpresion.Cells[7,I] := gCuerpo.Cells[5,J];
      gImpresion.Cells[8,I] := FormatFloat('0.00', Suma) + ').-';
      gImpresion.Cells[9,I] := Letras;
      gImpresion.Cells[10,I] := gCuerpo.Cells[1,J];
      gImpresion.Cells[11,I] := '';
      gImpresion.Cells[12,I] := gDetalle.Cells[8, gDetalle.Row];
      gImpresion.Cells[13,I] := gCuerpo.Cells[7,J];;
      Inc(i);
    end;

    gImpresion.SortColumn(9,True, 'N');
    if i>2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;

    objMail := TMail.Create;
    objMail.idPlantilla := qImpuestos.FieldByName('PlantillaInquilino').AsInteger;
    objMail.DireccionMail := qImpuestos.FieldByName('MailInquilino').AsString;
    objMail.Titulo := 'Recibo para Inquilinos ';
    objMail.Asunto := 'Recibo para Inquilinos ';
    objMail.Mes := DevuelveMes(MonthOf(StrToDate(gDetalle.Cells[0, gDetalle.Row])));
    objMail.Anio := YearOf(StrToDate(gDetalle.Cells[0, gDetalle.Row]));


    ImprimirReporte ( Reporte, objMail,  plReporte,  gImpresion ) ;
    ImprimirReporte ( ReporteDuplicado, objMail, plReporte,  gImpresion ) ;

////    actListadoRecibos.Execute;
//    stUbicacion := Edit5.Text;
//    Edit5.Properties.OnChange := nil;
//    stInquilino := Edit2.Text;
//
//    actPoneMesPagado.Execute;
//
//    if qImpuestos.Fieldbyname('EntregarImpuestos').AsInteger = 1 then
//      actImpuestosAlPropietario.Execute;
//
//    Edit2.Text := stInquilino;
//    Edit5.Text := stUbicacion;
//
//
//    Edit5.Properties.OnChange := Edit5PropertiesChange;
  finally
    FreeAndNil(qImpuestos);
  end;
end;

procedure TfAnomalias.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfAnomalias.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfAnomalias.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAnomalias.cbAfectaClick(Sender: TObject);
begin
//  todosafecta.Checked := False;
end;

procedure TfAnomalias.cbDestinoChange(Sender: TObject);
begin
//  TodosDestino.Checked := False;
end;

procedure TfAnomalias.cbTipoClick(Sender: TObject);
begin
  if cbTipo.ItemIndex = 1 then
  begin
    cbLetra.Items.Clear;
    cbLetra.Items.Add('X');
    cbLetra.Items.Add('B');
    cbLetra.Items.Add('D');
  end
  else if cbTipo.ItemIndex = 2 then
  begin
    cbLetra.Items.Clear;
    cbLetra.Items.Add('A');
    cbLetra.Items.Add('T');
  end;
end;

procedure TfAnomalias.DeseleccionarTodas1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    if gDetalle.Cells[0, I] <> '' then
      gDetalle.ColorRow[I] := clWhite;
end;

procedure TfAnomalias.TodosPropietariosClick(Sender: TObject);
begin
  if todosPropietarios.Checked then
    edPropietario.Text:='';

  if Trim(edPropietario.Text) = ''  then
    todosPropietarios.Checked := True;
end;

procedure TfAnomalias.edDescripcionChange(Sender: TObject);
begin
(*
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
*)
end;

procedure TfAnomalias.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAnomalias.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  edHasta.Text := edDesde.text;
end;


procedure TfAnomalias.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAnomalias.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfAnomalias.Edit6Change(Sender: TObject);
begin
  edit8.Text:=edit6.Text;

  if edit6.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfAnomalias.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TfAnomalias.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfAnomalias.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfAnomalias.edPropietarioChange(Sender: TObject);
begin
  todosPropietarios.Checked:=edPropietario.Text = '';
end;

procedure TfAnomalias.EliminarRecibo1Click(Sender: TObject);
begin
  if MostrarDialogoSiNo('¿Esta seguro de eliminar el recibo?') then
  begin
    DM.IniciarTransaccion;
    try
      EliminarRecibo(gDetalle.Cells[1, gDetalle.Row],gDetalle.Cells[3, gDetalle.Row],gDetalle.Cells[4, gDetalle.Row], gDetalle.Cells[5, gDetalle.Row]);
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos eliminados correctamente.');
    except
      DM.CancelarTransaccion;
    end;
    ActualizarClick(nil);
  end;
end;

procedure TfAnomalias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF aSSIGNED(LiqinOrig) THEN
    FreeAndNil(LiqinOrig);
  IF aSSIGNED(dspLiqinOrig) THEN
    FreeAndNil(dspLiqinOrig);
  action := caFree;
  if Assigned(FAnomalias) then
    fAnomalias := nil;
end;

procedure TfAnomalias.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  LiqinOrig := TClientDataSet.Create(nil);
  dspLiqinOrig := TDatasetProvider.Create(nil);

end;

procedure TfAnomalias.gDetalleClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  gCuerpo.Vaciar;
  gAnomalias.Vaciar;
  if gDetalle.Cells[gDetalle.Col, gdetalle.Row] = '' then
    Exit;
  try
    if gDetalle.Cells[3, gdetalle.Row] <> '' then
    begin
      q.SQL.Text := 'Select CU.*, CA.Fecha as FechaRecibo from cuerporecibos cu inner join cabezarecibos ca on ca.tipo=cu.tipo and ca.letra=cu.letra and ca.numero=cu.numero where Cu.Tipo=:Tipo and Cu.Letra=:letra and CU.Numero=:Numero order by cu.linea';
      q.ParamByName('Tipo').AsString := gdetalle.Cells[3,gDetalle.Row];
      q.ParamByName('Letra').AsString := gdetalle.Cells[4,gDetalle.Row];
      q.ParamByName('Numero').AsFloat := ToFloat(gdetalle.Cells[6,gDetalle.Row]);
      q.Open;

      I := 1;
      while not q.Eof  do
      begin
        gCuerpo.Cells[0,I] := FOrmatdatetime('dd/mm/yyyy', q.FieldByName('FechaRecibo').AsDatetime);
        gCuerpo.Cells[1,I] := q.FieldByName('Coditem').AsString;
        gCuerpo.Cells[2,I] := q.FieldByName('Linea').AsString;
        gCuerpo.Cells[3,I] := q.FieldByName('Item').AsString;
        gCuerpo.Cells[4,I] := q.FieldByName('Periodo').AsString;
        if q.FieldByName('Importe').AsString <> '' then
          gCuerpo.Cells[5,I] := FormatFloat('0.00',ToFloat(q.FieldByName('Importe').AsString));
        gCuerpo.Cells[6,I] := q.FieldByName('Codinq').AsString;
        gCuerpo.Cells[7,I] := q.FieldByName('IDMovimiento').AsString;
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gCuerpo.RowCount := 2
      else
        gCuerpo.RowCount := I;

      if gCuerpo.Cells[0,1] = '' then
         MostrarDialogoAceptar('El recibo no tiene cuerpo. Verifique por favor');

      q.SQL.Text := 'Select Cu.* from Anomalias cu inner join cabezarecibos ca on ca.tipo=cu.tipo and ca.letra=cu.letra and ca.numero=cu.numero where Cu.Tipo=:Tipo and Cu.Letra=:letra and CU.Numero=:Numero ';
      q.ParamByName('Tipo').AsString := gdetalle.Cells[3,gDetalle.Row];
      q.ParamByName('Letra').AsString := gdetalle.Cells[4,gDetalle.Row];
      q.ParamByName('Numero').AsFloat := ToFloat(gdetalle.Cells[6,gDetalle.Row]);
      q.Open;

      I := 1;
      while not q.Eof  do
      begin
        gAnomalias.Cells[0,I] := q.FieldByName('Anomalia').AsString;
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gAnomalias.RowCount := 2
      else
        gAnomalias.RowCount := I;

      if gCuerpo.Cells[0,1] = '' then
         MostrarDialogoAceptar('El recibo no tiene anomalías. Verifique por favor');
    end
    else
    begin
      q.SQL.Text := 'Select Cu.* from Anomalias cu  where Cu.ID=:ID ';
      q.ParamByName('ID').AsString := gdetalle.Cells[10,gDetalle.Row];
      q.Open;

      I := 1;
      while not q.Eof  do
      begin
        gAnomalias.Cells[0,I] := q.FieldByName('Anomalia').AsString;
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gAnomalias.RowCount := 2
      else
        gAnomalias.RowCount := I;
    end;
  finally
    FreeAndNil(q);
  end;

end;

procedure TfAnomalias.gDetalleDblClick(Sender: TObject);
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

procedure TfAnomalias.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if col = 0 then
    gDetalle.SortColumn(Col, True,'D')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfAnomalias.Marcarcomopendientederetirar1Click(
  Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;

  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' UPDATE CABEZARECIBOS SET PENDIENTERETIRAR = :PENDIENTE, usuario = :Usuario '+
                    '  WHERE TIPO = :TIPO '+
                    '    AND LETRA=:letra '+
                    '    and Numero = :numero '+
                    '    and codinq =:CODINQ';
      q.ParamByName('Tipo').AsString := gDetalle.Cells[3, gDetalle.Row];
      q.ParamByName('letra').AsString :=  gDetalle.Cells[4, gDetalle.Row];
      q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(gDetalle.Cells[5, gDetalle.Row],'-',''));
      q.ParamByName('Codinq').AsString :=  gDetalle.Cells[1, gDetalle.Row];
      q.ParamByName('Usuario').AsString :=  fPrincipal.fUsuario;
      q.ParamByName('Pendiente').AsInteger := 1;
      q.ExecSql;
      gDetalle.ColorRow[gDetalle.Row] := RGB(255,185,185);

      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAnomalias.Marcarcomoretirada1Click(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;

  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' UPDATE CABEZARECIBOS SET PENDIENTERETIRAR = :PENDIENTE, usuario = :usuario '+
                    '  WHERE TIPO = :TIPO '+
                    '    AND LETRA=:letra '+
                    '    and Numero = :numero '+
                    '    and codinq =:CODINQ';
      q.ParamByName('Tipo').AsString := gDetalle.Cells[3, gDetalle.Row];
      q.ParamByName('letra').AsString :=  gDetalle.Cells[4, gDetalle.Row];
      q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(gDetalle.Cells[5, gDetalle.Row],'-',''));
      q.ParamByName('Codinq').AsString :=  gDetalle.Cells[1, gDetalle.Row];
      q.ParamByName('Usuario').AsString :=  fPrincipal.fUsuario;
      q.ParamByName('Pendiente').AsInteger := 0;
      q.ExecSql;

      gDetalle.ColorRow[gDetalle.Row] := gDetalle.Color;

      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TfAnomalias.plTituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Fecha' then
    Result := gImpresion.Cells[2,1]
  else if aFieldName = 'Codinq' then
    Result := gImpresion.Cells[0,1]
  else if aFieldName = 'Total' then
    Result := gImpresion.Cells[8,1]
  else if aFieldName = 'Letras' then
    Result := gImpresion.Cells[9,1]
  else if aFieldName = 'Inquilino' then
    Result := gImpresion.Cells[1,1]
  else if aFieldName = 'Direccion' then
    Result := gImpresion.Cells[3,1]
  else if aFieldName = 'Propietario' then
    Result := gImpresion.Cells[12,1]
  else if aFieldName = 'DNIPropietario' then
    Result := gImpresion.Cells[11,1];
end;

procedure TfAnomalias.popEliminarPopup(Sender: TObject);
begin
  EliminarRecibo1.Visible := not FSoloClave;
  N1.Visible := not FSoloClave;
  MarcarComoPendienteDeRetirar1.Visible := not FSoloClave;
  MarcarComoRetirada1.Visible := not FSoloClave;
  ReciboControlado1.Visible := FSoloClave;
end;

procedure TfAnomalias.ReciboControlado1Click(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;

  DM.IniciarTransaccion;
  try
    try
      if gDetalle.Cells[3, gDetalle.Row] = '' then
      begin
        q.SQL.Text := ' DELETE FROM ANOMALIAS '+
                      '  WHERE ID = :ID ';
        q.ParamByName('ID').AsString := gDetalle.Cells[10, gDetalle.Row];
        q.ExecSql;
        gDetalle.ColorRow[gDetalle.Row] := clWhite;
        ActualizarCLick(nil);
      end
      else
      begin
        q.SQL.Text := ' UPDATE CABEZARECIBOS SET Controlado = 1 '+
                      '  WHERE TIPO = :TIPO '+
                      '    AND LETRA=:letra '+
                      '    and Numero = :numero '+
                      '    and codinq =:CODINQ';
        q.ParamByName('Tipo').AsString := gDetalle.Cells[3, gDetalle.Row];
        q.ParamByName('letra').AsString :=  gDetalle.Cells[4, gDetalle.Row];
        q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(gDetalle.Cells[5, gDetalle.Row],'-',''));
        q.ParamByName('Codinq').AsString :=  gDetalle.Cells[1, gDetalle.Row];
        q.ExecSql;
        gDetalle.ColorRow[gDetalle.Row] := clWhite;
      end;

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.ColorRow[I] = clWhite then
          Continue;

        if gDetalle.Cells[3, gDetalle.Row] = '' then
        begin
          q.SQL.Text := ' DELETE FROM ANOMALIAS '+
                        '  WHERE ID = :ID ';
          q.ParamByName('ID').AsString := gDetalle.Cells[10, I];
          q.ExecSql;
          gDetalle.ColorRow[gDetalle.Row] := clWhite;
        end
        else
        begin
          q.SQL.Text := ' UPDATE CABEZARECIBOS SET Controlado = 1 '+
                        '  WHERE TIPO = :TIPO '+
                        '    AND LETRA=:letra '+
                        '    and Numero = :numero '+
                        '    and codinq =:CODINQ';
          q.ParamByName('Tipo').AsString := gDetalle.Cells[3, I];
          q.ParamByName('letra').AsString :=  gDetalle.Cells[4, I];
          q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(gDetalle.Cells[5, I],'-',''));
          q.ParamByName('Codinq').AsString :=  gDetalle.Cells[1, I];
          q.ExecSql;
          gDetalle.ColorRow[gDetalle.Row] := clWhite;
        end;
      end;
      dm.ConfirmarTransaccion;
      ActualizarCLick(nil);
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfAnomalias.Seleccionartodas1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    if gDetalle.Cells[0, I] <> '' then
      gDetalle.ColorRow[I] := clYellow;
end;

end.
