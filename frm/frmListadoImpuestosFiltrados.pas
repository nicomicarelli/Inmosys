unit frmListadoImpuestosFiltrados;

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
  dxSkinSeven, cxCheckBox, ppDB, ppDBJIT, ppParameter, ppModule, raCodMod,
  ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  fxQuery, ppDesignLayer, System.Actions, cxGroupBox, AdvPanel;

type
  TfListadoImpuestosFiltrados = class(TForm)
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
    Reporte: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel10: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
    ppLabel8: TppLabel;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    plReporteppField5: TppField;
    plReporteppField6: TppField;
    plReporteppField7: TppField;
    plReporteppField8: TppField;
    plReporteppField9: TppField;
    ppLabel7: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel4: TppLabel;
    plTitulos: TppJITPipeline;
    plTitulosppField1: TppField;
    plTitulosppField2: TppField;
    plTitulosppField3: TppField;
    plTitulosppField4: TppField;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    plTitulosppField5: TppField;
    ppDBText7: TppDBText;
    qInquilinos: TFXQuery;
    qEmpresas: TFXQuery;
    pnlFondo: TAdvPanel;
    gbxBotones: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    chCuota50: TcxCheckBox;
    Label6: TLabel;
    edTotal: TcxTextEdit;
    gDetalle: TAdvStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edFecha: TcxMaskEdit;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    edCodigo: TcxTextEdit;
    edEmpresa: TcxComboBox;
    Label1: TLabel;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    Actualizar: TAdvGlowButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure gDetalleSearchFooterAction(Sender: TObject; Value: string; ACol,
      ARow: Integer; SearchAction: TSearchAction);
    procedure ActualizarClick(Sender: TObject);
    procedure edEmpresaClick(Sender: TObject);
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure gDetalleCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    function plTitulosGetFieldValue(aFieldName: string): Variant;
  private
    FOperacion: TTipoOperacion;
    FPorcentajeRecargo: Double;
  public
    DatoFijo: String;
    PantallaActiva: TPantallaActiva;
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, CantCodigos: Integer;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
    procedure prObtenerTotal;
  end;

var
  fListadoImpuestosFiltrados: TfListadoImpuestosFiltrados;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos,
  frmNuevoCedulon;
{$R *.DFM}

procedure TfListadoImpuestosFiltrados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fListadoImpuestosFiltrados := nil;
end;

procedure TfListadoImpuestosFiltrados.FormCreate(Sender: TObject);
var
  Fila: Integer;
  TiTulos: string;
begin
  Titulos := gDetalle.Rows[0].text;
  gDetalle.ClearAll;
  gDetalle.Rows[0].Text := Titulos;  fPrincipal.Center(Self);
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

procedure TfListadoImpuestosFiltrados.gDetalleCheckBoxClick(Sender: TObject; ACol,
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

procedure TfListadoImpuestosFiltrados.gDetalleEditCellDone(Sender: TObject; ACol,
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

procedure TfListadoImpuestosFiltrados.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    1,2,3: HAlign := taLeftJustify;
    4: HAlign := taCenter;
    5,6,7,8,9: HAlign := taRightJustify;
  end;
end;

procedure TfListadoImpuestosFiltrados.gDetalleKeyPress(Sender: TObject; var Key: Char);
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

//      if CantCodigos = 1 then
//      begin
//          prInterpretarCodigoBarras(gDetalle.Row, cxTextEdit1.Text);
//      end
//      else
//      begin
//        stCodigo := gDetalle.Cells[gDetalle.Col, gDetalle.Row];
//
//        if fCodigosBarras = nil then
//          Application.CreateForm(TfCodigosBarras, fCodigosBarras)
//        else
//          fCodigosBarras.Show;
//        fCodigosBarras.Preparar(IDDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, FPorcentajeRecargo);
//        fCodigosBarras.Cargar(stCodigo, gDetalle.Row, 1);
//        fCodigosBarras.Hide;
//        fCodigosBarras.ShowModal;
//      end;
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

procedure TfListadoImpuestosFiltrados.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(gDetalle.Col, gDetalle.Row);
end;

function TfListadoImpuestosFiltrados.plTitulosGetFieldValue(
  aFieldName: string): Variant;
begin
  if aFieldName = 'Empresa' then
    Result := edCodigo.Text + ' - ' + edEmpresa.Text
  else if aFieldName = 'Mes' then
    Result := edMes.Text + '/' + spAnio.Text
  else if aFieldName = 'FechaPago' then
    Result := edFecha.Text
  else if aFieldName = 'Total' then
    Result := edTotal.Text
  else if aFieldName = 'Titulo' then
    Result := Label1.Caption;
end;

procedure TfListadoImpuestosFiltrados.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
var
  ID: string;
  Fecha: string;
  Importe: string;
  niIndice: Integer;
  niColID, niColImporte: Integer;
  Estado: Boolean;
begin
  niColID := 3;
  niColImporte := 5;

  prTraducirCodigoBarras(ATexto, ID, Fecha, Importe, IdDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, FPorcentajeRecargo);

  if not fxBuscarCedulon(ID, Fecha, Importe, edMes.text, spAnio.Text, chCuota50.Checked,
    gDetalle, niIndice, niColID, niColImporte, 1, False) then
  begin
    MostrarDialogoAceptar('El cedulón no se encuentra cargado en la grilla');
    Exit;
  end;

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

  prObtenerTotal;
end;

procedure TfListadoImpuestosFiltrados.actGrabarExecute(Sender: TObject);
var
  Grilla: TStringAlignGrid;
  I: Integer;
begin
  Grilla := TStringAlignGrid.Create(nil);
  try
    if gDetalle.Cells[1,1] = '' then
      Exit;

    Grilla.ColCount := gDetalle.ColCount;
    Grilla.RowCount := gDetalle.RowCount;

    for I := 0 to gDetalle.RowCount - 1 do
      Grilla.Rows[I] := gDetalle.Rows[I];

    if PantallaActiva = paPagadosCobrados then
      ImprimirReporte ( Reporte,  plReporte,  Grilla )
    else if PantallaActiva = paPagadosNoCobrados then
      ImprimirReporte ( Reporte,  plReporte,  Grilla )
    else if PantallaActiva = paCobradosNoPagados then
      ImprimirReporte ( Reporte,  plReporte,  Grilla ) ;

  finally
    FreeAndNil(grilla);
  end;
end;

procedure TfListadoImpuestosFiltrados.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  pCodigo: string;
  Mes: string;
  Anio: Integer;
  TiTulos: string;
begin
  Titulos := gDetalle.Rows[0].text;
  gDetalle.ClearAll;
  gDetalle.Rows[0].Text := Titulos;
  pCodigo := edCodigo.Text;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;

  q := CrearQuery;
  try
    if FOperacion = toNuevo then
    begin
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
        btnGrabar.Enabled := False;
        Close;
        Exit;
      end;
    end;

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
    Mes := edMes.Text;
    Anio := ToInt(spAnio.Text);
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

      edMes.Text := q.FieldbyName('Mes').AsString;
      spAnio.Text := q.FieldbyName('Anio').AsString;

       if PantallaActiva = paPagadosCobrados then
       begin
         q.Sql.Text :=
           'select I.CODINQ, I.INQUILINO, C.PORCENTAJEINQUILINO, '+
           '       C.PORCENTAJEPROPIETARIO, C.VENCIMIENTO, C.IMPORTE, C.CUENTA, '+
           '       C.IMPORTEPROPIETARIO, C.IMPORTEINQUILINO, C.PAGADO '+
           '  from INMUEBLES I '+
           ' inner join CUERPOCEDULONES C on C.CODINQ = I.CODINQ '+
           ' where C.CODIGO = :CODIGO and '+
           '       C.MES = :MES and '+
           '       C.ANIO = :ANIO and '+
           '       C.CUOTA50 = :CUOTA50 and '+
           '       C.pagado = 1 and '+
           '       I.CODINQ <> '''' and '+
           '       EXISTS( SELECT CT.CODINQ FROM CTACTEINQUILINO CT '+
           '                WHERE CT.CODINQ = C.codinq '+
           '                  AND CT.FECHARECIBO = :Fecha '+
           '                  and (ct.haber > 0)) '+
           ' order by I.CODINQ';
         q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
         q.ParambyName('Mes').AsString := Mes;
         q.ParambyName('Anio').AsInteger := Anio;
         q.ParambyName('Fecha').AsDateTime := StrToDate(edFecha.Text);
         if chCuota50.checked then
           q.ParamByName('Cuota50').AsInteger := 1
         else
           q.ParamByName('Cuota50').AsInteger := 0;
         q.Open;
       end
       else if PantallaActiva = paCobradosNoPagados then
       begin
         q.Sql.Text :=
           'select I.CODINQ, I.INQUILINO, C.PORCENTAJEINQUILINO, '+
           '       C.PORCENTAJEPROPIETARIO, C.VENCIMIENTO, C.IMPORTE, C.CUENTA, '+
           '       C.IMPORTEPROPIETARIO, C.IMPORTEINQUILINO, C.PAGADO '+
           '  from INMUEBLES I '+
           ' inner join CUERPOCEDULONES C on C.CODINQ = I.CODINQ '+
           ' where C.CODIGO = :CODIGO and '+
           '       C.MES = :MES and '+
           '       C.ANIO = :ANIO and '+
           '       C.CUOTA50 = :CUOTA50 and '+
           '       C.pagado = 0 and '+
           '       I.CODINQ <> '''' and '+
           '       EXISTS( SELECT CT.CODINQ FROM CTACTEINQUILINO CT '+
           '                WHERE CT.CODINQ = C.codinq '+
           '                  AND CT.FECHARECIBO = :Fecha '+
           '                  and (ct.haber > 0)) '+
           ' order by I.CODINQ';
         q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
         q.ParambyName('Mes').AsString := Mes;
         q.ParambyName('Anio').AsInteger := Anio;
         q.ParambyName('Fecha').AsDateTime := StrToDate(edFecha.Text);
         if chCuota50.checked then
           q.ParamByName('Cuota50').AsInteger := 1
         else
           q.ParamByName('Cuota50').AsInteger := 0;
         q.Open;
       end
       else if PantallaActiva = paPagadosNoCobrados then
       begin
         q.Sql.Text :=
           'select I.CODINQ, I.INQUILINO, C.PORCENTAJEINQUILINO, '+
           '       C.PORCENTAJEPROPIETARIO, C.VENCIMIENTO, C.IMPORTE, C.CUENTA, '+
           '       C.IMPORTEPROPIETARIO, C.IMPORTEINQUILINO, C.PAGADO '+
           '  from INMUEBLES I '+
           ' inner join CUERPOCEDULONES C on C.CODINQ = I.CODINQ '+
           ' where C.CODIGO = :CODIGO and '+
           '       C.MES = :MES and '+
           '       C.ANIO = :ANIO and '+
           '       C.CUOTA50 = :CUOTA50 and '+
           '       C.pagado = 1 and '+
           '       I.CODINQ <> '''' and '+
           '       NOT EXISTS( SELECT CT.CODINQ FROM CTACTEINQUILINO CT '+
           '                WHERE CT.CODINQ = C.codinq '+
           '                  AND CT.FECHARECIBO = :Fecha '+
           '                  and (ct.haber > 0)) '+
           ' order by I.CODINQ';
         q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
         q.ParambyName('Mes').AsString := Mes;
         q.ParambyName('Anio').AsInteger := Anio;
         q.ParambyName('Fecha').AsDateTime := StrToDate(edFecha.Text);
         if chCuota50.checked then
           q.ParamByName('Cuota50').AsInteger := 1
         else
           q.ParamByName('Cuota50').AsInteger := 0;
         q.Open;
       end;

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
        gDetalleCheckBoxClick(nil,0,I, q.FieldbyName('Pagado').AsInteger = 1);
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;
    end;

  finally
    FreeAndNil(q);
  end;
end;

procedure TfListadoImpuestosFiltrados.AdvGlowButton1Click(Sender: TObject);
begin
  gDetalle.SearchFooter.Visible := not gdetalle.SearchFooter.Visible;
  if gDetalle.SearchFooter.Visible then
    gDetalle.SearchPanel.EditControl.Setfocus;
end;

procedure TfListadoImpuestosFiltrados.BorrarCeduln1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, True);
    gDetalleCheckBoxClick(nil,0, I, True);
  end;
end;

procedure TfListadoImpuestosFiltrados.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, False);
    gDetalleCheckBoxClick(nil,0, I, False);
  end;
end;

procedure TfListadoImpuestosFiltrados.edEmpresaClick(Sender: TObject);
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

procedure TfListadoImpuestosFiltrados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfListadoImpuestosFiltrados.Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
var
  q: TFXQuery;
  I: Integer;
  TiTulos: string;
  ndTotal: Double;
begin
  Titulos := gDetalle.Rows[0].text;
  gDetalle.ClearAll;
  gDetalle.Rows[0].Text := Titulos;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;
  if ToInt(pCodigo) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
    btnGrabar.Enabled := False;
    Exit;
  end;


//  if Operacion = toNuevo then
//  begin
//    q := CrearQuery;
//    try
//      q.Sql.Text :=
//        ' Select E.* from EmpresasImpuestos E' +
//        ' where Codigo = :Codigo';
//      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
//      q.Open;
//
//      FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
//      DatoFijo := q.FieldbyName('Identificacion').AsString;
//      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
//      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
//      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
//      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
//      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
//      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
//      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;
//
//      q.Sql.Text :=
//        ' Select I.Codinq, I.Inquilino, P.PorcentajeInquilino, P.PorcentajePropietario ' +
//        '   from Inmuebles I' +
//        '   Left Join PorcentajeCobro P on P.Codinq = I.Codinq ' +
//        '  where P.Codigo = :Codigo' +
//        '  Order by I.Codinq ';
//      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
//      q.Open;
//
//      if q.IsEmpty then
//      begin
//        MostrarDialogoAceptar('Debe asignar los porcentajes de pago para esta empresa.');
//        Close;
//        Exit;
//      end;
//      I := 1;
//      while not q.eof  do
//      begin
//        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
//        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
//        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
//        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
//        q.Next;
//        Inc(I);
//      end;
//
//      if I < 2 then
//        gDetalle.RowCount := 2
//      else
//        gDetalle.RowCount := I;
//
//    finally
//      FreeAndNil(q);
//    end;
//  end
//  else if Operacion = toModificar then
//  begin
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
        FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;

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

        edMes.Text := q.FieldbyName('Mes').AsString;
        spAnio.Text := q.FieldbyName('Anio').AsString;
        if not boEscopia then
        begin
          edMes.Enabled := False;
          spAnio.Enabled := False;
        end
        else
          FOperacion := toNuevo;

        chCuota50.Checked := q.FieldbyName('Cuota50').AsString = '1';

       ndTotal := 0;
       if PantallaActiva = paPagadosCobrados then
       begin
         Label1.Caption := 'Cedulones pagados y cobrados';

         q.Sql.Text :=
           'select I.CODINQ, I.INQUILINO, C.PORCENTAJEINQUILINO, '+
           '       C.PORCENTAJEPROPIETARIO, C.VENCIMIENTO, C.IMPORTE, C.CUENTA, '+
           '       C.IMPORTEPROPIETARIO, C.IMPORTEINQUILINO, C.PAGADO, C.FechaPago '+
           '  from INMUEBLES I '+
           ' inner join CUERPOCEDULONES C on C.CODINQ = I.CODINQ '+
           ' where C.CODIGO = :CODIGO and '+
           '       C.MES = :MES and '+
           '       C.ANIO = :ANIO and '+
           '       C.CUOTA50 = :CUOTA50 and '+
           '       C.pagado = 1 and '+
           '       I.CODINQ <> '''' and '+
           '       EXISTS( SELECT CT.CODINQ FROM CTACTEINQUILINO CT '+
           '                WHERE CT.CODINQ = C.codinq '+
           '                  AND CT.FECHARECIBO = C.fechapago '+
           '                  and (ct.haber > 0)) '+
           ' order by I.CODINQ';
         q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
         q.ParambyName('Mes').AsString := Mes;
         q.ParambyName('Anio').AsInteger := ToInt(Anio);
         if Cuota50 = 'SI' then
           q.ParambyName('Cuota50').AsInteger := 1
         else
           q.ParambyName('Cuota50').AsInteger := 0;
         q.Open;
       end
       else if PantallaActiva = paCobradosNoPagados then
       begin
         Label1.Caption := 'Cedulones cobrados y no pagados';
         q.Sql.Text :=
           'select I.CODINQ, I.INQUILINO, C.PORCENTAJEINQUILINO, '+
           '       C.PORCENTAJEPROPIETARIO, C.VENCIMIENTO, C.IMPORTE, C.CUENTA, '+
           '       C.IMPORTEPROPIETARIO, C.IMPORTEINQUILINO, C.PAGADO, C.FechaPago '+
           '  from INMUEBLES I '+
           ' inner join CUERPOCEDULONES C on C.CODINQ = I.CODINQ '+
           ' where C.CODIGO = :CODIGO and '+
           '       C.MES = :MES and '+
           '       C.ANIO = :ANIO and '+
           '       C.CUOTA50 = :CUOTA50 and '+
           '       C.pagado = 0 and '+
           '       I.CODINQ <> '''' and '+
           '       EXISTS( SELECT CT.CODINQ FROM CTACTEINQUILINO CT '+
           '                WHERE CT.CODINQ = C.codinq '+
           '                  AND CT.FECHARECIBO = C.fechapago '+
           '                  and (ct.haber > 0)) '+
           ' order by I.CODINQ';
         q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
         q.ParambyName('Mes').AsString := Mes;
         q.ParambyName('Anio').AsInteger := ToInt(Anio);
         if Cuota50 = 'SI' then
           q.ParambyName('Cuota50').AsInteger := 1
         else
           q.ParambyName('Cuota50').AsInteger := 0;
         q.Open;
       end
       else if PantallaActiva = paPagadosNoCobrados then
       begin
         Label1.Caption := 'Cedulones pagados y no cobrados';
         q.Sql.Text :=
           'select I.CODINQ, I.INQUILINO, C.PORCENTAJEINQUILINO, '+
           '       C.PORCENTAJEPROPIETARIO, C.VENCIMIENTO, C.IMPORTE, C.CUENTA, '+
           '       C.IMPORTEPROPIETARIO, C.IMPORTEINQUILINO, C.PAGADO, C.FechaPago '+
           '  from INMUEBLES I '+
           ' inner join CUERPOCEDULONES C on C.CODINQ = I.CODINQ '+
           ' where C.CODIGO = :CODIGO and '+
           '       C.MES = :MES and '+
           '       C.ANIO = :ANIO and '+
           '       C.CUOTA50 = :CUOTA50 and '+
           '       C.pagado = 1 and '+
           '       I.CODINQ <> '''' and '+
           '       NOT EXISTS( SELECT CT.CODINQ FROM CTACTEINQUILINO CT '+
           '                WHERE CT.CODINQ = C.codinq '+
           '                  AND CT.FECHARECIBO = C.fechapago '+
           '                  and (ct.haber > 0)) '+
           ' order by I.CODINQ';
         q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
         q.ParambyName('Mes').AsString := Mes;
         q.ParambyName('Anio').AsInteger := ToInt(Anio);
         if Cuota50 = 'SI' then
           q.ParambyName('Cuota50').AsInteger := 1
         else
           q.ParambyName('Cuota50').AsInteger := 0;
         q.Open;
       end;

        I := 1;
        while not q.eof  do
        begin
          if I < 2 then
            gDetalle.RowCount := 3
          else
            gDetalle.RowCount := I+1;

          gDetalle.AddCheckBox(0, I, False, False);
          edFecha.Text := FormatDateTime('dd/mm/yyyy', q.FieldByName('FechaPago').AsDateTime);
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
          gDetalleCheckBoxClick(nil,0,I, q.FieldbyName('Pagado').AsInteger = 1);
          gDetalle.ReadOnly[0,I] := q.FieldbyName('Pagado').AsInteger = 1;
          ndTotal := ndTotal + q.FieldbyName('Importe').AsFloat;
          q.Next;
          Inc(I);
        end;
        if I < 2 then
          gDetalle.RowCount := 2
        else
          gDetalle.RowCount := I;


      finally
        FreeAndNil(q);
      end;

     edTotal.Text := FormatFloat('0.00', ndTotal);
end;

procedure TfListadoImpuestosFiltrados.prObtenerTotal;
begin
end;

end.
