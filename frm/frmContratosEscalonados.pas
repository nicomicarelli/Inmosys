unit frmContratosEscalonados;

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
  AdvGlowButton, cxGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmContratos = class(TForm)
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
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    gDetalle: TStringAlignGrid;
    chMasivo: TCheckBox;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    cbPeriodo: TComboBox;
    btnNuevo: TAdvGlowButton;
    cbIndice: TcxLookupComboBox;
    Label5: TLabel;
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
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure btnNuevoClick(Sender: TObject);
  private
    dsIndice: TDataSource;
    qIndice: TFXQuery;
  public
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
  end;

var
  frmContratos: TfrmContratos;

implementation

uses frmPrincipal, funciones, frmABMContratos;
{$R *.DFM}

procedure TfrmContratos.btnNuevoClick(Sender: TObject);
var
  I: Integer;
  Meses: Integer;
  Periodo: Integer;
  Fecha: TDatetime;
  boConserva: Boolean;
  Fila: INteger;
begin
  boConserva := False;
  if MostrarDialogoSiNo('ATENCION!!'+#13#10+'¿Desea conservar los datos cargados en la grilla y generar un nuevo contrato a continuacion?') then
    boConserva := True;

  if not boConserva then
    gDetalle.Vaciar;

    for I := 1 to gDetalle.RowCount -1 do
      if gDetalle.Cells[0, I] = '' then
      begin
        Fila := I;
        Break;
      end;

    gDetalle.RowCount := 1000;
    Meses := ToInt(edit5.Text);
    case cbPeriodo.ItemIndex of
      0: begin
        Periodo := 1;
      end;
      1: begin
        Periodo := 2;
        Meses := Round(Meses/2);
      end;
      2: begin
        Periodo := 3;
        Meses := Round(Meses/3);
      end;
      3: begin
        Periodo := 4;
        Meses := Round(Meses/4);
      end;
      4: begin
        Periodo := 6;
        Meses := Round(Meses/6);
      end;
      5: begin
        Periodo := 12;
        Meses := Round(Meses/12);
      end;
    end;

    Fecha := StrToDate(Edit3.Text);

    for I := 1 to Meses do
    begin
      gDetalle.Cells[0, Fila] := FormatDatetime('dd/mm/yyyy', Fecha);
      Fecha := INcMonth(Fecha, Periodo);
      gDetalle.Cells[1, Fila] := FormatDatetime('dd/mm/yyyy', Fecha - 1);
      gDetalle.Cells[2, Fila] := '0.01';
      Inc(Fila);
    end;
end;

procedure TfrmContratos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratos.Cargar(pCodigo: string; Operacion: TTipoOperacion);
begin
  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(frmContratos) then
      FABMContratosEscalonados.ActualizarClick(nil);
  end;
end;

procedure TfrmContratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmContratos := nil;
end;

procedure TfrmContratos.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TfrmContratos.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  q: TFXQuery;
  I: Integer;
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
        Sql.Text := 'select * from contratosESCALONADOS  where codinq = :codinq order by Orden';
        ParamByName('codinq').AsString := Codigo;
        Open;
        I := 1;
        if not IsEmpty then
        begin
          case q.FieldbyName('Perioricidad').AsInteger of
            1: cbPeriodo.ItemIndex := 0;
            2: cbPeriodo.ItemIndex := 1;
            3: cbPeriodo.ItemIndex := 2;
            4: cbPeriodo.ItemIndex := 3;
            6: cbPeriodo.ItemIndex := 4;
            12: cbPeriodo.ItemIndex := 5;
            else cbPeriodo.ItemIndex := -1;
          end;

          while NOT EOF do
          BEGIN
            gDetalle.Cells[0, I] := FormatDatetime('dd/mm/yyyy', q.FieldbyName('Fechadesde').AsDatetime);
            gDetalle.Cells[1, I] := FormatDatetime('dd/mm/yyyy', q.FieldbyName('FechaHasta').AsDatetime);
            gDetalle.Cells[2, I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
            Inc(I);
            NEXT;
          END;
          chMasivo.Checked := q.FieldbyName('ActualizaMasivo').AsInteger = 1;
          cBIndice.EditValue := q.FieldbyName('Indice').AsInteger;
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

procedure TfrmContratos.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit3.Text;
  if Key = #13 then
  begin
    if Length(Edit3.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit3.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit3.Text := Fecha;
    Edit5.setfocus;
  end;
end;

procedure TfrmContratos.FormCreate(Sender: TObject);
begin
  qIndice := CrearQuery;
  qIndice.sql.text := 'Select * from Indices';
  qIndice.Open;

  dsIndice := TDatasource.Create(nil);

  dsIndice.DataSet := qIndice;
  cbIndice.Properties.ListSource := dsIndice;
  cbIndice.EditValue := -1;

  fPrincipal.Center(self);

end;

procedure TfrmContratos.actNuevoExecute(Sender: TObject);
begin
  gDetalle.RowCount := 7;

end;

procedure TfrmContratos.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if MessageDlg('¿Esta seguro de eliminar el escalonamiento del contrato?',mtConfirmation, [mbyes,mbno],0) = mrYes then
    begin
      DM.IniciarTransaccion;
      try
        q.Sql.Text := 'Delete from ContratosEscalonados where codinq =:Codinq ';
        q.ParamByName('Codinq').AsString := edit1.Text;
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar('El Contrato Se elimino satisfactoriamente.', mtInformation);
        Close;
      Except
        on E:Exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Ocurrio un error al eliminar el contrato. Datos Técnicos: ' + e.Message, mtError);
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmContratos.actGrabarExecute(Sender: TObject);
var
  q: TFXQuery;
  i: Integer;
begin
  q := CrearQuery;
  try
    MostrarDialogoAceptar('Verifique que todos los datos estan completos y son correctos. Si hay un dato incorrecto el contrato NO SERA GRABADO.');

    if MessageDlg('¿Esta seguro de grabar el escalonamiento del contrato?',mtConfirmation, [mbyes,mbno],0) = mrYes then
    begin
      DM.IniciarTransaccion;
      try
        Edit1.SetFocus;
        q.Sql.Text := 'Delete from contratosEscalonados where codinq = :Codinq';
        q.ParamByName('Codinq').AsString := Edit1.Text;
        q.ExecSql;

        q.Sql.Text := 'INSERT INTO CONTRATOSESCALONADOS (CODINQ, FECHADESDE, FECHAHASTA, IMPORTE, ORDEN, ACTUALIZAMASIVO, PERIORICIDAD, INDICE)'+
          ' VALUES (:CODINQ, :FECHADESDE, :FECHAHASTA, :IMPORTE, :ORDEN, :ACTUALIZAMASIVO, :PERIORICIDAD, :iNDICE);';

        for I := 1 to gDetalle.RowCount - 1 do
        begin
          if gDetalle.Cells[0, I] = '' then
            Break;
          if gDetalle.Cells[1, I] = '' then
            Break;
          if gDetalle.Cells[2, I] = '' then
            Break;

          q.Close;
          q.ParamByName('Codinq').AsString := Edit1.Text;
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(gDetalle.Cells[0, I]);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(gDetalle.Cells[1, I]);
          q.ParamByName('Importe').AsFloat := ToFloat(gDetalle.Cells[2, I]);
          q.ParamByName('Orden').AsInteger := I;
          q.ParamByName('ActualizaMasivo').AsInteger := BoolToInt(chMasivo.Checked);
          case cbPeriodo.ItemIndex of
            0: q.ParamByName('Perioricidad').AsInteger := 1;
            1: q.ParamByName('Perioricidad').AsInteger := 2;
            2: q.ParamByName('Perioricidad').AsInteger := 3;
            3: q.ParamByName('Perioricidad').AsInteger := 4;
            4: q.ParamByName('Perioricidad').AsInteger := 6;
            5: q.ParamByName('Perioricidad').AsInteger := 12;
            else q.ParamByName('Perioricidad').AsInteger := -1;
          end;

          q.ParamByName('Indice').AsInteger := cbIndice.EditValue;
          q.ExecSQL;
        end;

        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos grabados correctamente.');
      except
        on e: exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar(
            'Ocurrio un error al grabar el contrato escalonado. Datos técnicos: ' +
              e.message);
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfrmContratos.actGrabarUpdate(Sender: TObject);
begin
  actGrabar.Enabled := (Edit1.Text <> '');
end;

procedure TfrmContratos.gDetalleAfterEdit(Sender: TObject; col, row: Integer);
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

procedure TfrmContratos.gDetalleEnter(Sender: TObject);
begin
  if edit1.Text = '' then
  begin
    MostrarDialogoAceptar('Debe seleccionar un inquilino. Verifique por favor.');
    Edit1.SetFocus;
    Exit;
  end;

end;

procedure TfrmContratos.gDetalleGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
  if ACol in [0,1] then
    Value := '99/99/9999';
end;

procedure TfrmContratos.gDetalleKeyPress(Sender: TObject; var Key: Char);
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
