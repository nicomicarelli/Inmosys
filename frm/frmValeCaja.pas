unit frmValeCaja;

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
  TfValeCaja = class(TForm)
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
    Label6: TLabel;
    edtCodigo: TEdit;
    cbxDatoFijo: TComboBox;
    rdbEntra: TRadioButton;
    rdbSale: TRadioButton;
    cxGroupBox2: TcxGroupBox;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure edtCodinqKeyPress(Sender: TObject; var Key: Char);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigoVale: Integer; pLinea: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
    procedure prInicializar(var FCodigoVale: Integer; var FIncrementa: Boolean);
  end;

var
  fValeCaja: TfValeCaja;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales, frmVales,
  frmPlanillaCaja;

{$R *.DFM}

procedure TfValeCaja.FormActivate(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.add('select * from cabezaVales where cerrado = 0 order by descripcion');
      Open;
      cbxDatoFijo.Items.Clear;
      while not eof do
      begin
        cbxDatoFijo.Items.Add(Fields[1].AsString);
        Next;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfValeCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FValeCaja := nil;
end;

procedure TfValeCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfValeCaja.prInicializar(var FCodigoVale: Integer; var FIncrementa: Boolean);
begin
  edtCodigo.Text := Inttostr(fCodigoVale);
  rdbEntra.Checked := FIncrementa;
  rdbSale.Checked := not rdbEntra.Checked;
end;

function TfValeCaja.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

procedure TfValeCaja.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TfValeCaja.actNuevoExecute(Sender: TObject);
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

procedure TfValeCaja.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  idTransaccion: string;
  ndEntra, ndSale: Double;
begin
  if MostrarDialogoSiNo('Todos los items seleccionados tomarán los mismos parámetros. ¿Desea continuar?') then
  begin
    fPlanillaCaja.FCodigoVale := ToInt(edtCodigo.Text);
    FPlanillaCaja.FIncrementa := rdbEntra.Checked;

    if fPlanillaCaja.FCodigoVale < 1 then
    begin
      MostrarDialogoAceptar('Debe seleccionar un vale');
      ModalResult := mrNone;
      Exit;
    end;
  end;
end;


procedure TfValeCaja.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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
          Sql.Text := 'select Descripcion from CabezaVales where codigo= :codigo';
          ParamByName('codigo').AsString := Coditem;
          Open;
          if not isEmpty then
          begin
            nro   := FieldbyName('Descripcion').AsString;
          end
          else
          begin
            edtCodigo.text := '';
            MostrarDialogoAceptar('El vale no existe. Verifique por favor.');
          end;
        end;
        cbxDatoFijo.Text := q.Fieldbyname('Descripcion').AsString;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfValeCaja.edtCodinqKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;

begin
(*  q := CrearQuery;
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
  end; *)
end;

procedure TfValeCaja.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TfValeCaja.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfValeCaja.Cargar(pCodigoVale: Integer; pLinea: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  Tecla: Char;
begin
(*  Tecla := #13;
  FOperacion := Operacion;
  FCodigoVale:= pCodigoVale;
  FLinea:= pLinea;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
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
      if q.FieldbyName('Entra').AsFloat > 0 then
      begin
        edtImporte.Text := FOrmatFloat('0.00', q.FieldbyName('Entra').AsFloat);
        rdbEntra.Checked := True;
      end;
      if q.FieldbyName('Sale').AsFloat > 0 then
      begin
        edtImporte.Text := FOrmatFloat('0.00', q.FieldbyName('Sale').AsFloat);
        rdbSale.Checked := True;
      end;
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
  end; *)
end;

procedure TfValeCaja.cbxDatoFijoClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select codigo from Cabezavales where descripcion = :Descripcion ';
    q.ParamByName('descripcion').AsString := cbxDatoFijo.Text;
    q.Open;

    edtCodigo.Text := q.FieldByName('Codigo').AsString;
  finally
    FreeAndNil(q);
  end;
end;

end.
