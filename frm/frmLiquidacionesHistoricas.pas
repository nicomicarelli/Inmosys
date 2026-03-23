unit frmLiquidacionesHistoricas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, strUtils, FXQuery, ppDesignLayer, AdvGlowButton, ppModule, raCodMod,
  DBClient, Provider, DateUtils, voDispositivos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ppDBPipe;

type
  TfLiquidacionesHistoricas = class(TForm)
    gDetalle: TStringAlignGrid;
    gCuerpo: TStringAlignGrid;
    Panel3: TPanel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Shape1: TShape;
    Label4: TLabel;
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
    gImpresion: TStringAlignGrid;
    Reporte: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppVariable1: TppVariable;
    ppDetailBand1: TppDetailBand;
    ppVariable8: TppVariable;
    ppVariable6: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppVariable3: TppVariable;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppVariable9: TppVariable;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    plLiqPro: TppDBPipeline;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    plTitulo: TppJITPipeline;
    plTituloppField1: TppField;
    Documentacion: TppField;
    qLiqPro: TFXQuery;
    DataSource1: TDataSource;
    gPendiente: TStringAlignGrid;
    ppLabel7: TppLabel;
    popEliminar: TPopupMenu;
    EliminarRecibo1: TMenuItem;
    N1: TMenuItem;
    Marcarcomopendientederetirar1: TMenuItem;
    Marcarcomoretirada1: TMenuItem;
    Label10: TLabel;
    Shape2: TShape;
    chIncluirControlados: TCheckBox;
    LiquidacinControlada1: TMenuItem;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppVariable2: TppVariable;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppVariable4: TppVariable;
    ppVariable5: TppVariable;
    ppSummaryBand2: TppSummaryBand;
    ppVariable7: TppVariable;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppVariable10: TppVariable;
    raCodeModule2: TraCodeModule;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Change(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure btnNuevoClick(Sender: TObject);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
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
    procedure LiquidacinControlada1Click(Sender: TObject);
  private
    objMail: TMail;
    sMail: string;
    MontoTotal: Currency;
  public
    LiqPrOrig: TClientDataSet;
    dspLiqPrOrig: TDataSetProvider;
    FSoloPendientes : Boolean;
    FSoloPendientesRetirar : Boolean;
    FSoloClave : Boolean;
    { Public declarations }
  end;

var
  fLiquidacionesHistoricas: TfLiquidacionesHistoricas;
  fLiquidacionesConAnomalias: TfLiquidacionesHistoricas;
  fLiquidacionesNoRetiradas: TfLiquidacionesHistoricas;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos, frmConfirmacionRecibos;

{$R *.dfm}

procedure TfLiquidacionesHistoricas.ActualizarClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Distinct R.*, I.Inquilino, I.Propietario ' +
                  ' from CabezaRecibos R '+
                  ' inner join Inmuebles I on R.codinq=I.Codinq ';

    if not FSoloClave then
        q.SQL.Add('where R.Pendiente=0')
    else
        q.SQL.Add('where 1=1');

    if not FSoloClave then
      if FSoloPendientes then
        q.SQL.Add(' and R.Letra = ''P'' ')
      else
        q.SQL.Add(' and R.Letra <> ''P'' ');

    if FSoloClave then
      q.SQL.Add(' and R.UsoClave=1 ');

    if not chIncluirControlados.Checked then
    begin
      q.SQL.Add(' and R.Controlado = 0 ');
    end;

    if not Todos.Checked then
    begin
      q.SQL.Add(' and R.Fecha >=:desde and R.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and R.Codinq >=:cdesde and R.Codinq <=:CHasta ');
      q.ParamByName('CDesde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('CHasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosPropietarios.Checked then
    begin
      q.SQL.Add(' and Propietario Like :Propietario ');
      q.ParamByName('Propietario').AsString := edPropietario.text + '%';
    end;

    if FSoloPendientesRetirar then
      q.SQL.Add(' and PendienteRetirar = 1 ');

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
    gDetalleCLick(nil);
  finally
    FreeAndNil(q);
  end;
end;

procedure TfLiquidacionesHistoricas.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todos.Checked := True;
end;

procedure TfLiquidacionesHistoricas.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfLiquidacionesHistoricas.btnEliminarClick(Sender: TObject);
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

procedure TfLiquidacionesHistoricas.btnImprimirClick(Sender: TObject);
var
  q: TFXQuery;
  qLiqPrOrig: TFXQuery;
  qRepProp: TFXQuery;
  qRepProp2: TFXQuery;
  codi, nom: string;
  ci, se, si: string;
  I: Integer;
  num1, Suma, Ant, Act, gil: string;
  registro: Integer;
  Saltar: Boolean;
  boSubtotal: Boolean;
  Fecha, Total, Letras: String;
begin
  q := CrearQuery;
  qLiqPrOrig := CrearQuery;
  qRepProp := CrearQuery;
  qRepProp2:= CrearQuery;

  try
    Dm.IniciarTransaccion;
    q.SQL.Text := ' Delete from repprop where usuario = :usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.ExecSQL;

    Dm.ConfirmarTransaccion;

    q.SQL.Text := 'Select Sum(Cast(L.Importe as double precision)) as Total '+
                  '  from CuerpoRecibos L '+
                  ' Where L.Tipo = ''LI'' and L.Letra = :Letra and L.Numero = :Numero';
    q.ParambyName('Letra').AsString := gDetalle.Cells[4, gDetalle.Row];
    q.ParambyName('Numero').AsFloat := ToFloat(AnsiReplaceStr(gDetalle.Cells[5, gDetalle.Row], '-',''));
    q.Open;

    MontoTotal := q.FieldByName('Total').AsFloat;
    Total := FormatFloat('0.00', q.FieldByName('Total').AsFloat);

    letras:=importeenletras(MontoTotal);
    Total := '$'+FormatFloat('0.00', MontoTotal);

    Fecha := gDetalle.Cells[0, gDetalle.Row];
    Fecha := transformarfecha(Fecha);
    Fecha := 'Córdoba, ' + Fecha;

    Total := '$'+FormatFloat('0.00', q.FieldByName('Total').AsFloat);


    q.SQL.Text := 'Select L.*, I.Ubicacion '+
                  '  from CuerpoRecibos L '+
                  ' Inner Join Inmuebles I on I.Codinq = L.Codinq '+
                  ' Where L.Tipo = ''LI'' and L.Letra = :Letra and L.Numero = :Numero'+
                  ' Order by Inquilino, coditem, Linea ';
    q.ParambyName('Letra').AsString := gDetalle.Cells[4, gDetalle.Row];
    q.ParambyName('Numero').AsFloat := ToFloat(AnsiReplaceStr(gDetalle.Cells[5, gDetalle.Row], '-',''));
    q.Open;

    dspLiqPrOrig.DataSet := q;
    LiqPrOrig.Data := dspLiqPrOrig.Data;

    LiqPrOrig.Close;
    LiqPrOrig.Open;

    Dm.IniciarTransaccion;
    q.SQL.Text := ' ALTER SEQUENCE GEN_repprop RESTART WITH 0';
    q.ExecSQL;
    Dm.ConfirmarTransaccion;


    nom := '';

    codi := '';
    while not LiqPrOrig.eof do
    begin
      if LiqPrOrig.FieldbyName('Codinq').AsString <> Trim(Codi) then
      begin
        insertarrepprop('','',Fecha,'','','','','', Total, '', LiqPrOrig.FieldbyName('Inquilino').AsString, LiqPrOrig.FieldbyName('Propietario').AsString);
        insertarrepprop(LiqPrOrig.FieldbyName('Codinq').AsString,
          LiqPrOrig.FieldbyName('Inquilino').AsString,
          LiqPrOrig.FieldbyName('Fecha').AsString,
          'INQUILINO: ' + LiqPrOrig.FieldbyName('Inquilino').AsString + '  (' + LiqPrOrig.FieldbyName('Codinq').AsString+')',
          LiqPrOrig.FieldbyName('Iva').AsString,
          '','','', Total, Letras,
          nom+'         ('+codi+')', LiqPrOrig.FieldbyName('Propietario').AsString);
        insertarrepprop(LiqPrOrig.FieldbyName('Codinq').AsString,
          LiqPrOrig.FieldbyName('Inquilino').AsString,
          LiqPrOrig.FieldbyName('Fecha').AsString,
          LiqPrOrig.FieldbyName('Ubicacion').AsString,
          LiqPrOrig.FieldbyName('Iva').AsString,
          '','','', Total, Letras,
          nom+'         ('+codi+')', LiqPrOrig.FieldbyName('Propietario').AsString);

        ci := LiqPrOrig.FieldbyName('Item').AsString;
        se := LiqPrOrig.FieldbyName('Periodo').AsString;
        si := LiqPrOrig.FieldbyName('Importe').AsString;
        if si= '0.00' then si := '';

        insertarrepprop(LiqPrOrig.FieldbyName('Codinq').AsString,
          LiqPrOrig.FieldbyName('Inquilino').AsString,
          LiqPrOrig.FieldbyName('Fecha').AsString,
          ci,
          LiqPrOrig.FieldbyName('Iva').AsString,
          ci,se,si, Total, Letras,
          ci, LiqPrOrig.FieldbyName('Propietario').AsString);
      end
      else
      begin
        if (i=1) and (nom='') then
        begin
          ci := LiqPrOrig.FieldbyName('Item').AsString;
          se := LiqPrOrig.FieldbyName('Periodo').AsString;
          si := LiqPrOrig.FieldbyName('Importe').AsString;
          if si = '0.00' then
            si := '';

          insertarrepprop(LiqPrOrig.FieldbyName('Codinq').AsString,
            LiqPrOrig.FieldbyName('Inquilino').AsString,
            LiqPrOrig.FieldbyName('Fecha').AsString,
            ci,
            LiqPrOrig.FieldbyName('Iva').AsString,
            ci,se,si, Total, Letras,
            ci, LiqPrOrig.FieldbyName('Propietario').AsString);
        end;

        ci := LiqPrOrig.FieldbyName('Item').AsString;
        se := LiqPrOrig.FieldbyName('Periodo').AsString;
        si := LiqPrOrig.FieldbyName('Importe').AsString;
        if si = '0.00' then
          si := '';

        insertarrepprop(LiqPrOrig.FieldbyName('Codinq').AsString,
          LiqPrOrig.FieldbyName('Inquilino').AsString,
          LiqPrOrig.FieldbyName('Fecha').AsString,
          ci,
          LiqPrOrig.FieldbyName('Iva').AsString,
          ci,se,si, Total, Letras,
          ci, LiqPrOrig.FieldbyName('Propietario').AsString);
      end;
      nom := LiqPrOrig.FieldbyName('Codinq').AsString;
      codi := LiqPrOrig.FieldbyName('Codinq').AsString;
      LiqPrOrig.Next;
    end;

    Dm.IniciarTransaccion;
    q.SQL.Text := ' Delete from repprop2 where usuario = :usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

    qRepProp.SQL.Text := 'Select * from repprop where usuario = :usuario';
    qRepProp.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    qRepProp.Open;

    suma := '0.00';
    Dm.IniciarTransaccion;
    q.SQL.Text := ' ALTER SEQUENCE GEN_repprop RESTART WITH 0';
    q.ExecSQL;
    Dm.ConfirmarTransaccion;

//    insertarrepprop2('',
//        '',
//        '',
//        '',
//        '',
//        '',
//        '',
//        '',
//        '',
//        '', '', '');

    ant:='';
    boSubtotal := False;

    while not qRepProp.Eof do
    begin
      act:=qRepProp.Fields[0].AsString;
      if ((ant<>act) and (ant<>'')) then
      begin
        insertarrepprop2('',
            '',
            '',
            'Subtotal:',
            '',
            '',
            '',
            '',
            '',
            '','','');

        insertarrepprop2('',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '','', '');
        suma:='0.00';
        boSubtotal := True;
      end
      else
      begin
        insertarrepprop2(qRepProp.Fields[0].AsString,
          qRepProp.Fields[1].AsString,
          qRepProp.Fields[2].AsString,
          qRepProp.Fields[3].AsString,
          qRepProp.Fields[4].AsString,
          qRepProp.Fields[5].AsString,
          qRepProp.Fields[6].AsString,
          qRepProp.Fields[7].AsString,
          qRepProp.Fields[8].AsString,
          qRepProp.Fields[9].AsString,
          qRepProp.Fields[10].AsString,
          qRepProp.FieldbyName('Propietario').AsString);
          boSubtotal := False;
      end;
      ant:=qRepProp.Fields[0].AsString;
      qRepProp.Next;
    end;

    if (not boSubtotal) then
    begin
      insertarrepprop2('',
          '',
          '',
          'Subtotal:',
          '',
          '',
          '',
          '',
          '',
          '','', '');

      insertarrepprop2('',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '','', '');
      suma:='0.00';
    end;

    qRepProp2.sql.text := 'Select * from repprop2 where usuario = :usuario';
    qRepProp2.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    qRepProp2.open;

    num1:=qRepProp2.Fields[7].AsString;

    suma:='0.00';

    while not qRepProp2.eof do
    begin
      num1:=qRepProp2.Fields[7].AsString;
      if Trim(num1)='' then
      begin
        gil:=qRepProp2.Fields[3].AsString;
        Registro:=qRepProp2.Fields[11].AsInteger;
        Delete(gil,9,100);
        if Trim(gil)='Subtotal' then
        begin
          DM.IniciarTransaccion;
          q.SQL.Text := 'UPDATE REPPROP2 SET IMPORTE=:iMPORTE WHERE  REGISTRO=:REGISTRO and usuario = :usuario';
          Q.ParamByName('iMPORTE').aSString := Suma;
          Q.ParamByName('registro').aSInteger := Registro;
          q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
          q.execsql;
          suma:='0.00';
          DM.ConfirmarTransaccion;
        end;
      end
      else
      begin
        num1:=conversion(num1);
        suma:=conversion(suma);
        suma:=sumar(suma,num1);
        if suma='0' then suma:='000';
          suma:=agregarpunto2(suma);
      end;
      qRepProp2.next;
    end;

//    qLiqPro.Sql.text := 'Select * from repprop2 where usuario = :usuario ORDER BY Codinq, Orden, PrioridadFecha, Direccion Asc';
    qLiqPro.Sql.text := 'Select * from repprop2 where usuario = :usuario';
    qLiqPro.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
    qLiqPro.Open;

    q.SQL.text := 'Select * from repprop2 where usuario = :usuario order by registro';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.Open;

    I := 1;

    while not q.eof do
    begin
      gImpresion.Cells[0,I] := q.FieldByName('Direccion').AsString;
      gImpresion.Cells[1,I] := q.FieldByName('Periodo').AsString;
      gImpresion.Cells[2,I] := q.FieldByName('Importe').AsString;
      Inc(I);
      q.Next;
    end;
    if I> 2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;


    q.SQL.Text := 'Select * from repprop2 where usuario = :usuario';
    q.ParamByName('USUARIO').Asstring := fPrincipal.FUsuario;
    q.Open;

    I := 1;
    gPendiente.Vaciar;
    while not q.Eof do
    begin
      gPendiente.Cells[0, I] := q.FieldByName('Codinq').AsString;
      gPendiente.Cells[1, I] := q.FieldByName('Inquilino').AsString;
      gPendiente.Cells[2, I] := q.FieldByName('Fecha').AsString;
      gPendiente.Cells[3, I] := q.FieldByName('Direccion').AsString;
      gPendiente.Cells[4, I] := q.FieldByName('IVa').AsString;
      gPendiente.Cells[5, I] := q.FieldByName('Item').AsString;
      gPendiente.Cells[6, I] := q.FieldByName('Periodo').AsString;
      gPendiente.Cells[7, I] := q.FieldByName('Importe').AsString;
      gPendiente.Cells[8, I] := q.FieldByName('Total').AsString;
      gPendiente.Cells[9, I] := q.FieldByName('Letras').AsString;
      Inc(I);
      q.Next;
    end;
    if I>2 then
      gPendiente.RowCount := I
    else
      gPendiente.RowCount := 2;

    q.SQL.text := 'Select MailPropietario, PlantillaPropietario from Inmuebles Where Propietario = :Propietario ';
    q.ParamByName('Propietario').AsString := gDetalle.Cells[8, gDetalle.Row];
    q.Open;


    objMail := TMail.Create;

    objMail.Mes := DevuelveMes(MonthOf(StrToDate(gDetalle.Cells[0, gDetalle.Row])));
    objMail.Anio := YearOf(StrToDate(gDetalle.Cells[0, gDetalle.Row]));
    objMail.Titulo := 'Liquidación para propietarios';
    objMail.Asunto := 'Liquidación para propietarios';
    objMail.DireccionMail := q.FieldbyName('MailPropietario').AsString;
    objMail.idPlantilla := q.FieldbyName('PlantillaPropietario').AsInteger;

    ImprimirReporte(Reporte, objMail, plReporte, gPendiente, '0', False, sMail);
    ImprimirReporte(ReporteDuplicado, objMail, plreporte,gPendiente, '0', False, sMail);
  finally
    FreeAndNil(q);
    FreeAndNil(qLiqPrOrig);
    FreeAndNil(qRepProp);
    FreeAndNil(qRepProp2);
  end;
end;

procedure TfLiquidacionesHistoricas.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfLiquidacionesHistoricas.btnNuevoClick(Sender: TObject);
begin
  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar('',toNuevo);
end;

procedure TfLiquidacionesHistoricas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfLiquidacionesHistoricas.cbTipoClick(Sender: TObject);
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

procedure TfLiquidacionesHistoricas.TodosPropietariosClick(Sender: TObject);
begin
  if todosPropietarios.Checked then
    edPropietario.Text:='';

  if Trim(edPropietario.Text) = ''  then
    todosPropietarios.Checked := True;
end;

procedure TfLiquidacionesHistoricas.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfLiquidacionesHistoricas.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfLiquidacionesHistoricas.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfLiquidacionesHistoricas.Edit6Change(Sender: TObject);
begin
  edit8.Text:=edit6.Text;

  if edit6.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfLiquidacionesHistoricas.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TfLiquidacionesHistoricas.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfLiquidacionesHistoricas.Edit8KeyPress(Sender: TObject; var Key: Char);
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

procedure TfLiquidacionesHistoricas.edPropietarioChange(Sender: TObject);
begin
  todosPropietarios.Checked:=edPropietario.Text = '';
end;

procedure TfLiquidacionesHistoricas.EliminarRecibo1Click(Sender: TObject);
begin
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;

  if MostrarDialogoSiNo('¿Esta seguro de eliminar el recibo?') then
  begin
    DM.IniciarTransaccion;
    try
      EliminarRecibo(gDetalle.Cells[1, gDetalle.Row],gDetalle.Cells[3, gDetalle.Row],gDetalle.Cells[4, gDetalle.Row], gDetalle.Cells[5, gDetalle.Row]);
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos eliminados correctamente.');

      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  end;
end;

procedure TfLiquidacionesHistoricas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF aSSIGNED(LiqprOrig) THEN
    FreeAndNil(LiqprOrig);
  IF aSSIGNED(dspLiqprOrig) THEN
    FreeAndNil(dspLiqprOrig);
  action := caFree;
  if Assigned(fLiquidacionesConAnomalias) then
    fLiquidacionesConAnomalias := nil;
  if Assigned(fLiquidacionesHistoricas) then
    fLiquidacionesHistoricas := nil;
  if Assigned(fLiquidacionesNoRetiradas) then
    fLiquidacionesNoRetiradas := nil;
end;

procedure TfLiquidacionesHistoricas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  LiqprOrig := TClientDataSet.Create(nil);
  dspLiqprOrig := TDatasetProvider.Create(nil);

end;

procedure TfLiquidacionesHistoricas.gDetalleClick(Sender: TObject);
var
  q: tFXQuery;
  I: Integer;
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
  finally
    FreeAndNil(q);
  end;

end;

procedure TfLiquidacionesHistoricas.gDetalleDblClick(Sender: TObject);
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

procedure TfLiquidacionesHistoricas.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

procedure TfLiquidacionesHistoricas.LiquidacinControlada1Click(Sender: TObject);
var
  q: TFXQuery;
begin
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;
  q := CrearQuery;

  DM.IniciarTransaccion;
  try
    try
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

      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfLiquidacionesHistoricas.Marcarcomopendientederetirar1Click(
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

procedure TfLiquidacionesHistoricas.Marcarcomoretirada1Click(Sender: TObject);
var
  q: TFXQuery;
begin
  if gDetalle.Cells[0, gDetalle.Row] = '' then
    Exit;
  q := CrearQuery;
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
      q.ParamByName('Pendiente').AsInteger := 0;
      q.ExecSql;
      gDetalle.ColorRow[gDetalle.Row] := gDetalle.Color;

      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    Except
      Dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TfLiquidacionesHistoricas.plTituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName='Total' then
    Result := FormatFloat('0.00', Montototal);
end;

end.
