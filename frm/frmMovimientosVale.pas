unit frmMovimientosVale;

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
  TfMovimientosVale = class(TForm)
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
    edit2: TComboBox;
    edtCodinq: TEdit;
    edtImporte: TNumEdit;
    cxGroupBox2: TcxGroupBox;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    Label1: TLabel;
    edtValorCubierto: TNumEdit;
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
    FCodigoVale: Integer;
    FLinea: Integer;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigoVale: Integer; pLinea: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  fMovimientosVale: TfMovimientosVale;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales, frmVales;

{$R *.DFM}

procedure TfMovimientosVale.FormActivate(Sender: TObject);
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

procedure TfMovimientosVale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FMovimientosVale := nil;
end;

procedure TfMovimientosVale.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TfMovimientosVale.ValidarDatos: Boolean;
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

procedure TfMovimientosVale.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TfMovimientosVale.edtFechaExit(Sender: TObject);
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

procedure TfMovimientosVale.edtFechaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMovimientosVale.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TfMovimientosVale.actNuevoExecute(Sender: TObject);
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

procedure TfMovimientosVale.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  idTransaccion: string;
  ndEntra, ndSale: Double;
begin
  q := CrearQuery;

  DM.IniciarTransaccion;
  try
    try
      if Operacion = toNuevo then
      begin
        idTransaccion := FormatFloat('000', FCodigoVale) +
                         edtCodinq.Text+
                         edtCodigo.text+
                         formatdatetime('yyyymmdd', Date) +
                         edtCodigo.text+ '0';

        q.sql.text := 'Select Max(Linea) + 1 as Linea from CuerpoVales where Codigo = :Codigo';
        q.ParamByName('Codigo').AsInteger := FCodigoVale;
        Q.Open;

        ndEntra:= 0;
        ndSale := 0;

        ndEntra := ToFloat(edtImporte.Text);
        ndSale :=  ToFloat(edtValorCubierto.Text);

        InsertarCuerpoVale(FCodigoVale,
                           q.FieldByName('Linea').AsInteger,
                           edtCodinq.Text,
                           edtCodigo.text,
                           edtDescripcion.Text,
                           StrToDate(edtFecha.Text),
                           ndEntra, ndSale, IdTransaccion, 1,0);
      end
      else
      begin
        idTransaccion := FormatFloat('000', FCodigoVale) +
                         edtCodinq.Text+
                         edtCodigo.text+
                         formatdatetime('yyyymmdd', Date) +
                         edtCodigo.text+ '0';

        q.sql.text := 'Delete from CuerpoVales where Codigo = :Codigo and Linea = :Linea';
        q.ParamByName('Codigo').AsInteger := FCodigoVale;
        q.ParamByName('Linea').AsInteger := FLinea;
        Q.ExecSql;

        ndEntra:= 0;
        ndSale := 0;

        ndEntra := ToFloat(edtImporte.Text);
        ndSale :=  ToFloat(edtValorCubierto.Text);

        InsertarCuerpoVale(FCodigoVale,
                           FLinea,
                           edtCodinq.Text,
                           edtCodigo.text,
                           edtDescripcion.Text,
                           StrToDate(edtFecha.Text),
                           ndEntra, ndSale, IdTransaccion, 1,0);

      end;
      DM.ConfirmarTransaccion;
      MostrarDIalogoAceptar('Movimiento guardado correctamente.');
      if Assigned(fVales) then
        fVales.ActualizarClick(nil);


      Close;
    Except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;


procedure TfMovimientosVale.DatosKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMovimientosVale.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfMovimientosVale.edtCodinqEnter(Sender: TObject);
begin
  if length(edtCodinq.Text) = 0 then
    edit2.Text := '';

end;

procedure TfMovimientosVale.edtCodinqKeyPress(Sender: TObject; var Key: Char);
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
      end;
      edtCodigo.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientosVale.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfMovimientosVale.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfMovimientosVale.Cargar(pCodigoVale: Integer; pLinea: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  Tecla: Char;
begin
  Tecla := #13;
  FOperacion := Operacion;
  FCodigoVale:= pCodigoVale;
  FLinea:= pLinea;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtDescripcion.Text := '';
    FCodigoVale:= pCodigoVale;
  end;

  q := CrearQuery;
  try
    if Operacion = toModificar then
    begin
      q.SQL.Text := 'Select * from CuerpoVales where codigo=:Codigo and Linea = :Linea';
      q.ParamByName('Codigo').AsInteger := pCodigoVale;
      q.ParamByName('Linea').AsInteger := pLinea;
      q.Open;

      edtFecha.Text := FormatDatetime('dd/mm/yyyy', q.FieldbyName('Fecha').AsDatetime);
      edtCodinq.Text := q.FieldbyName('Codinq').AsString;
      edtCodinqKeyPress(nil, Tecla);
      edtCodigo.Text := q.FieldbyName('CodigoItem').AsString;
      edtCodigoKeyPress(nil, Tecla);
      edtCodigo.Enabled := True;
      edtDescripcion.Text := q.FieldbyName('Descripcion').AsString;
      edtImporte.Text := FOrmatFloat('0.00', q.FieldbyName('Entra').AsFloat);
      edtValorCubierto.Text := FOrmatFloat('0.00', q.FieldbyName('Sale').AsFloat);
      edtDescripcion.SetFocus;
    end;

    btnGrabar.Visible            := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled            := (Operacion in  [toNuevo, toModificar]);
    edtDescripcion.Enabled       := (Operacion in  [toNuevo, toModificar]);
  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FVales) then
      FVales.ActualizarClick(nil);
  end;
end;

procedure TfMovimientosVale.cbxDatoFijoClick(Sender: TObject);
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
            MostrarDialogoAceptar('Dato fijo invalido para este caso'+#13+'Por favor Verifique...');
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
