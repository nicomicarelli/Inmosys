unit frmVales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  AdvGlowButton, cxGroupBox, AdvPanel, fxQuery, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxCheckBox, cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, strUtils,
  dbClient, cxSpinEdit;

type
  TONActualizar = Procedure of object;

  TFVales = class(TForm)
    pnlFondo: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    cxGroupBox1: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    cbCategoria: TcxLookupComboBox;
    edMonto: TEdit;
    chCerrado: TcxCheckBox;
    Label4: TLabel;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Actualizar: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    popEliminar: TPopupMenu;
    EliminarRecibo1: TMenuItem;
    Retirarfondositem1: TMenuItem;
    Label3: TLabel;
    edPendiente: TEdit;
    N1: TMenuItem;
    GenerarMovimientoenlaCaja1: TMenuItem;
    CubrirTodos1: TMenuItem;
    Edit1: TcxTextEdit;
    Edit2: TcxComboBox;
    Label5: TLabel;
    Edit3: TEdit;
    cbxDatoFijo: TComboBox;
    Label6: TLabel;
    Panel1: TPanel;
    btnSubir: TSpeedButton;
    btnBajar: TSpeedButton;
    Label8: TLabel;
    Shape2: TShape;
    btnModificar: TAdvGlowButton;
    Transformaritemennuevovale1: TMenuItem;
    GenerarMovimientoenlaCajaxImpAFavor1: TMenuItem;
    N3: TMenuItem;
    popSeleccion: TPopupMenu;
    SeleccionarTodos1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    chSoloPendiente: TcxCheckBox;
    chSinCubrir: TcxCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Seleccionado: TcxGridDBColumn;
    Columna_PasadoACaja: TcxGridDBColumn;
    Columna_Manual: TcxGridDBColumn;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Fecha: TcxGridDBColumn;
    Columna_Item: TcxGridDBColumn;
    Columna_Descripcion: TcxGridDBColumn;
    Columna_Entra: TcxGridDBColumn;
    Columna_Sale: TcxGridDBColumn;
    Columna_ID: TcxGridDBColumn;
    Columna_Diferencias: TcxGridDBColumn;
    Columna_Ganancia: TcxGridDBColumn;
    Columna_Usuario: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Agrupado: TTabSheet;
    cxGrid2: TcxGrid;
    gAgrupado: TcxGridDBTableView;
    Agrupado_Seleccionado: TcxGridDBColumn;
    Agrupado_PasadoACaja: TcxGridDBColumn;
    Agrupado_Manual: TcxGridDBColumn;
    Agrupado_Codigo: TcxGridDBColumn;
    Agrupado_Fecha: TcxGridDBColumn;
    Agrupado_Item: TcxGridDBColumn;
    Agrupado_Descripcion: TcxGridDBColumn;
    Agrupado_Entra: TcxGridDBColumn;
    Agrupado_Sale: TcxGridDBColumn;
    Agrupado_ID: TcxGridDBColumn;
    Agrupado_Diferencias: TcxGridDBColumn;
    Agrupado_Usuario: TcxGridDBColumn;
    Agrupado_Ganancia: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edMontoKeyPress(Sender: TObject; var Key: Char);
    procedure edMontoExit(Sender: TObject);
    procedure ActualizarClick(Sender: TObject);
    procedure gDatosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure EliminarRecibo1Click(Sender: TObject);
    procedure Retirarfondositem1Click(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure CubrirTodos1Click(Sender: TObject);
    procedure GenerarMovimientoenlaCaja1Click(Sender: TObject);
    procedure EliminarItem1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure btnSubirClick(Sender: TObject);
    procedure btnBajarClick(Sender: TObject);
    procedure popEliminarPopup(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure Transformaritemennuevovale1Click(Sender: TObject);
    procedure GenerarMovimientoenlaCajaxImpAFavor1Click(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure chSoloPendienteClick(Sender: TObject);
    procedure chSinCubrirClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    ds: TDataSource;
    qUsuarios: TFXQuery;
    dsCategorias: TDataSource;
    qCategorias: TFXQuery;

    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    cdsAgrupado: TClientDataset;
    dsAgrupado: TDatasource;
    Monto: Double;
    FCodigo: Integer;
    procedure prPrepararDataset;
    procedure prSeleccionarDeseleccionar(boSeleccionado: Boolean);
  public
    fOnActualizar: TOnActualizar;
    Categoria: Integer;
    EsHistorico: Boolean;
    TablaCabeza, TablaCuerpo: string;
    property OnActualizar: TOnActualizar read FOnActualizar write FOnActualizar;

    procedure prOnActualizar;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  FVales: TFVales;
  FValesCopia: TFVales;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmMovimientosVale;

{$R *.DFM}

procedure TFVales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(FVales) then
    FVales := nil;
  if Assigned(FValesCopia) then
    FValesCopia := nil;
end;

procedure TFVales.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  ds := TDatasource.Create(nil);

  qUsuarios := CrearQuery;
  qUsuarios.sql.text := 'Select * from Usuarios';
  qUsuarios.Open;

  ds.DataSet := qUsuarios;
  dsCategorias := TDatasource.Create(nil);

  EsHistorico := False;

  qCategorias := CrearQuery;
  qCategorias.sql.text := 'Select * from CategoriasVales';
  qCategorias.Open;

  dsCategorias.DataSet := qCategorias;
  cbCategoria.Properties.ListSource := dsCategorias;
  cbCategoria.EditValue := -1;

  TablaCabeza := 'CabezaVales';
  TablaCuerpo := 'CuerpoVales';

  prPrepararDataset;
end;

procedure TFVales.gDatosCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, Columna_Manual.Index) <> 0) then
  begin
    ACanvas.Brush.Color := clWhite;
    ACanvas.Font.Color := clBlack;
  end;
  if (Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, Columna_PasadoACaja.Index) = true) then
  begin
    ACanvas.Brush.Color := RGB(253,255,206);
    ACanvas.Font.Color := clBlack;
  end;
  if (Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, Columna_Entra.Index) <> 0) and
     (Sender.DataController.GetValue(AViewInfo.GridRecord.RecordIndex, Columna_Sale.Index) <> 0) then
  begin
    ACanvas.Brush.Color := RGB(255,209,164);
    ACanvas.Font.Color := clBlack;
  end;
end;

procedure TFVales.GenerarMovimientoenlaCaja1Click(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
begin
  q := CrearQuery;

  if cdsDatos.FieldByName('Entra').AsFloat = 0 then
  begin
    MostrarDialogoAceptar('El importe en contra es 0. NO se generara ningun movmiento.');
    Exit;
  end;

  DM.IniciarTransaccion;
  try
    try
      q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
      Q.Open;

      idtransaccion := q.fieldbyname('id').AsInteger;

      q.sql.text := 'Select Descripcion From Conceptos where codigo = :Codigo';
      q.ParamByName('Codigo').AsString := cdsDatos.FieldByName('Coditem').AsString;
      Q.Open;

      InsertarCaja(IDTransaccion,
                   FormatDateTime('dd/mm/yyyy', cdsDatos.FieldByName('Fecha').AsDatetime),
                   cdsDatos.FieldByName('CodiGO').AsString,
                   'MA',
                   'M',
                   Inttostr(IDTransaccion));

      InsertarCajaDetalles(IDTransaccion,
                   cdsDatos.FieldByName('Codigo').AsString,
                   cdsDatos.FieldByName('Coditem').AsString,
                   FormatDateTime('dd/mm/yyyy', cdsDatos.FieldByName('Fecha').AsDatetime),
                   '1',
                   q.FieldByName('Descripcion').AsString,
                   cdsDatos.FieldByName('Descripcion').AsString,
                   '0.00',
                   FormatFloat('0.00', cdsDatos.FieldByName('Entra').AsFloat),
                   IDTransaccion);

      q.sql.text := 'Update CuerpoVales Set PasadoACaja = 1 where codigo = :Codigo and Linea = :Linea';
      q.ParamByName('Codigo').AsString := edtCodigo.text;
      q.ParamByName('Linea').AsInteger := cdsDatos.FieldByName('Linea').AsInteger;
      Q.ExecSql;

      cdsDatos.Edit;
      cdsDatos.FieldByName('PasadoACaja').AsBoolean := True;
      cdsDatos.Post;

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento grabado correctamente.');
    except
      DM.CancelarTransaccion;
      MostrarDialogoAceptar('Ocurrio un error al grabar el Movimiento.');
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.GenerarMovimientoenlaCajaxImpAFavor1Click(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
begin
  q := CrearQuery;
  if cdsDatos.FieldByName('Sale').AsFloat = 0 then
  begin
    MostrarDialogoAceptar('El importe a favor es 0. NO se generara ningun movmiento.');
    Exit;
  end;

  DM.IniciarTransaccion;
  try
    try
      q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
      Q.Open;

      idtransaccion := q.fieldbyname('id').AsInteger;

      q.sql.text := 'Select Descripcion From Conceptos where codigo = :Codigo';
      q.ParamByName('Codigo').AsString := cdsDatos.FieldByName('Coditem').AsString;
      Q.Open;

      InsertarCaja(IDTransaccion,
                   FormatDateTime('dd/mm/yyyy', cdsDatos.FieldByName('Fecha').AsDatetime),
                   cdsDatos.FieldByName('CodiGO').AsString,
                   'MA',
                   'M',
                   Inttostr(IDTransaccion));

      InsertarCajaDetalles(IDTransaccion,
                   cdsDatos.FieldByName('Codigo').AsString,
                   cdsDatos.FieldByName('Coditem').AsString,
                   FormatDateTime('dd/mm/yyyy', cdsDatos.FieldByName('Fecha').AsDatetime),
                   '1',
                   q.FieldByName('Descripcion').AsString,
                   cdsDatos.FieldByName('Descripcion').AsString,
                   FormatFloat('0.00', cdsDatos.FieldByName('sALE').AsFloat),
                   '0.00',
                   IDTransaccion);

      q.sql.text := 'Update CuerpoVales Set PasadoACaja = 1 where codigo = :Codigo and Linea = :Linea';
      q.ParamByName('Codigo').AsString := edtCodigo.text;
      q.ParamByName('Linea').AsInteger := cdsDatos.FieldByName('Linea').AsInteger;
      Q.ExecSql;

      cdsDatos.Edit;
      cdsDatos.FieldByName('PasadoACaja').AsBoolean := True;
      cdsDatos.Post;

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento grabado correctamente.');
    except
      DM.CancelarTransaccion;
      MostrarDialogoAceptar('Ocurrio un error al grabar el Movimiento.');
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.popEliminarPopup(Sender: TObject);
begin
  N1.Visible := True;
  GenerarMovimientoEnLaCaja1.Visible := True;

  if cdsDatos.FieldByName('PasadoACaja').AsBoolean then
  begin
    N1.Visible := False;
    GenerarMovimientoEnLaCaja1.Visible := False;
  end;
  if not cdsDatos.FieldByName('EsManual').AsBoolean then
  begin
    N1.Visible := False;
    GenerarMovimientoEnLaCaja1.Visible := False;
  end;

end;

procedure TFVales.prOnActualizar;
begin
  if Assigned(FOnActualizar) then
    FOnActualizar;
end;

function TFVales.ValidarDatos: Boolean;
var
  Monto: Double;
begin
  Result := True;

  if Trim(edtCodigo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripción. ', mtInformation);
    Result := False;
    Exit;
  end;

  if cbCategoria.EditValue = -1 then
  begin
    MostrarDialogoAceptar('Debe ingresar una categoria. ', mtInformation);
    Result := False;
    Exit;
  end;

  Monto       := ToFloat(AnsiReplaceStr(AnsiReplaceStr(edMonto.Text, '$',''), ',',''));

  if ToInt(spANIO.Text) <= 0 then
  begin
    MostrarDialogoAceptar('Debe ingresar un año. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

procedure TFVales.edMontoExit(Sender: TObject);
begin
  Monto := ToFloat(edMonto.Text);
  edMonto.Text := FormatFloat('$ ,0.00', Monto);
end;

procedure TFVales.edMontoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', ',','.', #8, #13]) then
    Key := #0;
  if key = ',' then
    Key := '.';
end;

procedure TFVales.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TFVales.edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['I', 'P', 'U', 'O', 'N', 'i', 'p', 'u', 'o', 'n', #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    actGrabar.Execute;
    edtCodigo.SetFocus;
  end;
end;

procedure TFVales.EliminarItem1Click(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
begin
  if (Operacion <> toCopiaFiel) and (Operacion <> toCopia) and (Operacion <> toCopiaLimpia) then
  begin
    q := CrearQuery;
    DM.IniciarTransaccion;
    try
      try
        q.sql.text := 'Delete from CuerpoVales Where Codigo = :Codigo and Linea = :Linea';
        q.ParamByName('Codigo').AsString := edtCodigo.Text;
        q.ParamByName('Linea').AsInteger := cdsDatos.FieldByName('Linea').AsInteger;
        Q.ExecSql;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos eliminados correctamente.');
      except
        DM.CancelarTransaccion;
      end;
    finally
      FreeAndNil(q);
    end;
  end
  else
  begin
    cdsDatos.Delete;
  end;
end;

procedure TFVales.EliminarRecibo1Click(Sender: TObject);
begin
  cdsDatos.Edit;
  if cdsDatos.FieldByName('Sale').AsFloat <> 0 then
  begin
    cdsDatos.FieldByName('EsManual').AsBoolean := true;
    cdsDatos.FieldByName('Entra').AsFloat := cdsDatos.FieldByName('Sale').AsFloat
  end
  else
  begin
      cdsDatos.FieldByName('EsManual').AsBoolean := true;
      cdsDatos.FieldByName('Sale').AsFloat := cdsDatos.FieldByName('Entra').AsFloat;
  end;
  cdsDatos.FieldByName('Diferencia').AsFloat := cdsDatos.FieldByName('Entra').AsFloat - cdsDatos.FieldByName('Sale').AsFloat;
  cdsDatos.Post;
  if gDatos.DataController.Summary.FooterSummaryValues[0] > 0 then
    label3.Caption := 'Pendiente en contra: '
  else
    label3.Caption := 'Pendiente A FAVOR: ';


  edPendiente.Text := '$ ' + FormatFloat(',0.00',gDatos.DataController.Summary.FooterSummaryValues[0]);
end;

procedure TFVales.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
  begin
    if TWinControl.ClassNameIs('TEdit') then
    begin
      Self.Controls[I].Enabled := True;
      TEdit(Self.Controls[I]).Text    := '';
    end;
    if TWinControl.ClassNameIs('TCombobox') then
      TCombobox(Self.Controls[I]).ItemIndex := -1;
  end;
end;

procedure TFVales.ActualizarClick(Sender: TObject);
var
  qCuerpo: TFXQuery;
begin
  qCuerpo := CrearQuery;
  cdsDatos.DisableControls;
  try
    qCuerpo.SQL.Text :=
      ' Select * from '+ TablaCuerpo +
      '  Where Codigo = :Codigo';
    qCuerpo.ParamByName('Codigo').AsInteger := FCodigo;
    qCuerpo.Open;
      cdsDatos.EmptyDataset;
      while not qCuerpo.eof do
      begin
        cdsDatos.Append;
        cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
        cdsDatos.FieldByName('Codigo').AsString := qCuerpo.FieldByName('Codinq').AsString;
        cdsDatos.FieldByName('Descripcion').AsString := qCuerpo.FieldByName('Descripcion').AsString;
        cdsDatos.FieldByName('Linea').AsInteger := qCuerpo.FieldByName('Linea').AsInteger;
        cdsDatos.FieldByName('Entra').AsFloat := qCuerpo.FieldByName('Entra').AsFloat;
        cdsDatos.FieldByName('Sale').AsFloat := qCuerpo.FieldByName('Sale').AsFloat;
        cdsDatos.FieldByName('Fecha').AsDatetime := qCuerpo.FieldByName('Fecha').AsDatetime;
        cdsDatos.FieldByName('Coditem').AsString := qCuerpo.FieldByName('Codigoitem').AsString;
        cdsDatos.FieldByName('ID').AsString := qCuerpo.FieldByName('ID').AsString;
        cdsDatos.FieldByName('Usuario').AsString := qCuerpo.FieldByName('Usuario').AsString;
        if qCuerpo.FieldByName('Entra').AsFloat - qCuerpo.FieldByName('Sale').AsFloat > 0 then
          cdsDatos.FieldByName('Diferencia').AsFloat := qCuerpo.FieldByName('Entra').AsFloat - qCuerpo.FieldByName('Sale').AsFloat;
        if qCuerpo.FieldByName('Sale').AsFloat - qCuerpo.FieldByName('Entra').AsFloat > 0 then
          cdsDatos.FieldByName('Ganancias').AsFloat := qCuerpo.FieldByName('Sale').AsFloat - qCuerpo.FieldByName('Entra').AsFloat;
        cdsDatos.FieldByName('EsManual').AsBoolean := qCuerpo.FieldByName('EsManual').AsInteger = 1;
        cdsDatos.FieldByName('PasadoACaja').AsBoolean := qCuerpo.FieldByName('PasadoACaja').AsInteger = 1;
        cdsDatos.Post;

        qCuerpo.Next;
      end;
  finally
    cdsDatos.First;
    FreeAndNil(qCuerpo);
  if gDatos.DataController.Summary.FooterSummaryValues[0] > 0 then
    label3.Caption := 'Pendiente en contra: '
  else
    label3.Caption := 'Pendiente A FAVOR: ';

    edPendiente.Text := '$ ' + FormatFloat(',0.00',gDatos.DataController.Summary.FooterSummaryValues[0]);
    cdsDatos.EnableControls;
  end;
end;

procedure TFVales.actGrabarExecute(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
  Categoria: Integer;
  Monto: Double;
  Pendiente: Double;
  Cerrado: Boolean;
  Mes, Anio: Integer;
  Codinq, Coditem: string;
begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;
  Categoria   := cbCategoria.EditValue;
  Monto       := ToFloat(AnsiReplaceStr(AnsiReplaceStr(edMonto.Text, '$',''), ',',''));
  Cerrado     := chCerrado.Checked;
  Mes         := edMes.ItemIndex + 1;
  Anio        := ToInt(spAnio.text);
  Codinq      := Edit1.text;
  Coditem     := Edit3.text;

  if Operacion = toModificar then
  begin
    if Cerrado then
    begin
      if Pendiente >  0 then
      begin
        MostrarDialogoAceptar('Información','No es posible cerrar el vale ya que aun tiene monto pendiente.', mtInformation);
        Exit;
      end;
    end;
  end;

  if ValidarDatos then
  begin
    if DM.GrabarVales(Codigo, Descripcion, Categoria, Monto, Pendiente, Cerrado, Operacion, Mes, Anio, Codinq, Coditem, cdsDatos) then
    begin
      MostrarDialogoAceptar('Información','El vale se grabo satisfactoriamente', mtInformation);
      actNuevo.Execute;
    end;
    Close;
  end;
end;


procedure TFVales.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        if Length(edtCodigo.Text) = 1 then
          edtCodigo.Text := '0' + edtCodigo.Text;
        edtDescripcion.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from RazonesSociales where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe una Razon Social con ese Código. Verifique por favor.', mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus;
      end;
      if not (CharInSet(Key, ['0'..'9', #8])) then
        Key := #0;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.DeseleccionarTodos1Click(Sender: TObject);
begin
  prSeleccionarDeseleccionar(False);
end;

procedure TFVales.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: tFXQuery;
  qColor: tFXQuery;

begin
  q := CrearQuery;
  qColor := CrearQuery;
  try
    if Key = #13 then
    begin
      Codigo     := Edit1.Text;
      Edit1.Text := LargoCodigo(Codigo);
      Codigo     := Edit1.Text;
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and a.codinq=:codinq');
        ParamByName('Codinq').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Fecha      := FieldByName('FechaFin').AsString;
          Fecha      := FechaAlReves(Fecha);
          Hoy        := DatetoStr(Date());
          Hoy        := FechaAlReves(Hoy);
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
        end
        else
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where codinq= :codinq');
          ParamByName('Codinq').AsString := Codigo;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFVales.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  Coditem: string;
  Fecha:   string;
  Nro:     string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if key=#13 then
    begin
      Coditem := Edit3.Text;
      if Edit3.Text <> '' then
      begin
        if length(Coditem) = 1 then
          Coditem := '0' + Coditem;
        with q do
        begin
          Sql.Text := 'select * from conceptos where codigo= :codigo';
          ParamByName('codigo').AsString := Coditem;
          Open;
          if not isEmpty then
          begin
            nro   := Fields[2].AsString;
          end;
        end;
        cbxDatoFijo.Text := q.Fieldbyname('Descripcion').AsString;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TFVales.btnBajarClick(Sender: TObject);
var
  linea: Integer;
  Registro: Integer;
begin
  Linea := cdsDatos.FIeldbyName('Linea').AsInteger;
  Registro := cdsDatos.Recno;

  if (Linea = cdsDatos.RecordCount) then
    Exit;

  cdsDatos.Filtered := false;
  cdsDatos.Filter := 'LINEA = ' + iNTTOSTR(lINEA);
  CDSdATOS.fILTERED := tRUE;
  cdsDatos.Edit;
  cdsDatos.FIeldbyName('Linea').AsInteger := -1;
  cdsDatos.Post;
  cdsDatos.Filtered := false;
  cdsDatos.Filter := 'LINEA = ' + iNTTOSTR(lINEA + 1);
  CDSdATOS.fILTERED := tRUE;
  cdsDatos.Edit;
  cdsDatos.FIeldbyName('Linea').AsInteger := cdsDatos.FIeldbyName('Linea').AsInteger - 1;
  cdsDatos.Post;
  cdsDatos.Filtered := false;
  cdsDatos.Filter := 'LINEA = -1';
  CDSdATOS.fILTERED := tRUE;
  cdsDatos.Edit;
  cdsDatos.FIeldbyName('Linea').AsInteger := lINEA +1;
  cdsDatos.Post;
  cdsDatos.Filtered := false;
  cdsDatos.Recno := Registro + 1;

end;

procedure TFVales.btnEliminarClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if cdsDatos.IsEmpty then
      Exit;
    if not MostrarDialogoSiNo('¿Esta seguro de eliminar el item?') then
      Exit;

    DM.IniciarTransaccion;
    try
      q.SQL.text := ' Delete from CuerpoVales where Codigo = :Codigo and Linea = :Linea ';
      q.ParamByName('Codigo').AsInteger := FCodigo;
      q.ParamByName('Linea').AsInteger := cdsDatos.FieldbyName('Linea').AsInteger;
      q.ExecSQL();

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento eliminado correctamente');
      ActualizarCLick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.btnModificarClick(Sender: TObject);
begin
  if FMovimientosVale = nil then
    Application.CreateForm(TFMovimientosVale, FMovimientosVale)
  else
    FMovimientosVale.Show;
  FMovimientosVale.Cargar(ToInt(edtCodigo.Text),cdsDatos.FieldbyName('Linea').AsInteger,toModificar);
end;

procedure TFVales.btnNuevoClick(Sender: TObject);
begin
  if FMovimientosVale = nil then
    Application.CreateForm(TFMovimientosVale, FMovimientosVale)
  else
    FMovimientosVale.Show;
  FMovimientosVale.Cargar(ToInt(edtCodigo.Text),0,toNuevo);
end;

procedure TFVales.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFVales.btnSubirClick(Sender: TObject);
var
  linea: Integer;
  Registro: Integer;
begin
  Linea := cdsDatos.FIeldbyName('Linea').AsInteger;
  Registro := cdsDatos.Recno;

  if (Linea = 1) then
    Exit;

  cdsDatos.Filtered := false;
  cdsDatos.Filter := 'LINEA = ' + iNTTOSTR(lINEA);
  CDSdATOS.fILTERED := tRUE;
  cdsDatos.Edit;
  cdsDatos.FIeldbyName('Linea').AsInteger := -1;
  cdsDatos.Post;
  cdsDatos.Filtered := false;
  cdsDatos.Filter := 'LINEA = ' + iNTTOSTR(lINEA - 1);
  CDSdATOS.fILTERED := tRUE;
  cdsDatos.Edit;
  cdsDatos.FIeldbyName('Linea').AsInteger := cdsDatos.FIeldbyName('Linea').AsInteger + 1;
  cdsDatos.Post;
  cdsDatos.Filtered := false;
  cdsDatos.Filter := 'LINEA = -1';
  CDSdATOS.fILTERED := tRUE;
  cdsDatos.Edit;
  cdsDatos.FIeldbyName('Linea').AsInteger := lINEA -1;
  cdsDatos.Post;
  cdsDatos.Filtered := false;
  cdsDatos.Recno := Registro -1;

end;

procedure TFVales.Cargar(pCodigo: Integer; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  qCuerpo: TFXQuery;
  ndSale: Double;
  Tecla: Char;
begin
  if EsHistorico then
  begin
    TablaCabeza := 'HistoricoCabezaVales';
    TablaCuerpo := 'HistoricoCuerpoVales';
  end;

  FCodigo := pCodigo;
  FOperacion := Operacion;
  cdsDatos.EmptyDataSet;
  if (Operacion = toNuevo) or (Operacion = toCopia) or (Operacion = toCopiaFiel) or (Operacion = toCopiaLimpia) then
  begin
    edMes.ItemIndex := ToInt(FormatDatetime('mm', Date())) - 1;
    spAnio.text := FormatDatetime('yyyy', Date());
    btnEliminar.Visible := False;
    btnNuevo.Visible := False;
    Actualizar.Visible := False;
    chCerrado.Visible := False;
    cbCategoria.EditValue        := Categoria;
    cbCategoria.Enabled := False;
    q := CrearQuery;
    try
      q.SQL.Text := ' Select Coalesce(Max(Codigo)+1, 1) as Codigo '+
                    '   From CabezaVales ';
      q.Open;

      edtCodigo.Text := q.FieldByName('Codigo').AsString;
    finally
      FreeAndNIl(q);
    end;
    edtDescripcion.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;
  Tecla := #13;
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from '+TablaCabeza+' where codigo=:Codigo';
    q.ParamByName('Codigo').AsInteger := pCodigo;
    q.Open;

    if pCodigo > 0 then
    begin
      if (Operacion <> toCopia) and (Operacion <> toCopiaFiel) and (Operacion <> toCopiaLimpia) then
        edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
      edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      edMonto.Text                 := FormatFloat('$ ,0.00', q.Fieldbyname('Monto').asFloat);
      cbCategoria.EditValue        := q.Fieldbyname('CodigoCategoria').asInteger;
      chCerrado.Checked            := q.Fieldbyname('Cerrado').asInteger = 1;
      spAnio.Text                  := q.Fieldbyname('Anio').asString;
      edMes.ItemIndex              := q.Fieldbyname('Mes').asInteger - 1;
      EDIT1.TEXT                   := q.FieldbyName('Codinq').AsString;
      edit1KeyPress(Self, Tecla);
      EDIT3.TEXT                   := q.FieldbyName('Coditem').AsString;
      edit3KeyPress(Self, Tecla);
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar, toCopia, toCopiaFiel, toCopiaLimpia]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo, toCopia, toCopiaFIel,toCopiaLimpia]);
    edtCodigo.Readonly  := (Operacion in  [toNuevo, toCopia, toCopiaFIel,toCopiaLimpia]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar, toCopia, toCopiaFiel,toCopiaLimpia]);

    if Operacion in ([toModificar, toCopia, toCopiaFiel, toCopiaLimpia]) then
    begin
      qCuerpo := CrearQuery;
      cdsDatos.DisableControls;
      try
        qCuerpo.SQL.Text :=
          ' Select * from '+TablaCuerpo +
          '  Where Codigo = :Codigo';
        qCuerpo.ParamByName('Codigo').AsInteger := pCodigo;
        qCuerpo.Open;

          while not qCuerpo.eof do
          begin
            ndSale := qCuerpo.FieldByName('Sale').AsFloat;
            if (Operacion = toCopia) then
            begin
              if (qCuerpo.FieldByName('Sale').AsFloat > 0.005) and (qCuerpo.FieldByName('Entra').AsFloat < 0.005) then
              begin
                qCuerpo.Next;
                Continue;
              end;
              if (qCuerpo.FieldByName('Sale').AsFloat > 0.005)  then
                ndSale := 0;
            end;

            cdsDatos.Append;
            cdsDatos.FieldByName('Seleccionado').AsBoolean := True;
            cdsDatos.FieldByName('Codigo').AsString := qCuerpo.FieldByName('Codinq').AsString;
            cdsDatos.FieldByName('Descripcion').AsString := qCuerpo.FieldByName('Descripcion').AsString;
            if Operacion = toCopiaLimpia then
            begin
              cdsDatos.FieldByName('Entra').AsFloat := 0;
              cdsDatos.FieldByName('Sale').AsFloat := 0;
            end
            else
            begin
              cdsDatos.FieldByName('Entra').AsFloat := qCuerpo.FieldByName('Entra').AsFloat;
              cdsDatos.FieldByName('Sale').AsFloat := ndSale;
            end;
            cdsDatos.FieldByName('Linea').AsInteger := qCuerpo.FieldByName('Linea').AsInteger;
            cdsDatos.FieldByName('Fecha').AsDatetime := qCuerpo.FieldByName('Fecha').AsDatetime;
            cdsDatos.FieldByName('Coditem').AsString := qCuerpo.FieldByName('Codigoitem').AsString;
            cdsDatos.FieldByName('ID').AsString := qCuerpo.FieldByName('ID').AsString;
            if Operacion = toCopiaLimpia then
            begin
              cdsDatos.FieldByName('Usuario').AsString := Fprincipal.fUsuario;
              cdsDatos.FieldByName('Diferencia').AsFloat := 0;
            end
            else
            begin
              cdsDatos.FieldByName('Usuario').AsString := qCuerpo.FieldByName('Usuario').AsString;
              if qCuerpo.FieldByName('Entra').AsFloat - ndSale > 0 then
                cdsDatos.FieldByName('Diferencia').AsFloat := qCuerpo.FieldByName('Entra').AsFloat - qCuerpo.FieldByName('Sale').AsFloat;
            end;

            if ndSale - qCuerpo.FieldByName('Entra').AsFloat > 0 then
              cdsDatos.FieldByName('Ganancias').AsFloat := ndSale - qCuerpo.FieldByName('Entra').AsFloat;

            cdsDatos.FieldByName('EsManual').AsBoolean := qCuerpo.FieldByName('EsManual').AsInteger = 1;
            cdsDatos.FieldByName('PasadoAcaja').AsBoolean := qCuerpo.FieldByName('PasadoACaja').AsInteger = 1;
            cdsDatos.Post;

            qCuerpo.Next;
          end;
      finally
        cdsDatos.First;
        FreeAndNil(qCuerpo);
        cdsDatos.EnableControls;
  if gDatos.DataController.Summary.FooterSummaryValues[0] > 0 then
    label3.Caption := 'Pendiente en contra: '
  else
    label3.Caption := 'Pendiente A FAVOR: ';

        edPendiente.Text := '$ ' + FormatFloat(',0.00',gDatos.DataController.Summary.FooterSummaryValues[0]);
      end;
    end;

    if Operacion = toEliminar then
    begin
      if not MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el vale selecciado?') then
      begin
        Close;
        Exit;
      end;

      DM.prBorrarElemento(q.FieldbyName('Codigo').asstring, 'CuerpoVales', 'Codigo', '');
      DM.prBorrarElemento(q.FieldbyName('Codigo').asstring, 'CabezaVales', 'Codigo', 'el vale');
      Close;
      if Assigned(FABMRazonesSociales) then
        FABMRazonesSociales.ActualizarClick(nil);
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.cbxDatoFijoClick(Sender: TObject);
var
  Codigo: string;
  Fecha:  string;
  Numero: string;
  ibqConsulta: TFXQuery;

begin
  ibqConsulta := CrearQuery;
  try
    with ibqConsulta do
    begin
      Close;
      Sql.clear;
      Sql.add('Select * from conceptos where descripcion=:descripcion');
      ParamByName('descripcion').AsString := cbxDatoFijo.Text;
      Open;
      edit3.Text := Fields[0].AsString;
      Codigo := edit3.Text;
      if edtCodigo.Text<>'' then
      begin
        if Length(Codigo) = 1 then
          Codigo := '0' + Codigo;
        Close;
        Sql.clear;
        Sql.Add('select * from conceptos where codigo=:codigo');
        ParamByName('codigo').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Numero := Fields[2].AsString;
          if ValidarDatoFijo(Fecha,Numero) then
          begin
            cbxDatoFijo.Text := Fields[1].AsString;
          end
          else
          begin
            edtCodigo.Text   := '';
            cbxDatoFijo.Text := '';
            MostrarDialogoAceptar('Dato fijo invalido para este caso'+#13+'Por favor Verifique...',mtwarning);
            edtCodigo.setfocus;
          end;
          if edtCodigo.Text = '' then
            cbxDatoFijo.Text := '';
        end;
      end;
    end;
  finally
    FreeAndNil(ibqConsulta);
  end;
end;

procedure TFVales.CubrirTodos1Click(Sender: TObject);
begin
  cdsDatos.First;
  while not cdsDatos.Eof do
  begin
    cdsDatos.Edit;
    if (cdsDatos.FieldByName('Sale').AsFloat <> 0) and (cdsDatos.FieldByName('Entra').AsFloat = 0) then
    begin
      cdsDatos.FieldByName('Entra').AsFloat := cdsDatos.FieldByName('Sale').AsFloat;
      cdsDatos.FieldByName('EsManual').AsBoolean := true;
    end
    else if (cdsDatos.FieldByName('Entra').AsFloat <> 0) and (cdsDatos.FieldByName('Sale').AsFloat = 0) then
    begin
      cdsDatos.FieldByName('Sale').AsFloat := cdsDatos.FieldByName('Entra').AsFloat;
      cdsDatos.FieldByName('EsManual').AsBoolean := true;
    end;
    if cdsDatos.FieldByName('Entra').AsFloat - cdsDatos.FieldByName('Sale').AsFloat > 0 then
      cdsDatos.FieldByName('Diferencia').AsFloat := cdsDatos.FieldByName('Entra').AsFloat - cdsDatos.FieldByName('Sale').AsFloat;
    cdsDatos.Post;
    cdsDatos.Next;
  end;

  if gDatos.DataController.Summary.FooterSummaryValues[0] > 0 then
    label3.Caption := 'Pendiente en contra: '
  else
    label3.Caption := 'Pendiente A FAVOR: ';

  edPendiente.Text := '$ ' + FormatFloat(',0.00',gDatos.DataController.Summary.FooterSummaryValues[0]);

end;

procedure TFVales.chSinCubrirClick(Sender: TObject);
begin
  if chSinCubrir.Checked then
  begin
    cdsDatos.Filtered := False;
    cdsDatos.Filter := '(Entra = 0 or Sale = 0)';
    cdsDatos.Filtered := True;
  end
  else
  begin
    cdsDatos.Filtered := False;
  end;
end;

procedure TFVales.chSoloPendienteClick(Sender: TObject);
begin
  if chSoloPendiente.Checked then
  begin
    cdsDatos.Filtered := False;
    cdsDatos.Filter := 'Entra <> Sale';
    cdsDatos.Filtered := True;
  end
  else
  begin
    cdsDatos.Filtered := False;
  end;
end;

procedure TFVales.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);
  cdsAgrupado := TClientDataset.Create(nil);
  dsAgrupado := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Seleccionado', ftBoolean);
  cdsDatos.FieldDefs.Add('Codigo', ftString, 10);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.FieldDefs.Add('Entra', ftFloat);
  cdsDatos.FieldDefs.Add('Linea', ftInteger);
  cdsDatos.FieldDefs.Add('Sale', ftFloat);
  cdsDatos.FieldDefs.Add('Fecha', ftDatetime);
  cdsDatos.FieldDefs.Add('Coditem', ftString,100);
  cdsDatos.FieldDefs.Add('ID', ftString,100);
  cdsDatos.FieldDefs.Add('USUARIO', ftString,50);
  cdsDatos.FieldDefs.Add('Diferencia', ftFloat);
  cdsDatos.FieldDefs.Add('Ganancias', ftFloat);
  cdsDatos.FieldDefs.Add('EsManual', ftBoolean);
  cdsDatos.FieldDefs.Add('PasadoACaja', ftBoolean);
  cdsDatos.CreateDataset;
  cdsDatos.IndexDefs.Clear;
  cdsDatos.IndexDefs.Add('Indice','Linea',[] );
  cdsDatos.IndexName := 'Indice';

  cdsAgrupado.FieldDefs.Clear;
  cdsAgrupado.FieldDefs.Add('Seleccionado', ftBoolean);
  cdsAgrupado.FieldDefs.Add('Codigo', ftString, 10);
  cdsAgrupado.FieldDefs.Add('Descripcion', ftString, 100);
  cdsAgrupado.FieldDefs.Add('Entra', ftFloat);
  cdsAgrupado.FieldDefs.Add('Linea', ftInteger);
  cdsAgrupado.FieldDefs.Add('Sale', ftFloat);
  cdsAgrupado.FieldDefs.Add('Fecha', ftDatetime);
  cdsAgrupado.FieldDefs.Add('Coditem', ftString,100);
  cdsAgrupado.FieldDefs.Add('ID', ftString,100);
  cdsAgrupado.FieldDefs.Add('USUARIO', ftString,50);
  cdsAgrupado.FieldDefs.Add('Diferencia', ftFloat);
  cdsAgrupado.FieldDefs.Add('Ganancias', ftFloat);
  cdsAgrupado.FieldDefs.Add('EsManual', ftBoolean);
  cdsAgrupado.FieldDefs.Add('PasadoACaja', ftBoolean);
  cdsAgrupado.CreateDataset;
  cdsAgrupado.IndexDefs.Clear;
  cdsAgrupado.IndexDefs.Add('Indice','Linea',[] );
  cdsAgrupado.IndexName := 'Indice';

  Columna_Codigo.DataBinding.FieldName := 'Codigo';
  Columna_Descripcion.DataBinding.FieldName := 'Descripcion';
  Columna_Entra.DataBinding.FieldName := 'Entra';
  Columna_Diferencias.DataBinding.FieldName := 'Diferencia';
  Columna_Ganancia.DataBinding.FieldName := 'Ganancias';
  Columna_Sale.DataBinding.FieldName := 'Sale';
  Columna_Fecha.DataBinding.FieldName := 'Fecha';
  Columna_Item.DataBinding.FieldName := 'CodItem';
  Columna_ID.DataBinding.FieldName := 'ID';
  Columna_Usuario.DataBinding.FieldName := 'Usuario';
  Columna_Manual.DataBinding.FieldName := 'EsManual';
  Columna_PasadoACaja.DataBinding.FieldName := 'PasadoACaja';
  Columna_Seleccionado.DataBinding.FieldName := 'Seleccionado';

  TFloatField(cdsDatos.FieldByname('Fecha')).DisplayFormat := 'dd/mm/yyyy';
  TFloatField(cdsDatos.FieldByname('Entra')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsDatos.FieldByname('Sale')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsDatos.FieldByname('Diferencia')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsDatos.FieldByname('Ganancias')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';

  Agrupado_Codigo.DataBinding.FieldName := 'Codigo';
  Agrupado_Descripcion.DataBinding.FieldName := 'Descripcion';
  Agrupado_Entra.DataBinding.FieldName := 'Entra';
  Agrupado_Diferencias.DataBinding.FieldName := 'Diferencia';
  Agrupado_Ganancia.DataBinding.FieldName := 'Ganancias';
  Agrupado_Sale.DataBinding.FieldName := 'Sale';
  Agrupado_Fecha.DataBinding.FieldName := 'Fecha';
  Agrupado_Item.DataBinding.FieldName := 'CodItem';
  Agrupado_ID.DataBinding.FieldName := 'ID';
  Agrupado_Usuario.DataBinding.FieldName := 'Usuario';
  Agrupado_Manual.DataBinding.FieldName := 'EsManual';
  Agrupado_PasadoACaja.DataBinding.FieldName := 'PasadoACaja';
  Agrupado_Seleccionado.DataBinding.FieldName := 'Seleccionado';

  TFloatField(cdsAgrupado.FieldByname('Fecha')).DisplayFormat := 'dd/mm/yyyy';
  TFloatField(cdsAgrupado.FieldByname('Entra')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsAgrupado.FieldByname('Sale')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsAgrupado.FieldByname('Diferencia')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';
  TFloatField(cdsAgrupado.FieldByname('Ganancias')).DisplayFormat := '$ ,0.00;'+'$ -,0.00';

  dsDatos.DataSet := cdsDatos;
  dsAgrupado.DataSet := cdsAgrupado;
  gDatos.DataController.DataSource := dsDatos;
  gAgrupado.DataController.DataSource := dsAgrupado;
end;

procedure TFVales.Transformaritemennuevovale1Click(Sender: TObject);
var
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
  Codigo: string;
  Coditem: String;
  Codinq: String;
  Monto: Double;
  Mes, Anio: Integer;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select Coalesce(Max(Codigo)+1, 1) as Codigo '+
                    '   From CabezaVales ';
    q.Open;

    Codigo := q.FieldByName('Codigo').AsString;
    if cdsDatos.FieldByName('Entra').AsFloat > 0 then
      Monto := cdsDatos.FieldByName('Entra').AsFloat
    else
      Monto := cdsDatos.FieldByName('Sale').AsFloat;
    cbCategoria.Enabled := True;
    Categoria   := cbCategoria.EditValue;
    cbCategoria.Enabled := False;
    Mes         := edMes.ItemIndex + 1;
    Anio        := ToInt(spAnio.text);
    Codinq      := Edit1.text;
    Coditem     := Edit3.text;

    DM.IniciarTransaccion;
    try
      Operacion := toNuevo;
      if DM.GrabarVales(Codigo, cdsDatos.FieldByName('Descripcion').AsString, Categoria, 0, 0, False, Operacion, Mes, Anio, Codinq, Coditem, cdsDatos) then
      begin
        q.SQL.Text := ' Update CuerpoVales Set Codigo = :Codigo, Linea = 2 Where Codigo = :COdigoVale and Linea = :Linea ';
        q.ParamByName('CodigoVale').AsString := edtCodigo.Text;
        q.ParamByName('Codigo').AsString := Codigo;
        q.ParamByName('Linea').AsInteger := cdsDatos.FieldByName('Linea').AsInteger;
        q.ExecSql;

        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar('Información','El vale se grabo satisfactoriamente', mtInformation);
        actNuevo.Execute;
      end;
      Operacion := toModificar;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFVales.Retirarfondositem1Click(Sender: TObject);
begin
  cdsDatos.Edit;
  cdsDatos.FieldByName('Sale').AsFloat := 0;
  if cdsDatos.FieldByName('Entra').AsFloat - cdsDatos.FieldByName('Sale').AsFloat > 0 then
    cdsDatos.FieldByName('Diferencia').AsFloat := cdsDatos.FieldByName('Entra').AsFloat - cdsDatos.FieldByName('Sale').AsFloat;
  cdsDatos.FieldByName('EsManual').AsBoolean := False;
  cdsDatos.Post;
  if gDatos.DataController.Summary.FooterSummaryValues[0] > 0 then
    label3.Caption := 'Pendiente en contra: '
  else
    label3.Caption := 'Pendiente A FAVOR: ';

  edPendiente.Text := '$ ' + FormatFloat(',0.00',gDatos.DataController.Summary.FooterSummaryValues[0]);
end;

procedure TFVales.SeleccionarTodos1Click(Sender: TObject);
begin
  prSeleccionarDeseleccionar(True);
end;

procedure TFVales.prSeleccionarDeseleccionar(boSeleccionado: Boolean);
begin
  cdsDatos.DisableControls;
  try
    cdsDatos.First;
    while not cdsDatos.eof do
    begin
      cdsDatos.Edit;
      cdsDatos.FieldByName('Seleccionado').AsBoolean := boSeleccionado;
      cdsDatos.Post;
      cdsDatos.Next;
    end;
    cdsDatos.First;

  finally
    cdsDatos.EnableControls;
  end;
end;
end.
