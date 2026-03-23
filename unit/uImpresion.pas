unit uImpresion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, ComCtrls, strUtils, frmframeCajas, Generics.Collections, ActnList, DBClient,
  Provider, ppDesignLayer, System.Actions, fxQuery, Data.DB, cxGroupBox, AdvPanel, cxCheckBox,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;
type
  TImpresion = Class
  public
    cdsDatos: TClientDataset;
    gDetalle: TStringAlignGrid;
    Vista: TcxGridTableView;


    procedure prGenerarImpresion;
    constructor Create;
    destructor Liberar;
  End;

implementation

{ TImpresion }

constructor TImpresion.Create;
begin
  gDetalle := TStringAlignGrid.Create(nil);
end;

destructor TImpresion.Liberar;
begin
  FreeAndNil(gDetalle);
end;

procedure TImpresion.prGenerarImpresion;
var
  I: Integer;
  niFIla: Integer;
begin
  niFila := 1;
  gDetalle.ColCount := cdsDatos.FieldCount;
  gDetalle.RowCount := cdsDatos.RecordCount + 1;

  for I := 0 to Vista.ColumnCount - 1 do
  begin
    gDetalle.Cells[I, 0] := Vista.Columns[I].Caption;
  end;
  cdsDatos.First;
  while not cdsDatos.eof do
  begin
    for I := 0 to gDetalle.ColCount - 1 do
      gDetalle.Cells[I, niFIla] := cdsDatos.Fields[I].AsString;
    inc(niFIla);
    cdsDatos.Next;
  end;
end;

end.
