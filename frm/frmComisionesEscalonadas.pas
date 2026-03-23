unit frmComisionesEscalonadas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  IBCustomDataSet, IBQuery, IBTable, frmDatos, ActnList, ImgList, ToolWin,
  Aligrid, Menus, sqlExpr, Declaraciones, Dateutils, System.Actions, FXQuery,
  System.UITypes, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  TfrmComisiones = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ActionList1: TActionList;
    actRefrescaGrilla: TAction;
    actNuevo: TAction;
    actModificar: TAction;
    actBorrar: TAction;
    actBuscar: TAction;
    actGrabar: TAction;
    query5: TIBDataSet;
    ImageList1: TImageList;
    ImageList2: TImageList;
    popOrdenar: TPopupMenu;
    Ordenar1: TMenuItem;
    Cdigo1: TMenuItem;
    Descripcin1: TMenuItem;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    gDetalle: TStringAlignGrid;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actGrabarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure gDetalleAfterEdit(Sender: TObject; col, row: Integer);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure gDetalleEnter(Sender: TObject);
    procedure gDetalleGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
  private
    { Private declarations }
  public
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
  end;

var
  frmComisiones: TfrmComisiones;

implementation

uses frmPrincipal, funciones, frmABMContratos, frmABMComisiones;
{$R *.DFM}

procedure TfrmComisiones.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmComisiones.Cargar(pCodigo: string; Operacion: TTipoOperacion);
begin
  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(frmComisiones) then
      FABMComisionesEscalonadas.ActualizarClick(nil);
  end;
end;

procedure TfrmComisiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmComisiones := nil;
end;

procedure TfrmComisiones.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TfrmComisiones.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      Codigo := FormatFloat('0000', ToFloat(Edit1.Text));

      with q do
      begin
        Sql.Text :=
          'Select Codinq, Inquilino, Propietario from inmuebles  where codinq = :codinq';
        ParamByName('codinq').AsString := Codigo;
        Open;
        Edit1.Text := FieldbyName('Codinq').AsString;
        Edit2.Text := FieldbyName('Inquilino').AsString;
        Edit4.Text := FieldbyName('Propietario').AsString;
      end;

      with q do
      begin
        Sql.Text := 'select * from comisiones  where codinq = :codinq';
        ParamByName('codinq').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          gDetalle.Cells[0, 1] := FechaConBarras(q.FieldbyName('F1D').AsString);
          gDetalle.Cells[1, 1] := FechaConBarras(q.FieldbyName('F1H').AsString);
          gDetalle.Cells[2, 1] := FormatFloat
            ('0.00', ToFloat(q.FieldbyName('I1').AsString));

          gDetalle.Cells[0, 2] := FechaConBarras(q.FieldbyName('F2D').AsString);
          gDetalle.Cells[1, 2] := FechaConBarras(q.FieldbyName('F2H').AsString);
          gDetalle.Cells[2, 2] := FormatFloat
            ('0.00', ToFloat(q.FieldbyName('I2').AsString));

          gDetalle.Cells[0, 3] := FechaConBarras(q.FieldbyName('F3D').AsString);
          gDetalle.Cells[1, 3] := FechaConBarras(q.FieldbyName('F3H').AsString);
          gDetalle.Cells[2, 3] := FormatFloat
            ('0.00', ToFloat(q.FieldbyName('I3').AsString));

          gDetalle.Cells[0, 4] := FechaConBarras(q.FieldbyName('F4D').AsString);
          gDetalle.Cells[1, 4] := FechaConBarras(q.FieldbyName('F4H').AsString);
          gDetalle.Cells[2, 4] := FormatFloat
            ('0.00', ToFloat(q.FieldbyName('I4').AsString));

          gDetalle.Cells[0, 5] := FechaConBarras(q.FieldbyName('F5D').AsString);
          gDetalle.Cells[1, 5] := FechaConBarras(q.FieldbyName('F5H').AsString);
          gDetalle.Cells[2, 5] := FormatFloat
            ('0.00', ToFloat(q.FieldbyName('I5').AsString));

          gDetalle.Cells[0, 6] := FechaConBarras(q.FieldbyName('F6D').AsString);
          gDetalle.Cells[1, 6] := FechaConBarras(q.FieldbyName('F6H').AsString);
          gDetalle.Cells[2, 6] := FormatFloat
            ('0.00', ToFloat(q.FieldbyName('I6').AsString));
        end
        else
        begin
          gDetalle.Vaciar;
          actNuevo.Execute;
        end;
      end;
      gDetalle.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmComisiones.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(self);
end;

procedure TfrmComisiones.actNuevoExecute(Sender: TObject);
begin
  gDetalle.RowCount := 7;

end;

procedure TfrmComisiones.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if MessageDlg('¿Esta seguro de eliminar el escalonamiento de la comision?',mtConfirmation, [mbyes,mbno],0) = mrYes then
    begin
      DM.IniciarTransaccion;
      try
        q.Sql.Text := 'Delete from Comisiones where codinq =:Codinq ';
        q.ParamByName('Codinq').AsString := edit1.Text;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar('La comisión se eliminó satisfactoriamente.', mtInformation);
        Close;
      Except
        on E:Exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Ocurrio un error al eliminar la comisión. Datos Técnicos: ' + e.Message, mtError);
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmComisiones.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if MessageDlg('¿Esta seguro de grabar el escalonamiento de la comision?',mtConfirmation, [mbyes,mbno],0) = mrYes then
    begin
      DM.IniciarTransaccion;
      try
        Edit1.SetFocus;
        q.Sql.Text := 'Select Codinq from comisiones where codinq = :Codinq';
        q.ParamByName('Codinq').AsString := Edit1.Text;
        q.Open;

        if not q.IsEmpty then
          q.Sql.Text := ' Update Comisiones set ' + ' F1D = :F1D,' +
            ' F1H = :F1H,' + ' I1  = :I1,' + ' F2D = :F2D,' + ' F2H = :F2H,' +
            ' I2  = :I2,' + ' F3D = :F3D,' + ' F3H = :F3H,' + ' I3  = :I3,' +
            ' F4D = :F4D,' + ' F4H = :F4H,' + ' I4  = :I4,' + ' F5D = :F5D,' +
            ' F5H = :F5H,' + ' I5  = :I5,' + ' F6D = :F6D,' + ' F6H = :F6H,' +
            ' I6  = :I6 ' + ' Where Codinq = :Codinq'
        else
          q.Sql.Text := ' Insert into Comisiones Values( ' + ' :Codinq, ' +
            ' :F1D,' + ' :F1H,' + ' :I1,' + ' :F2D,' + ' :F2H,' + ' :I2,' +
            ' :F3D,' + ' :F3H,' + ' :I3,' + ' :F4D,' + ' :F4H,' + ' :I4,' +
            ' :F5D,' + ' :F5H,' + ' :I5,' + ' :F6D,' + ' :F6H,' + ' :I6 )';
        q.ParamByName('Codinq').AsString := Edit1.Text;
        q.ParamByName('F1D').AsString := FechaAlReves(gDetalle.Cells[0, 1]);
        q.ParamByName('F1H').AsString := FechaAlReves(gDetalle.Cells[1, 1]);
        q.ParamByName('I1').AsString := (gDetalle.Cells[2, 1]);
        q.ParamByName('F2D').AsString := FechaAlReves(gDetalle.Cells[0, 2]);
        q.ParamByName('F2H').AsString := FechaAlReves(gDetalle.Cells[1, 2]);
        q.ParamByName('I2').AsString := (gDetalle.Cells[2, 2]);
        q.ParamByName('F3D').AsString := FechaAlReves(gDetalle.Cells[0, 3]);
        q.ParamByName('F3H').AsString := FechaAlReves(gDetalle.Cells[1, 3]);
        q.ParamByName('I3').AsString := (gDetalle.Cells[2, 3]);
        q.ParamByName('F4D').AsString := FechaAlReves(gDetalle.Cells[0, 4]);
        q.ParamByName('F4H').AsString := FechaAlReves(gDetalle.Cells[1, 4]);
        q.ParamByName('I4').AsString := (gDetalle.Cells[2, 4]);
        q.ParamByName('F5D').AsString := FechaAlReves(gDetalle.Cells[0, 5]);
        q.ParamByName('F5H').AsString := FechaAlReves(gDetalle.Cells[1, 5]);
        q.ParamByName('I5').AsString := (gDetalle.Cells[2, 5]);
        q.ParamByName('F6D').AsString := FechaAlReves(gDetalle.Cells[0, 6]);
        q.ParamByName('F6H').AsString := FechaAlReves(gDetalle.Cells[1, 6]);
        q.ParamByName('I6').AsString := (gDetalle.Cells[2, 6]);
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos grabados correctamente.');
      except
        on e: exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar(
            'Ocurrio un error al grabar la comisión escalonada. Datos técnicos: ' +
              e.message);
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmComisiones.actGrabarUpdate(Sender: TObject);
begin
  actGrabar.Enabled := (Edit1.Text <> '');
end;

procedure TfrmComisiones.gDetalleAfterEdit(Sender: TObject; col, row: Integer);
begin
  if col in [0, 1] then
  begin
    if length(Trim(gDetalle.Cells[Col, Row])) = 8 then
      gDetalle.Cells[Col, Row] := Copy(gDetalle.Cells[Col, Row], 1,6) + '20'+ Copy(gDetalle.Cells[Col, Row],7,2);
    if gDetalle.Cells[Col, Row] = '  /  /    ' then
      gDetalle.Cells[Col, Row] := '';
  end;

  if col = 2 then
    gDetalle.Cells[col, row] := FormatFloat
      ('0.00', ToFloat(gDetalle.Cells[col, row]))
end;

procedure TfrmComisiones.gDetalleEnter(Sender: TObject);
begin
  if edit1.Text = '' then
  begin
    MostrarDialogoAceptar('Debe seleccionar un inquilino. Verifique por favor.');
    Edit1.SetFocus;
    Exit;
  end;
end;

procedure TfrmComisiones.gDetalleGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
  if ACol in [0,1] then
    Value := '99/99/9999';
end;

procedure TfrmComisiones.gDetalleKeyPress(Sender: TObject; var Key: Char);
begin
  if gDetalle.Cells[gDetalle.Col, gDetalle.Row] = '  /  /    ' then
    Exit;

  if gDetalle.col in [0, 1] then
  begin
    if not charinset(Key, ['0' .. '9', '/', #8, #13]) then
      Key := #0;

    if (Key = #13) and (gDetalle.col = 0) then
    begin
      gDetalle.col := 1;
      Exit;
    end;

    if (Key = #13) and (gDetalle.col = 1) then
    begin
      gDetalle.col := 2;
      Exit;
    end;
  end;

  if gDetalle.col in [2] then
  begin
    if not charinset(Key, ['0' .. '9', '.',',', #8, #13]) then
      Key := #0;
    if (Key = #13) and (gDetalle.col = 2) then
    begin
      gDetalle.col := 0;
      if gDetalle.row < 6 then
        gDetalle.row := gDetalle.row + 1
      else
        btnGrabar.SetFocus;
    end;
  end;
end;

end.
