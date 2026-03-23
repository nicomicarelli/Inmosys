unit Asignaciongastosdepartamentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, frmDatos, sqlexpr, ALIGRID, FXQuery,
  System.Actions;

type
  TfrmAsignacionGastosdeptos = class(TForm)
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
    Label5: TLabel;
    cbdeptos: TComboBox;
    gDetalle: TStringAlignGrid;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Image3: TImage;
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
    procedure cbdeptosDropDown(Sender: TObject);
    procedure cbdeptosClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure gDetalleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure Ejecutar;
  end;

var
  frmAsignacionGastosdeptos: TfrmAsignacionGastosdeptos;

implementation

uses frmprincipal;

{$R *.DFM}

procedure TfrmAsignacionGastosdeptos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAsignacionGastosdeptos := nil;
end;

procedure TfrmAsignacionGastosdeptos.FormCreate(Sender: TObject);
begin
  FPrincipal.Center(Self);
end;

procedure TfrmAsignacionGastosdeptos.gDetalleClick(Sender: TObject);
var
  Consorcio: string;
  Concepto: string;
  depto: string;
  Mes: Integer;
  Anio: Integer;
  q: TFXQuery;

begin
  Consorcio := gDetalle.Cells[0,gDetalle.Row];
  Concepto  := gDetalle.Cells[1,gDetalle.Row];
  Depto     := cbdeptos.Text;
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
              ' a.CodConcepto as CodigoConcepto, cc.descripcion as Concepto, a.Importe, a.depto ' +
              '  from Asignaciondeptos A INNER JOIN CONSORCIOS C ON C.CODIGO=A.CODCONSORCIO ' +
              '  INNER JOIN conceptosCONSORCIOS Cc ON a.CODconcepto=cc.CODIgO ' +
              ' where A.codcONSORCIO=:Codigo and A.CodConcepto=:Concepto and a.mes=:mes and A.Anio=:anio and a.depto=:depto');
      ParamByName('Codigo').AsString := Consorcio;
      ParamByName('Concepto').AsString := Concepto;
      ParamByName('Depto').AsString := Depto;
      ParamByName('mes').AsInteger := Mes;
      ParamByName('Anio').AsInteger := Anio;
      Open;
    end;
    edtCodigo.Text        := q.Fields[0].asstring;
    edIt2.Text            := q.Fields[1].asstring;
    edtConcepto.Text      := q.Fields[2].asstring;
    edtDescripcion.Text   := q.Fields[3].asstring;
    edtPorcentaje.Text    := q.Fields[4].asstring;
    cbDeptos.Text        := q.Fields[5].asstring;

    actModificar.Execute;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmAsignacionGastosdeptos.FormActivate(Sender: TObject);
begin
//  DM.ArmarGrilla('CodConsorcio','Depto', 'DepartamentosxConsorcio');
//  dbgGrilla.DataSource := DM.dtsGrillaAzul;
  actNuevo.Execute;
  edtCodigo.setFocus;

end;

procedure TfrmAsignacionGastosdeptos.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
    if TWinControl.ClassNameIs('TEdit') then
      Self.Controls[I].Enabled := True;

  edtpORCENTAJE.Text       := '';

end;

procedure TfrmAsignacionGastosdeptos.actGrabarExecute(Sender: TObject);
var
  Consorcio:       string;
  Concepto:        string;
  Depto:           string;
  Importe: Double;
  Mes: Integer;
  Anio: Integer;
begin
  Consorcio := edtCodigo.text;
  Concepto  := edtConcepto.text;
  Depto     := cbDeptos.text;
  Mes       := cbMes.ItemIndex + 1;
  Anio      := Strtoint(cbAnio.text);

  if depto = '-- Seleccione depto --' then
  begin
    MessageDlg('Debe seleccionar departamento. Verifique por facor.', mtInformation, [mbOk], 0);
    Exit;
  end;

  Importe := Strtofloat(edtPorcentaje.text);

  if DM.GrabarGastosdEPTOS(Consorcio, Concepto, dEPTO, Mes, Anio, Importe) then
  begin
    MostrarDialogoAceptar('El Gasto se grabo satisfactoriamente');
    actGrabar.Enabled := False;
    edtCodigo.Text             := '';
    edit2.Text                 := '';
    edtPorcentaje.Text         := '0.00';
    edtConcepto.Text           := '';
    edtDescripcion.Text        := '';
    cbDeptos.Text              := '-- Seleccione Depto. --';
    edtCOdigo.SetFocus;
  end;
  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosDEPTO(Consorcio, DEPTO, Mes, Anio));
end;

procedure TfrmAsignacionGastosdeptos.actBorrarExecute(Sender: TObject);
var
  I:      Integer;
  Consorcio: String;
  Concepto: string;
  Depto: string;
  Anio: Integer;
  Mes: Integer;

begin
  if MostrarDialogoSiNo('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?') then
  begin
    Consorcio := edtCodigo.Text;
    Concepto  := edtConcepto.Text;
    depto     := cbdeptos.Text;
    Mes       := cbMes.Itemindex + 1;
    Anio      := strtoint(cbAnio.text);
    DM.BuscarGastoDepto(Consorcio, Concepto, dEPTO, Mes, Anio,'Borrar');
    for I := 1 to Self.ControlCount - 1 do
    begin
      if (Self.Controls[I].ClassNameIs('TEdit')) or (Self.Controls[I].ClassNameIs ('TMaskEdit')) then
      begin
        TEdit(Self.Controls[I]).Text     := '';
        TMaskEdit(Self.Controls[I]).Text := '';
      end;
    end;

    edtCodigo.text         := '';
    cbdeptos.text          := '-- Seleccione depto --';
    edit2.text             := '';
    edtConcepto.text       := '';
    edtDescripcion.text    := '';
    edtPorcentaje.text     := '0,00';
  end;
  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosDepto(Consorcio, Depto, Mes, Anio));
  edtCodigo.SetFocus;
end;

procedure TfrmAsignacionGastosdeptos.DatosKeyPress(Sender: TObject; var Key: Char);
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
        edtCodigo.text := FormatFloat('00000', Codigo);
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from consorcios where Codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if q.RecordCount > 0 then
        begin
          With q do
          begin
            edtCodigo.Text             := FieldByName('Codigo').asstring;
            edit2.Text                 := FieldByName('Nombre').asstring;
          end;
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
        if q.RecordCount > 0 then
        begin
          With q do
          begin
            edtConcepto.Text             := FieldByName('Codigo').asstring;
            edtdescripcion.Text          := FieldByName('Descripcion').asstring;
          end;
          actModificar.Execute;
        end
        else
        begin
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
       if not (Key in ['0'..'9', #8,#13,',','.','-']) then
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

procedure TfrmAsignacionGastosdeptos.actModificarExecute(Sender: TObject);
begin
  DM.BuscarConsorcioPorCodigo(edtCodigo.Text,'');
end;

class procedure TfrmAsignacionGastosdeptos.Ejecutar;
begin
end;

procedure TfrmAsignacionGastosdeptos.actGrabarUpdate(Sender: TObject);
begin
  actGrabar.Enabled := (edtPorcentaje.Text <> '');
end;

procedure TfrmAsignacionGastosdeptos.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfrmAsignacionGastosdeptos.r(Sender: TObject);
var
  Codigo: Double;
begin
  if Trim(edtCodigo.text) = '' then
    Exit;

  Codigo := Strtofloat(edtCodigo.text);
  edtCodigo.Text := Formatfloat('00', Codigo);
end;

procedure TfrmAsignacionGastosdeptos.btnconsultarClick(Sender: TObject);
var
  Consorcio, Concepto, DEPTO: string;
  Mes, Anio: Integer;
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    Consorcio := edtCodigo.text;
    Concepto  := edtConcepto.text;
    dEPTO  := CBdEPTOS.text;
    Mes       := cbMes.ItemIndex + 1;
    Anio      := Strtoint(cbAnio.text);
    with q do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select A.CodConsorcio as Consorcio, A.CodConcepto as Codigo, C.Descripcion as Descripcion, a.importe as Importe ' +
              '  from AsignacionDeptos A inner join conceptosconsorcios c ' +
              '    on a.codconcepto=c.codigo ' +
              ' where a.codconsorcio=:codigo and a.mes=:mes and a.Anio=:anio and a.depto=:depto' +
              ' Order By CodConcepto');
      ParamByName('Codigo').AsString := Consorcio;
      ParamByName('Depto').AsString := Depto;
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
      Inc(I);
      q.Next;
    end;

    if i < 2 then
      gDetalle.RowCount := 2
    else
      gDetalle.RowCount := I;

    edtTotal.Text := FormatFloat('0.00', DM.TotalGastosdEPTO(Consorcio, dEPTO, Mes, Anio));
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmAsignacionGastosdeptos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAsignacionGastosdeptos.cbMesChange(Sender: TObject);
begin
  btnConsultar.Click;
end;

procedure TfrmAsignacionGastosdeptos.cbAnioChange(Sender: TObject);
begin
  btnConsultar.click;
end;

procedure TfrmAsignacionGastosdeptos.cbdeptosDropDown(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.text := 'Select depto from departamentosxconsorcio where codconsorcio=:Codigo';
    q.ParamByName('Codigo').AsString := edtCodigo.text;
    q.Open;
    cbdeptos.clear;
    while not q.eof do
    begin
      cbdeptos.Items.Add(q.FieldbyName('Depto').asstring);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmAsignacionGastosdeptos.cbdeptosClick(Sender: TObject);
begin
  btnConsultar.click;
end;

end.
