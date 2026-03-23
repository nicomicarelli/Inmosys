unit frmclavecaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FXQuery, Funciones, dbClient, Vcl.Grids, ALIGRID;

type
  TfClaveCaja = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnGrabar: TBitBtn;
    BitBtn1: TBitBtn;
    gDetalle: TStringAlignGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FResultado: Boolean;
    class function Ejecutar(cdsDatos: TClientDataset; var Resultado: Boolean):Boolean;
    procedure prCargarAnomalias(cdsDatos:TClientDataSet);
  end;

var
  fClaveCaja: TfClaveCaja;

implementation

uses frmprincipal;

{$R *.dfm}

procedure TfClaveCaja.BitBtn1Click(Sender: TObject);
begin
  FResultado := False;
  ModalResult := mrCancel;
end;

procedure TfClaveCaja.btnGrabarClick(Sender: TObject);
var
  q: TFXQuery;
  clave: string;
begin
  q := CrearQuery;
  try
    q.Sql.text := 'Select clave from usuarios where nombre = :Nombre';
    q.ParamByName('Nombre').AsString := fPrincipal.fUsuario;
    q.Open;
    clave := q.Fieldbyname('Clave').AsString;
  finally
    FreeAndNil(q);
  end;

  if (Uppercase(edit1.Text) = Uppercase(clave)) then
  begin
    FResultado := True;
    ModalResult := mrOk;
  end
  else
  begin
    FResultado := False;
    ModalResult := mrCancel;
  end;
end;

class function TfClaveCaja.Ejecutar(cdsDatos: TClientDataset;Var resultado: Boolean):Boolean;
begin
  with TFClaveCaja.Create(Application) do
  begin
    prCargarAnomalias(cdsDatos);
    FResultado := Showmodal = mrOk;
    Resultado := FResultado;
  end;
end;

procedure TfClaveCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.center(Self);

end;

procedure TfClaveCaja.prCargarAnomalias(cdsDatos: TClientDataset);
var
  I: Integer;
begin
  I := 1;
  if Assigned(cdsDatos) then
  begin
    cdsDatos.First;
    while not cdsDatos.eof do
    begin
      gDetalle.Cells[0, I] := cdsDatos.FieldByName('Descripcion').AsString;
      Inc(I);
      cdsDatos.Next;
    end;
  end;
end;

end.
