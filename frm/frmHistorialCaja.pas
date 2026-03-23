unit frmHistorialCaja;

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
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox;

type
  TfHistorialCaja = class(TForm)
    cxGroupBox1: TcxGroupBox;
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
    gDetalle: TStringAlignGrid;
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
    { Public declarations }
  end;

var
  fHistorialCaja: TfHistorialCaja;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmCambioAlquiler;

{$R *.dfm}

procedure TfHistorialCaja.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  qMovimientos: TFXQuery;
  I: Integer;
  codinq: string;
begin
  q := CrearQuery;
  qMovimientos := CrearQuery;
  try
    gDetalle.Vaciar;
    qMovimientos.SQL.Text := 'Select H.* from HistoriaCajaDetalles H where 1=1 ';

    if not TodosCodigos.Checked then
    begin
      qMovimientos.SQL.Add(' and Codinq >=:desde and Codinq <=:Hasta ');
      qMovimientos.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      qMovimientos.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

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

    qMovimientos.SQL.Add(' order by Codinq, Fecha, Coditem, FechaCambio, Tipo ');
    qMovimientos.Open;

    codinq := '';
      I := 1;
      while not qMovimientos.eof do
      begin
        gDetalle.Cells[0, I] := FormatDatetime('dd/mm/yyyy', qMovimientos.FieldByName('Fecha').AsDatetime);
        gDetalle.Cells[1, I] := qMovimientos.FieldByName('Codinq').AsString;
        gDetalle.Cells[2, I] := qMovimientos.FieldByName('Item').AsString + ' ' + qMovimientos.FieldByName('Periodo').AsString;
        gDetalle.Cells[3,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Entra').AsString));
        gDetalle.Cells[4,I] := FormatFloat('0.00', ToFloat(qMovimientos.FieldByName('Sale').AsString));
        gDetalle.Cells[7,I] := qMovimientos.FieldByName('Tipo').AsString;
        gDetalle.Cells[8,I] := qMovimientos.FieldByName('Letra').AsString;
        gDetalle.Cells[9,I] := FormatFloat('0000-00000000', qMovimientos.FieldByName('Numero').AsFloat);
        gDetalle.Cells[10,I] := qMovimientos.FieldByName('Coditem').AsString;

        gDetalle.Cells[12,I] := qMovimientos.FieldByName('Usuario').AsString;
        if qMovimientos.FieldByName('TipoOperacion').AsInteger = 0 then
          gDetalle.Cells[13,I] := 'Creado'
        else if qMovimientos.FieldByName('TipoOperacion').AsInteger = 1 then
          gDetalle.Cells[13,I] := 'Modificado'
        else if qMovimientos.FieldByName('TipoOperacion').AsInteger = 2 then
          gDetalle.Cells[13,I] := 'Eliminado';
        gDetalle.Cells[14, I] := FormatDatetime('dd/mm/yyyy', qMovimientos.FieldByName('FechaCambio').AsDatetime);

        Inc(I);
        qMovimientos.Next;
      end;

//      q.Next;
//    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
  finally
    FreeAndNil(q);
    FreeAndNil(qMovimientos);
  end;
end;

procedure TfHistorialCaja.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
  begin
    edtFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if Trim(edtFecha.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfHistorialCaja.TodosItemsClick(Sender: TObject);
begin
  if todosItems.Checked then
  begin
    edtItemDesde.Text:='';
    edItemHasta.Text:='';
  end;

  if Trim(edtItemDesde.Text) = ''  then
    todosItems.Checked := True;
end;

procedure TfHistorialCaja.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfHistorialCaja.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfHistorialCaja.VerContratoEscalonado1Click(Sender: TObject);
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

procedure TfHistorialCaja.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[6,gDetalle.Row] = '' then
    Exit;

  if FMovimientos = nil then
    Application.CreateForm(TFMovimientos, FMovimientos)
  else
    FMovimientos.Show;
  FMovimientos.Cargar(gDetalle.Cells[6,gDetalle.Row],toEliminar);
end;

procedure TfHistorialCaja.btnModificarClick(Sender: TObject);
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

procedure TfHistorialCaja.btnNuevoClick(Sender: TObject);
begin
  if FMovimientos = nil then
    Application.CreateForm(TFMovimientos, FMovimientos)
  else
    FMovimientos.Show;
  FMovimientos.Cargar('',toNuevo);
end;

procedure TfHistorialCaja.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfHistorialCaja.cbFechaPagoClick(Sender: TObject);
begin
  todosFPago.Checked := False;
end;

procedure TfHistorialCaja.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfHistorialCaja.edDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    edtFecha.SetFocus;

end;

procedure TfHistorialCaja.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfHistorialCaja.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edHasta.SetFocus;
end;


procedure TfHistorialCaja.edFechaHastaChange(Sender: TObject);
begin
//  TodosFPago.checked := Trim(edFechaHasta.Text) = '';
end;

procedure TfHistorialCaja.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfHistorialCaja.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfHistorialCaja.edHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edDescripcion.SetFocus;

end;

procedure TfHistorialCaja.edItemHastaChange(Sender: TObject);
begin
  if edItemHasta.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfHistorialCaja.edtFechaChange(Sender: TObject);
begin
  TodosFPago.checked := Trim(edtFecha.Text) = '';
  edFechahasta.Text:=edtfecha.Text;
end;

procedure TfHistorialCaja.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfHistorialCaja.edtItemDesdeChange(Sender: TObject);
begin
  edItemhasta.Text:=edtItemdesde.Text;

  if edtItemdesde.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;

end;

procedure TfHistorialCaja.edtItemDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
  if key = #13 then
    edItemHasta.SetFocus;

end;

procedure TfHistorialCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fHistorialCaja := nil;
end;

procedure TfHistorialCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfHistorialCaja.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfHistorialCaja.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

end.
