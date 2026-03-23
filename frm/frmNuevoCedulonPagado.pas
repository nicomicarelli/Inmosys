unit frmNuevoCedulonPagado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Spin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, AdvObj, BaseGrid, AdvGrid, AdvGlowButton,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  FMTBcd, AdvDBLookupComboBox, frameInquilinos, cxSpinEdit, strUtils,
  dxSkinSeven, cxCheckBox, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, fxQuery, System.Actions,
  cxGroupBox, AdvPanel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, DBClient;

type
  TfNuevoCedulonPagado = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    dsEmpresas: TDataSource;
    dsInquilinos: TDataSource;
    popOpciones: TPopupMenu;
    BorrarCeduln1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    qEmpresas: TFXQuery;
    qInquilinos: TFXQuery;
    pnlFondo: TAdvPanel;
    gbxBotones: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    edFecha: TcxMaskEdit;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    edCodigo: TcxTextEdit;
    edEmpresa: TcxComboBox;
    gDetalle: TAdvStringGrid;
    Label5: TLabel;
    cxTextEdit1: TcxTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    edTotal: TcxTextEdit;
    edTotalPagado: TcxTextEdit;
    cxGrid1: TcxGrid;
    gDatos: TcxGridDBTableView;
    Columna_Seleccionado: TcxGridDBColumn;
    Columna_Vale: TcxGridDBColumn;
    Columna_Codigo: TcxGridDBColumn;
    Columna_Nombre: TcxGridDBColumn;
    Columna_Cuenta: TcxGridDBColumn;
    Columna_Vencimiento: TcxGridDBColumn;
    Columna_Importe: TcxGridDBColumn;
    Columna_PorcentajeInquilino: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Columna_PorcentajePropietario: TcxGridDBColumn;
    Columna_ImporteInquilino: TcxGridDBColumn;
    Columna_ImportePropietario: TcxGridDBColumn;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnGenerarVale: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    btnBuscar: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    btnValidar: TAdvGlowButton;
    lbTotalInq: TLabel;
    lbTotalProp: TLabel;
    Desmarcarcomopagado1: TMenuItem;
    Shape1: TShape;
    Label8: TLabel;
    Shape2: TShape;
    Label9: TLabel;
    Shape3: TShape;
    Label10: TLabel;
    Shape4: TShape;
    Label11: TLabel;
    Shape5: TShape;
    Label12: TLabel;
    chCuota50: TCheckBox;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure btnValidarClick(Sender: TObject);
    procedure gDetalleSearchFooterAction(Sender: TObject; Value: string; ACol,
      ARow: Integer; SearchAction: TSearchAction);
    procedure ActualizarClick(Sender: TObject);
    procedure edEmpresaClick(Sender: TObject);
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure gDetalleCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure btnGenerarValeClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure Desmarcarcomopagado1Click(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    FPorcentajeRecargo: Double;
  public
    DatoFijo: String;
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, CantCodigos: Integer;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
    procedure prObtenerTotal;
    procedure prMarcarCedulonesEnVales;
  end;

var
  fNuevoCedulonPagado: TfNuevoCedulonPagado;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos,
  frmNuevoCedulon;
{$R *.DFM}

procedure TfNuevoCedulonPagado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevoCedulonPagado := nil;
end;

procedure TfNuevoCedulonPagado.FormCreate(Sender: TObject);
var
  Fila: Integer;
begin
  fPrincipal.Center(Self);
  qEmpresas.Connection := DM.Conexion;
  qEmpresas.Open;

  while not qEmpresas.Eof do
  begin
    edEmpresa.Properties.Items.Add(qEmpresas.FieldbyName('Descripcion').AsString);
    qEmpresas.Next;
  end;

  qInquilinos.Connection := DM.Conexion;
  qInquilinos.Open;
  edFecha.Text := FormatDatetime('05/mm/yyyy', Date);
  Fila := 1;
  while not qInquilinos.eof do
  begin
    gDetalle.Cells[1, Fila] := qInquilinos.FieldByName('Codinq').AsString;
    gDetalle.Cells[2, Fila] := qInquilinos.FieldByName('Inquilino').AsString;
    Inc(Fila);
    qInquilinos.Next;
  end;
  gDetalle.RowCount := Fila;
end;

procedure TfNuevoCedulonPagado.gDetalleCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if State then
  begin
    gDetalle.RowColor[Arow] := clMoneyGreen;
    prObtenerTotal;
  end
  else
  begin
    gDetalle.RowColor[Arow] := gDetalle.Color;
    prObtenerTotal;
  end;
end;

procedure TfNuevoCedulonPagado.gDetalleEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 6 then
  begin
    if ToFloat(gDetalle.Cells[ACol, ARow]) > 100 then
    begin
      MostrarDialogoAceptar('El porcentaje de asignación debe ser un valor entre 0 y 100%');
      gDetalle.Cells[ACol, ARow] := '100.00';
      gDetalle.Cells[ACol + 1, ARow] := '0.00';
    end;
    gDetalle.Cells[ACol, ARow] := FormatFloat('0.00', ToFloat(gDetalle.Cells[ACol, ARow]));
    gDetalle.Cells[ACol, ARow] := gDetalle.Cells[ACol, ARow];

    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := gDetalle.Row + 1;
  end;

  if ACol = 7 then
  begin
    if ToFloat(gDetalle.Cells[ACol, ARow]) > 100 then
    begin
      MostrarDialogoAceptar('El porcentaje de asignación debe ser un valor entre 0 y 100%');
      gDetalle.Cells[ACol, ARow] := '100.00';
      gDetalle.Cells[ACol - 1, ARow] := '0.00';
    end;

    gDetalle.Cells[ACol, ARow]     := FormatFloat('0.00', ToFloat(gDetalle.Cells[ACol, ARow]));
    gDetalle.Cells[ACol, ARow]     := FormatFloat('0.00', ToFloat(gDetalle.Cells[ACol, ARow]));

    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := gDetalle.Row + 1;
  end;
end;

procedure TfNuevoCedulonPagado.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    1,2,3: HAlign := taLeftJustify;
    4: HAlign := taCenter;
    5,6,7,8,9: HAlign := taRightJustify;
  end;
end;

procedure TfNuevoCedulonPagado.gDetalleKeyPress(Sender: TObject; var Key: Char);
var
  stCodigo: string;
begin
  if gDetalle.Col in [2,3,4] then
    if not (CharInSet(Key, ['0'..'9',#8,#13])) then
      Key := #0;

  if Key = #13 then
  begin
    if gDetalle.Col = 3 then
    begin
      if edCodigo.Text = '' then
      begin
        MostrarDialogoAceptar('Debe seleccionar la empresa relacionada. Verifique por favor.');
        Exit;
      end;

      if CantCodigos = 1 then
      begin
          prInterpretarCodigoBarras(gDetalle.Row, cxTextEdit1.Text);
      end
      else
      begin
        stCodigo := gDetalle.Cells[gDetalle.Col, gDetalle.Row];

        if fCodigosBarras = nil then
          Application.CreateForm(TfCodigosBarras, fCodigosBarras)
        else
          fCodigosBarras.Show;
        fCodigosBarras.Preparar(IDDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, FPorcentajeRecargo);
        fCodigosBarras.Cargar(stCodigo, gDetalle.Row, 1);
        fCodigosBarras.Hide;
        fCodigosBarras.ShowModal;
      end;
    end
    else if gDetalle.Col = 5 then
    begin
      gDetalle.Cells[5, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row]));
      gDetalle.Cells[8, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row])*ToFloat(gDetalle.Cells[5, gDetalle.Row])/100);
      gDetalle.Cells[9, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row])*ToFloat(gDetalle.Cells[6, gDetalle.Row])/100);
      if gDetalle.Row + 1 <= gDetalle.RowCount -1 then
        gDetalle.Row := gDetalle.Row + 1
      else
        gDetalle.Row := gDetalle.Row - 1;
    end
    else if gDetalle.Col = 6 then
    begin

    end
    else if gDetalle.Col = 7 then
    begin

    end


  end;
end;

procedure TfNuevoCedulonPagado.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(gDetalle.Col, gDetalle.Row);
end;

procedure TfNuevoCedulonPagado.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
var
  ID: string;
  Fecha: string;
  Importe: string;
  niIndice: Integer;
  niColID, niColImporte: Integer;
  Estado: Boolean;
  I: Integer;
  niFila: Integer;
  boEncontrado: Boolean;
begin
  niColID := 3;
  niColImporte := 5;

  prTraducirCodigoBarras(ATexto, ID, Fecha, Importe, IdDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, FPorcentajeRecargo);

  niFila:= 1;
  boEncontrado := False;
  for I := niFila to gDetalle.RowCount - 1 do
  begin
    if not fxBuscarCedulon(ID, Fecha, Importe, edMes.text, spAnio.Text, chCuota50.Checked,
      gDetalle, niIndice, niColID, niColImporte, niFila, False) then
    begin
      if not boEncontrado then
        MostrarDialogoAceptar('El cedulón no se encuentra cargado en la grilla');
      Exit;
    end;
    boEncontrado := True;
    niFila := niIndice +1;

    if not gDetalle.ReadOnly[0, niIndice] then
      if gDetalle.GetCheckboxState(0, niIndice, Estado) then
        if not Estado then
        begin
          gDetalle.SetCheckboxState(0, niIndice, True);
          gDetalle.RowColor[niIndice] := clMoneyGreen;
        end
        else
        begin
          gDetalle.SetCheckboxState(0, niIndice, False);
          gDetalle.RowColor[niIndice] := gDetalle.Color;
        end;
  end;

  prObtenerTotal;
end;

procedure TfNuevoCedulonPagado.prMarcarCedulonesEnVales;
var
  q: TFXQuery;
  ID: String;
  Codinq: string;
  DatoFijo: string;
  Columna: string;
  Fecha: string;
  Cuenta: string;
  I: Integer;

begin
  q := CrearQuery;
  try
    q.SQL.Text :=
      ' Select First 1 CA.CodigoEmpresa '+
      '   from CabezaVales CA '+
      '  Inner Join CuerpoVales CU on CA.Codigo = CU.Codigo '+
      '  Where CA.CodigoEmpresa = :Codigo '+
      '    and Ca.Mes = :Mes ' +
      '    and CA.Anio = :Anio '+
      '    and CU.Codinq = :Codinq '+
      '    and CU.CodigoItem = :Coditem ';
    q.Prepare;

    for I := 1 to gDetalle.RowCount - 1 do
    begin
      if ToFloat(gDetalle.Cells[8, I]) <> 0 then
      begin
        q.Close;
        q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.ParamByName('Mes').AsString := Inttostr(edMes.ItemIndex + 1);
        q.ParamByName('Anio').AsInteger := ToInt(spAnio.Text);
        q.ParamByName('Codinq').AsString:= gDetalle.Cells[1, I];
        q.ParamByName('Coditem').AsString := '09';
        q.Open;

        if not q.IsEmpty then
          gDetalle.FontStyles[8, I] := [fsBold]
//        ELSE
//          gDetalle.Colors[8, I] := rgb(255,209,164);


      end;

      if ToFloat(gDetalle.Cells[9, I]) <> 0 then
      begin
        q.Close;
        q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.ParamByName('Mes').AsString := Inttostr(edMes.ItemIndex + 1);
        q.ParamByName('Anio').AsInteger := ToInt(spAnio.Text);
        q.ParamByName('Codinq').AsString:= gDetalle.Cells[1, I];
        q.ParamByName('Coditem').AsString := '27';
        q.Open;

        if not q.IsEmpty then
          gDetalle.FontStyles[9, I] := [fsBold]
//        ELSE
//          gDetalle.Colors[9, I] := rgb(255,209,164);

      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNuevoCedulonPagado.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Descripcion: string;
  Mes: string;
  Anio: string;
  q: TFXQuery;
  qAutomatizacion: TFXQuery;
  qValorAutomatizacion: TFXQuery;
  qCampoAutomatizacion: TFXQuery;
  Cuota50: Boolean;
  I: Integer;
  Estado: Boolean;
begin

  if FOperacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        'Select codigo from CabezaCedulones '+
        ' where Codigo = :Codigo' +
        '   and Mes = :Mes ' +
        '   and Anio = :Anio '+
        '   and Cuota50 = :Cuota50';
      q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
      q.ParamByName('Mes').AsString := edMes.Text;
      q.ParamByName('Anio').AsString := spAnio.Text;
      if chCuota50.checked then
        q.ParamByName('Cuota50').AsInteger := 1
      else
        q.ParamByName('Cuota50').AsInteger := 0;
      q.Open;

      if not q.IsEmpty then
      begin
        MostrarDialogoAceptar('Ya fueron cargados los siguientes cedulones: '+#13#10 +
          ' Empresa: '+ EdEmpresa.text + #13#10 +
          ' Periodo: '+ edMes.Text + '/' + spAnio.Text);
//        btnGrabar.Enabled := False;
        Exit;
      end;
    finally
      FreeAndNil(q);
    end;
  end;

  Codigo := edCodigo.Text;
  Descripcion := edEmpresa.Text;
  Mes := edMes.Text;
  Anio := spAnio.Text;
  Cuota50 := chCuota50.Checked;

  DM.IniciarTransaccion;

  q := CrearQuery;
  qAutomatizacion := CrearQuery;
  qValorAutomatizacion := CrearQuery;
  qCampoAutomatizacion := CrearQuery;
  try
    try
      q.Sql.Text :=
        'Update CuerpoCedulones '+
        '   Set Pagado = :Pagado, '+
        '       PorcentajeInquilino = :PorcentajeInquilino, '+
        '       PorcentajePropietario = :PorcentajePropietario '+
        ' where Codigo = :Codigo ' +
        '   and Codinq = :Codinq '+
        '   and Mes = :Mes ' +
        '   and Anio = :Anio '+
        '   and Cuota50 = :Cuota50';

      if fProgreso = nil then
        Application.CreateForm(TfProgreso, fProgreso)
      else
        fProgreso.Show;

      fProgreso.Maximo := gDetalle.RowCount - 1;
      fProgreso.Leyenda := 'Grabando cedulones. Por favor espere...';

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        fProgreso.Posicion := I;
        gDetalle.GetCheckBoxState(0,I,Estado);
        q.Close;
        q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.ParamByName('Codinq').AsString := gDetalle.Cells[1,I];
        q.ParamByName('PorcentajeInquilino').AsFloat := ToFloat(gDetalle.Cells[6,I]);
        q.ParamByName('PorcentajePropietario').AsFloat := ToFloat(gDetalle.Cells[7,I]);
        q.ParamByName('Mes').AsString := Mes;
        q.ParamByName('Anio').AsString := Anio;
        q.ParamByName('Cuota50').AsInteger := BooltoInt(Cuota50);
        q.ParambyName('Pagado').AsInteger := BooltoInt(Estado);
        q.ExecSQL;

        Application.ProcessMessages;
      end;

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
      if Assigned(fABMIdentificacionImpuestos) then
        fABMIdentificacionImpuestos.ActualizarClick(nil);
      Close;
    Except
      on e: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar los cedulones.' + #13#10 +
                              'Detalles Técnicos: ' + e.message);
        if Assigned(fABMIdentificacionImpuestos) then
          fABMIdentificacionImpuestos.ActualizarClick(nil);
      end;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qAutomatizacion);
    FreeAndNil(qValorAutomatizacion);
    FreeAndNil(qCampoAutomatizacion);
  end;
end;

procedure TfNuevoCedulonPagado.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  pCodigo: string;
begin
  pCodigo := edCodigo.Text;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;

  q := CrearQuery;
  try
//    if FOperacion = toNuevo then
//    begin
//      q.Sql.Text :=
//        'Select codigo from CabezaCedulones '+
//        ' where Codigo = :Codigo' +
//        '   and Mes = :Mes ' +
//        '   and Anio = :Anio '+
//        '   and Cuota50 = :Cuota50';
//      q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
//      q.ParamByName('Mes').AsString := edMes.Text;
//      q.ParamByName('Anio').AsString := spAnio.Text;
//      if chCuota50.checked then
//        q.ParamByName('Cuota50').AsInteger := 1
//      else
//        q.ParamByName('Cuota50').AsInteger := 0;
//      q.Open;
//
//      if not q.IsEmpty then
//      begin
//        MostrarDialogoAceptar('Ya fueron cargados los siguientes cedulones: '+#13#10 +
//          ' Empresa: '+ EdEmpresa.text + #13#10 +
//          ' Periodo: '+ edMes.Text + '/' + spAnio.Text);
//        btnGrabar.Enabled := False;
//        Close;
//        Exit;
//      end;
//    end;

    if ToInt(pCodigo) = 0 then
    begin
      MostrarDialogoAceptar('Debe seleccionar la empresa.');
      btnGrabar.Enabled := False;
      Exit;
    end;

    q.Sql.Text :=
      ' Select E.* from EmpresasImpuestos E' +
      ' where Codigo = :Codigo';
    q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
    q.Open;

    FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
    edEmpresa.Text := q.FieldbyName('Descripcion').AsString;
    edEmpresa.Properties.Readonly := True;

    DatoFijo := q.FieldbyName('Identificacion').AsString;
    idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
    idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
    FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
    FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
    ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
    ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
    CantCodigos := q.FieldbyName('CantCodigos').AsInteger;

    if FOperacion = toNuevo then
    begin
      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario ' +
        '   from Inmuebles I' +
        '  Inner Join PorcentajeCobro C on C.Codinq = I.Codinq ' +
        '  Where C.Codigo = :Codigo ' +
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
      q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;

      Exit;
    end;

    if FOperacion <> toNuevo then
    begin
      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := edMes.Text;
      q.ParambyName('Anio').AsInteger := ToInt(spAnio.Text);
      if chCuota50.Checked then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      edMes.ItemIndex := edMes.Properties.Items.Indexof(q.FieldbyName('Mes').AsString);
      spAnio.Text := q.FieldbyName('Anio').AsString;

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImportePropietario, C.ImporteInquilino, C.Pagado ' +
        '   from Inmuebles I' +
        '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '    and I.Codinq <> '''''+
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := edMes.Text;
      q.ParambyName('Anio').AsInteger := ToInt(spAnio.Text);
      if chCuota50.Checked  then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.AddCheckBox(0, I, False, False);
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[4,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[9,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
        gDetalle.SetCheckBoxState(0,I, q.FieldbyName('Pagado').AsInteger = 1);
        if q.FieldbyName('Pagado').AsInteger = 1 then
          gDetalle.RowColor[I] := clMoneyGreen
        else
          gDetalle.RowColor[I] := gDetalle.Color;
//        gDetalleCheckBoxClick(nil,0,I, q.FieldbyName('Pagado').AsInteger = 1);
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;
      prObtenerTotal;

    end;

  finally
    btnValidarClick(nil);
    prMarcarCedulonesEnVales;
    FreeAndNil(q);
  end;
end;

procedure TfNuevoCedulonPagado.btnValidarClick(Sender: TObject);
var
  cdsDatos: TClientDataSet;
  I: Integer;
begin
  cdsDatos := TClientDataset.Create(nil);
  try
    cdsDatos.FieldDefs.Clear;
    cdsDatos.FieldDefs.Add('Codigo', ftString,100);
    cdsDatos.FieldDefs.Add('Porcentaje', ftFloat);
    cdsDatos.CreateDataset;

    for I := 1 to gDetalle.RowCount - 1 do
    begin
      if gDetalle.Cells[3, I] = '' then
        Continue;

      cdsDatos.Filtered := False;
      cdsDatos.Filter := 'CODIGO = ' + QuotedStr(gDetalle.Cells[3, I]);
      cdsDatos.Filtered := True;

      if cdsDatos.IsEmpty then
      begin
        cdsDatos.Append;
        cdsDatos.FieldByName('Codigo').AsString := gDetalle.Cells[3, I];
        cdsDatos.FieldByName('Porcentaje').AsFloat := cdsDatos.FieldByName('Porcentaje').AsFloat + ToFloat(gDetalle.Cells[6, I]) + ToFloat(gDetalle.Cells[7, I]);
        cdsDatos.Post;
      end
      else
      begin
        cdsDatos.Edit;
        cdsDatos.FieldByName('Porcentaje').AsFloat := cdsDatos.FieldByName('Porcentaje').AsFloat + ToFloat(gDetalle.Cells[6, I]) + ToFloat(gDetalle.Cells[7, I]);
        cdsDatos.Post;
      end;
      cdsDatos.Filtered := False;
    end;

    for I := 1 to gDetalle.RowCount - 1 do
    begin
      cdsDatos.Filtered := False;
      cdsDatos.Filter := 'CODIGO = ' + QuotedStr(gDetalle.Cells[3, I]);
      cdsDatos.Filtered := True;

      if cdsDatos.FieldByName('Porcentaje').AsFloat > 100 then
        gDetalle.Colors[3, I] := RGB(255,185,185);
    end;
  finally
    FreeAndNil(cdsDatos);
  end;
end;

procedure TfNuevoCedulonPagado.AdvGlowButton2Click(Sender: TObject);
var
  Estado:Boolean;
  I: Integer;
  idTransaccion: INteger;
  q: TFXQuery;
  qConsulta: TFXQuery;
  dgrcuota: string;
  perimpu: string;
  Mes: Integer;
  Anio: string;
begin
  q := CrearQuery;
  qConsulta := CrearQuery;

  Mes := edMes.ItemIndex + 1;
  Anio := spAnio.Text;

  DM.IniciarTransaccion;
  try
    try
      qConsulta.Sql.Text := 'Select cuotas from Automatizacion A Where Codinq = :Codinq';
      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.GetCheckboxState(0, I, Estado) and (Estado) then
        begin
          if gDetalle.Readonly[0,I] then
            Continue;

          qConsulta.Close;
          qConsulta.ParambyName('Codinq').AsString := gDetalle.Cells[1, I];
          qConsulta.Open;

          dgrcuota := cuotadgr(IntToStr(mes),anio, qConsulta.fieldbyName('Cuotas').AsInteger);
          perimpu:=periodoimpuestos(FormatFloat('00', MES),anio);

          q.sql.text := 'Select Gen_ID(GEN_CAJAS, 1) as ID from RDB$DATABASE';
          Q.Open;

          idtransaccion := q.fieldbyname('id').AsInteger;

          InsertarCaja(IDTransaccion,
                       FormatDateTime('dd/mm/yyyy', now),
                       gDetalle.Cells[1, I],
                       'MA',
                       'M',
                       Inttostr(IDTransaccion));

          if DatoFijo = '04' then
          begin
            if ToFloat(gDetalle.Cells[8, I]) <> 0 then
              InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS Y/O SERVICIOS',
                       'D.G.R.' + DGRCUOTA,
                       '0.00',
                       FormatFloat('0.00', ToFloat(gDetalle.Cells[8, I])),
                       IDTransaccion);

            if ToFloat(gDetalle.Cells[9, I]) <> 0 then
              InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '27',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS A DESCONTAR',
                       'D.G.R.' + DGRCUOTA,
                       '0.00',
                       FormatFloat('0.00', ToFloat(gDetalle.Cells[9, I])),
                       IDTransaccion);
          end
          else if DatoFijo = '02' then
          begin
            if ToFloat(gDetalle.Cells[8, I]) <> 0 then
              InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS Y/O SERVICIOS',
                       'AGUAS CORDOBESAS ' + PERIMPU,
                       '0.00',
                       FormatFloat('0.00', ToFloat(gDetalle.Cells[8, I])),
                       IDTransaccion);
            if ToFloat(gDetalle.Cells[9, I]) <> 0 then
              InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS A DESCONTAR',
                       'AGUAS CORDOBESAS ' + PERIMPU,
                       '0.00',
                       FormatFloat('0.00', ToFloat(gDetalle.Cells[9, I])),
                       IDTransaccion);
          END
          else if DatoFijo = '05' then
          begin
            if ToFloat(gDetalle.Cells[8, I]) <> 0 then
              InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS Y/O SERVICIOS',
                       'TASA MUNICIPAL ' + PERIMPU,
                       '0.00',
                       FormatFloat('0.00', ToFloat(gDetalle.Cells[8, I])),
                       IDTransaccion);
            if ToFloat(gDetalle.Cells[9, I]) <> 0 then
              InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '27',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS A DESCONTAR',
                       'TASA MUNICIPAL ' + PERIMPU,
                       '0.00',
                       FormatFloat('0.00', ToFloat(gDetalle.Cells[9, I])),
                       IDTransaccion);

          end;
        end;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');

      btnGrabar.Click;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    ActualizarClick(nil);
  end;
end;


procedure TfNuevoCedulonPagado.btnBuscarClick(Sender: TObject);
begin
  gDetalle.SearchFooter.Visible := not gdetalle.SearchFooter.Visible;
  if gDetalle.SearchFooter.Visible then
    gDetalle.SearchPanel.EditControl.Setfocus;
end;

procedure TfNuevoCedulonPagado.btnGenerarValeClick(Sender: TObject);
var
  Estado:Boolean;
  I: Integer;
  idTransaccion: INteger;
  q, q1: TFXQuery;
  qConsulta: TFXQuery;
  dgrcuota: string;
  perimpu: string;
  Mes: Integer;
  Anio: string;
  Linea: Integer;
  Monto: Double;
  ID: String;
  Descripcion: string;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  qConsulta := CrearQuery;

  Mes := edMes.ItemIndex + 1;
  Anio := spAnio.Text;

  q.SQL.Text := ' Select Coalesce(Max(Codigo)+1, 1) as Codigo '+
                '   From CabezaVales ';
  q.Open;

  idtransaccion := q.fieldbyname('Codigo').AsInteger;

  DM.IniciarTransaccion;
  try
    qConsulta.Sql.Text := 'Select cuotas from Automatizacion A Where Codinq = :Codinq';
    try
      Linea := 1;
      Monto := 0;
      q1.Sql.text := 'Select Descripcion from conceptos where codigo = :codigo ';
      q1.Prepare;

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.GetCheckboxState(0, I, Estado) and (Estado) then
        begin
          if (ToFloat(gDetalle.Cells[8, I]) = 0) and (ToFloat(gDetalle.Cells[9, I]) = 0) then
            Continue;

          qConsulta.Close;
          qConsulta.ParambyName('Codinq').AsString := gDetalle.Cells[1, I];
          qConsulta.Open;

          dgrcuota := cuotadgr(IntToStr(mes),anio, qConsulta.fieldbyName('Cuotas').AsInteger);
          perimpu:=periodoimpuestos(FormatFloat('00', MES),anio);

          if ToFloat(gDetalle.Cells[8, I]) <> 0 then
          begin
            if gDetalle.FontStyles[8, I] = [fsBold] then
              Continue;

            id := FormatFloat('000', ToFLoat(edCOdigo.Text)) + gDetalle.Cells[1, I] + Datofijo + formatdatetime('yyyymmdd', StrToDate(edFecha.Text)) + '09' + gDetalle.Cells[3, I];
            Descripcion := 'IMP Y/O SERVICIOS';

            if DatoFijo = '04' then
            begin
              InsertarCuerpoVale(idtransaccion, Linea, gDetalle.Cells[1, I], '09', Descripcion + ' D.G.R. ' + DGRCUOTA, StrTODAte(edFecha.text), TOFloat(gDetalle.Cells[8, I]), 0, ID, 0,0);
              Monto := Monto  + TOFloat(gDetalle.Cells[8, I]);
            end
            else if DatoFijo = '02' then
            begin
              InsertarCuerpoVale(idtransaccion, Linea, gDetalle.Cells[1, I], '09', Descripcion + ' AGUAS CORDOBESAS ' + PERIMPU, StrTODAte(edFecha.text), TOFloat(gDetalle.Cells[8, I]), 0, ID, 0,0);
              Monto := Monto  + TOFloat(gDetalle.Cells[8, I]);
            END
            else if DatoFijo = '05' then
            begin
              InsertarCuerpoVale(idtransaccion, Linea, gDetalle.Cells[1, I], '09', Descripcion + ' TASA MUNICIPAL ' + PERIMPU, StrTODAte(edFecha.text), TOFloat(gDetalle.Cells[8, I]), 0, ID, 0,0);
              Monto := Monto  + TOFloat(gDetalle.Cells[8, I]);
            end;
            inc(Linea);
          end;
          if ToFloat(gDetalle.Cells[9, I]) <> 0 then
          begin
            if gDetalle.FontStyles[8, I] = [fsBold] then
              Continue;
            id := FormatFloat('000', ToFLoat(edCOdigo.Text)) + gDetalle.Cells[1, I] + Datofijo + formatdatetime('yyyymmdd', StrToDate(edFecha.Text)) + '27' + gDetalle.Cells[3, I];
            q1.Close;
            q1.ParambyName('Codigo').AsString := '27';
            q1.Open;

            if DatoFijo = '04' then
            begin
              InsertarCuerpoVale(idtransaccion, Linea, gDetalle.Cells[1, I], '27', q1.FieldbyName('Descripcion').AsString + ' D.G.R. ' + DGRCUOTA, StrTODAte(edFecha.text), TOFloat(gDetalle.Cells[9, I]), 0, ID, 0, 0);
              Monto := Monto  + TOFloat(gDetalle.Cells[9, I]);
            end
            else if DatoFijo = '02' then
            begin
              InsertarCuerpoVale(idtransaccion, Linea, gDetalle.Cells[1, I], '27', q1.FieldbyName('Descripcion').AsString + ' AGUAS CORDOBESAS ' + PERIMPU, StrTODAte(edFecha.text), TOFloat(gDetalle.Cells[9, I]), 0, ID, 0, 0);
              Monto := Monto  + TOFloat(gDetalle.Cells[9, I]);
            END
            else if DatoFijo = '05' then
            begin
              InsertarCuerpoVale(idtransaccion, Linea, gDetalle.Cells[1, I], '27', q1.FieldbyName('Descripcion').AsString + ' TASA MUNICIPAL ' + PERIMPU, StrTODAte(edFecha.text), TOFloat(gDetalle.Cells[9, I]), 0, ID, 0, 0);
              Monto := Monto  + TOFloat(gDetalle.Cells[9, I]);
            end;
            inc(Linea);
          end;
        end;
      end;
      if Monto > 0 then
        InsertarCabezaVale(idtransaccion, 'VALE ' + edEmpresa.Text + ' ' + edMes.Text + '/' + spAnio.Text, 2, Monto, Monto, edMes.ItemIndex + 1, ToInt(spAnio.Text), toInt(edCodigo.Text));

      DM.ConfirmarTransaccion;
      if Monto > 0 then
        MostrarDialogoAceptar('Se genero el vale correctamente con el nombre: ' + 'VALE ' + edEmpresa.Text + ' ' + edMes.Text + '/' + spAnio.Text + ' por un monto de $ ' + FormatFLoat(',0.00', Monto));
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    ActualizarClick(nil);
  end;
end;


procedure TfNuevoCedulonPagado.BorrarCeduln1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, True);
//    gDetalle.RowColor[I] := clMoneyGreen;
  end;
  prObtenerTotal;
  btnValidarClick(nil);

end;

procedure TfNuevoCedulonPagado.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, False);
    gDetalle.RowColor[I] := gDetalle.Color;
  end;
  prObtenerTotal;
  btnValidarClick(nil);
end;

procedure TfNuevoCedulonPagado.Desmarcarcomopagado1Click(Sender: TObject);
begin
  gDetalle.ReadOnly[0, gDetalle.Row] := False;
  gDetalle.SetCheckboxState(0, gDetalle.Row, False);
  gDetalle.RowColor[gDetalle.Row] := clWindow;
end;

procedure TfNuevoCedulonPagado.edEmpresaClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.Sql.Text :=
      ' Select Codigo From EmpresasImpuestos where Descripcion = :Descripcion ';
    q.ParambyName('Descripcion').AsString := edEmpresa.Text;
    q.Open;

    edCodigo.Text := q.FieldbyName('Codigo').AsString;
    ActualizarClick(nil);
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNuevoCedulonPagado.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNuevoCedulonPagado.Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
var
  q: TFXQuery;
  I: Integer;
begin
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

//  try
//    btnGrabar.Enabled := True;
//  finally
//
//  end;
  if ToInt(pCodigo) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
    btnGrabar.Enabled := False;
    Exit;
  end;

  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
      DatoFijo := q.FieldbyName('Identificacion').AsString;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, P.PorcentajeInquilino, P.PorcentajePropietario ' +
        '   from Inmuebles I' +
        '   Left Join PorcentajeCobro P on P.Codinq = I.Codinq ' +
        '  where P.Codigo = :Codigo' +
        '  Order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      if q.IsEmpty then
      begin
        MostrarDialogoAceptar('Debe asignar los porcentajes de pago para esta empresa.');
        Close;
        Exit;
      end;
      I := 1;
      gDetalle.BeginUpdate;
      try
        while not q.eof  do
        begin
          gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
          gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
          gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
          gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
          q.Next;
          Inc(I);
        end;
      Finally
        gDetalle.EndUpdate;
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;

    finally
      FreeAndNil(q);
    end;
  end
  else if Operacion = toModificar then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      edMes.ItemIndex := edMes.Properties.Items.Indexof(q.FieldbyName('Mes').AsString);
      spAnio.Text := q.FieldbyName('Anio').AsString;
      if not boEscopia then
      begin
        edMes.Enabled := False;
        spAnio.Enabled := False;
      end
      else
        FOperacion := toNuevo;

      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      DatoFijo := q.FieldbyName('Identificacion').AsString;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;
      FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;

      edEmpresa.Enabled := True;
      edEmpresa.ItemIndex := edEmpresa.Properties.Items.IndexOf(q.FieldbyName('Descripcion').Text);
      edEmpresa.Enabled := False;
      edEmpresa.Properties.Readonly := True;


      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.Pagado, C.FechaPago, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImporteInquilino, C.ImportePropietario, Cast(Coalesce(C.Cuota50, 0) as integer) as Cuota50 ' +
        '   from Inmuebles I' +
        '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :pCuota50'+
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('pCuota50').AsInteger := 1
      else
        q.ParambyName('pCuota50').AsInteger := 0;
      q.Open;
      chCuota50.Checked := q.FieldbyName('Cuota50').AsInteger = 1;

      I := 1;
      gDetalle.BeginUpdate;
      try
        while not q.eof  do
        begin
          gDetalle.AddCheckBox(0, I, False, False);
          edFecha.Text := FormatDateTime('dd/mm/yyyy', q.FieldByName('FechaPago').AsDateTime);
          gDetalle.Cells[0,I] := '';
          gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
          gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
          gDetalle.Cells[3,I] := q.FieldbyName('Cuenta').AsString;
          gDetalle.Cells[4,I] := q.FieldbyName('Vencimiento').AsString;
          gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
          gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
          gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
          gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
          gDetalle.Cells[9,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
          gDetalle.SetCheckBoxState(0,I, q.FieldbyName('Pagado').AsInteger = 1);
          if q.FieldbyName('Pagado').AsInteger = 1 then
            gDetalle.RowColor[I] := clMoneyGreen
          else
            gDetalle.RowColor[I] := gDetalle.Color;
          gDetalle.ReadOnly[0,I] := q.FieldbyName('Pagado').AsInteger = 1;

          q.Next;
          Inc(I);
        end;
      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;
      prObtenerTotal;
      finally
        gDetalle.EndUpdate;
      end;

    finally
      FreeAndNil(q);
      btnValidarClick(nil);
      prMarcarCedulonesEnVales;
    end;
  end
  else if Operacion = toEliminar then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;
      edEmpresa.Text := q.FieldbyName('Descripcion').Text;
      edEmpresa.Properties.Readonly := True;

      DatoFijo := q.FieldbyName('Identificacion').AsString;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;

      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      edMes.ItemIndex := edMes.Properties.Items.Indexof(q.FieldbyName('Mes').AsString);
      spAnio.Text := q.FieldbyName('Anio').AsString;
      if not boEscopia then
      begin
        edMes.Enabled := False;
        spAnio.Enabled := False;
      end
      else
        FOperacion := toNuevo;

      chCuota50.Checked := q.FieldbyName('Cuota50').AsString = '1';

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta ' +
        '   from Inmuebles I' +
        '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[4,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;

      if MostrarDialogoSino('Inmosys',
        '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
      begin
        DM.IniciarTransaccion;
        try
          q.Sql.Text :=
            'Delete from CabezaCedulones C '+
                '  where C.Codigo = :Codigo '+
                '    and C.Mes = :Mes '+
                '    and C.Anio = :Anio '+
                '    and C.Cuota50 = :Cuota50';
          q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
          q.ParambyName('Mes').AsString := Mes;
          q.ParambyName('Anio').AsInteger := ToInt(Anio);
          if Cuota50 = 'SI' then
            q.ParambyName('Cuota50').AsInteger := 1
          else
            q.ParambyName('Cuota50').AsInteger := 0;
          q.ExecSQL;
          q.Sql.Text :=
            'Delete from CuerpoCedulones C '+
                '  where C.Codigo = :Codigo '+
                '    and C.Mes = :Mes '+
                '    and C.Anio = :Anio '+
                '    and C.Cuota50 = :Cuota50';
          q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
          q.ParambyName('Mes').AsString := Mes;
          q.ParambyName('Anio').AsInteger := ToInt(Anio);
          if Cuota50 = 'SI' then
            q.ParambyName('Cuota50').AsInteger := 1
          else
            q.ParambyName('Cuota50').AsInteger := 0;
          q.ExecSQL;
          DM.ConfirmarTransaccion;
          MostrarDialogoAceptar('Datos eliminados correctamente.');
          if Assigned(fABMIdentificacionImpuestos) then
            fABMIdentificacionImpuestos.ActualizarClick(nil);
        except
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Inmosys',
            'Ocurrio un error al eliminar el dato Fijo.', mtError);
        end;
        Close;
      end
      else
        Close;
    finally
      FreeAndNil(q);
    end;
  end;
end;

procedure TfNuevoCedulonPagado.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
var
  Texto: string;

begin
  if Key = #13 then
  begin
    Texto := cxTextEdit1.Text;
    prInterpretarCodigoBarras(gDetalle.Row, Texto);
    prObtenerTotal;
    cxTextEdit1.Text := '';
  end;
end;

procedure TfNuevoCedulonPagado.prObtenerTotal;
var
  I, J: Integer;
  TotalInq: Double;
  TotalProp: Double;
  Total: Double;
  TotalPagado: Double;
  Estado: Boolean;
  boEncontrado: Boolean;
begin
  TotalInq := 0;
  TotalProp := 0;

  Total := 0;
  TotalPagado := 0;

  for I := 1 to gDetalle.RowCount - 1 do
  begin
    TotalInq := TotalInq + ToFloat(gDetalle.Cells[8, I]);
    TotalProp := TotalProp + ToFloat(gDetalle.Cells[9, I]);
  end;

  for I := 1 to gDetalle.RowCount - 1 do
    if gDetalle.GetcheckboxState(0, I, Estado) then
      if Estado then
      begin
        boEncontrado := False;
        for J := 1 to I - 1  do
          if (gDetalle.Cells[3,I] = gDetalle.Cells[3, J]) then
          begin
           if gDetalle.GetcheckboxState(0, J, Estado) then
             if Estado then
             begin
               boEncontrado := True;
               Break;
             end;
          end;

        if not boEncontrado then
          if gDetalle.Readonly[0, I] then
            TotalPagado := TotalPagado + ToFloat(gDetalle.Cells[5,I])
          else
            Total := Total + ToFloat(gDetalle.Cells[5, I]);
      end;

  edTotal.Text := FormatFloat('0.00', Total);
  edTotalPagado.Text := FormatFloat('0.00', TotalPagado);
  lbTotalInq.Caption := FormatFloat('$ ,0.00', TotalInq);
  lbTotalProp.Caption := FormatFloat('$ ,0.00', TotalProp);

end;

end.
