unit frmRecibosPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, strUtils, FXQuery, ppDesignLayer, AdvGlowButton;

type
  TfRecibosPendientes = class(TForm)
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
    gCuerpo: TStringAlignGrid;
    popEliminar: TPopupMenu;
    EliminarRecibo1: TMenuItem;
    Panel3: TPanel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Shape1: TShape;
    Label4: TLabel;
    btnEliminar: TAdvGlowButton;
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
    edTotal: TEdit;
    Label9: TLabel;
    Shape2: TShape;
    Label10: TLabel;
    N1: TMenuItem;
    Marcarcomopendientederetirar1: TMenuItem;
    Marcarcomoretirada1: TMenuItem;
    Label11: TLabel;
    Edit1: TEdit;
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
    procedure gCuerpoFixedColClick(Sender: TObject; col: Integer);
    procedure Marcarcomopendientederetirar1Click(Sender: TObject);
    procedure Marcarcomoretirada1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    FSoloPendientes : Boolean;
    { Public declarations }
  end;

var
  fRecibosPendientes: TfRecibosPendientes;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos, frmValeDepositos;

{$R *.dfm}

procedure TfRecibosPendientes.ActualizarClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Distinct R.*, I.Inquilino, I.Propietario ' +
                  ' from CabezaRecibos R '+
                  ' inner join Inmuebles I on R.codinq=I.Codinq where R.Pendiente=1';
    if FSoloPendientes then
      q.SQL.Add(' and R.Letra = ''P'' ')
    else
      q.SQL.Add(' and R.Letra <> ''P'' ');


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
      q.SQL.Add(' and R.Propietario Like :Propietario ');
      q.ParamByName('Propietario').AsString := edPropietario.text + '%';
    end;

    if edit1.Text <> '' then
    begin
      q.SQL.Add(' and R.Numero = :Numero ');
      q.ParamByName('Numero').AsFloat := ToFloat(edit1.text);
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
      gDetalle.Cells[8,I] := q.FieldByName('Propietario').AsString;
      if q.FieldByName('PendienteRetirar').AsInteger = 1 then
        gDetalle.ColorRow[I] := RGB(255,185,185);

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

function TfRecibosPendientes.TituloGetFieldValue(aFieldName: string): Variant;
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

procedure TfRecibosPendientes.TodosAfectaClick(Sender: TObject);
begin
(*
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
*)
end;

procedure TfRecibosPendientes.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todos.Checked := True;
end;

procedure TfRecibosPendientes.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfRecibosPendientes.TodosDescripcionClick(Sender: TObject);
begin
(*
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
*)
end;

procedure TfRecibosPendientes.TodosDestinoClick(Sender: TObject);
begin
(*
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
*)
end;

procedure TfRecibosPendientes.btnEliminarClick(Sender: TObject);
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
      MostrarDialogoAceptar('Datos eliminados correctamente.');
      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    gCuerpo.Vaciar;
  end;
end;

procedure TfRecibosPendientes.btnImprimirClick(Sender: TObject);
var
  I,j: Integer;
  idTransaccion: INteger;
  q, qCtaCte, qVale: tFXQuery;
  CodigoVale: Integer;
  boEncontrado: Boolean;
  ndTotal: Double;
  niLinea: Integer;
  Categoria: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    boEncontrado := False;
    if gDetalle.ColorRow[I] = clYellow then
    begin
      if (gDetalle.Cells[4, I] = 'D') or (gDetalle.Cells[4, I] = 'T') then
      begin
        boEncontrado := True;
        Categoria := 6;
        Break;
      end
      else
      begin
        boEncontrado := True;
        Categoria := 16;
        Break;
      end

    end;

  end;

  if boEncontrado then
    if (not TfValeDepositos.Ejecutar(CodigoVale, Categoria)) then
      CodigoVale := 0;

  q := CrearQuery;
  qctacte := CrearQuery;
  qVale := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.Cells[3, I] = 'LI' then
        begin
          ndTotal := 0;
          if gDetalle.ColorRow[I] = clYellow then
          begin
            gDetalle.Row := I;
            gDetalleClick(nil);

            if gCuerpo.Cells[0,1] = '' then
              Continue;

            for j := 1 to gCuerpo.RowCount - 1 do
            begin
              if gCuerpo.Cells[0,J] = '' then
                Break;

              q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
              Q.Open;

              idtransaccion := q.fieldbyname('id').AsInteger;

              InsertarCaja(IDTransaccion,
                           FormatDatetime('dd/mm/yyyy', Date),
                           gDetalle.Cells[1, I],
                           'LI',
                           gDetalle.Cells[4, I],
                           gDetalle.Cells[6, I]);

              if gcUERPO.Cells[5, j] <> '' then
                ndTotal := ndTotal + tofloat(gcUERPO.Cells[5, j]);

              if ToFloat(gCuerpo.Cells[5, j]) < 0 then
                InsertarCajaDetalles(IDTransaccion,
                         gcUERPO.Cells[6, j],
                         gcUERPO.Cells[1, j],
                         FormatDatetime('dd/mm/yyyy', Date),
                         gCuerpo.Cells[2, J],
                         gcUERPO.Cells[3, j],
                         gcUERPO.Cells[4, j],
                         gcUERPO.Cells[5, j],
                         '0.00',
                         ToInt(gCuerpo.Cells[7,j])
                         )
              else
              if ToFloat(gCuerpo.Cells[5, j]) > 0 then
                InsertarCajaDetalles(IDTransaccion,
                         gcUERPO.Cells[6, j],
                         gcUERPO.Cells[1, j],
                         FormatDatetime('dd/mm/yyyy', Date),
                         gCuerpo.Cells[2, J],
                         gcUERPO.Cells[3, j],
                         gcUERPO.Cells[4, j],
                         '0.00',
                         FormatFloat('0.00', ToFloat(gcUERPO.Cells[5, j])*-1),
                         ToInt(gCuerpo.Cells[7,j]));
              if (gCuerpo.Cells[1,J] = '27') then
              begin
                q.SQL.Text := ' Select * from CuerpoVales '+
                              '  where CodigoItem =:CodigoItem '+
                              '    and Descripcion Like :Descripcion '+
                              '    and Codinq = :Codinq ';
                q.ParamByName('CodigoItem').AsString := gCuerpo.Cells[1,J];
                q.ParamByName('Descripcion').AsString := '%' + 'A DESCONTAR' + ' ' + gCuerpo.Cells[4,J] + '%';
                q.ParamByName('Codinq').AsString := gDetalle.Cells[1, gDetalle.Row];
                q.Open;

                if not q.IsEmpty then
                begin
                  qVale.SQL.Text :=
                    ' Update CuerpoVales ' +
                    '    Set Sale = :Sale ' +
                    '  Where Codigo = :Codigo ' +
                    '    and Linea = :Linea ' +
                    '    and CodigoItem = :CodigoItem '+
                    '    and Codinq = :Codinq '+
                    '    and ID = :ID ';
                  qVale.ParambyName('Sale').AsFloat := Abs(ToFloat(gCuerpo.Cells[5,J]));
                  qVale.ParambyName('Codigo').AsInteger := q.FieldByName('Codigo').AsInteger;
                  qVale.ParamByName('CodigoItem').AsString := gCuerpo.Cells[1,J];
                  qVale.ParambyName('Linea').AsInteger := q.FieldByName('Linea').AsInteger;
                  qVale.ParambyName('Codinq').AsString := gCuerpo.Cells[6,J];
                  qVale.ParambyName('ID').AsString := q.FieldByName('ID').AsString;
                  qVale.ExecSQL;
                end;
              end;
            end;

            q.sql.text := 'Update cabezarecibos set pendiente=:pendiente, usuariocaja = :usuariocaja where tipo=:tipo and letra=:letra and NUmero=:numero';
            q.Parambyname('Tipo').AsString := gDetalle.Cells[3, I];
            q.Parambyname('Pendiente').AsInteger := 0;
            q.Parambyname('Letra').AsString := gDetalle.Cells[4, I];
            q.Parambyname('Numero').AsFloat := ToFloat(gDetalle.Cells[6, I]);
            q.ParamByName('Usuariocaja').AsString :=  fPrincipal.fUsuario;
            Q.ExecSql;

            q.SQL.Text := ' Select Max(Linea) as Linea from CuerpoVales where codigo=:Codigo';
            Q.ParamByName('CODIGO').AsInteger := CodigoVale;
            q.Open;

            niLinea := q.FieldByName('Linea').AsInteger + 1;

            InsertarCuerpoVale(CodigoVale,
                               niLinea,
                               gDetalle.Cells[1, I],
                               '',
                               'LI T ' + FormatFloat('0000-00000000', ToFloat(gDetalle.Cells[6, I])),
                               Date,
                               ndTotal, 0, '0', 1, 1);
          end;
        end;

        if gDetalle.Cells[3, I] = 'RE' then
        begin
          ndTotal := 0;
          if gDetalle.ColorRow[I] = clYellow then
          begin
            gDetalle.Row := I;
            gDetalleClick(nil);

            if gCuerpo.Cells[0,1] = '' then
              Continue;

            for j := 1 to gCuerpo.RowCount - 1 do
            begin
              if gCuerpo.Cells[0,J] = '' then
                Break;

              q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
              Q.Open;

              idtransaccion := q.fieldbyname('id').AsInteger;

              InsertarCaja(IDTransaccion,
                           FormatDatetime('dd/mm/yyyy', Date),
                           gDetalle.Cells[1, I],
                           'RE',
                           gDetalle.Cells[4, I],
                           gDetalle.Cells[6, I]);

              if gcUERPO.Cells[5, j] <> '' then
                ndTotal := ndTotal + tofloat(gcUERPO.Cells[5, j]);

                if tofloat(gcUERPO.Cells[5, j]) < 0 then
                  InsertarCajaDetalles(IDTransaccion,
                         gDetalle.Cells[1, I],
                         gcUERPO.Cells[1, j],
                         FormatDatetime('dd/mm/yyyy', Date),
                         gCuerpo.Cells[2, J],
                         gcUERPO.Cells[3, j],
                         gcUERPO.Cells[4, j],
                         '0.00',
                         gcUERPO.Cells[5, j],
                         ToInt(gCuerpo.Cells[7,j]))
                else
                  InsertarCajaDetalles(IDTransaccion,
                         gDetalle.Cells[1, I],
                         gcUERPO.Cells[1, j],
                         FormatDatetime('dd/mm/yyyy', Date),
                         gCuerpo.Cells[2, J],
                         gcUERPO.Cells[3, j],
                         gcUERPO.Cells[4, j],
                         gcUERPO.Cells[5, j],
                         '0.00',
                         ToInt(gCuerpo.Cells[7,j])
                         );

              if (gCuerpo.Cells[1,J] = '09') then
              begin
                q.SQL.Text := ' Select * from CuerpoVales '+
                              '  where CodigoItem =:CodigoItem '+
                              '    and Descripcion Like :Descripcion '+
                              '    and Codinq = :Codinq ';
                q.ParamByName('CodigoItem').AsString := gCuerpo.Cells[1,J];
                q.ParamByName('Descripcion').AsString := gCuerpo.Cells[3,J] + ' ' + gCuerpo.Cells[4,J];
                q.ParamByName('Codinq').AsString := gDetalle.Cells[1, gDetalle.Row];
                q.Open;

                if not q.IsEmpty then
                begin
                  qVale.SQL.Text :=
                    ' Update CuerpoVales ' +
                    '    Set Sale = :Sale ' +
                    '  Where Codigo = :Codigo ' +
                    '    and Linea = :Linea ' +
                    '    and CodigoItem = :CodigoItem '+
                    '    and Codinq = :Codinq '+
                    '    and ID = :ID ';
                  qVale.ParambyName('Sale').AsFloat := Abs(ToFloat(gCuerpo.Cells[5,J]));
                  qVale.ParambyName('Codigo').AsInteger := q.FieldByName('Codigo').AsInteger;
                  qVale.ParamByName('CodigoItem').AsString := gCuerpo.Cells[1,J];
                  qVale.ParambyName('Linea').AsInteger := q.FieldByName('Linea').AsInteger;
                  qVale.ParambyName('Codinq').AsString := gCuerpo.Cells[6,J];
                  qVale.ParambyName('ID').AsString := q.FieldByName('ID').AsString;
                  qVale.ExecSQL;
                end;
              end;
            end;

            q.sql.text := 'Update cabezarecibos set pendiente=:pendiente, usuariocaja = :usuario where tipo=:tipo and letra=:letra and NUmero=:numero';
            q.Parambyname('Tipo').AsString := gDetalle.Cells[3, I];
            q.Parambyname('Pendiente').AsInteger := 0;
            q.Parambyname('Letra').AsString := gDetalle.Cells[4, I];
            q.ParamByName('Usuario').AsString :=  fPrincipal.fUsuario;
            q.Parambyname('Numero').AsFloat := ToFloat(gDetalle.Cells[6, I]);
            Q.ExecSql;

            q.SQL.Text := ' Select Max(Linea) as Linea from CuerpoVales where codigo=:Codigo';
            Q.ParamByName('CODIGO').AsInteger := CodigoVale;
            q.Open;

            niLinea := q.FieldByName('Linea').AsInteger + 1;

            InsertarCuerpoVale(CodigoVale,
                               niLinea,
                               gDetalle.Cells[1, I],
                               '',
                               'RE D ' + FormatFloat('0000-00000000', ToFloat(gDetalle.Cells[6, I])),
                               Date,
                               0, ndTotal, '0', 1, 1);

          end;
        end;
        if gDetalle.Cells[3, I] = 'FA' then
        begin
          if gDetalle.ColorRow[I] = clYellow then
          begin
            gDetalle.Row := I;
            gDetalleClick(nil);

            if gCuerpo.Cells[0,1] = '' then
              Continue;

            for j := 1 to gCuerpo.RowCount - 1 do
            begin
              if gCuerpo.Cells[0,J] = '' then
                Break;

              q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
              Q.Open;

              idtransaccion := q.fieldbyname('id').AsInteger;

              InsertarCaja(IDTransaccion,
                           gDetalle.Cells[0, I],
                           gDetalle.Cells[1, I],
                           'FA',
                           gDetalle.Cells[4, I],
                           gDetalle.Cells[6, I]);

              if gcUERPO.Cells[5, j] <> '' then
                if tofloat(gcUERPO.Cells[5, j]) < 0 then
                  InsertarCajaDetalles(IDTransaccion,
                         gDetalle.Cells[1, I],
                         gcUERPO.Cells[1, j],
                         gDetalle.Cells[0, I],
                         gCuerpo.Cells[2, J],
                         gcUERPO.Cells[3, j],
                         gcUERPO.Cells[4, j],
                         '0.00',
                         gcUERPO.Cells[5, j],
                         ToInt(gCuerpo.Cells[7,I]))
              else
                InsertarCajaDetalles(IDTransaccion,
                         gDetalle.Cells[1, I],
                         gcUERPO.Cells[1, j],
                         gDetalle.Cells[0, I],
                         gCuerpo.Cells[2, J],
                         gcUERPO.Cells[3, j],
                         gcUERPO.Cells[4, j],
                         gcUERPO.Cells[5, j],
                         '0.00',
                         ToInt(gCuerpo.Cells[7,I]));
            end;

            q.sql.text := 'Update cabezarecibos set pendiente=:pendiente, usuariocaja = :Usuario where tipo=:tipo and letra=:letra and NUmero=:numero';
            q.Parambyname('Tipo').AsString := gDetalle.Cells[3, I];
            q.Parambyname('Pendiente').AsInteger := 0;
            q.Parambyname('Letra').AsString := gDetalle.Cells[4, I];
            q.ParamByName('Usuario').AsString :=  fPrincipal.fUsuario;
            q.Parambyname('Numero').AsFloat := ToFloat(gDetalle.Cells[6, I]);
            Q.ExecSql;
          end;
        end;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    gCuerpo.Vaciar;
  end;
end;

procedure TfRecibosPendientes.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfRecibosPendientes.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfRecibosPendientes.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfRecibosPendientes.cbAfectaClick(Sender: TObject);
begin
//  todosafecta.Checked := False;
end;

procedure TfRecibosPendientes.cbDestinoChange(Sender: TObject);
begin
//  TodosDestino.Checked := False;
end;

procedure TfRecibosPendientes.cbTipoClick(Sender: TObject);
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

procedure TfRecibosPendientes.TodosPropietariosClick(Sender: TObject);
begin
  if todosPropietarios.Checked then
    edPropietario.Text:='';

  if Trim(edPropietario.Text) = ''  then
    todosPropietarios.Checked := True;
end;

procedure TfRecibosPendientes.edDescripcionChange(Sender: TObject);
begin
(*
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
*)
end;

procedure TfRecibosPendientes.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfRecibosPendientes.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  edHasta.Text := edDesde.text;
end;


procedure TfRecibosPendientes.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfRecibosPendientes.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfRecibosPendientes.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    Key := #0;
end;

procedure TfRecibosPendientes.Edit6Change(Sender: TObject);
begin
  edit8.Text:=edit6.Text;

  if edit6.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfRecibosPendientes.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TfRecibosPendientes.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfRecibosPendientes.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfRecibosPendientes.edPropietarioChange(Sender: TObject);
begin
  todosPropietarios.Checked:=edPropietario.Text = '';
end;

procedure TfRecibosPendientes.EliminarRecibo1Click(Sender: TObject);
begin
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;

  if MostrarDialogoSiNo('¿Esta seguro de eliminar el recibo?') then
  begin
    DM.IniciarTransaccion;
    try
      EliminarRecibo(gDetalle.Cells[1, gDetalle.Row],gDetalle.Cells[3, gDetalle.Row],gDetalle.Cells[4, gDetalle.Row], gDetalle.Cells[5, gDetalle.Row]);
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos eliminados correctamente.');
    except
      DM.CancelarTransaccion;
    end;
    ActualizarClick(nil);
  end;
end;

procedure TfRecibosPendientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fRecibosPendientes := nil;
end;

procedure TfRecibosPendientes.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfRecibosPendientes.gCuerpoFixedColClick(Sender: TObject;
  col: Integer);
begin
  if Col = 0 then
    gCuerpo.SortColumn(Col, True,'D')
  else if Col = 5 then
    gCuerpo.SortColumn(Col, True,'N')
  else
    gCuerpo.SortColumn(Col, True,'S');
end;

procedure TfRecibosPendientes.gDetalleClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
  ndTotal: Double;
begin
  q := CrearQuery;
  gCuerpo.Vaciar;

  if gDetalle.Cells[gDetalle.Col, gdetalle.Row] = '' then
    Exit;

  try
    q.SQL.Text := 'Select CU.*, CA.Fecha as FechaRecibo from cuerporecibos cu inner join cabezarecibos ca on ca.tipo=cu.tipo and ca.letra=cu.letra and ca.numero=cu.numero where Cu.Tipo=:Tipo and Cu.Letra=:letra and CU.Numero=:Numero order by cu.linea';
    q.ParamByName('Tipo').AsString := gdetalle.Cells[3,gDetalle.Row];
    q.ParamByName('Letra').AsString := gdetalle.Cells[4,gDetalle.Row];
    q.ParamByName('Numero').AsFloat := ToFloat(gdetalle.Cells[6,gDetalle.Row]);
    q.Open;

    I := 1;
    ndTotal := 0;
    while not q.Eof  do
    begin
      gCuerpo.Cells[0,I] := FOrmatdatetime('dd/mm/yyyy', q.FieldByName('FechaRecibo').AsDatetime);
      gCuerpo.Cells[1,I] := q.FieldByName('Coditem').AsString;
      gCuerpo.Cells[2,I] := q.FieldByName('Linea').AsString;
      gCuerpo.Cells[3,I] := q.FieldByName('Item').AsString;
      gCuerpo.Cells[4,I] := q.FieldByName('Periodo').AsString;
      if q.FieldByName('Importe').AsString <> '' then
      begin
        gCuerpo.Cells[5,I] := FormatFloat('0.00',ToFloat(q.FieldByName('Importe').AsString));
        ndTotal := ndTotal + ToFloat(q.FieldByName('Importe').AsString);
      end;
      gCuerpo.Cells[6,I] := q.FieldByName('Codinq').AsString;
      gCuerpo.Cells[7,I] := q.FieldByName('IDMovimiento').AsString;
      q.Next;
      Inc(I);
    end;

    if I < 2 then
      gCuerpo.RowCount := 2
    else
      gCuerpo.RowCount := I;

    edTotal.Text := FormatFloat(',0.00', ndTotal);

    if gCuerpo.Cells[0,1] = '' then
       MostrarDialogoAceptar('El recibo no tiene cuerpo. Verifique por favor');
  finally
    FreeAndNil(q);
  end;

end;

procedure TfRecibosPendientes.gDetalleDblClick(Sender: TObject);
begin
  if gDetalle.ColorRow[gDetalle.Row] <> clYellow then
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

procedure TfRecibosPendientes.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 0 then
    gDetalle.SortColumn(Col, True,'D')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfRecibosPendientes.Marcarcomopendientederetirar1Click(
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
      q.SQL.Text := ' UPDATE CABEZARECIBOS SET PENDIENTERETIRAR = :PENDIENTE '+
                    '  WHERE TIPO = :TIPO '+
                    '    AND LETRA=:letra '+
                    '    and Numero = :numero '+
                    '    and codinq =:CODINQ';
      q.ParamByName('Tipo').AsString := gDetalle.Cells[3, gDetalle.Row];
      q.ParamByName('letra').AsString :=  gDetalle.Cells[4, gDetalle.Row];
      q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(gDetalle.Cells[5, gDetalle.Row],'-',''));
      q.ParamByName('Codinq').AsString :=  gDetalle.Cells[1, gDetalle.Row];
      q.ParamByName('Pendiente').AsInteger := 1;
      q.ExecSql;
      gDetalle.ColorRow[gDetalle.Row] := RGB(255,185,185);

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfRecibosPendientes.Marcarcomoretirada1Click(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;

  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' UPDATE CABEZARECIBOS SET PENDIENTERETIRAR = :PENDIENTE '+
                    '  WHERE TIPO = :TIPO '+
                    '    AND LETRA=:letra '+
                    '    and Numero = :numero '+
                    '    and codinq =:CODINQ';
      q.ParamByName('Tipo').AsString := gDetalle.Cells[3, gDetalle.Row];
      q.ParamByName('letra').AsString :=  gDetalle.Cells[4, gDetalle.Row];
      q.ParamByName('numero').AsFloat :=  ToFloat(AnsiReplacestr(gDetalle.Cells[5, gDetalle.Row],'-',''));
      q.ParamByName('Codinq').AsString :=  gDetalle.Cells[1, gDetalle.Row];
      q.ParamByName('Pendiente').AsInteger := 0;
      q.ExecSql;

      gDetalle.ColorRow[gDetalle.Row] := gDetalle.Color;

      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

end.
