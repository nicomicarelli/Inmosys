unit frmNuevaDevolucionDinero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
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
  dxSkinSeven, cxCheckBox, FXQuery, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions;

type
  TfNuevaDevolucionDinero = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    Panel3: TPanel;
    ImageList1: TImageList;
    dsEmpresas: TDataSource;
    dsInquilinos: TDataSource;
    popOpciones: TPopupMenu;
    BorrarCeduln1: TMenuItem;
    Label6: TLabel;
    edTotal: TcxTextEdit;
    DeseleccionarTodos1: TMenuItem;
    qEmpresas: TFXQuery;
    qInquilinos: TFXQuery;
    btnGrabar: TAdvGlowButton;
    btnBuscar: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edFecha: TcxMaskEdit;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    edCodigo: TcxTextEdit;
    chCuota50: TcxCheckBox;
    edEmpresa: TcxComboBox;
    cxTextEdit1: TcxTextEdit;
    gDetalle: TAdvStringGrid;
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
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure gDetalleCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
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
  end;

var
  fNuevaDevolucionDinero: TfNuevaDevolucionDinero;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos,
  frmNuevoCedulon, frmNuevoCedulonPagado;
{$R *.DFM}

procedure TfNuevaDevolucionDinero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevaDevolucionDinero := nil;
end;

procedure TfNuevaDevolucionDinero.FormCreate(Sender: TObject);
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
end;

procedure TfNuevaDevolucionDinero.gDetalleCheckBoxClick(Sender: TObject; ACol,
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

procedure TfNuevaDevolucionDinero.gDetalleEditCellDone(Sender: TObject; ACol,
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

procedure TfNuevaDevolucionDinero.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    1,2,3: HAlign := taLeftJustify;
    4: HAlign := taCenter;
    5,6,7,8,9: HAlign := taRightJustify;
  end;
end;

procedure TfNuevaDevolucionDinero.gDetalleKeyPress(Sender: TObject; var Key: Char);
var
  stCodigo: string;
begin
  if gDetalle.Col in [2,3,4] then
    if not (Key in ['0'..'9',#8,#13]) then
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

procedure TfNuevaDevolucionDinero.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(gDetalle.Col, gDetalle.Row);
end;

procedure TfNuevaDevolucionDinero.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
var
  ID: string;
  Fecha: string;
  Importe: string;
  niIndice: Integer;
  niColID, niColImporte: Integer;
  boEncontrado, Estado: Boolean;
  I, niFila: integer;

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

procedure TfNuevaDevolucionDinero.actGrabarExecute(Sender: TObject);
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
  Codigo := edCodigo.Text;
  Descripcion := edEmpresa.Text;
  Mes := edMes.Text;
  Anio := spAnio.Text;
  Cuota50 := chCuota50.Checked;

  q := CrearQuery;
  qAutomatizacion := CrearQuery;
  qValorAutomatizacion := CrearQuery;
  qCampoAutomatizacion := CrearQuery;

  try
    try
      q.Sql.Text :=
        'Update CuerpoCedulones '+
        '   Set Pagado = :Pagado '+
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
        q.ParamByName('Mes').AsString := Mes;
        q.ParamByName('Anio').AsString := Anio;
        q.ParamByName('Cuota50').AsInteger := BooltoInt(Cuota50);
        if Estado then
          q.ParambyName('Pagado').AsInteger := 0
        else
          q.ParambyName('Pagado').AsInteger := 1;
        q.ExecSQL;

        Application.ProcessMessages;
      end;

      if Assigned(fABMIdentificacionImpuestos) then
        fABMIdentificacionImpuestos.ActualizarClick(nil);
      Close;
    Except
      on e: Exception do
      begin
//        MostrarDialogoAceptar('Ocurrio un error al grabar los cedulones.' + #13#10 +
//                              'Detalles Técnicos: ' + e.message);
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

procedure TfNuevaDevolucionDinero.ActualizarClick(Sender: TObject);
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
        '    and C.Pagado = 1 '+
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
        if I < 2 then
          gDetalle.RowCount := 2
        else
          gDetalle.RowCount := I+1;
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
        gDetalleCheckBoxClick(nil,0,I, q.FieldbyName('Pagado').AsInteger = 0);
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

procedure TfNuevaDevolucionDinero.AdvGlowButton1Click(Sender: TObject);
begin
  gDetalle.SearchFooter.Visible := not gdetalle.SearchFooter.Visible;
  if gDetalle.SearchFooter.Visible then
    gDetalle.SearchPanel.EditControl.Setfocus;
end;

procedure TfNuevaDevolucionDinero.AdvGlowButton2Click(Sender: TObject);
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
    qConsulta.Sql.Text := 'Select cuotas from Automatizacion A Where Codinq = :Codinq';
    try
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
            InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS Y/O SERVICIOS',
                       'D.G.R.' + DGRCUOTA,
                       FormatFloat('0.00', TOFloat(gDetalle.Cells[8, I])),
                       '0.00',
                       IDTransaccion);
          end
          else if DatoFijo = '02' then
          begin
            InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS Y/O SERVICIOS',
                       'AGUAS CORDOBESAS ' + PERIMPU,
                       FormatFloat('0.00', TOFloat(gDetalle.Cells[8, I])),
                       '0.00',
                       IDTransaccion);
          END
          else if DatoFijo = '05' then
          begin
            InsertarCajaDetalles(IDTransaccion,
                       gDetalle.Cells[1, I],
                       '09',
                       FormatDateTime('dd/mm/yyyy', now),
                       '1',
                       'IMPUESTOS Y/O SERVICIOS',
                       'TASA MUNICIPAL ' + PERIMPU,
                       FormatFloat('0.00', TOFloat(gDetalle.Cells[8, I])),
                       '0.00',
                       IDTransaccion);

          end;
        end;
      end;
      btnGrabar.Click;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;


procedure TfNuevaDevolucionDinero.BorrarCeduln1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, True);
    gDetalleCheckBoxClick(nil,0, I, True);
  end;
end;

procedure TfNuevaDevolucionDinero.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, False);
    gDetalleCheckBoxClick(nil,0, I, False);
  end;
end;

procedure TfNuevaDevolucionDinero.edEmpresaClick(Sender: TObject);
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

procedure TfNuevaDevolucionDinero.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNuevaDevolucionDinero.Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
var
  q: TFXQuery;
  I: Integer;
begin
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;
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
      while not q.eof  do
      begin
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
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
  end
  else if Operacion = toModificar then
  begin
    ActualizarClick(nil);
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
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.FechaPago, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta ' +
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
        edFecha.Text := FormatDateTime('dd/mm/yyyy', q.FieldByName('FechaPago').AsDateTime);
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

  if gDetalle.Cells[1,1] ='' then
  begin
    MostrarDialogoAceptar('No hay cedulones pagados a devolver. Verifique por favor.');
    Close;
  end;

end;

procedure TfNuevaDevolucionDinero.cxTextEdit1KeyPress(Sender: TObject;
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

procedure TfNuevaDevolucionDinero.prObtenerTotal;
var
  I, J: Integer;
  Total: Double;
  Estado: Boolean;
  boEncontrado: Boolean;
begin
  Total := 0;

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
          Total := Total + ToFloat(gDetalle.Cells[5,I]);
      end;

  edTotal.Text := FormatFloat('0.00', Total);
end;

end.
