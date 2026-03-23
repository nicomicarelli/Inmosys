unit frmValeDepositos;

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
  AdvGlowButton, cxGroupBox, frmClaveCaja, Data.db;

type
  TfValeDepositos = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label1: TLabel;
    edtCodigo: TEdit;
    cbxDatoFijo: TComboBox;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxDatoFijoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxDatoFijoDropDown(Sender: TObject);
  private
    cdsAnomalias: TClientDataset;
  public
    FResultado: Integer;
    FCategoria: Integer;
    procedure prPrepararDataset;
    class function Ejecutar(Var resultado: Integer; pCategoria: Integer):Boolean;
  end;

var
  fValeDepositos: TfValeDepositos;

implementation

uses frmprincipal, frmdatos;

{$R *.dfm}

class function TfValeDepositos.Ejecutar(Var resultado: Integer; pCategoria: Integer):Boolean;
begin
  with TfValeDepositos.Create(Application) do
  begin
    FCategoria := pCategoria;
    Result := Showmodal = mrOk;
    Resultado := FResultado;
  end;
end;

procedure TfValeDepositos.btnGrabarClick(Sender: TObject);
begin
  FResultado := ToInt(edtCodigo.Text);

end;

procedure TfValeDepositos.btnSalirClick(Sender: TObject);
VAR
  Resultado: Boolean;
begin
  if MostrarDialogoSiNo('ANOMALIA!!! '+ #13#10#13#10 + 'Si desea continuar deberá introducir su clave de autorización.'+#13#10+'¿Desea continuar?', mterror, mbNo)then
  begin
    if TFClaveCaja.Ejecutar(cdsAnomalias, Resultado) then
    begin
      if not Resultado then
        Exit;
      ModalResult := mrCancel;
      Close;
    end
    else
    begin
      ModalResult := mrCancel;
      Exit;
    end;
  end
  else
    begin
      ModalResult := mrCancel;
      Exit;
    end;
end;

procedure TfValeDepositos.prPrepararDataset;
begin
  cdsAnomalias := TClientDataset.Create(nil);

  cdsAnomalias.FieldDefs.Clear;
  cdsAnomalias.FieldDefs.Add('Descripcion', ftString, 200);
  cdsAnomalias.CreateDataset;
end;


procedure TfValeDepositos.cbxDatoFijoClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select Codigo, Descripcion, Mes, Anio,Cerrado from Cabezavales where Codigo = ' + QuotedStr(Trim(Copy(cbxDatoFijo.Text, 1, Pos('|',cbxDatoFijo.Text) - 2)));
    q.Open;

    edtCodigo.Text := q.FieldByName('Codigo').AsString;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfValeDepositos.cbxDatoFijoDropDown(Sender: TObject);
var
  q: TFXQuery;
begin
  cbxDatoFijo.Clear;
  q := CrearQuery;
  try
    q.SQL.Text := 'Select CA.Codigo, CA.Descripcion, CA.Anio, CA.Mes from Cabezavales CA '+
                  ' Inner Join CategoriasVales CV on CV.Codigo = CA.COdigoCategoria '+
                  ' Where CA.CodigoCategoria = :pCategoria ' +
                  '   and CA.Cerrado = 0 '+
                  ' Order By Anio desc,Mes Desc ';
    q.ParamByName('pCategoria').AsInteger := FCategoria;
    q.Open;

    while not q.eof do
    begin
      cbxDatoFijo.Items.Add(q.FieldByName('Codigo').AsString+' | '+q.FieldByName('Descripcion').AsString );
      q.Next;
    end;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfValeDepositos.cbxDatoFijoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  q: TFXQuery;
begin
  if Key = VK_RETURN then
  begin
    cbxDatoFijo.Items.Clear;

    q := CrearQuery;
    try
      q.SQL.Text := 'Select Codigo, Descripcion, Mes, Anio from Cabezavales where descripcion LIKE :Descripcion';
      q.ParamByName('Descripcion').AsString :=  cbxDatoFijo.Text + '%';
      q.Open;

      while not q.eof do
      begin
        cbxDatoFijo.Items.Add(q.FieldByName('Codigo').AsString+' | '+q.FieldByName('Descripcion').AsString );
        q.Next;
      end;
    finally
      FreeAndNil(q);
    end;
  end;
  cbxDatoFijo.DroppedDown := True;
end;

procedure TfValeDepositos.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfValeDepositos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fValeDepositos := nil;
  Action := caFree;
end;

procedure TfValeDepositos.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  fPrincipal.Center(Self);
  prPrepararDataset;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select CA.Codigo, CA.Descripcion, CA.Anio, CA.Mes from Cabezavales CA '+
                  ' Inner Join CategoriasVales CV on CV.Codigo = CA.COdigoCategoria '+
                  ' Where CA.CodigoCategoria = :Categoria ' +
                  '   and CA.Cerrado = 0 '+
                  ' Order By Anio desc,Mes Desc ';
    q.ParambyName('Categoria').AsInteger := FCategoria;
    q.Open;

    while not q.eof do
    begin
      cbxDatoFijo.Items.Add(q.FieldByName('Codigo').AsString+' | '+q.FieldByName('Descripcion').AsString );
      q.Next;
    end;

    if q.RecordCount = 1 then
    begin
      cbxDatoFijo.ItemIndex := 0;
      cbxDatoFijoClick(nil);
    end;
  finally
    FreeAndNil(q);
  end;
end;

end.
