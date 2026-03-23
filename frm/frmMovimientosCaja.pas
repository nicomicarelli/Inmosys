unit frmMovimientosCaja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Numedit, fxQuery, System.Actions, System.UITypes, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TfMovimientosCaja = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
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
    cxGroupBox2: TcxGroupBox;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
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
  fMovimientosCaja: TfMovimientosCaja;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales;

{$R *.DFM}

procedure TfMovimientosCaja.FormActivate(Sender: TObject);
var
  q: TFXQuery;
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
        cbxDatoFijo.Items.Add(Fields[1].AsString);
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
        Edit2.Items.Add(Fields[1].AsString);
        Next;
      end;
    end;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FMovimientosCaja := nil;
end;

procedure TfMovimientosCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TfMovimientosCaja.ValidarDatos: Boolean;
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

procedure TfMovimientosCaja.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TfMovimientosCaja.edtFechaExit(Sender: TObject);
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

procedure TfMovimientosCaja.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMovimientosCaja.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TfMovimientosCaja.actNuevoExecute(Sender: TObject);
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

procedure TfMovimientosCaja.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  idTransaccion: Integer;
begin
  q := CrearQuery;

  DM.IniciarTransaccion;
  try
    try
      q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
      Q.Open;

      idtransaccion := q.fieldbyname('id').AsInteger;

      InsertarCaja(IDTransaccion,
                   edtFecha.Text,
                   edtCodinq.Text,
                   'MA',
                   'M',
                   Inttostr(IDTransaccion));


      if rdbSale.Checked then
          InsertarCajaDetalles(IDTransaccion,
                   edtCodinq.Text,
                   edtCodigo.Text,
                   edtFecha.Text,
                   '1',
                   'EGRESO DE CAJA',
                   edtDescripcion.Text,
                   '0.00',
                   FormatFloat('0.00', TOFloat(edtImporte.Text)),
                   -1)
        else
          InsertarCajaDetalles(IDTransaccion,
                   edtCodinq.Text,
                   edtCodigo.Text,
                   edtFecha.Text,
                   '1',
                   'INGRESO DE CAJA',
                   edtDescripcion.Text,
                   FormatFloat('0.00', TOFloat(edtImporte.Text)),
                   '0.00', -1);
        DM.ConfirmarTransaccion;
        MostrarDIalogoAceptar('Movimiento de caja guardado correctamente.');
        Close;
    Except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;


procedure TfMovimientosCaja.DatosKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMovimientosCaja.edtCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Coditem: string;
  Nro:     string;
  q: TFXQuery;

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
            nro   := Fields[2].AsString;
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

procedure TfMovimientosCaja.edtCodinqEnter(Sender: TObject);
begin
  if length(edtCodinq.Text) = 0 then
    edit2.Text := '';

end;

procedure TfMovimientosCaja.edtCodinqKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;

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
          Edit2.Text := Fields[1].AsString;
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

procedure TfMovimientosCaja.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfMovimientosCaja.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfMovimientosCaja.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;

begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtDescripcion.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from RazonesSociales where codigo=:Codigo';
    q.ParamByName('Codigo').AsString := pCodigo;
    q.Open;

    edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
    edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMRazonesSociales) then
      FABMRazonesSociales.ActualizarClick(nil);
  end;
end;

procedure TfMovimientosCaja.cbxDatoFijoClick(Sender: TObject);
var
  Codigo: string;
  Fecha:  string;
  Numero: string;
  ibqConsulta: TFXQuery;

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
      edtCodigo.Text := Fields[0].AsString;
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
          Numero := Fields[2].AsString;
          if ValidarDatoFijo(Fecha,Numero) then
          begin
            cbxDatoFijo.Text := Fields[1].AsString;
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
