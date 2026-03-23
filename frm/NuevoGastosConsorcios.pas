unit NuevoGastosConsorcios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Declaraciones, sqlExpr, fxQuery,
  System.Actions;

type
  TfrmNuevoGastoConsorcio = class(TForm)
    Panel2: TPanel;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    edtCodigo: TEdit;
    edtNombre: TEdit;
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actModificarExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure r(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    { Private declarations }
  public
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    class procedure Ejecutar;
  end;

var
  frmNuevoGastoConsorcio: TfrmNuevoGastoConsorcio;

implementation

uses frmdatos, ABMGastosConsorcios, frmprincipal;

{$R *.DFM}

procedure TfrmNuevoGastoConsorcio.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtNombre.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtNombre.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from conceptosConsorcios where codigo=:Codigo';
    q.ParamByName('Codigo').AsString := pCodigo;
    q.Open;

    edtCodigo.Text          := q.FieldbyName('Codigo').asstring;
    edtNombre.Text          := q.Fieldbyname('Descripcion').asstring;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtNombre.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMGastosConsorcios) then
      FABMGastosConsorcios.ActualizarClick(nil);
  end;
end;


procedure TfrmNuevoGastoConsorcio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmNuevoGastoConsorcio := nil;
end;

procedure TfrmNuevoGastoConsorcio.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfrmNuevoGastoConsorcio.actGrabarExecute(Sender: TObject);
var
  Codigo:       string;
  Nombre:       string;
  Direccion:    string;
  CodigoPostal: string;
  Sobre:        string;

begin
  Codigo       := edtCodigo.text;
  Nombre       := edtNombre.text;

  if DM.GrabarConceptosConsorcios(Codigo, Nombre) then
  begin
    MostrarDialogoAceptar('El Concepto de gastos se grabo satisfactoriamente.');
    edtCodigo.Text               := '';
    edtNombre.Text               := '';
  end;

  if Assigned(fABMGastosConsorcios) then
    fABMGastosConsorcios.ActualizarClick(nil);

end;

procedure TfrmNuevoGastoConsorcio.actBorrarExecute(Sender: TObject);
var
  I:      Integer;
  Codigo: String;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
  begin
    Codigo := EdtCodigo.Text;
    DM.BuscarGastoConsorcioPorCodigo(Codigo,'Borrar');
    for I := 1 to Self.ControlCount - 1 do
    begin
      if (Self.Controls[I].ClassNameIs('TEdit')) or (Self.Controls[I].ClassNameIs ('TMaskEdit')) then
      begin
        TEdit(Self.Controls[I]).Text     := '';
        TMaskEdit(Self.Controls[I]).Text := '';
      end;
    end;

    edtCodigo.text               := '';
    edtNombre.text               := '';
  end;
end;

procedure TfrmNuevoGastoConsorcio.DatosKeyPress(Sender: TObject; var Key: Char);
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
        edtNombre.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from ConceptosConsorcios where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          actModificar.Execute;
          With DM.ibqConsulta do
          begin
            edtCodigo.Text               := FieldByName('Codigo').asstring;
            edtNombre.Text               := FieldByName('Descripcion').asstring;
          end;
        end
        else
        begin
          actNuevo.Execute;
          edtNombre.Text         := '';
        end;
        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus;
      end;
      if not (Key in ['0'..'9', #8]) then
        Key := #0;
    end;
    if (TWinControl(Sender).Name = 'edtNombre') then
    begin
      if Key = #13 then
        actGrabar.Execute;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmNuevoGastoConsorcio.actModificarExecute(Sender: TObject);
begin
  DM.BuscarConsorcioPorCodigo(edtCodigo.Text,'');
end;

class procedure TfrmNuevoGastoConsorcio.Ejecutar;
begin
end;

procedure TfrmNuevoGastoConsorcio.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNuevoGastoConsorcio.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNuevoGastoConsorcio.r(Sender: TObject);
var
  Codigo: Double;
begin
  if Trim(edtCodigo.text) = '' then
    Exit;

  Codigo := Strtofloat(edtCodigo.text);
  edtCodigo.Text := Formatfloat('00000', Codigo);
end;

end.
