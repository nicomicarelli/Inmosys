unit frmMovimientosCtactePropietario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Numedit, System.Actions, fxQuery, System.UITypes, AdvGlowButton;

type
  TfMovimientosCtaCtePropietario = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Panel3: TPanel;
    popOrdenar: TPopupMenu;
    Ordenar1: TMenuItem;
    Cdigo1: TMenuItem;
    Descripcin1: TMenuItem;
    Destino1: TMenuItem;
    lblCodigo: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtFecha: TEdit;
    edtDescripcion: TEdit;
    edtCodigo: TEdit;
    cbxDatoFijo: TComboBox;
    rdbEntra: TRadioButton;
    rdbSale: TRadioButton;
    edit2: TComboBox;
    edtCodinq: TEdit;
    edtImporte: TNumEdit;
    edtRegistro: TEdit;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure edtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodinqEnter(Sender: TObject);
    procedure edtCodinqKeyPress(Sender: TObject; var Key: Char);
    procedure edtFechaExit(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  fMovimientosCtaCtePropietario: TfMovimientosCtaCtePropietario;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmABMCtaCteInquilinos, frmMovimientosCtacte, frmABMCtaCtePropietarios;

{$R *.DFM}

procedure TfMovimientosCtaCtePropietario.FormActivate(Sender: TObject);
var
  q: tFXQuery;
begin
  q := CrearQuery;
  try
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.add('select * from conceptos order by descripcion');
      Open;
      cbxDatoFijo.Items.Clear;
      while not eof do
      begin
        cbxDatoFijo.Items.Add(FieldByName('Descripcion').AsString);
        Next;
      end;
    end;

    with q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from inmuebles ');
      Open;

      Edit2.Items.Clear;
      Edit2.Text :='';
      while not eof do
      begin
        Edit2.Items.Add(FieldByName('Inquilino').AsString);
        Next;
      end;
    end;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosCtaCtePropietario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FMovimientosCtactePropietario := nil;
end;

procedure TfMovimientosCtaCtePropietario.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TfMovimientosCtaCtePropietario.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripción. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

procedure TfMovimientosCtaCtePropietario.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TfMovimientosCtaCtePropietario.edtFechaExit(Sender: TObject);
begin
  try
    strToDate(edtFecha.Text);
  except
    on e: exception do
    begin
      MostrarDIalogoAceptar('La fecha es inválida. Verifique por favor.');
      edtFecha.Text := Formatdatetime('dd/mm/yyyy', Now);
    end;
  end;

end;

procedure TfMovimientosCtaCtePropietario.edtFechaKeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
begin
  Fecha := EdtFecha.Text;
  if Key = #13  then
  begin
    EdtFecha.Text := FechaCorrecta(Fecha);
    EdtCodinq.SetFocus;
  end;
end;

procedure TfMovimientosCtaCtePropietario.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TfMovimientosCtaCtePropietario.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
  begin
    if TWinControl.ClassNameIs('TEdit') then
    begin
      Self.Controls[I].Enabled := True;
      TEdit(Self.Controls[I]).Text    := '';
    end;
    if TWinControl.ClassNameIs('TCombobox') then
      TCombobox(Self.Controls[I]).ItemIndex := -1;
  end;
end;

procedure TfMovimientosCtaCtePropietario.actGrabarExecute(Sender: TObject);
var
  q: tFXQuery;
  Propietario: string;
begin
  q := CrearQuery;
  try
    q.sql.text := 'Select Propietario From Inmuebles where Codinq = :Codinq';
    q.ParamByName('Codinq').AsString := edtCodinq.text;
    Q.Open;

    Propietario := q.FieldByName('Propietario').AsString;

    if fOperacion = toNuevo then
    else
    begin
      q.sql.text :=
        ' UPDATE CTACTEPROPIETARIO '+
        '    SET CODINQ = :Codinq, '+
        '        FECHA = :Fecha, '+
        '        ITEM = :Item, '+
        '        PERIODO = :Periodo, '+
        '        DEBE = :Debe ,'+
        '        HABER = :Haber,'+
        '        CODPRO = :CodPro, '+
        '        CODITEM = :Coditem, '+
        '        USUARIO = :Usuario '+
        '  WHERE REGISTRO = :Registro';
      q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(edtCodinq.text));
      q.ParambyName('Fecha').AsDatetime := StrToDateTime(edtFecha.text);
      q.ParambyName('Item').AsString := cbxDatoFijo.text;
      q.ParambyName('Periodo').AsString := edtDescripcion.text;
      if rdbEntra.Checked then
      begin
        q.ParambyName('Debe').AsFloat := ToFloat(edtImporte.Text);
        q.ParambyName('Haber').AsFloat := 0;
      end
      else
      begin
        q.ParambyName('Haber').AsFloat := ToFloat(edtImporte.Text);
        q.ParambyName('Debe').AsFloat := 0;
      end;
      q.ParambyName('CodPro').AsString := Propietario;
      q.ParambyName('CodItem').AsString := edtCodigo.Text;
      q.ParambyName('Usuario').AsString := fPrincipal.fUsuario;
      q.ParambyName('Registro').AsInteger := ToInt(edtRegistro.Text);
      q.ExecSQL();
    end;

    MostrarDIalogoAceptar('Movimiento en cta cte guardado correctamente.');
    Close;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosCtaCtePropietario.actBorrarExecute(Sender: TObject);
var
  q: tFXQuery;

begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
  begin
    DM.IniciarTransaccion;
    q := CrearQuery;
    try
      try
        q.SQL.Text := ' Delete from CtaCtePropietario where Registro = :Registro';
        q.ParamByName('Registro').AsInteger := ToInt(edtRegistro.Text);
        q.ExecSQL();
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Movimiento Eliminado correctamente.');
        Close;
        if Assigned(fAbMCtaCtePropietarios) then
          fAbMCtaCtePropietarios.ActualizarClick(nil);

      except
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Inmosys', 'Ocurrio un error al eliminar el elemento.', mtError);
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

procedure TfMovimientosCtaCtePropietario.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: tFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        if Length(edtCodigo.Text) = 1 then
          edtCodigo.Text := '0' + edtCodigo.Text;
        edtDescripcion.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from RazonesSociales where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe una Razon Social con ese Código. Verifique por favor.', mtInformation);
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
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosCtaCtePropietario.edtCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Coditem: string;
  Nro:     string;
  q: tFXQuery;

begin
  q := CrearQuery;
  try
    if key=#13 then
    begin
      Coditem := edtCodigo.Text;
      if edtCodigo.Text <> '' then
      begin
        if length(Coditem) = 1 then
          Coditem := '0' + Coditem;
        edtCodigo.text := Coditem;
        with q do
        begin
          Sql.Text := 'select * from conceptos where codigo= :codigo';
          ParamByName('codigo').AsString := Coditem;
          Open;
          if not isEmpty then
          begin
            nro   := FieldByName('InqProp').AsString;
          end
          else
          begin
            edtCodigo.text := '';
            MostrarDialogoAceptar('El item no existe. Verifique por favor.');
          end;
        end;
        cbxDatoFijo.Text := q.Fieldbyname('Descripcion').AsString;
        edtDescripcion.setfocus;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosCtaCtePropietario.edtCodinqEnter(Sender: TObject);
begin
  if length(edtCodinq.Text) = 0 then
    edit2.Text := '';

end;

procedure TfMovimientosCtaCtePropietario.edtCodinqKeyPress(Sender: TObject; var Key: Char);
var
  q: tFXQuery;

begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      if edtCodinq.Text = '' then
        Exit;

      edtCodinq.Text := FormatFLoat('0000', ToFloat(edtCodinq.Text));
      with q do
      begin
        Close;
        Sql.clear;
        Sql.Add('select * from inmuebles where codinq=:codinq');
        ParamByName('codinq').AsString := edtCodinq.Text;
        Open;
        if not IsEmpty then
        begin
          Edit2.Text := FieldByName('Inquilino').AsString;
          edtImporte.SetFocus;
        end
        else
        begin
          Edit2.Text := '';
          Showmessage('Inmueble correspondiente al inquilino '+ edtCodinq.text +' No cargado');
        end;
      end;
      edtCodigo.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosCtaCtePropietario.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfMovimientosCtaCtePropietario.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfMovimientosCtaCtePropietario.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: tFXQuery;
  Tecla: Char;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtDescripcion.Text := '';
  end
  else
  begin
    q := CrearQuery;
    try
      q.SQL.Text :=
        ' Select C.Fecha, C.Codinq, I.Inquilino, C.Coditem, C.Item, C.Periodo, C.Debe, C.Haber, C.Registro ' +
        '   From CtaCtePropietario C ' +
        '  Inner Join Inmuebles I on I.Codinq = C.Codinq ' +
        '  where C.Registro = :Codigo';
      q.ParamByName('Codigo').AsString := pCodigo;
      q.Open;

      edtFecha.Text := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
      edtCodinq.Text := q.FieldByName('Codinq').AsString;
      edtRegistro.Text := q.FieldByName('Registro').AsString;
      Tecla := #13;
      edtCodinqKeyPress(nil, Tecla);
      edtCodigo.Text := q.FieldByName('Coditem').AsString;
      edtCodigoKeyPress(nil, tecla);
      edtDescripcion.Text := q.FieldByName('Periodo').AsString;

      if q.FieldByName('Debe').AsFloat = 0 then
        edtImporte.text := FormatFloat('0.00', q.FieldByName('Haber').AsFloat)
      else
        edtImporte.text := FormatFloat('0.00', q.FieldByName('Debe').AsFloat);

      rdbEntra.Checked := q.FieldByName('Debe').AsFloat > 0.001;
      rdbSale.Checked  := q.FieldByName('Haber').AsFloat > 0.001;
    finally
      FreeAndNil(q);
    end;

    if Operacion = toEliminar then
    begin
      actBorrar.Execute;
    end;
  end;
end;

procedure TfMovimientosCtaCtePropietario.cbxDatoFijoClick(Sender: TObject);
var
  Codigo: string;
  Fecha:  string;
  Numero: string;
  ibqConsulta: tFXQuery;

begin
  ibqConsulta := CrearQuery;
  try
    with ibqConsulta do
    begin
      Close;
      Sql.clear;
      Sql.add('Select * from conceptos where descripcion=:descripcion');
      ParamByName('descripcion').AsString := cbxDatoFijo.Text;
      Open;
      edtCodigo.Text := FieldByName('Codigo').AsString;
      Codigo := edtCodigo.Text;
      if edtCodigo.Text<>'' then
      begin
        if Length(Codigo) = 1 then
          Codigo := '0' + Codigo;
        Close;
        Sql.clear;
        Sql.Add('select * from conceptos where codigo=:codigo');
        ParamByName('codigo').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Numero := FieldByName('InqProp').AsString;
          if ValidarDatoFijo(Fecha,Numero) then
          begin
            cbxDatoFijo.Text := FieldByName('Descripcion').AsString;
          end
          else
          begin
            edtCodigo.Text   := '';
            cbxDatoFijo.Text := '';
            messagedlg('Dato fijo invalido para este caso'+#13+'Por favor Verifique...',mtwarning,[mbOk],0);
            edtCodigo.setfocus;
          end;
          if edtCodigo.Text = '' then
            cbxDatoFijo.Text := '';
        end;
      end;
    end;
  finally
    FreeAndNil(ibqConsulta);
  end;
end;

end.




