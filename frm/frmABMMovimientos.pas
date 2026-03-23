unit frmABMMovimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, frmMovimientos, FXQuery, Data.db, cxGraphics,
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
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox, frmDatos;

type
  TfAbmMovimientos = class(TForm)
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    gDetalle: TStringAlignGrid;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
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
    Actualizar: TAdvGlowButton;
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
    procedure edFechaHastaChange(Sender: TObject);
    procedure edtItemDesdeChange(Sender: TObject);
    procedure edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edItemHastaChange(Sender: TObject);
    procedure TodosItemsClick(Sender: TObject);
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaKeyPress(Sender: TObject; var Key: Char);
    procedure edDescripcionKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    boItemsRepetidos: Boolean;
  end;

var
  fAbmMovimientos: TfAbmMovimientos;
  fAbmMovimientosRepetidos: TfAbmMovimientos;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmCambioAlquiler;

{$R *.dfm}

procedure TfAbmMovimientos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  qMovimientos: TFXQuery;
  I: Integer;
begin
  q := dm.fxCrearQuery(opOptimizaAlPalo);
  qMovimientos := CrearQuery;
  gDetalle.BeginUpdate;
  try
    q.SQL.Text := 'Select * from inmuebles i where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and I.Codinq >=:desde and I.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by I.Codinq ');

    q.Open;

    if boItemsRepetidos then
      qMovimientos.SQL.Text := 'Select Coditem, Item, Periodo, count(*) as Veces from ItemAutom where codinq = :Codinq '
    else
      qMovimientos.SQL.Text := 'Select * from ItemAutom where codinq = :Codinq ';

    if not TodosFPago.Checked then
    begin
      qMovimientos.SQL.Add(' and Fecha = :Fecha ');
      qMovimientos.ParamByName('Fecha').AsString := FechaAlReves(edtFecha.Text);
    end;

    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      if boItemsRepetidos then
        qMovimientos.SQL.Text := 'Select Fecha, Coditem, Item, Periodo, count(*) as Veces from ItemAutom where codinq = :Codinq '
      else
        qMovimientos.SQL.Text := 'Select * from ItemAutom where codinq = :Codinq ';

      if not TodosFPago.Checked then
      begin
        qMovimientos.SQL.Add(' and Fecha >= :FechaDesde and Fecha <= :FechaHasta ');
        qMovimientos.ParamByName('FechaDesde').AsString := FechaAlReves(edtFecha.Text);
        qMovimientos.ParamByName('FechaHasta').AsString := FechaAlReves(edFechaHasta.Text);
      end;

      if not TodosItems.Checked then
      begin
        qMovimientos.SQL.Add(' and Coditem >= :Desde and Coditem <= :Hasta ');
        qMovimientos.ParamByName('Desde').AsString := edtItemDesde.Text;
        qMovimientos.ParamByName('Hasta').AsString := edItemHasta.Text;
      end;
      if boItemsRepetidos then
      begin
        qMovimientos.SQL.Add('Group by 1,2,3,4 Having Count(*) > 1 ');
        qMovimientos.SQL.Add(' order by Coditem ');
      end
      else
        qMovimientos.SQL.Add(' order by Fecha, Coditem ');

      qMovimientos.Close;
      qMovimientos.ParamByName('Codinq').AsString := q.FieldByName('Codinq').AsString;
      qMovimientos.Open;

      if not qMovimientos.isEmpty then
      begin
        gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString;
        gDetalle.ColorRow[I] := clSkyBlue;

        Inc(I);
      end;

      while not qMovimientos.eof do
      begin
        gDetalle.Cells[0,I] := qMovimientos.FieldByName('Coditem').AsString;
        gDetalle.Cells[1,I] := qMovimientos.FieldByName('Item').AsString + ' ' + qMovimientos.FieldByName('Periodo').AsString;
        gDetalle.Cells[2,I] := FechaConBarras(qMovimientos.FieldByName('Fecha').AsString);
        if boItemsRepetidos then
          gDetalle.Cells[3,I] := qMovimientos.FieldByName('veces').AsString;

        if not boItemsRepetidos then
        begin
          if qMovimientos.FieldByName('Importe').IsNull then
            gDetalle.Cells[3,I] := ''
          else
          begin
            if (qMovimientos.FieldByName('Coditem').AsString = '12') or(qMovimientos.FieldByName('Coditem').AsString = '121') or (qMovimientos.FieldByName('Coditem').AsString = '27') then
            begin
              if ToFloat(qMovimientos.FieldByName('Importe').AsString) < 0 then
                gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Importe').AsString))
              else
                gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Importe').AsString)*-1);
            end
            else
              gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Importe').AsString));
          end;

          gDetalle.Cells[4,I] := qMovimientos.FieldByName('Codinq').AsString;
          gDetalle.Cells[5,I] := qMovimientos.FieldByName('Clave').AsString;
          gDetalle.Cells[6,I] := qMovimientos.FieldByName('Registro').AsString;
          gDetalle.Cells[7,I] := qMovimientos.FieldByName('Usuario').AsString;
        end;
        Inc(I);
        qMovimientos.Next;
      end;




//      gDetalle.Cells[2,I] := FormatDatetime('dd/mm/yyyy',q.FieldByName('FechaFin').AsDatetime);
//      gDetalle.Cells[3,I] := FormatFloat('0.00', q.FieldByName('Alquiler').AsFloat);
//      gDetalle.Cells[4,I] := q.FieldByName('FechaPago').AsString;
//      if q.FieldByName('Liquidacion').AsString = 'S' then
//        gDetalle.Cells[5,I] := 'Si';
//      if q.FieldByName('Liquidacion').AsString = 'N' then
//        gDetalle.Cells[5,I] := 'No';
//      if q.FieldByName('Liquidacion').AsString = 'I' then
//        gDetalle.Cells[5,I] := 'Impuestos';
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
  finally
    gDetalle.EndUpdate;
    FreeAndNil(q);
    FreeAndNil(qMovimientos);
  end;
end;

procedure TfAbmMovimientos.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
  begin
    edtFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edtFecha.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfAbmMovimientos.TodosItemsClick(Sender: TObject);
begin
  if todosItems.Checked then
  begin
    edtItemDesde.Text:='';
    edItemHasta.Text:='';
  end;

  if Trim(edtItemDesde.Text) = ''  then
    todosItems.Checked := True;
end;

procedure TfAbmMovimientos.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmMovimientos.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmMovimientos.VerContratoEscalonado1Click(Sender: TObject);
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

procedure TfAbmMovimientos.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientos = nil then
    Application.CreateForm(TFMovimientos, FMovimientos)
  else
    FMovimientos.Show;
  FMovimientos.Cargar(gDetalle.Cells[6,gDetalle.Row],toEliminar);
end;

procedure TfAbmMovimientos.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if gDetalle.Cells[0,gDetalle.Row] = '01' then
  begin
    if FCambioAlquiler = nil then
      Application.CreateForm(TFCambioAlquiler, FCambioAlquiler)
    else
      FCambioAlquiler.Show;
    FCambioAlquiler.chCambiar.Visible := True;

    FCambioAlquiler.Cargar(ToInt(gDetalle.Cells[6,gDetalle.Row]), 1);
  end
  else if gDetalle.Cells[0,gDetalle.Row] = '30' then
  begin
    if FCambioAlquiler = nil then
      Application.CreateForm(TFCambioAlquiler, FCambioAlquiler)
    else
      FCambioAlquiler.Show;

    FCambioAlquiler.chCambiar.Visible := False;
    FCambioAlquiler.Cargar(ToInt(gDetalle.Cells[6,gDetalle.Row]), 30);
  end
  else
  begin
    if FMovimientos = nil then
      Application.CreateForm(TFMovimientos, FMovimientos)
    else
      FMovimientos.Show;
    FMovimientos.Cargar(gDetalle.Cells[6,gDetalle.Row],toModificar);
  end;
end;

procedure TfAbmMovimientos.btnNuevoClick(Sender: TObject);
begin
  if FMovimientos = nil then
    Application.CreateForm(TFMovimientos, FMovimientos)
  else
    FMovimientos.Show;
  FMovimientos.Cargar('',toNuevo);
end;

procedure TfAbmMovimientos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmMovimientos.cbFechaPagoClick(Sender: TObject);
begin
  todosFPago.Checked := False;
end;

procedure TfAbmMovimientos.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmMovimientos.edDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    edtFecha.SetFocus;

end;

procedure TfAbmMovimientos.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmMovimientos.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edHasta.SetFocus;
end;


procedure TfAbmMovimientos.edFechaHastaChange(Sender: TObject);
begin
//  TodosFPago.checked := Trim(edFechaHasta.Text) = '';
end;

procedure TfAbmMovimientos.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfAbmMovimientos.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmMovimientos.edHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edDescripcion.SetFocus;

end;

procedure TfAbmMovimientos.edItemHastaChange(Sender: TObject);
begin
  if edItemHasta.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfAbmMovimientos.edtFechaChange(Sender: TObject);
begin
  TodosFPago.checked := Trim(edtFecha.Text) = '';
  edFechahasta.Text:=edtfecha.Text;
end;

procedure TfAbmMovimientos.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfAbmMovimientos.edtItemDesdeChange(Sender: TObject);
begin
  edItemhasta.Text:=edtItemdesde.Text;

  if edtItemdesde.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;

end;

procedure TfAbmMovimientos.edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edItemHasta.SetFocus;

end;

procedure TfAbmMovimientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMMovimientos := nil;
  FABMMovimientosRepetidos := nil;
end;

procedure TfAbmMovimientos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmMovimientos.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmMovimientos.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
