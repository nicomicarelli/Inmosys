unit LiquidacionGastos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, DBClient, Funciones, System.Actions;

type
  TfrmLiquidacionDeptos = class(TForm)
    Panel2: TPanel;
    lblCodigo: TLabel;
    Image3: TImage;
    Label1: TLabel;
    Image2: TImage;
    dbgGrilla: TDBGrid;
    edtCodigo: TEdit;
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ToolBar1: TToolBar;
    btnGrbar: TToolButton;
    btnBorrar: TToolButton;
    actCerrar: TAction;
    btnCerrar: TToolButton;
    Edit2: TMaskEdit;
    Label2: TLabel;
    cbMes: TComboBox;
    Label3: TLabel;
    cbAnio: TComboBox;
    btnconsultar: TButton;
    edtTotal: TEdit;
    Label4: TLabel;
    dsGastos: TDataSource;
    lista: TListView;
    CheckBox1: TCheckBox;
    ImageList2: TImageList;
    Datos: TClientDataSet;
    MaskEdit1: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgGrillaCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure edtDeptoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actModificarExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure actGrabarUpdate(Sender: TObject);
    procedure actBorrarUpdate(Sender: TObject);
    procedure r(Sender: TObject);
    procedure btnconsultarClick(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure cbAnioChange(Sender: TObject);
    procedure listaClick(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure Ejecutar;
  end;

var
  frmLiquidacionDeptos: TfrmLiquidacionDeptos;

implementation

uses frmdatos;

{$R *.DFM}

procedure TfrmLiquidacionDeptos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLiquidacionDeptos.dbgGrillaCellClick(Column: TColumn);
var
  Consorcio: string;
  Concepto: string;
  Mes: Integer;
  Anio: Integer;

begin
  Consorcio := DbgGrilla.SelectedField.Text;
  Concepto  := DbgGrilla.Fields[1].Text;
  Mes       := cbMes.Itemindex + 1;
  Anio      := strtoint(cbAnio.text);

  if trim(Consorcio) = '' then
    Exit;

  if trim(Concepto) = '' then
    Exit;

  with DM.ibqConsulta do
  begin
    Close;
    Sql.Clear;
    Sql.Add('select A.CodConsorcio as Codigoconsorcio, c.Nombre as Consorcio, ' +
            ' a.CodConcepto as CodigoConcepto, cc.descripcion as Concepto, a.Importe ' +
            '  from Asignacionconsorcios A INNER JOIN CONSORCIOS C ON C.CODIGO=A.CODCONSORCIO ' +
            '  INNER JOIN conceptosCONSORCIOS Cc ON a.CODconcepto=cc.CODIgO ' +
            ' where A.codcONSORCIO=:Codigo and A.CodConcepto=:Concepto and a.mes=:mes and A.Anio=:anio ');
    ParamByName('Codigo').AsString := Consorcio;
    ParamByName('Concepto').AsString := Concepto;
    ParamByName('mes').AsInteger := Mes;
    ParamByName('Anio').AsInteger := Anio;
    Open;
  end;
  edtCodigo.Text        := DM.ibqConsulta.Fields[0].asstring;
  edIt2.Text            := DM.ibqConsulta.Fields[1].asstring;

  actModificar.Execute;
end;

procedure TfrmLiquidacionDeptos.FormActivate(Sender: TObject);
begin
//  DM.ArmarGrilla('CodConsorcio','Depto', 'DepartamentosxConsorcio');
//  dbgGrilla.DataSource := DM.dtsGrillaAzul;
  actNuevo.Execute;
  edtCodigo.setFocus;

  dm.ibqConsulta2.Close;
  Dm.ibqConsulta2.SQL.text := 'Select * from conceptos where 1=2';
  dm.ibqConsulta2.Open;
end;

procedure TfrmLiquidacionDeptos.edtDeptoKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
end;

procedure TfrmLiquidacionDeptos.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
    if TWinControl.ClassNameIs('TEdit') then
      Self.Controls[I].Enabled := True;


end;

procedure TfrmLiquidacionDeptos.actGrabarExecute(Sender: TObject);
var
  Consorcio:       string;
  Descripcion:     string;
  DIRECCION:       string;
  Mes: string;
  Anio: string;
  Depto: string;
  Importetotal: string;
  Comun: string;
  Fondo: string;
  PorcFondo: string;
  Otros: string;
  Interes: string;
  Letras:string;
  Total: string;
  Propietario: string;
  Extraordinario: string;

begin
//  IF lISTA.Selected = NIL THEN
//    EXIT;
//
//  dm.ibqConsulta.SQL.Text := 'Select Propietario from departamentosxconsorcio where codconsorcio=:Codigo and depto=:Depto';
//  dm.ibqConsulta.Parambyname('Codigo').asstring := edtCodigo.text;
//  dm.ibqConsulta.Parambyname('Depto').asstring := Lista.Selected.SubItems[0];
//  dm.ibqConsulta.Open;
//
//  Propietario := dm.ibqConsulta.Fields[0].AsString;
//
//  Datos.emptydataset;
//    if not DM.Transaction.InTransaction then
//      DM.Transaction.StartTransaction;
//
//    Consorcio    := edtCodigo.text;
//    Descripcion  := Edit2.text;
//    DIRECCION    := mASKEDIT1.text;
//    Mes          := cbMes.text;
//    Anio         := cbAnio.Text;
//    Depto        := Lista.Selected.Subitems[0];
//    ImporteTotal := Lista.Selected.Subitems[1];
//    PorcFondo    := Lista.Selected.Subitems[2];
//    Comun        := Lista.Selected.Subitems[3];
//    Fondo        := Lista.Selected.Subitems[4];
//    Extraordinario := Lista.Selected.Subitems[5];
//    Otros        := Lista.Selected.Subitems[6];
//    Interes      := Lista.Selected.Subitems[7];
//    Total        := edttotal.text;
//
//    Datos.Append;
//    Datos.Fields[0].Asstring := Consorcio;
//    Datos.Fields[1].Asstring := Descripcion;
//    Datos.Fields[2].Asstring := Mes;
//    Datos.Fields[3].Asstring := Anio;
//    Datos.Fields[4].Asstring := Depto;
//    Datos.Fields[5].Asstring := Importetotal;
//    Datos.Fields[6].Asstring := PorcFondo;
//    Datos.Fields[7].Asstring := Comun;
//    Datos.Fields[8].Asstring := Fondo;
//    Datos.Fields[9].Asstring := Otros;
//    Datos.Fields[10].Asstring := Interes;
//    Datos.Fields[11].Asstring := Total;
//    Datos.Fields[12].Asstring := Propietario;
//    Datos.Fields[13].Asstring := Extraordinario;
//    Datos.Fields[14].Asstring := FormatDateTime('dd/mm/yyyy', Now);
//    Datos.Fields[15].Asstring := dIRECCION;
//    Datos.Post;

 
 // actListadoRecibos.Execute;
// actPoneMesPagado.Execute;

//tforigdup.Ejecutar('C:\Inmosys\RecExpensas.rav', 'C:\Inmosys\RecExpensas.rav');

end;

procedure TfrmLiquidacionDeptos.actBorrarExecute(Sender: TObject);
var
  I:      Integer;
  Consorcio: String;
  Concepto: string;
  Anio: Integer;
  Mes: Integer;

begin
//  if MostrarDIalogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?') then
//  begin
//    if not DM.Transaction.InTransaction then
//      DM.Transaction.StartTransaction;
//    Consorcio := edtCodigo.Text;
//    Mes       := cbMes.Itemindex + 1;
//    Anio      := strtoint(cbAnio.text);
//    DM.BuscarGasto(Consorcio, Concepto, Mes, Anio,'Borrar');
//    for I := 1 to Self.ControlCount - 1 do
//    begin
//      if (Self.Controls[I].ClassNameIs('TEdit')) or (Self.Controls[I].ClassNameIs ('TMaskEdit')) then
//      begin
//        TEdit(Self.Controls[I]).Text     := '';
//        TMaskEdit(Self.Controls[I]).Text := '';
//      end;
//    end;
//
//    edtCodigo.text         := '';
//    edit2.text             := '';
//  end;
//  DM.ArmarGrillaGastos(Consorcio, Mes, Anio);
//  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosConsorcio(Consorcio, Mes, Anio));
//  edtCodigo.SetFocus;
//  DM.Transaction.CommitRetaining;
end;

procedure TfrmLiquidacionDeptos.DatosKeyPress(Sender: TObject; var Key: Char);
var
  Codigo: Double;
begin
  if TWinControl(Sender).Name = 'edtCodigo' then
  begin
    if Key = #13 then
    begin
      Codigo := Strtofloat(edtCodigo.text);
      edtCodigo.text := FormatFloat('00000', Codigo);
      With DM.ibqConsulta do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from consorcios where Codigo = :Codigo');
        ParamByName('Codigo').AsString := edtCodigo.Text;
        Open;
      end;
      if DM.ibqConsulta.RecordCount > 0 then
      begin
        With DM.ibqConsulta do
        begin
          edtCodigo.Text             := FieldByName('Codigo').asstring;
          edit2.Text                 := FieldByName('Nombre').asstring;
          MASKEDIT1.Text             := FieldByName('dIRECCION').asstring;
        end;
        actModificar.Execute;
        btnConsultar.Click;
      end
      else
      begin
        edtCodigo.Text   := '';
        edit2.Text   := '';
        Exit;
      end;

      if edtCodigo.Text = '' then
        EdtCodigo.SetFocus
    end;
    if not (Key in ['0'..'9', #8]) then
      Key := #0;
  end;

  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmLiquidacionDeptos.actModificarExecute(Sender: TObject);
begin
  DM.BuscarConsorcioPorCodigo(edtCodigo.Text,'');
end;

class procedure TfrmLiquidacionDeptos.Ejecutar;
begin
  with TfrmLiquidacionDeptos.Create(Application) do
    ShowModal;
end;

procedure TfrmLiquidacionDeptos.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmLiquidacionDeptos.actGrabarUpdate(Sender: TObject);
begin
  actGrabar.Enabled := (edtCodigo.Text <> '');
end;

procedure TfrmLiquidacionDeptos.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfrmLiquidacionDeptos.r(Sender: TObject);
var
  Codigo: Double;
begin
  if Trim(edtCodigo.text) = '' then
    Exit;

  Codigo := Strtofloat(edtCodigo.text);
  edtCodigo.Text := Formatfloat('00000', Codigo);
end;

procedure TfrmLiquidacionDeptos.btnconsultarClick(Sender: TObject);
var
  Consorcio, Concepto: string;
  Mes, Anio, I: Integer;
  Gasto: Double;


begin
  Consorcio := edtCodigo.text;
  Mes       := cbMes.ItemIndex + 1;
  Anio      := Strtoint(cbAnio.text);
  DM.ArmarGrillaDeptos(Consorcio, 'NO', Mes, Anio);
  Lista.Clear;
  Lista.Columns[0].Width := 60;
  Lista.Columns[1].Width := 60;
  Lista.Columns[2].Width := 80;
  Lista.Columns[3].Width := 50;
  Lista.Columns[4].Width := 100;
  Lista.Columns[5].Width := 100;
  Lista.Columns[6].Width := 100;
  Lista.Columns[7].Width := 100;

  while not DM.ibqConsulta2.Eof do
  begin
    with Lista.items.add do
    begin
      Caption := DM.ibqConsulta2.Fields[0].AsString;
      Subitems.Add(DM.ibqConsulta2.Fields[1].AsString);
      Subitems.Add(FormatFloat('0.00',DM.ibqConsulta2.Fields[2].AsFloat));
      Subitems.Add(FormatFloat('0.00',DM.ibqConsulta2.Fields[3].AsFloat));
      Subitems.Add(FormatFloat('0.00',DM.ibqConsulta2.Fields[4].AsFloat));
      Subitems.Add(FormatFloat('0.00',DM.ibqConsulta2.Fields[5].AsFloat));
      Subitems.Add(FormatFloat('0.00',DM.ibqConsulta2.Fields[6].AsFloat));
      DM.ibqConsulta2.Next;
    end;
  end;

  edtTotal.Text := FormatFloat('0.00', DM.TotalGastosConsorcio(Consorcio, Mes, Anio));

  for I := 0 to Lista.Items.Count - 1 do
  begin
    Gasto := DM.ObtenerGastosDeptos(Consorcio, Lista.Items[I].SubItems[0], Mes, Anio);
    Lista.Items[I].SubItems.Add( FormatFloat('0.00',Gasto ));
  end;
end;

procedure TfrmLiquidacionDeptos.cbMesChange(Sender: TObject);
begin
  dm.ibqConsulta2.Close;
  Dm.ibqConsulta2.SQL.text := 'Select * from conceptos where 1=2';
  dm.ibqConsulta2.Open;
  btnConsultar.Click;
end;

procedure TfrmLiquidacionDeptos.cbAnioChange(Sender: TObject);
begin
  dm.ibqConsulta2.Close;
  Dm.ibqConsulta2.SQL.text := 'Select * from conceptos where 1=2';
  dm.ibqConsulta2.Open;
  btnConsultar.click;
end;

procedure TfrmLiquidacionDeptos.listaClick(Sender: TObject);
var
  Interes: Double;

  function CalcularInteres: Double;
  var
    DiaPago: Integer;
    Mes: double;
    Coeficiente: double;
    Anio: string;
    Fecha: string;
    FechaMes: string;
    EsMesActual: Boolean;
    DiaActual: Integer;
    Interes: Double;
    Capital: Double;

  begin
   //CALCULO DE LOS PUNITORIOS
    EsMesActual := False;

    Mes := (cbMes.ItemIndex + 1);
    Anio := cbAnio.text;
    FechaMes := '01/' + FormatFloat('00', Mes) + '/' + Anio;

    with Dm.ibqConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.add('select Vencimiento, ((Interes/100)/30) as Interes from consorcios where codigo=:codigo');
      Parambyname('codigo').AsString:=edtCodigo.text;
      Open;
      FetchAll;
      DiaPago := Fields[0].AsInteger;

      DiaActual := StrtoInt(FormatDatetime('dd', Now));
      Coeficiente := Fields[1].AsFloat;
    end;

    if Mes = Strtofloat(FormatDatetime('mm', Now)) then
      EsMesActual := true;

    Capital := strToFloat(Lista.selected.Subitems[3]);
    if EsMesActual then
    begin
      if DiaActual > DiaPago then
        Interes := Capital*Coeficiente*DiaActual;
    end
    else
    begin
      DiaActual := Trunc(Now-Strtodatetime(FechaMes));
      Interes := Capital*Coeficiente*DiaActual;
    end;
    Result := Interes;
   end;

begin
  if Lista.Selected = nil then
    Exit;

  Interes := CalcularInteres;

  Lista.Selected.SubItems.Add(Formatfloat('0.00', Interes));

  edtTotal.text := FormatFloat('0.00', Strtofloat(Lista.Selected.SubItems[3]) +Strtofloat(Lista.Selected.SubItems[4]) +Strtofloat(Lista.Selected.SubItems[5]) + Strtofloat(Lista.Selected.SubItems[6])+ Strtofloat(Lista.Selected.SubItems[7]));

end;

end.




