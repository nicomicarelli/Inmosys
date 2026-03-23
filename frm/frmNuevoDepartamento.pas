unit frmNuevodepartamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, frmDatos, Declaraciones, SQLExpr,
  System.Actions, FXQuery;

type
  TfrmNuevoDepartamento = class(TForm)
    Panel2: TPanel;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    lblInquilinoPropietario: TLabel;
    lblListadoInforme: TLabel;
    edtCodigo: TEdit;
    edtDepto: TEdit;
    edtPH: TEdit;
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Edit2: TMaskEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtNombreP: TMaskEdit;
    Label3: TLabel;
    edtDireccionP: TMaskEdit;
    Label4: TLabel;
    edtDniP: TMaskEdit;
    Label5: TLabel;
    edtTelefonoP: TMaskEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtNombreI: TMaskEdit;
    edtDireccionI: TMaskEdit;
    edtDniI: TMaskEdit;
    edtTelefonoI: TMaskEdit;
    edtPorcentaje: TMaskEdit;
    Panel1: TPanel;
    Label1: TLabel;
    lblContratoVencido2: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edtDeptoKeyPress(Sender: TObject; var Key: Char);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actModificarExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure actBorrarUpdate(Sender: TObject);
    procedure r(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    class procedure Ejecutar;
    procedure Cargar(pCodigo, pDepto: string; Operacion: TTipoOperacion);
  end;

var
  fNuevoDepartamento: TfrmNuevoDepartamento;

implementation

uses ABMDepartamentos, frmprincipal;


{$R *.DFM}

procedure TfrmNuevoDepartamento.Cargar(pCodigo, pDepto: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edit2.text := '';
    edtDepto.text := '';
    edtPh.text := '';
    edtPorcentaje.text := '';
    edtNombreP.text := '';
    edtDireccionP.text := '';
    edtDniP.text := '';
    edtTelefonoP.text := '';
    edtNombreI.text := '';
    edtDireccionI.text := '';
    edtDniI.text := '';
    edtTelefonoI.text := '';
  end;

  if Operacion = toModificar then
  begin
    edtDepto.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select D.*, C.Nombre from DepartamentosXConsorcio D Inner Join Consorcios C on C.COdigo=D.COdCOnsorcio where codConsorcio=:Codigo and Depto =:Depto';
    q.ParamByName('Codigo').AsString := pCodigo;
    q.ParamByName('Depto').AsString := pDepto;
    q.Open;

    edtCodigo.Text               := q.FieldbyName('CodConsorcio').asstring;
    edit2.Text                   := q.Fieldbyname('Nombre').asstring;
    edtDepto.Text                := q.FieldbyName('Depto').asstring;
    edtPh.Text                   := q.FieldbyName('PH').asstring;
    edtPorcentaje.Text           := FormatFloat('0.000', q.FieldbyName('Porcentaje').asFloat);

    edtNombreP.Text              := q.FieldbyName('Propietario').asstring;
    edtDireccionP.Text           := q.FieldbyName('DirPropietario').asstring;
    edtDniP.Text                 := q.FieldbyName('DniPropietario').asstring;
    edtTelefonoP.Text            := q.FieldbyName('TelPropietario').asstring;

    edtNombreI.Text              := q.FieldbyName('Inquilino').asstring;
    edtDireccionI.Text           := q.FieldbyName('DirInquilino').asstring;
    edtDniI.Text                 := q.FieldbyName('DniInquilino').asstring;
    edtTelefonoI.Text            := q.FieldbyName('TelInquilino').asstring;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edit2.Enabled  := (Operacion in  [toNuevo]);
    edtDepto.Enabled  := (Operacion in  [toNuevo]);

    edtPH.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtPorcentaje.Enabled  := (Operacion in  [toNuevo, toModificar]);

    edtNombreP.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDireccionP.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDNIP.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtTelefonoP.Enabled  := (Operacion in  [toNuevo, toModificar]);

    edtNombreI.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDireccionI.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtDNII.Enabled  := (Operacion in  [toNuevo, toModificar]);
    edtTelefonoI.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMDepartamentos) then
      FABMDepartamentos.ActualizarClick(nil);
  end;
end;

procedure TfrmNuevoDepartamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevoDepartamento := nil;
end;

procedure TfrmNuevoDepartamento.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfrmNuevoDepartamento.FormActivate(Sender: TObject);
begin
  edtCodigo.setFocus;
end;

procedure TfrmNuevoDepartamento.edtDeptoKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtPH.text) = '' then
     EdtPH.SetFocus;
end;

procedure TfrmNuevoDepartamento.actGrabarExecute(Sender: TObject);
var
  Codigo:       string;
  Depto:       string;
  Ph:    string;
  Porcentaje: Double;
  NombreP:      string;
  DireccionP:   string;
  DNIP:         string;
  TelefonoP:    string;
  NombreI:      string;
  DireccionI:   string;
  DNII:         string;
  TelefonoI:    string;

begin

  Codigo     := edtCodigo.text;
  Depto      := edtDepto.text;
  ph         := edtph.text;
  Porcentaje := Strtofloat(edtPorcentaje.text);
  NombreP    := edtNombreP.text;
  DireccionP := edtDireccionP.text;
  DNIP       := edtDNIP.text;
  TelefonoP  := edtTelefonoP.text;
  NombreI    := edtNombreI.text;
  DireccionI := edtDireccionI.text;
  DNII       := edtDNII.text;
  TelefonoI  := edtTelefonoI.text;

  if DM.GrabarDeptosConsorcios(Codigo, Depto, ph, Porcentaje, NombreP, DireccionP, DNIP, TelefonoP,NombreI, DireccionI, DNII, TelefonoI) then
  begin
    MostrarDialogoAceptar('Información','El Departamento se grabo satisfactoriamente',mtInformation);
    edtCodigo.Text             := '';
    edit2.Text                 := '';
    edtDepto.Text              := '';
    edtPH.Text                 := '';
    edtPorcentaje.Text         := '';
    edtNombreP.Text            := '';
    edtDireccionP.Text         := '';
    edtDNIP.Text               := '';
    edtTelefonoP.Text          := '';
    edtNombreI.Text            := '';
    edtDireccionI.Text         := '';
    edtDNII.Text               := '';
    edtTelefonoI.Text          := '';
    edtCOdigo.SetFocus;
    if Assigned(FABMDepartamentos) then
      FABMDepartamentos.ActualizarClick(nil);
  end;
end;

procedure TfrmNuevoDepartamento.actBorrarExecute(Sender: TObject);
var
  I:      Integer;
  Codigo: String;
  Depto: String;
begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
  begin
    Codigo := EdtCodigo.Text;
    Depto := Edtdepto.Text;
    DM.BuscarDepartamentoConsorcioPorCodigo(Codigo, Depto,'Borrar');
    for I := 1 to Self.ControlCount - 1 do
    begin
      if (Self.Controls[I].ClassNameIs('TEdit')) or (Self.Controls[I].ClassNameIs ('TMaskEdit')) then
      begin
        TEdit(Self.Controls[I]).Text     := '';
        TMaskEdit(Self.Controls[I]).Text := '';
      end;
    end;

    edtCodigo.text         := '';
    edtDepto.text          := '';
    edit2.text             := '';
    edtPH.text             := '';
    edtPorcentaje.text     := '0.000';
    edtNombreP.text        := '';
    edtDireccionP.text     := '';
    edtDNIP.text           := '';
    edtTelefonoP.text      := '';
    edtNombreI.text        := '';
    edtDireccionI.text     := '';
    edtDNII.text           := '';
    edtTelefonoI.text      := '';
  end;
end;

procedure TfrmNuevoDepartamento.DatosKeyPress(Sender: TObject; var Key: Char);
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
        edtDepto.SetFocus;
        With Q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from Consorcios where Codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          With q do
          begin
            edtCodigo.Text             := FieldByName('Codigo').asstring;
            edit2.Text                 := FieldByName('Nombre').asstring;
  //          edtDepto.Text              := FieldByName('Nombre').asstring;
  //          edtph.Text                 := FieldByName('Direccion').asstring;
  //          edtPorcentaje.Text         := FieldByName('CodigoPostal').asstring;
          end;
          actModificar.Execute;
        end
        else
        begin
          MostrarDIalogoAceptar('El consorcio no existe. Verifique Por Favor.');
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
        end;
        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus;
      end;
      if not (Key in ['0'..'9', #8]) then
        Key := #0;
    end;

    if (TWinControl(Sender).Name = 'edtDepto') then
    begin
      if Key = #13 then
        edtPH.SetFocus;
    end;

    if (TWinControl(Sender).Name = 'edtPH') then
    begin
      if Key = #13 then
        edtPorcentaje.SetFocus;
    end;

    if (TWinControl(Sender).Name = 'edtPorcentaje') then
    begin
       if not (Key in ['0'..'9', #8,#13,',','.']) then
         Key := #0;
       if Key = '.' then
        Key := ',';

       if Key = #13 then
        edtNombreP.SetFocus;
    end;

    if (TWinControl(Sender).Name = 'edtNombreP') then
    begin
      if Key = #13 then
        edtDireccionP.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtDireccionP') then
    begin
      if Key = #13 then
        edtDniP.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtDniP') then
    begin
      if Key = #13 then
        edtTelefonoP.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtTelefonoP') then
    begin
      if Key = #13 then
        edtNombreI.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtNombreI') then
    begin
      if Key = #13 then
        edtDireccionI.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtDireccionI') then
    begin
      if Key = #13 then
        edtDNII.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtDniI') then
    begin
      if Key = #13 then
        edtTelefonoI.SetFocus;
    end;
    if (TWinControl(Sender).Name = 'edtTelefonoI') then
    begin
      if Key = #13 then
        actGrabar.execute;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmNuevoDepartamento.actModificarExecute(Sender: TObject);
begin
  DM.BuscarConsorcioPorCodigo(edtCodigo.Text,'');
end;

class procedure TfrmNuevoDepartamento.Ejecutar;
begin
end;

procedure TfrmNuevoDepartamento.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNuevoDepartamento.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNuevoDepartamento.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfrmNuevoDepartamento.r(Sender: TObject);
var
  Codigo: Double;
begin
  if Trim(edtCodigo.text) = '' then
    Exit;
    
  Codigo := Strtofloat(edtCodigo.text);
  edtCodigo.Text := Formatfloat('00', Codigo);
end;

end.
