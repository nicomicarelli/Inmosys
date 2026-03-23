unit frmRecuperarHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Funciones, sqlExpr;

type
  TfRecuperarHistorico = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    Panel1: TPanel;
    Label4: TLabel;
    edFechaHasta: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRecuperarHistorico: TfRecuperarHistorico;

implementation

uses frmprincipal, frmPasarHistorico;

{$R *.dfm}

procedure TfRecuperarHistorico.btnGrabarClick(Sender: TObject);
var
  q, q1: TSQLQuery;
  I: Integer;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  Label2.Visible := True;
  try
    q.SQL.Text := ' Insert into Caja '+
                  ' Select * From HistoricoCaja '+
                  ' Where Fecha <= :Hasta';
    q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
    q.ExecSql;

    q1.SQL.Text := ' Insert into CajaDetalles '+
                  ' Select * From HistoricoCajaDetalles '+
                  ' Where Fecha <= :Hasta';
    q1.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
    q1.ExecSql;
    Label2.Visible := False;

    q.SQL.Text := ' delete From HistoricoCaja '+
                  ' Where Fecha <= :Hasta';
    q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
    q.ExecSql;

    q.SQL.Text := ' delete From HistoricoCajaDetalles '+
                  ' Where Fecha <= :Hasta';
    q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
    q.ExecSql;

    MostrarDialogoAceptar('Datos pasados al historico satisfactoriamente.');
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

procedure TfRecuperarHistorico.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfRecuperarHistorico.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
var
  Dia:   string;
  Fecha: string;

begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    Dia := edFechaHasta.Text;
    if Length(Dia) = 0 then
      Dia := '5';
    if Length(Dia) = 10 then
      Fecha := Dia;
    if length(Dia) <> 10 then
    begin
      Fecha := FormatDatetime('dd/mm/yyyy', Date());
      Delete(Fecha, 1, 2);
      if Dia = '5' then
        Fecha := '05' + Fecha;
      if Dia = '10' then
        Fecha := '10' + Fecha;
      if (Dia <> '5') and (Dia <> '10') then
        Fecha := TransformaFecha(Dia);
    end;
    edFechaHasta.Text := Fecha;
    btnGrabar.SetFocus;
  end;
end;


procedure TfRecuperarHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fRecuperarHistorico := nil;
  Action := caFree;
end;

procedure TfRecuperarHistorico.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

end.
