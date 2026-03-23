unit frmMailPropietarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, frmMovimientos, frmGestionEmail, uGrillaClientDataSet, DB,
  FXQuery;

type
  TfMailAPropietarios = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    Actualizar: TBitBtn;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    Panel2: TPanel;
    btnSalir: TBitBtn;
    btnEliminar: TBitBtn;
    btnModificar: TBitBtn;
    btnNuevo: TBitBtn;
    Label4: TLabel;
    TodosFPago: TCheckBox;
    popOpciones: TPopupMenu;
    edtFecha: TEdit;
    Label6: TLabel;
    edFechaHasta: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    edtItemDesde: TEdit;
    edItemHasta: TEdit;
    TodosItems: TCheckBox;
    gDetalle: TStringAlignGrid;
    Panel1: TPanel;
    Label8: TLabel;
    edtTotal: TEdit;
    chMismoPropietario: TCheckBox;
    GestordeMails1: TMenuItem;
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
    procedure GestordeMails1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GestorDeCorreos( Actividad: TProcesoMails );
    procedure prAdjuntarPDF( sender: tobject );
    procedure prStatusCorreos( sender: TObject );
    procedure status( msg: string );
    { Public declarations }
  end;

var
  fMailAPropietarios: TfMailAPropietarios;

const{antes de columnas}
   _COLCODIGO      = 0;
   _COLINQUILINO   = 1;
   _COLPROPIETARIO = 2;
(*   _COLNROCOMP    = 2;
   _COLCLIENTE    = 3;
   _COLPROVINCIA  = 4;
   _COLNETO       = 5;
   _COLEXENTO     = 6;
   _COLIVA        = 7;
   _COLIVARECARGO = 8;
   _COLTOTAL      = 9;
   _COLCDO        = 10;
   _COLCUIT       = 11;
   _COLCOMISION   = 12;
   _COLCODCLIENTE = 13;*)


implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMMovimientos,
  frmMovimientosCtacte, frmMovimientosCtactePropietario;

{$R *.dfm}

procedure TfMailAPropietarios.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  qMovimientos: TFXQuery;
  I: Integer;
  TotalDebe,  TotalHaber: Double;

begin
  if (TodosCodigos.Checked) and (todosFPago.Checked) and (TodosDescripcion.Checked) then
  begin
    if not MostrarDialogoSiNo('Esta operacion puede demorar varios minutos. ¿Desea Continuar?') then
      Exit;
  end;

  q := CrearQuery;
  qMovimientos := CrearQuery;
  try
    if (chMismoPropietario.Checked) and (not TodosCodigos.Checked) then
    begin
      q.SQL.Text :=
        ' Select Distinct I.Codinq, ' +
        '        I.Inquilino, ' +
        '        I.Propietario ' +
//        '        C.Fecha, ' +
//        '        C.Coditem, ' +
//        '        C.Item, ' +
//        '        C.Periodo, ' +
//        '        C.Debe, '+
//        '        C.Haber, '+
//        '        C.Registro, ' +
//        '        C.Usuario ' +
        '   From CtaCtePropietario C '+
        '  Inner Join Inmuebles I on I.Codinq = C.Codinq '+
        '  Where 1=1 '+
        '    and I.codinq in (select codinq from inmuebles I1 where I.propietario in ( '+
        '        Select propietario from inmuebles I2 where I2.codinq = :codinq))';
      q.ParamByName('Codinq').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
    end
    else
    begin
      q.SQL.Text :=
        ' Select distinct I.Codinq, ' +
        '        I.Inquilino, ' +
        '        I.Propietario ' +
//        '        C.Fecha, ' +
//        '        C.Coditem, ' +
//        '        C.Item, ' +
//        '        C.Periodo, ' +
//        '        C.Debe, '+
//        '        C.Haber, '+
//        '        C.Registro, ' +
//        '        C.Usuario ' +
        '   From CtaCtePropietario C '+
        '  Inner Join Inmuebles I on I.Codinq = C.Codinq '+
        '  Where 1=1 ';

      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
        q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
        q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
      end;
    end;

    if not TodosItems.Checked then
    begin
      q.SQL.Add(' and C.Coditem >=:desdeI and I.Coditem <=:HastaI ');
      q.ParamByName('DesdeI').AsString := edtItemDesde.Text;
      q.ParamByName('HastaI').AsString := edItemHasta.Text;
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    if not TodosFPago.Checked then
    begin
      q.SQL.Add(' and C.Fecha >= :FechaDesde and C.Fecha <=:FechaHasta ');
      q.ParamByName('FechaDesde').AsDateTime := StrToDatetime(edtFecha.Text);
      q.ParamByName('FechaHasta').AsDateTime := StrToDatetime(edFechaHasta.Text);
    end;

    q.SQL.Add(' order by I.Codinq ');

    q.Open;

    gDetalle.Vaciar;
    I := 1;
    TotalDebe := 0;
    TotalHaber := 0;

    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Propietario').AsString;
(*      gDetalle.Cells[2,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      gDetalle.Cells[3,I] := q.FieldByName('Coditem').AsString;
      gDetalle.Cells[4,I] := q.FieldByName('Item').AsString + ' ' + q.FieldByName('Periodo').AsString;
      gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldByName('Debe').AsFloat);
      gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldByName('Haber').AsFloat);
      gDetalle.Cells[7,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[8,I] := q.FieldByName('Coditem').AsString;
      gDetalle.Cells[9,I] := q.FieldByName('Registro').AsString;
      gDetalle.Cells[10,I] := q.FieldByName('Usuario').AsString; *)
//      TotalDebe := TotalDebe + q.FieldByName('Debe').AsFloat;
//      TotalHaber := TotalHaber + q.FieldByName('Haber').AsFloat;

      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
    edtTotal.Text := FormatFloat('0.00', TotalDebe - TotalHaber);
  finally
    FreeAndNil(q);
    FreeAndNil(qMovimientos);
  end;
end;

procedure TfMailAPropietarios.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
  begin
    edtFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edtFecha.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfMailAPropietarios.TodosItemsClick(Sender: TObject);
begin
  if todosItems.Checked then
  begin
    edtItemDesde.Text:='';
    edItemHasta.Text:='';
  end;

  if Trim(edtItemDesde.Text) = ''  then
    todosItems.Checked := True;
end;

procedure TfMailAPropietarios.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfMailAPropietarios.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfMailAPropietarios.VerContratoEscalonado1Click(Sender: TObject);
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

procedure TfMailAPropietarios.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientosCtaCtePropietario = nil then
    Application.CreateForm(TFMovimientosCtaCtePropietario, FMovimientosCtaCtePropietario)
  else
    FMovimientosCtaCtePropietario.Show;
  FMovimientosCtaCtePropietario.Cargar(gDetalle.Cells[9,gDetalle.Row],toEliminar);
end;

procedure TfMailAPropietarios.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientosCtaCtePropietario = nil then
    Application.CreateForm(TFMovimientosCtaCtePropietario, FMovimientosCtaCtePropietario)
  else
    FMovimientosCtaCtePropietario.Show;
  FMovimientosCtaCtePropietario.Cargar(gDetalle.Cells[9,gDetalle.Row],toModificar);
end;

procedure TfMailAPropietarios.btnNuevoClick(Sender: TObject);
begin
  if FMovimientosCtaCtePropietario = nil then
    Application.CreateForm(TFMovimientosCtaCtePropietario, FMovimientosCtaCtePropietario)
  else
    FMovimientosCtaCtePropietario.Show;
  FMovimientosCtaCtePropietario.Cargar('',toNuevo);
end;

procedure TfMailAPropietarios.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfMailAPropietarios.cbFechaPagoClick(Sender: TObject);
begin
  todosFPago.Checked := False;
end;

procedure TfMailAPropietarios.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfMailAPropietarios.edDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    edtFecha.SetFocus;

end;

procedure TfMailAPropietarios.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfMailAPropietarios.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edHasta.SetFocus;
end;


procedure TfMailAPropietarios.edFechaHastaChange(Sender: TObject);
begin
//  TodosFPago.checked := Trim(edFechaHasta.Text) = '';
end;

procedure TfMailAPropietarios.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMailAPropietarios.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfMailAPropietarios.edHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edDescripcion.SetFocus;

end;

procedure TfMailAPropietarios.edItemHastaChange(Sender: TObject);
begin
  if edItemHasta.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfMailAPropietarios.edtFechaChange(Sender: TObject);
begin
  TodosFPago.checked := Trim(edtFecha.Text) = '';
//  edFechahasta.Text:=edtfecha.Text;
end;

procedure TfMailAPropietarios.edtFechaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edFechaHasta.Text := edtfecha.text;
end;

procedure TfMailAPropietarios.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMailAPropietarios.edtItemDesdeChange(Sender: TObject);
begin
//  edItemhasta.Text:=edtItemdesde.Text;

  if edtItemdesde.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;

end;

procedure TfMailAPropietarios.edtItemDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edItemHasta.Text := edtItemDesde.text;
end;

procedure TfMailAPropietarios.edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edItemHasta.SetFocus;

end;

procedure TfMailAPropietarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fMailAPropietarios := nil;
end;

procedure TfMailAPropietarios.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfMailAPropietarios.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfMailAPropietarios.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

procedure TfMailAPropietarios.GestordeMails1Click(Sender: TObject);
begin
  GestorDeCorreos( gcInterface );
end;

procedure TfMailAPropietarios.GestorDeCorreos( Actividad: TProcesoMails );
const
 aTipos: array[_COLCODIGO.._COLPROPIETARIO] of TFieldType =
              (ftString, //cODINQ
               ftString, //iNQUILINO
               ftString); //pROPIETARIO
(*               ftDate,   //fecha
               ftString, //tipo
               ftString, //nrocomp
               ftString, //cliente
               ftString, //provincia
               ftFloat,  //neto
               ftFloat,  //exento
               ftFloat,  //iva
               ftFloat,  //iva recargo
               ftFloat,  //total
               ftString, //cdo
               ftString, //cuit
               ftFloat,  //Comision
               ftString);  //codigo cliente para email *)

var
 r: integer;
 arTipos: TCampos;
 I: byte;
begin
 Application.CreateForm(TfGestionEmail,fGestionEmail);
 With fGestionEmail do
 begin
   try
     Proceso := modLiquidacionPropietarios;
     BuscaMailsDesde := bmdPropietarios;

     SetLength( arTipos, length(aTipos) );
     for I := Low(aTipos) to High(aTipos) do
         arTipos[i] := aTipos[i];

     CDS := TGrillaClientDataSet.fxCrearClientDataSet(gDetalle, arTipos);
     OnAdjuntarArchivo := prAdjuntarPDF;
     if Actividad = gcInterface then
        ShowModal
     else
     begin
           Status('Espere: generando comprobantes y enviando e-mails...');
           OnStatus := prStatusCorreos;
           r := fxEjecutarTareaDefectiva;
           Status('');
           if r > 0 then
             MostrarDialogoAceptar(Format('Proceso terminado: se enviaron %d correos.', [r]));
     end;
   finally
     if Assigned(cds) then
       cds.free;
     Free;
     Status('');
   end;
 end;
end;

procedure TfMailAPropietarios.prAdjuntarPDF( sender: tobject );
begin
end;

procedure TfMailAPropietarios.prStatusCorreos( sender: TObject );
begin
   Status(Format( 'Espere: generando comprobantes y enviando e-mails (%d/%d)',
          [TfGestionEmail(sender).cds.recno, TfGestionEmail(sender).cds.recordcount] ) );
end;

procedure TfMailAPropietarios.status( msg: string );
begin
end;

end.
