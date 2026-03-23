unit frmCierresCaja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Numedit, FXQuery, System.Actions, AdvGlowButton;

type
  TfCierresCaja = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Panel3: TPanel;
    popOrdenar: TPopupMenu;
    Ordenar1: TMenuItem;
    Cdigo1: TMenuItem;
    Descripcin1: TMenuItem;
    Destino1: TMenuItem;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    lblCodigo: TLabel;
    edtFecha: TEdit;
    gDetalle: TStringAlignGrid;
    Actualizar: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure edtFechaExit(Sender: TObject);
    procedure ActualizarClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pTotal: Double; pSobres: TListaSobres; Operacion: TTipoOperacion);
  end;

var
  fCierresCaja: TfCierresCaja;

implementation

uses frmDatos, frmprincipal, frmPlanillaCaja;

{$R *.DFM}

procedure TfCierresCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FCierresCaja := nil;
end;

procedure TfCierresCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  edtFecha.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TfCierresCaja.edtFechaExit(Sender: TObject);
begin
  try
    StrToDate(edtFecha.Text);
  except
    on e: exception do
    begin
      MostrarDIalogoAceptar('La fecha es inválida. Verifique por favor.');
      edtFecha.Text := Formatdatetime('dd/mm/yyyy', Now);
    end;
  end;

end;

procedure TfCierresCaja.edtFechaKeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
begin
  Fecha := EdtFecha.Text;
  if Key = #13  then
  begin
    EdtFecha.Text := FechaCorrecta(Fecha);
  end;
end;

procedure TfCierresCaja.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  iDCierre: Double;
  I: Integer;
begin
 q := CrearQuery;
 if not MostrarDialogoSiNO('Para el cierre de caja, se ELIMINARAN TODOS LOS CIERRES posteriores a la fecha seleccionada. ¿Desea Continuar?') then
   Exit;
  DM.IniciarTransaccion;
  try
    try
      q.SQL.Text := ' Select Max(IDCierre) AS idcIERRE from CierresCaja';
      q.Open;
      if q.FieldByName('IDCierre').IsNull then
        IDCierre := 1
      else
        IDCierre := q.FieldByName('IDCierre').AsFloat + 1;
      q.SQL.Text := 'Delete from cierrescaja where fecha >= :Fecha';
      q.ParamByName('Fecha').AsDateTime := StrToDate(edtFecha.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from cierrescajaDetalles where fecha >= :Fecha';
      q.ParamByName('Fecha').AsDateTime := StrToDate(edtFecha.Text);
      q.ExecSQL;

      q.SQL.Text := 'Insert into CierresCaja(IDCierre, Fecha, Codigo, Total, Usuario)' +
                    'Values(:IDCierre, :Fecha, :Codigo, :Total, :Usuario)';
      q.ParamByName('IDCierre').AsFloat := IDCierre;
      q.ParamByName('Fecha').AsDateTime := StrToDate(edtFecha.Text);
      q.ParamByName('Codigo').AsInteger := 0;
      q.ParamByName('Total').AsFloat    := ToFloat(GDetalle.Cells[2,1]);
      q.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
      q.ExecSQL();

      for I := 2 to gDetalle.RowCount - 1 do
      begin
        q.SQL.Text := 'Insert into CierresCajaDetalles(IDCierre, Fecha, Codigo, Total, Usuario)' +
                      'Values(:IDCierre, :Fecha, :Codigo, :Total, :Usuario)';
        q.ParamByName('IDCierre').AsFloat := IDCierre;
        q.ParamByName('Fecha').AsDateTime := StrToDate(edtFecha.Text);
        q.ParamByName('Codigo').AsInteger := ToInt(GDetalle.Cells[0,I]);
        q.ParamByName('Total').AsFloat    := ToFloat(GDetalle.Cells[2,I]);
        q.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
        q.ExecSQL();
      end;
      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      dm.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;

  Close;
end;

procedure TfCierresCaja.ActualizarClick(Sender: TObject);
begin
  if Assigned(fPlanillaCaja) then
  begin
    if not MostrarDialogoSiNO('Para el cierre de caja, se calculara toda la historia de la caja al dia de hoy. ¿Desea Continuar?') then
      Exit;

    fPlanillaCaja.EsCierreCaja := True;
    fPlanillaCaja.edit6.Text := '01/01/2013';
    fPlanillaCaja.edit8.Text := edtFecha.Text;
    fPlanillaCaja.Actualizar.Click;
    Cargar(ToFloat(fPlanillaCaja.edtTotal.Text), fPlanillaCaja.ListaSobres, toNuevo);
    fPlanillaCaja.EsCierreCaja := False;
  end;
end;

procedure TfCierresCaja.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfCierresCaja.Cargar(pTotal: Double; pSobres: TListaSobres; Operacion: TTipoOperacion);
var
  I: Integer;
  J: Integer;
begin
  I := 1;
  gDetalle.Cells[0, I] := '00';
  gDetalle.Cells[1, I] := 'General';
  gDetalle.Cells[2, I] := FormatFloat('0.00', pTotal);
  Inc(I);

  for J := 0 to pSobres.Count - 1 do
  begin
    gDetalle.Cells[0, I] := pSobres.Items[J].Codigo;
    gDetalle.Cells[1, I] := pSobres.Items[J].Descripcion;
    gDetalle.Cells[2, I] := FormatFloat('0.00', pSobres.Items[J].Total);
    Inc(I);
  end;
  if I < 2 then
    gDetalle.RowCount := 2
  else
    gDetalle.RowCount := I;
end;

end.
