unit frmABMCtaCteInquilinos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, frmMovimientos, fxQuery, cxGraphics,
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
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox;

type
  TfAbMCtaCteInquilinos = class(TForm)
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    gDetalle: TStringAlignGrid;
    Panel1: TPanel;
    Label9: TLabel;
    Edit1: TEdit;
    N1: TMenuItem;
    CompensarAutomaticamente1: TMenuItem;
    CompensarMovimientoManual1: TMenuItem;
    cxGroupBox1: TcxGroupBox;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    Actualizar: TAdvGlowButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
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
    Edit2: TEdit;
    Label11: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    btnEliminar: TAdvGlowButton;
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
    procedure CompensarAutomaticamente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    boSoloImpagos:Boolean;
    { Public declarations }
  end;

var
  fAbMCtaCteInquilinos: TfAbMCtaCteInquilinos;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMMovimientos,
  frmMovimientosCtacte;

{$R *.dfm}

procedure TfAbMCtaCteInquilinos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  qMovimientos: TFXQuery;
  I: Integer;
  TotalAlquileres, TotalImpuestos, TotalOtros, TotalHaber, Saldo: Double;
  TotalDebeGeneral,  TotalHaberGeneral: Double;

begin
  TotalAlquileres := 0;
  TotalImpuestos := 0;
  TotalOtros := 0;

  //Label8.Caption := 'Total al ' + FormatDateTime('dd/mm/yyyy', Date)+':';
  if (TodosCodigos.Checked) and (todosFPago.Checked) and (TodosDescripcion.Checked) then
  begin
    if not MostrarDialogoSiNo('Esta operacion puede demorar varios minutos. ¿Desea Continuar?') then
      Exit;
  end;

  q := CrearQuery;
  qMovimientos := CrearQuery;
//  FORMATSETTINGS.DecimalSeparator := ',';
//  FORMATSETTINGS.tHOUSANDSeparator := '.';
  try
    if boSoloImpagos then
    begin
      q.SQL.Text :=
         ' Select A.Codinq, ' +
        '        A.Inquilino, ' +
        '        A.Propietario, ' +
        '        I.Fecha, ' +
        '        I.Coditem, ' +
        '        I.Item, ' +
        '        I.Periodo, ' +
        '        I.Importe, '+
        '        I.Registro, ' +
        '        I.Usuario ' +
          '    FROM (Select I.Fecha, I.Codinq, I.Coditem, I.Item, I.Periodo, I.Importe, I.Registro, I.Usuario '+
          '          From ITEMAUTOM I '+
          '          where  I.codinq >= :Desde and I.Codinq <= :Hasta '+
          '            AND I.IMPORTE <> '''' '+
          '            and cast(replace(I.IMPORTE, '','',''.'') as double precision) <> 0) I '+
          '   INNER JOIN (select CODIGO, INQPROP '+
          '             from CONCEPTOS '+
          '             WHERE INQPROP <> 2) C on C.CODIGO = I.CODITEM '+
          '   inner join(select A.CODINQ, A.FECHAINICIO, A.INQUILINO, A.Propietario '+
          '             from INMUEBLES A '+
          '             order by A.CODINQ) A on A.CODINQ = I.CODINQ '+
          '   where I.codinq >= :Desde and I.Codinq <= :Hasta '+
          '     and cast(substring(I.fecha FROM 5 FOR 2)||''/''||substring(I.fecha FROM 7 FOR 2)||''/''||substring(I.fecha FROM 1 FOR 4) AS TIMESTAMP) >= A.FECHAINICIO '+
  //        '     and I.CODITEM in (''01'', ''08'', ''20'', ''30'') '+
          '     AND C.inqprop <> 2 '+
          '     AND NOT EXISTS(SELECT CU.CODITEM '+
          '                      FROM CUERPORECIBOS CU '+
          '                     INNER JOIN CABEZARECIBOS CA ON CA.CODINQ = CU.CODINQ '+
          '                     WHERE CA.CODINQ = i.CODINQ '+
          '                       and CU.CODINQ >= :DESDE '+
          '                       and CU.CODINQ <= :HASTA '+
          '                       AND CU.CODITEM = I.coditem '+
          '                       AND CU.TIPO = ''RE'' '+
          '                       and cu.item = i.item '+
          '                       and cu.periodo = i.periodo) ';


//         '   from (Select I.Fecha, I.Codinq, I.Coditem, I.Item, I.Periodo, I.Importe, I.Registro, I.Usuario '+
//         '          From ITEMAUTOM I) I '+
//         '  Inner Join (Select A.Codinq, A.FechaInicio, a.iNQUILINO, A.Propietario '+
//         '                from Inmuebles A '+
//         '               Order by A.Codinq) A on A.Codinq = I.Codinq '+
//         '  Inner Join (Select Codigo, InqProp from Conceptos) C on C.Codigo = i.cODITEM '+
//         '  where cast(A.FechaInicio as varchar(10)) <= I.fecha'+
//         '    and I.importe <> '''' '+
//         '    and cast(I.importe as double precision) <> 0 '+
//         '    and c.inqprop <> 2 '+
//         '    and i.Codinq >=:desde and i.Codinq <=:Hasta '+
//   //      '    and I.Coditem not in (''01'',''20'',''30'',''08'', ''09'',''04'',''05'',''02'')'+
//         '    and not exists( '+
//         ' Select ca.Codinq '+
//         '   from CuerpoRecibos CR '+
//         '  Inner Join CabezaRecibos CA on CA.Codinq = CR.Codinq and CA.Tipo = CR.Tipo and CA.Letra = CR.Letra and CA.Numero = CR.Numero'+
//         '  Inner Join Inmuebles M on M.COdinq = A.COdinq   and A.Inquilino = Cr.Inquilino'+
//         '  where CR.importe <> '''' '+
//         '    and CR.Tipo = ''RE'' '+
//         '    and Cr.Codinq >=:desde and Cr.Codinq <=:Hasta '+
//  //       '    and CR.Coditem not in (''01'',''20'',''30'',''08'', ''09'',''04'',''05'',''02'')'+
//         '    and I.Item = CR.Item '+
//         '    and I.Periodo = CR.Periodo '+
//         '    and I.Importe = CR.Importe '+
//         '    and cast(I.importe as double precision) <> 0 '+
//         ' ) ';

//        ' Select I.Codinq, ' +
//        '        I.Inquilino, ' +
//        '        I.Propietario, ' +
//        '        C.Fecha, ' +
//        '        C.Coditem, ' +
//        '        C.Item, ' +
//        '        C.Periodo, ' +
//        '        C.Debe, '+
//        '        C.Haber, '+
//        '        C.Registro, ' +
//        '        C.IDMovimiento, ' +
//        '        C.Usuario ' +
//        '   From CtaCteInquilino C '+
//        '  Inner Join Inmuebles I on I.Codinq = C.Codinq '+
//        '  Where ((c.Debe <> 0 and c.Haber = 0) or (c.Debe = 0 and c.Haber <> 0)) '+
//        '        and Not exists (Select C1.ITEM ' +
//        '                      FROM CtaCteInquilino C1 '+
//        '                     Where C1.Codinq = c.Codinq '+
//        '                       and C1.Coditem = C.Coditem '+
//        '                       and C1.Item = C.Item '+
//        '                       AND C1.Periodo = C.Periodo '+
//        '                       and C1.haber = C.DEBE) ';
////        '                       AND (((C1.Periodo = C.Periodo) and (C1.idMovimiento=c.idMovimiento)) or '+
////        '                            ((C1.Periodo = C.Periodo) and (C1.idMovimiento<>c.idMovimiento)) or '+
////        '                            ((C1.Periodo = C.Periodo) and (C1.idMovimiento=-1))or '+
////        '                            ((C1.IDMovimiento = C.IDMovimiento) and (C1.Haber = C.Debe))) '+
////
//////        '                       and (((C1.Periodo = c.Periodo) and (C1.idMovimiento = -1)) or (c1.idmovimiento = c.idmovimiento) OR (C1.PERIODO = '''')) '+
////        '                       and C1.Haber <> 0) ';
//
//      if not TodosCodigos.Checked then
//      begin
//        q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
//      end;

      if not TodosItems.Checked then
      begin
        q.SQL.Add(' and C.Coditem >=:desdeI and C.Coditem <=:HastaI ');
        q.ParamByName('DesdeI').AsString := edtItemDesde.Text;
        q.ParamByName('HastaI').AsString := edItemHasta.Text;
      end;
//
//      if not TodosDescripcion.Checked then
//      begin
//        q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
//        q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
//      end;
//
      if not TodosFPago.Checked then
      begin
        q.SQL.Add(' and i.Fecha >= :FechaDesde and i.Fecha <=:FechaHasta ');
        q.ParamByName('FechaDesde').AsString := FormatDatetime('YYYYMMDD',sTRtOdATE(edtFecha.Text));
        q.ParamByName('FechahASTA').AsString := FormatDatetime('YYYYMMDD',sTRtOdATE(edFechahASTA.Text));
      end;

      q.SQL.Add(' order by I.CodiTEM, i.fECHA ');
//      q.SQL.Add(' Union ');
//      q.SQL.Add(
//        ' Select I.Codinq, ' +
//        '        I.Inquilino, ' +
//        '        I.Propietario, ' +
//        '        C.Fecha, ' +
//        '        C.Coditem, ' +
//        '        C.Item, ' +
//        '        C.Periodo, ' +
//        '        C.Debe, '+
//        '        C.Haber, '+
//        '        C.Registro, ' +
//        '        C.IDMovimiento, ' +
//        '        C.Usuario ' +
//        '   From CtaCteInquilino C '+
//        '  Inner Join Inmuebles I on I.Codinq = C.Codinq '+
//        '  Where ((c.Haber <> 0 and c.Debe = 0) or (c.Debe <> 0 and c.Haber = 0)) '+
//        '        and Not exists (Select C1.ITEM ' +
//        '                      FROM CtaCteInquilino C1 '+
//        '                     Where C1.Codinq = c.Codinq '+
//        '                       and C1.Coditem = C.Coditem '+
//        '                       and C1.Item = C.Item '+
//        '                       AND C1.HABER = C.DEBE '+
//        '                       AND C1.IDMOVIMIENTO = C.IDMOVIMIENTO) ');
//{        '                       AND (((C1.Periodo = C.Periodo) and (C1.idMovimiento=c.idMovimiento)) or '+
//        '                            ((C1.Periodo = C.Periodo) and (C1.idMovimiento<>c.idMovimiento)) or '+
//        '                            ((C1.Periodo = C.Periodo) and (C1.idMovimiento=-1))or '+
//        '                            ((C1.IDMovimiento = C.IDMovimiento) and (C.Haber = C1.Debe))) '+
////        '                       and (((C1.Periodo = c.Periodo) and (C1.idMovimiento = -1)) or (c1.idmovimiento = c.idmovimiento) OR (C1.PERIODO = '''')) '+
//        '                       and C1.Debe <> 0) '); }
//
//      if not TodosCodigos.Checked then
//      begin
//        q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
//        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
//        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
//      end;
//
//      if not TodosItems.Checked then
//      begin
//        q.SQL.Add(' and C.Coditem >=:desdeI and C.Coditem <=:HastaI ');
//        q.ParamByName('DesdeI').AsString := edtItemDesde.Text;
//        q.ParamByName('HastaI').AsString := edItemHasta.Text;
//      end;
//
//      if not TodosDescripcion.Checked then
//      begin
//        q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
//        q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
//      end;
//
//      if not TodosFPago.Checked then
//      begin
//        q.SQL.Add(' and C.Fecha >= :FechaDesde and C.Fecha <=:FechaHasta ');
//        q.ParamByName('FechaDesde').AsDateTime := StrToDatetime(edtFecha.Text);
//        q.ParamByName('FechaHasta').AsDateTime := StrToDatetime(edFechaHasta.Text);
//      end;
//
//      q.SQL.Add(' order by 1,4 ');
//
//      q.Open;
//    end
//    else
//    begin
//      q.SQL.Text :=
//        ' Select I.Codinq, ' +
//        '        I.Inquilino, ' +
//        '        I.Propietario, ' +
//        '        C.Fecha, ' +
//        '        C.Coditem, ' +
//        '        C.Item, ' +
//        '        C.Periodo, ' +
//        '        C.Debe, '+
//        '        C.Haber, '+
//        '        C.Registro, ' +
//        '        C.IDMovimiento, ' +
//        '        C.Usuario ' +
//        '   From CtaCteInquilino C '+
//        '  Inner Join Inmuebles I on I.Codinq = C.Codinq ';
//
//
//      if not chMostrarEnCero.Checked then
//        q.SQL.Add('  Where (((C.Debe = 0) and (C.Haber <> 0)) or ((C.Debe <> 0) and (C.Haber = 0))) ')
//      else
//        q.SQL.Add('  Where 1=1 ');
//
//      if not TodosCodigos.Checked then
//      begin
//        q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
//        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
//        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
//      end;
//
//      if not TodosItems.Checked then
//      begin
//        q.SQL.Add(' and C.Coditem >=:desdeI and C.Coditem <=:HastaI ');
//        q.ParamByName('DesdeI').AsString := edtItemDesde.Text;
//        q.ParamByName('HastaI').AsString := edItemHasta.Text;
//      end;
//
//      if not TodosDescripcion.Checked then
//      begin
//        q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
//        q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
//      end;
//
//      if not TodosFPago.Checked then
//      begin
//        q.SQL.Add(' and C.Fecha >= :FechaDesde and C.Fecha <=:FechaHasta ');
//        q.ParamByName('FechaDesde').AsDateTime := StrToDatetime(edtFecha.Text);
//        q.ParamByName('FechaHasta').AsDateTime := StrToDatetime(edFechaHasta.Text);
//      end;
//
//      q.SQL.Add(' order by I.Codinq, 4 ');
//
      q.Open;
    end;

    gDetalle.Vaciar;
    I := 1;
    Saldo := 0;
    while not q.Eof do
    begin
      if q.FieldByName('Coditem').AsInteger in [1,8,20,30] then
        TotalAlquileres := TotalAlquileres + ToFloat(q.FieldByName('Importe').AsString);
      if q.FieldByName('Coditem').AsInteger in [2,4,5,9] then
        TotalImpuestos := TotalImpuestos + ToFloat(q.FieldByName('Importe').AsString);
      if not (q.FieldByName('Coditem').AsInteger in [1,8,20,30,2,4,5,9]) then
        TotalOtros := TotalOtros + ToFloat(q.FieldByName('Importe').AsString);

      gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString;
//      gDetalle.Cells[2,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      gDetalle.Cells[2,I] := Copy(q.FieldByName('Fecha').AsString,7,2)+'/'+ Copy(q.FieldByName('Fecha').AsString,5,2) +'/'+Copy(q.FieldByName('Fecha').AsString,1,4);
      ;
      gDetalle.Cells[3,I] := q.FieldByName('Coditem').AsString;
      gDetalle.Cells[4,I] := q.FieldByName('Item').AsString + ' ' + q.FieldByName('Periodo').AsString;
      gDetalle.Cells[5,I] := FormatFloat('#,##0.00', q.FieldByName('Importe').AsFloat);
//      gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldByName('Haber').AsFloat);
      gDetalle.Cells[7,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[8,I] := q.FieldByName('Coditem').AsString;
      gDetalle.Cells[9,I] := q.FieldByName('Registro').AsString;
      gDetalle.Cells[10,I] := q.FieldByName('Usuario').AsString;
//      gDetalle.Cells[11,I] := q.FieldByName('IDMovimiento').AsString;
      gDetalle.Cells[12,I] := q.FieldByName('Propietario').AsString;

//      if q.FieldByName('Fecha').AsDatetime <= Date  then
//      begin
//        TotalDebe := TotalDebe + q.FieldByName('Debe').AsFloat;
//        TotalHaber := TotalHaber + q.FieldByName('Haber').AsFloat;
//      end;
//
//      TotalDebeGeneral := TotalDebeGeneral + q.FieldByName('Debe').AsFloat;
//      TotalHaberGeneral := TotalHaberGeneral + q.FieldByName('Haber').AsFloat;
//      Saldo := Saldo + q.FieldByName('Debe').AsFloat - q.FieldByName('Haber').AsFloat;
      gDetalle.Cells[13,I] := FormatFloat('#,##0.00', Saldo);

//      if q.FieldByName('IDMovimiento').AsInteger = -1 then
//        gDetalle.ColorRow[I] := clYellow;
      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
//    edtTotal.Text := FormatFloat('0.00', TotalDebe - TotalHaber);
    Edit2.Text := FormatFloat('#,##0.00', TotalAlquileres);
    Edit3.Text := FormatFloat('#,##0.00', TotalImpuestos);
    Edit4.Text := FormatFloat('#,##0.00', TotalOtros);
    edit1.Text := FormatFloat('#,##0.00', TotalAlquileres + TotalImpuestos + TotalOtros);
  finally
    FreeAndNil(q);
    FreeAndNil(qMovimientos);
//    FORMATSETTINGS.DecimalSeparator := '.';
//    FORMATSETTINGS.tHOUSANDSeparator := ',';
  end;
end;

procedure TfAbMCtaCteInquilinos.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
  begin
    edtFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edtFecha.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfAbMCtaCteInquilinos.TodosItemsClick(Sender: TObject);
begin
  if todosItems.Checked then
  begin
    edtItemDesde.Text:='';
    edItemHasta.Text:='';
  end;

  if Trim(edtItemDesde.Text) = ''  then
    todosItems.Checked := True;
end;

procedure TfAbMCtaCteInquilinos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbMCtaCteInquilinos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbMCtaCteInquilinos.VerContratoEscalonado1Click(Sender: TObject);
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

procedure TfAbMCtaCteInquilinos.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[9,gDetalle.Row] = '' then
    Exit;

  if FMovimientos = nil then
    Application.CreateForm(TFMovimientos, FMovimientos)
  else
    FMovimientos.Show;
  FMovimientos.Cargar(gDetalle.Cells[9,gDetalle.Row],toEliminar);
end;

procedure TfAbMCtaCteInquilinos.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientosCtaCte = nil then
    Application.CreateForm(TFMovimientosCtaCte, FMovimientosCtaCte)
  else
    FMovimientosCtaCte.Show;
  FMovimientosCtaCte.Cargar(gDetalle.Cells[9,gDetalle.Row],toModificar,gDetalle.Cells[11,gDetalle.Row]);
end;

procedure TfAbMCtaCteInquilinos.btnNuevoClick(Sender: TObject);
begin
  if FMovimientosCtaCte = nil then
    Application.CreateForm(TFMovimientosCtaCte, FMovimientosCtaCte)
  else
    FMovimientosCtaCte.Show;
  FMovimientosCtaCte.Cargar('',toNuevo,'');
end;

procedure TfAbMCtaCteInquilinos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbMCtaCteInquilinos.cbFechaPagoClick(Sender: TObject);
begin
  todosFPago.Checked := False;
end;

procedure TfAbMCtaCteInquilinos.CompensarAutomaticamente1Click(Sender: TObject);
var
  mensaje: string;
  ndMonto: Double;
  boEntra: Boolean;

begin
  Mensaje := 'Se compensara el movimiento automáticamente. Generará un movimiento con las siguientes caracteristicas: ' + #13#10 +
    'Codigo: ' + gDetalle.Cells[0, gDetalle.Row] + #13#10 +
    'Inquilino: ' + gDetalle.Cells[1, gDetalle.Row] + #13#10 +
    'Fecha: ' + gDetalle.Cells[2, gDetalle.Row] + #13#10 +
    'Item: ' + gDetalle.Cells[3, gDetalle.Row] + #13#10 +
    'Descripcion: ' + gDetalle.Cells[4, gDetalle.Row] + #13#10;
  if ToFloat(gDetalle.Cells[5, gDetalle.Row]) <> 0  then
    Mensaje := Mensaje + 'Pagado: ' + gDetalle.Cells[5, gDetalle.Row] + #13#10
  else
    Mensaje := Mensaje + 'Debe: ' + gDetalle.Cells[6, gDetalle.Row] + #13#10;

  if ToFloat(gDetalle.Cells[5, gDetalle.Row]) <> 0 then
  begin
    boEntra := False;
    ndMonto := ToFloat(gDetalle.Cells[5, gDetalle.Row]);
  end
  else
  begin
    boEntra := True;
    ndMonto := ToFloat(gDetalle.Cells[6, gDetalle.Row]);
  end;
end;

procedure TfAbMCtaCteInquilinos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbMCtaCteInquilinos.edDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    edtFecha.SetFocus;

end;

procedure TfAbMCtaCteInquilinos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbMCtaCteInquilinos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edHasta.SetFocus;
end;


procedure TfAbMCtaCteInquilinos.edFechaHastaChange(Sender: TObject);
begin
//  TodosFPago.checked := Trim(edFechaHasta.Text) = '';
end;

procedure TfAbMCtaCteInquilinos.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfAbMCtaCteInquilinos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbMCtaCteInquilinos.edHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edDescripcion.SetFocus;

end;

procedure TfAbMCtaCteInquilinos.edItemHastaChange(Sender: TObject);
begin
  if edItemHasta.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfAbMCtaCteInquilinos.edtFechaChange(Sender: TObject);
begin
  TodosFPago.checked := Trim(edtFecha.Text) = '';
//  edFechahasta.Text:=edtfecha.Text;
end;

procedure TfAbMCtaCteInquilinos.edtFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edFechaHasta.Text := edtfecha.text;
end;

procedure TfAbMCtaCteInquilinos.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfAbMCtaCteInquilinos.edtItemDesdeChange(Sender: TObject);
begin
//  edItemhasta.Text:=edtItemdesde.Text;

  if edtItemdesde.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;

end;

procedure TfAbMCtaCteInquilinos.edtItemDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edItemHasta.Text := edtItemDesde.text;
end;

procedure TfAbMCtaCteInquilinos.edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edItemHasta.SetFocus;

end;

procedure TfAbMCtaCteInquilinos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fAbMCtaCteInquilinos := nil;
end;

procedure TfAbMCtaCteInquilinos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  boSoloImpagos := False;
end;

procedure TfAbMCtaCteInquilinos.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbMCtaCteInquilinos.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
