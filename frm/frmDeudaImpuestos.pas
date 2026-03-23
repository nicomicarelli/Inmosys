unit frmDeudaImpuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FXQuery, Funciones, dbClient, Vcl.Grids, ALIGRID,
  Vcl.ExtCtrls;

type
  TfDeudaImpuestos = class(TForm)
    gDetalle: TStringAlignGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    edTotal: TEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FResultado: Boolean;
    class function Ejecutar(q: TFXQuery):Boolean;
    procedure prCargarDatos(q: TFXQuery);
  end;

var
  fDeudaImpuestos: TfDeudaImpuestos;

implementation

uses frmprincipal;

{$R *.dfm}

procedure TfDeudaImpuestos.BitBtn1Click(Sender: TObject);
begin
  FResultado := False;
  ModalResult := mrCancel;
end;

procedure TfDeudaImpuestos.btnGrabarClick(Sender: TObject);
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
end;

class function TfDeudaImpuestos.Ejecutar(q: TFXQuery):Boolean;
begin
  with TfDeudaImpuestos.Create(Application) do
  begin
    prCargarDatos(q);
    FResultado := Showmodal = mrOk;
  end;
end;

procedure TfDeudaImpuestos.FormShow(Sender: TObject);
begin
  fPrincipal.center(Self);
end;

procedure TfDeudaImpuestos.prCargarDatos(q: TFXQuery);
var
  I: Integer;
  Total: Double;
begin
  I := 1;
  Total := 0;
  q.First;
  while not q.eof do
  begin
    gDetalle.Cells[0, I] := q.FieldByName('Codigo').AsString;
    gDetalle.Cells[1, I] := q.FieldByName('Descripcion').AsString;
    gDetalle.Cells[2, I] := '$ ' + FormatFloat('#,##0.00', q.FieldByName('Deuda').AsFloat);
    Total := Total + q.FieldByName('Deuda').AsFloat;
    Inc(I);
    q.Next;
  end;
  edTotal.text := '$ ' + FormatFloat('#,##0.00', Total);
end;

end.
