unit Asignaciongastosconsorcios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, FUnciones, sqlexpr, frmDatos, ALIGRID, FXQuery,
  System.Actions;

type
  TfrmAsignacionGastos = class(TForm)
    Panel2: TPanel;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    lblListadoInforme: TLabel;
    edtCodigo: TEdit;
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Edit2: TMaskEdit;
    edtPorcentaje: TMaskEdit;
    edtConcepto: TEdit;
    edtDescripcion: TMaskEdit;
    Label2: TLabel;
    cbMes: TComboBox;
    Label3: TLabel;
    cbAnio: TComboBox;
    btnconsultar: TButton;
    edtTotal: TEdit;
    Label4: TLabel;
    dsGastos: TDataSource;
    chExtraordinario: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    BitBtn1: TBitBtn;
    gDetalle: TStringAlignGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actModificarExecute(Sender: TObject);
    procedure actGrabarUpdate(Sender: TObject);
    procedure actBorrarUpdate(Sender: TObject);
    procedure r(Sender: TObject);
    procedure btnconsultarClick(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure cbAnioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure gDetalleClick(Sender: TObject);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
  private
    { Private declarations }
  public
    class procedure Ejecutar;
  end;

var
  frmAsignacionGastos: TfrmAsignacionGastos;

implementation

uses frmprincipal;

{$R *.DFM}

procedure TfrmAsignacionGastos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAsignacionGastos := nil;
end;

procedure TfrmAsignacionGastos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(self);
end;

procedure TfrmAsignacionGastos.gDetalleClick(Sender: TObject);
var
  Consorcio: string;
  Concepto: string;
  Mes: Integer;
  Anio: Integer;
  q: TFXQuery;
begin
  Consorcio := gDetalle.Cells[0, gdetalle.Row];
  Concepto  := gDetalle.Cells[1, gdetalle.Row];
  Mes       := cbMes.Itemindex + 1;
  Anio      := strtoint(cbAnio.text);

  if trim(Consorcio) = '' then
    Exit;

  if trim(Concepto) = '' then
    Exit;

  q := CrearQuery;
  try
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select A.CodConsorcio as Codigoconsorcio, c.Nombre as Consorcio, ' +
              ' a.CodConcepto as CodigoConcepto, cc.descripcion as Concepto, a.Importe, a.extraordinario ' +
              '  from Asignacionconsorcios A INNER JOIN CONSORCIOS C ON C.CODIGO=A.CODCONSORCIO ' +
              '  INNER JOIN conceptosCONSORCIOS Cc ON a.CODconcepto=cc.CODIgO ' +
              ' where A.codcONSORCIO=:Codigo and A.CodConcepto=:Concepto and a.mes=:mes and A.Anio=:anio ');
      ParamByName('Codigo').AsString := Consorcio;
      ParamByName('Concepto').AsString := Concepto;
      ParamByName('mes').AsInteger := Mes;
      ParamByName('Anio').AsInteger := Anio;
      Open;
    end;
    edtCodigo.Text        := q.Fields[0].asstring;
    edIt2.Text            := q.Fields[1].asstring;
    edtConcepto.Text      := q.Fields[2].asstring;
    edtDescripcion.Text   := Q.Fields[3].asstring;
    edtPorcentaje.Text    := q.Fields[4].asstring;
    chExtraordinario.checked := (q.Fields[5].asstring = 'SI');
    actModificar.Execute;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmAsignacionGastos.gDetalleFixedColClick(Sender: TObject;
  col: Integer);
begin
  if Col = 3 then
    gDetalle.SortColumn(Col, True,'N')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

procedure TfrmAsignacionGastos.FormActivate(Sender: TObject);
var
  q: TFXQuery;

begin
//  DM.ArmarGrilla('CodConsorcio','Depto', 'DepartamentosxConsorcio');
//  dbgGrilla.DataSource := DM.dtsGrillaAzul;
  q := CrearQuery;
  try
    actNuevo.Execute;
    edtCodigo.setFocus;

    q.Close;
    q.SQL.text := 'Select * from conceptos where 1=2';
    q.Open;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmAsignacionGastos.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
    if TWinControl.ClassNameIs('TEdit') then
      Self.Controls[I].Enabled := True;

  edtpORCENTAJE.Text       := '';

end;

procedure TfrmAsignacionGastos.actGrabarExecute(Sender: TObject);
var
  Consorcio:      string;
  Concepto:       string;
  Extraordinario: string;
  Importe: Double;
  Mes: Integer;
  Anio: Integer;
begin
  Consorcio := edtCodigo.text;
  Concepto  := edtConcepto.text;
  Mes       := cbMes.ItemIndex + 1;
  Anio      := Strtoint(cbAnio.text);
  if chExtraordinario.checked then
    Extraordinario := 'SI'
  else
    Extraordinario := 'NO';

  Importe := Strtofloat(edtPorcentaje.text);

  if DM.GrabarGastosConsorcios(Consorcio, Concepto, Mes, Anio, Importe, Extraordinario) then
  begin
    MostrarDIalogoAceptar('El gasto se grabo satisfactoriamente');
    actGrabar.Enabled := False;
    edtCodigo.Text             := '';
    edit2.Text                 := '';
    edtPorcentaje.Text         := '0.00';
    edtConcepto.Text           := '';
    edtDescripcion.Text        := '';
    edtCOdigo.SetFocus;
  end;
  DM.ArmarGrillaGastos(Consorcio, Mes, Anio);
  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosConsorcio(Consorcio, Mes, Anio));
  btnCOnsultarClick(nil);
end;

procedure TfrmAsignacionGastos.actBorrarExecute(Sender: TObject);
var
  I:      Integer;
  Consorcio: String;
  Concepto: string;
  Anio: Integer;
  Mes: Integer;

begin
  if MostrarDIalogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?') then
  begin
    Consorcio := edtCodigo.Text;
    Concepto  := edtConcepto.Text;
    Mes       := cbMes.Itemindex + 1;
    Anio      := strtoint(cbAnio.text);
    DM.BuscarGasto(Consorcio, Concepto, Mes, Anio,'Borrar');
    for I := 1 to Self.ControlCount - 1 do
    begin
      if (Self.Controls[I].ClassNameIs('TEdit')) or (Self.Controls[I].ClassNameIs ('TMaskEdit')) then
      begin
        TEdit(Self.Controls[I]).Text     := '';
        TMaskEdit(Self.Controls[I]).Text := '';
      end;
    end;

    edtCodigo.text         := '';
    edit2.text             := '';
    edtConcepto.text       := '';
    edtDescripcion.text    := '';
    edtPorcentaje.text     := '0,00';
  end;
  btnConsultarCLick(nil);
  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosConsorcio(Consorcio, Mes, Anio));
  edtCodigo.SetFocus;
end;

procedure TfrmAsignacionGastos.DatosKeyPress(Sender: TObject; var Key: Char);
var
  Codigo: Double;
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        Codigo := Strtofloat(edtCodigo.text);
        edtCodigo.text := FormatFloat('00', Codigo);
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from consorcios where Codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          edtCodigo.Text             := q.FieldByName('Codigo').asstring;
          edit2.Text                 := q.FieldByName('Nombre').asstring;
          actModificar.Execute;
          btnConsultar.Click;
        end
        else
        begin
          edtCodigo.Text   := '';
          edtConcepto.Text   := '';
          edtDescripcion.Text   := '';
          edit2.Text   := '';
          edtPorcentaje.Text   := '';
          Exit;
        end;

        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus
        else
          EdtConcepto.SetFocus;
      end;
      if not (Key in ['0'..'9', #8]) then
        Key := #0;
    end;


    if TWinControl(Sender).Name = 'edtConcepto' then
    begin
      if Key = #13 then
      begin
        Codigo := Strtofloat(edtConcepto.text);
        edtConcepto.text := FormatFloat('00000', Codigo);
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from ConceptosConsorcios where Codigo = :Codigo');
          ParamByName('Codigo').AsString := edtConcepto.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          edtConcepto.Text             := q.FieldByName('Codigo').asstring;
          edtdescripcion.Text          := q.FieldByName('Descripcion').asstring;
          actModificar.Execute;
        end
        else
        begin
          MostrarDialogoAceptar('El Codigo de concepto no existe. Verifique por favor.');
          edtConcepto.Text   := '';
          edtDescripcion.Text   := '';
          edtPorcentaje.Text   := '';
          Exit;
        end;

        if Trim(edtConcepto.Text) = '' then
          Edtconcepto.SetFocus
        else
          edtPorcentaje.SetFocus;
      end;
      if not (Key in ['0'..'9', #8]) then
        Key := #0;
    end;


    if (TWinControl(Sender).Name = 'edtPorcentaje') then
    begin
       if not (Key in ['0'..'9', #8,#13,',','.']) then
         Key := #0;
       if Key = '.' then
        Key := ',';

      if Key = #13 then
      begin
        if Trim(edtCodigo.text) = '' then
          Exit;
        if Trim(edtConcepto.text) = '' then
          Exit;

        actGrabar.execute;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmAsignacionGastos.actModificarExecute(Sender: TObject);
begin
  DM.BuscarConsorcioPorCodigo(edtCodigo.Text,'');
end;

class procedure TfrmAsignacionGastos.Ejecutar;
begin
end;

procedure TfrmAsignacionGastos.actGrabarUpdate(Sender: TObject);
begin
  actGrabar.Enabled := (edtPorcentaje.Text <> '');
end;

procedure TfrmAsignacionGastos.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfrmAsignacionGastos.r(Sender: TObject);
var
  Codigo: Double;
begin
  if Trim(edtCodigo.text) = '' then
    Exit;

  Codigo := Strtofloat(edtCodigo.text);
  edtCodigo.Text := Formatfloat('00', Codigo);
end;

procedure TfrmAsignacionGastos.btnconsultarClick(Sender: TObject);
var
  Consorcio, Concepto: string;
  Mes, Anio: Integer;
  q: TFXQuery;
  I: Integer;
begin
  Consorcio := edtCodigo.text;
  Concepto  := edtConcepto.text;
  Mes       := cbMes.ItemIndex + 1;
  Anio      := Strtoint(cbAnio.text);
  gDetalle.Vaciar;
  q := CrearQuery;
  try
    with q do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select A.CodConsorcio as Consorcio, A.CodConcepto as Codigo, C.Descripcion as Descripcion, a.importe as Importe, A.Extraordinario ' +
              '  from AsignacionConsorcios A inner join conceptosconsorcios c ' +
              '    on a.codconcepto=c.codigo ' +
              ' where a.codconsorcio=:codigo and a.mes=:mes and a.Anio=:anio '+
              ' Order By A.CodConcepto');
      ParamByName('Codigo').AsString := Consorcio;
      ParamByName('Mes').AsInteger :=   Mes;
      ParamByName('Anio').AsInteger := Anio;
      Open;
    end;

    i := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Consorcio').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Codigo').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Descripcion').AsString;
      gDetalle.Cells[3,I] := FormatFloat('0.00', q.FieldByName('Importe').AsFloat);
      gDetalle.Cells[4,I] := q.FieldByName('Extraordinario').AsString;
      Inc(I);
      q.Next;
    end;

    if i < 2 then
      gDetalle.RowCount := 2
    else
      gDetalle.RowCount := I;
  finally
    FreeAndNil(q);
  end;

  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosConsorcio(Consorcio, Mes, Anio));
end;

procedure TfrmAsignacionGastos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAsignacionGastos.cbMesChange(Sender: TObject);
begin
  btnConsultar.Click;
end;

procedure TfrmAsignacionGastos.cbAnioChange(Sender: TObject);
begin
  btnConsultar.click;
end;

end.
