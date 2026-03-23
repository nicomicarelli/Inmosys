unit frmframeCajas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ALIGRID, Menus, SqlExpr, DBClient, Provider, FXQuery;

type
  TfraCaja = class(TFrame)
    gDetalle: TStringAlignGrid;
    pnlTotal: TPanel;
    Label4: TLabel;
    edtTotal: TEdit;
    Label1: TLabel;
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure PasaralHistorico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  frmdatos, Funciones, frmPlanillaCaja;
{$R *.dfm}

procedure TfraCaja.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if (col = 0) THEN
    gdetalle.SortColumn(Col,True, 'D')
  ELSE IF (col=2) then
    gdetalle.SortColumn(Col,True, 'S')
  else
    gdetalle.SortColumn(Col,True, 'N');
end;

procedure TfraCaja.PasaralHistorico1Click(Sender: TObject);
var
  q, q1: TFXQuery;
begin
  if (gDetalle.ColorRow[gDetalle.Row] = RGB(255,185,185)) or (gDetalle.ColorRow[gDetalle.Row] = clSkyBlue) then
    Exit;

  DM.IniciarTransaccion;
  q := CrearQuery;
  q1 := CrearQuery;
  try
    try
      q.SQL.Text := ' Insert into HistoricoCaja '+
                    ' Select C.* From Caja C '+
                    '  Inner Join CajaDetalles D on C.IdTransaccion = D.IDTransaccion '+
                    '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                    '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                    '  Where C.IDTransaccion = :ID ';
      q.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[6,gDetalle.Row]);
      q.ExecSql;

      q1.SQL.Text := ' Insert into HistoricoCajaDetalles '+
                     ' Select D.* From CajaDetalles D '+
                     '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                     '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                     '  Where D.IDTransaccion = :ID ';
      q1.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[6,gDetalle.Row]);
      q1.ExecSql;

      q1.SQL.Text := ' delete From CajaDetalles '+
                     ' Where IDTransaccion = :id';
      q1.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[6,gDetalle.Row]);
      q1.ExecSql;

      q1.SQL.Text := ' delete From Caja '+
                     ' Where IDTransaccion = :id';
      q1.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[6,gDetalle.Row]);
      q1.ExecSql;


      DM.ConfirmarTransaccion;
      fPlanillaCaja.ActualizarClick(nil);

      MostrarDialogoAceptar('Datos pasados al historico satisfactoriamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;
end.
