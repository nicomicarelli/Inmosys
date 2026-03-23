unit frmConfirmacionFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Declaraciones, sqlExpr, Numedit, Aligrid,
  System.Actions, FXQuery, AdvGlowButton;

type
  TfConfirmacionFacturas = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    NumEdit1: TNumEdit;
    NumEdit2: TNumEdit;
    gPendiente: TStringAlignGrid;
    Label4: TLabel;
    cbTipo: TComboBox;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NumEdit1Exit(Sender: TObject);
    procedure NumEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    fCodinq: string;
    fGrilla: TStringAlignGrid;
    EsLiquidacion: Boolean;

    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    class procedure Ejecutar;
  end;

var
  fConfirmacionFacturas: TfConfirmacionFacturas;

implementation

uses frmdatos, frmprincipal;

{$R *.DFM}

procedure TfConfirmacionFacturas.Cargar(pCodigo: string; Operacion: TTipoOperacion);
begin
end;


procedure TfConfirmacionFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fConfirmacionFacturas := nil;
end;

procedure TfConfirmacionFacturas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfConfirmacionFacturas.NumEdit1Exit(Sender: TObject);
begin
  try
    NumEdit1.Text := FormatFloat('0000', ToFloat(Numedit1.Text));
  Except
    NumEdit1.Text := '0001';
  end;

end;

procedure TfConfirmacionFacturas.NumEdit2Exit(Sender: TObject);
begin
  try
    NumEdit2.Text := FormatFloat('00000000', ToFloat(Numedit2.Text));
  Except
    NumEdit1.Text := '00000000';
  end;

end;

procedure TfConfirmacionFacturas.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;

  q.SQL.Text := ' Select * from Facturas where TIPOComprobante =:tipo and Numero=:Numero';

  if cbTipo.ItemIndex = 0 then
    q.ParamByName('Tipo').AsString := 'FA'
  else
    q.ParamByName('Tipo').AsString := 'RE';

  q.ParamByName('Numero').AsFloat := ToFloat(NumEdit1.Text + Numedit2.Text);
  q.Open;

  if not q.IsEmpty then
  begin
    if cbTipo.ItemIndex = 0 then
      MostrarDialogoAceptar('La Factura ya se encuentra registrada. ')
    else
      MostrarDialogoAceptar('El Recibo ya se encuentra registrado. ');
    Exit;
  end;

  try
    if cbTipo.ItemIndex in [0,1] then
    begin
      if not MostrarDialogoSiNo('¿Confirma la Factura?', mbYes) then
        Exit;
      DM.IniciarTransaccion;
      try
        for I := 1 to FGrilla.RowCount - 1 do
        begin
          q.SQL.Text := 'Insert into facturas (Fecha, Tipocomprobante, Numero, Codinq, Neto, Iva, Total) values(:Fecha, :Tipo, :Numero, :Codinq, :Neto, :Iva, :Total)';
          q.ParamByName('Fecha').AsDateTime := Now;

          if CbTipo.ItemIndex = 0 then
          begin
            if Combobox1.text = 'A' then
              q.ParamByName('Tipo').AsString := 'FA'
            else
              q.ParamByName('Tipo').AsString := 'FB';
          end
          else
          begin
            q.ParamByName('Tipo').AsString := 'RE'
          end;
          q.ParamByName('Numero').AsFloat := ToFloat(NumEdit1.text + Numedit2.text);
          q.ParamByName('Codinq').AsString := Copy(fGrilla.Cells[0, I], 2,4);
          q.ParamByName('Neto').AsFloat := ToFloat(fGrilla.Cells[2, I])/1.21;
          q.ParamByName('IVA').AsFloat := ToFloat(fGrilla.Cells[2, I]) - ToFloat(fGrilla.Cells[2, I])/1.21;
          q.ParamByName('Total').AsFloat := ToFloat(fGrilla.Cells[2, I]);
          q.ExecSQL;
        end;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar('Se registro con éxito la Factura: ' + Combobox1.text + ' ' + NumEdit1.Text + '-' + Numedit2.TexT);
      except
        DM.CancelarTransaccion;
      end;
      Close;
    end;
  finally
    FreeAndNil(q);
  end;
end;

class procedure TfConfirmacionFacturas.Ejecutar;
begin
end;

procedure TfConfirmacionFacturas.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfConfirmacionFacturas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
