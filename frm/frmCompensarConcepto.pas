unit frmCompensarConcepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Funciones, sqlExpr, DBClient, Provider,
  fxQuery, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  AdvGlowButton, cxGroupBox;

type
  TfCompensarConcepto = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    edItem: TEdit;
    edDescripcion: TEdit;
    Label1: TLabel;
    lbCompensar: TLabel;
    lbMonto: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbDescripcion: TLabel;
    Label4: TLabel;
    edImporte: TEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edItemKeyPress(Sender: TObject; var Key: Char);
    procedure edItemExit(Sender: TObject);
  private
    { Private declarations }
  public
    FMonto: Double;
    FDatoFijo: Integer;
    procedure prInicializar(pDatoFijo: Integer; pMonto: Double);
    { Public declarations }
  end;

var
  fCompensarConcepto: TfCompensarConcepto;

implementation

uses frmprincipal, frmdatos, frmTablero;

{$R *.dfm}

procedure TfCompensarConcepto.btnGrabarClick(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
  stCoditem: string;
  Entra, Sale: Double;
begin
  if Trim(edDescripcion.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe introducir una descripcion');
    Exit;
  end;

  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
      Q.Open;

      idtransaccion := q.fieldbyname('id').AsInteger;

      q.SQL.Text := 'Select descripcion from conceptos where cast(codigo as integer) = :codigo';
      q.ParamByName('Codigo').AsInteger := FDatoFijo;
      q.Open;

      stCoditem := Inttostr(FDatoFijo);
      if Length(stCoditem) = 1 then
        stCoditem := FormatFloat('00', FDatoFijo);

      if FMonto < 0 then
      begin
        Entra := Abs(ToFloat(edImporte.text));
        Sale := 0;
      end
      else
      begin
        Sale := Abs(ToFloat(edImporte.text));
        Entra := 0;
      end;

      InsertarCaja(IDTransaccion,
                   FormatDateTime('dd/mm/yyyy', now),
                   '0000',
                   'MA',
                   'M',
                   Inttostr(IDTransaccion));

      InsertarCajaDetalles(IDTransaccion,
                   '0000',
                   stCodItem,
                   FormatDateTime('dd/mm/yyyy', now),
                   '1',
                   q.FieldByName('Descripcion').AsString,
                   edDescripcion.text,
                   FormatFloat('0.00', Entra),
                   FormatFloat('0.00', Sale),
                   0);

      q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
      Q.Open;

      idtransaccion := q.fieldbyname('id').AsInteger;

      q.SQL.Text := 'Select descripcion from conceptos where cast(codigo as integer) = :codigo';
      q.ParamByName('Codigo').AsInteger := ToInt(edItem.Text);
      q.Open;

      stCoditem := edItem.text;
      if Length(stCoditem) = 1 then
        stCoditem := FormatFloat('00', ToFloat(stCodItem));

      if FMonto < 0 then
      begin
        Sale := Abs(ToFloat(edImporte.text));
        Entra := 0;
      end
      else
      begin
        Entra := Abs(ToFloat(edImporte.text));
        Sale := 0;
      end;

      InsertarCaja(IDTransaccion,
                   FormatDateTime('dd/mm/yyyy', now),
                   '0000',
                   'MA',
                   'M',
                   Inttostr(IDTransaccion));

      InsertarCajaDetalles(IDTransaccion,
                   '0000',
                   stCodItem,
                   FormatDateTime('dd/mm/yyyy', now),
                   '1',
                   q.FieldByName('Descripcion').AsString,
                   edDescripcion.text,
                   FormatFloat('0.00', Entra),
                   FormatFloat('0.00', Sale),
                   0);


      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento generado exitosamente.');
      if Assigned(FTablero) then
        FTablero.ActualizarClick(nil);
      Close;

    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfCompensarConcepto.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfCompensarConcepto.edItemExit(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select descripcion from conceptos where cast(codigo as integer) = :codigo';
    q.ParamByName('Codigo').AsInteger := ToInt(edItem.Text);
    q.Open;

    lbDescripcion.Caption := edItem.Text + ' - ' + q.FieldByName('Descripcion').AsString;
    lbDescripcion.Visible := True;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfCompensarConcepto.edItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',','.',#8,#13]) then
    Key := #0;
end;

procedure TfCompensarConcepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fCompensarConcepto := nil;
  Action := caFree;
end;

procedure TfCompensarConcepto.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfCompensarConcepto.prInicializar(pDatoFijo: Integer; pMonto: Double);
var
  q: TFXQuery;
begin
  FMonto := pMonto;
  FDatoFijo := pDatoFijo;

  lbMonto.Caption := FormatFloat('$ ,0.00;$-,0.00', pMonto);
  q := CrearQuery;
  try
    q.SQL.Text := 'Select descripcion from conceptos where cast(codigo as integer) = :codigo';
    q.ParamByName('Codigo').AsInteger := FDatoFijo;
    q.Open;

    lbCompensar.Caption := IntToStr(FDatoFijo) + ' - ' + q.FieldByName('Descripcion').AsString;
  finally
    FreeAndNil(q);
  end;

  edImporte.Text := FormatFloat('0.00', FMonto);

end;

end.
