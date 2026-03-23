unit frmNuevoConsorcio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, FrmDatos, Declaraciones, sqlExpr,
  System.Actions, fxQuery;

type
  TfNuevoConsorcio = class(TForm)
    Panel2: TPanel;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    lblInquilinoPropietario: TLabel;
    lblListadoInforme: TLabel;
    edtCodigo: TEdit;
    edtNombre: TEdit;
    edtDireccion: TEdit;
    edtCodigoPostal: TEdit;
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    lblContratoVencido2: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNombreKeyPress(Sender: TObject; var Key: Char);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actModificarExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure actBorrarUpdate(Sender: TObject);
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
  fNuevoConsorcio: TfNuevoConsorcio;

implementation

uses frmprincipal, frmABMDatosFijos;

{$R *.DFM}

procedure TFNuevoConsorcio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevoConsorcio := nil;
end;

procedure TfNuevoConsorcio.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfNuevoConsorcio.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtNombre.Text := '';
    edtDireccion.Text := '';
    edtCodigoPostal.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtNombre.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from Consorcios where codigo=:Codigo';
    q.ParamByName('Codigo').AsString := pCodigo;
    q.Open;

    edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
    edtNombre.Text               := q.Fieldbyname('Nombre').asstring;
    edtDireccion.Text            := q.FieldbyName('Direccion').asstring;
    edtCodigoPostal.Text         := q.FieldbyName('CodigoPostal').asstring;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtNombre.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDireccion.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtCodigoPostal.Enabled  := (Operacion in  [toNuevo, toModificar]);
  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
  end;
end;

procedure TFNuevoConsorcio.edtNombreKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDireccion.text) = '' then
     EdtDireccion.SetFocus;
end;

procedure TFNuevoConsorcio.actGrabarExecute(Sender: TObject);
var
  Codigo:       string;
  Nombre:       string;
  Direccion:    string;
  CodigoPostal: string;
  Sobre:        string;

begin
  Codigo       := edtCodigo.text;
  Nombre       := edtNombre.text;
  Direccion    := edtDireccion.text;
  CodigoPostal := edtCodigoPostal.text;

  if DM.GrabarConsorcios(Codigo, Nombre, Direccion, CodigoPostal) then
  begin
    edtCodigo.Text               := '';
    edtNombre.Text               := '';
    edtDireccion.Text            := '';
    edtCodigoPostal.Text         := '';
  end;

  if Assigned(fabmConsorcios) then
    fAbmConsorcios.ActualizarClick(nil);
end;

procedure TFNuevoConsorcio.actBorrarExecute(Sender: TObject);
var
  I:      Integer;
  Codigo: String;
  Transaccion: TTransactionDesc;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
  begin
    if DM.Conexion.InTransaction then
      DM.Conexion.Rollback;
    DM.Conexion.StartTransaction;
    try
      Codigo := EdtCodigo.Text;
      DM.BuscarConsorcioPorCodigo(Codigo,'Borrar');
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
      edtDireccion.text            := '';
      edtCodigoPostal.text         := '';

      DM.Conexion.Commit;
    except
      MostrarDialogoAceptar('Inmosys', 'Ocurrio un error al eliminar el Consorcio.', mtError);
      DM.Conexion.Rollback;
    end;
  end;
end;

procedure TFNuevoConsorcio.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        if Length(edtCodigo.Text) = 1 then
          edtCodigo.Text := '0' + edtCodigo.Text;
        edtNombre.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from consorcios where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe un Consorcio con ese Código. Verifique por favor.', mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
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
      begin
        if edtNombre.Text = '' then
          edtNombre.SetFocus
        else
        begin
          edtDireccion.SetFocus;
        end;
      end;
    end;

    if (TWinControl(Sender).Name = 'edtDireccion') then
    begin
      if Key = #13 then
        if edtDireccion.Text = '' then
          edtDireccion.SetFocus
        else
        begin
          edtCodigoPostal.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtCodigoPostal') then
    begin
      if Key = #13 then
        if edtCodigoPostal.Text = '' then
          edtCodigoPostal.SetFocus
        else
        begin
          if fOperacion = toMostrar then
            Exit;
          btnGrabar.setfocus;
        end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoConsorcio.actModificarExecute(Sender: TObject);
begin
  DM.BuscarConsorcioPorCodigo(edtCodigo.Text,'');
end;

class procedure TFNuevoConsorcio.Ejecutar;
begin
  with TFNuevoConsorcio.Create(Application) do
    ShowModal;
end;

procedure TFNuevoConsorcio.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfNuevoConsorcio.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNuevoConsorcio.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TFNuevoConsorcio.r(Sender: TObject);
var
  Codigo: Double;
begin
  if Trim(edtCodigo.text) = '' then
    Exit;
    
  Codigo := Strtofloat(edtCodigo.text);
  edtCodigo.Text := Formatfloat('00000', Codigo);
end;

end.
