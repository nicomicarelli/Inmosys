unit frmAlicuotasIVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Funciones, sqlExpr, Grids,
  ALIGRID, FXQuery, AdvGlowButton;

type
  TfAlicuotasIVA = class(TForm)
    Panel3: TPanel;
    gDetalle: TStringAlignGrid;
    btnSalir: TAdvGlowButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAlicuotasIVA: TfAlicuotasIVA;

implementation

uses frmprincipal;

{$R *.dfm}

procedure TfAlicuotasIVA.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAlicuotasIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fAlicuotasIVA := nil;
  Action := caFree;
end;

procedure TfAlicuotasIVA.FormCreate(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select * from TiposIVA';
    q.Open;

    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codigo').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Descripcion').AsString;
      gDetalle.Cells[2,I] := FormatFloat('0.00', q.FieldByName('Alicuota').AsFloat);
      Inc(I);
      q.Next;
    end;

    gDetalle.RowCount := I;
  finally
    FreeAndNil(q);

  end;
  fPrincipal.Center(Self);
end;

end.
