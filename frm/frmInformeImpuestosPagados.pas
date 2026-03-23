unit frmInformeImpuestosPagados;

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
  cxGroupBox, AdvPanel;

type
  TTipoInforme = (tiValeNoAutomatizado, tiValeNoAutomatizadoDiferencia, tiAutomatizadoNoPagado, tiValeNoCobrado,
                  tiValeNoCobradoDiferencias, tiRepetidos, tiComisionesNoCobradas, tiValesRepetidos);

  TfInformeImpuestosPagados = class(TForm)
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
    qInquilinos: TFXQuery;
    pnlFondo: TAdvPanel;
    gbxBotones: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    edVale: TcxTextEdit;
    gDetalle: TAdvStringGrid;
    cbVales: TcxComboBox;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnBuscar: TAdvGlowButton;
    edCodigo: TcxTextEdit;
    edEmpresa: TcxComboBox;
    Label1: TLabel;
    qVales: TFXQuery;
    dsVales: TDataSource;
    qEmpresas: TFXQuery;
    Label3: TLabel;
    edTotal: TcxTextEdit;
    Label4: TLabel;
    edDatoFijo: TEdit;
    btnEliminar: TAdvGlowButton;
    SeleccionarTodos1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    N1: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    TodosCodigos: TcxCheckBox;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnEliminarClick(Sender: TObject);
    procedure gDetalleSearchFooterAction(Sender: TObject; Value: string; ACol,
      ARow: Integer; SearchAction: TSearchAction);
    procedure ActualizarClick(Sender: TObject);
    procedure cbValesClick(Sender: TObject);
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure edEmpresaPropertiesChange(Sender: TObject);
    procedure edEmpresaPropertiesEditValueChanged(Sender: TObject);
    procedure edEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
    FPorcentajeRecargo: Double;
  public
    TipoInforme: TTipoInforme;
    DatoFijo: String;
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, CantCodigos: Integer;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: Boolean = True; boEsCopia: Boolean = False);
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
  end;

var
  fInformeImpuestosPagados: TfInformeImpuestosPagados;
  fInformeDifNoAutomatizadas: TfInformeImpuestosPagados;
  fInformeAutomatizadoNoPagado: TfInformeImpuestosPagados;
  fInformeValeNoCobrado: TfInformeImpuestosPagados;
  fInformeValeNoCobradoDiferencias: TfInformeImpuestosPagados;
  fInformeItemsRepetidos: TfInformeImpuestosPagados;
  fInformeComisionesNoCobradas: TfInformeImpuestosPagados;
  fInformeValesRepetidos: TfInformeImpuestosPagados;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos,
  ABMImpuestosPagados;
{$R *.DFM}

procedure TfInformeImpuestosPagados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(fInformeDifNoAutomatizadas) then
    fInformeDifNoAutomatizadas := nil;

  if Assigned(fInformeImpuestosPagados) then
    fInformeImpuestosPagados := nil;

  if Assigned(fInformeAutomatizadoNoPagado) then
    fInformeAutomatizadoNoPagado := nil;

  if Assigned(fInformeValeNoCobrado) then
    fInformeValeNoCobrado := nil;

  if Assigned(fInformeItemsRepetidos) then
    fInformeItemsRepetidos := nil;

  if Assigned(fInformeValeNoCobradoDIferencias) then
    fInformeValeNoCobradoDiferencias := nil;


end;

procedure TfInformeImpuestosPagados.FormCreate(Sender: TObject);
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

//  edEmpresa.ItemIndex := 0;

//  qInquilinos.Connection := DM.Conexion;
//  qInquilinos.Open;

//  edEmpresaClick(nil);

//  Fila := 1;
//  while not qInquilinos.eof do
//  begin
//    gDetalle.Cells[0, Fila] := qInquilinos.FieldByName('Codinq').AsString;
//    gDetalle.Cells[1, Fila] := qInquilinos.FieldByName('Inquilino').AsString;
////    gDetalle.ReadOnly[0, Fila] := False;
////    gDetalle.ReadOnly[1, Fila] := False;
//    Inc(Fila);
//    qInquilinos.Next;
//  end;
//  gDetalle.RowCount := Fila;
end;

procedure TfInformeImpuestosPagados.FormShow(Sender: TObject);
begin
  Label4.Visible  := TipoInforme = tiAutomatizadoNoPagado;
  edDatoFijo.Visible  := TipoInforme = tiAutomatizadoNoPagado;
  btnEliminar.Visible := TipoInforme = tiAutomatizadoNoPagado;
end;

procedure TfInformeImpuestosPagados.gDetalleEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 5 then
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

  if ACol = 6 then
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

procedure TfInformeImpuestosPagados.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2,3,4: HAlign := taLeftJustify;
//    3: HAlign := taCenter;
    5,6,7,8,9: HAlign := taRightJustify;
  end;
end;

procedure TfInformeImpuestosPagados.gDetalleKeyPress(Sender: TObject; var Key: Char);
var
  stCodigo: string;
begin
  if gDetalle.Col in [1,2,3] then
    if not (CHarInSet(Key, ['0'..'9',#8,#13])) then
      Key := #0;

  if Key = #13 then
  begin
    if gDetalle.Col = 2 then
    begin
      if edCodigo.Text = '' then
      begin
        MostrarDialogoAceptar('Debe seleccionar la empresa relacionada. Verifique por favor.');
        Exit;
      end;

      if CantCodigos = 1 then
      begin
          prInterpretarCodigoBarras(gDetalle.Row, gDetalle.Cells[gDetalle.Col, gDetalle.Row]);
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
    else if gDetalle.Col = 4 then
    begin
      gDetalle.Cells[5, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, gDetalle.Row]));
      gDetalle.Cells[8, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, gDetalle.Row])*ToFloat(gDetalle.Cells[6, gDetalle.Row])/100);
      gDetalle.Cells[9, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, gDetalle.Row])*ToFloat(gDetalle.Cells[7, gDetalle.Row])/100);
      if gDetalle.Row + 1 <= gDetalle.RowCount -1 then
        gDetalle.Row := gDetalle.Row + 1
      else
        gDetalle.Row := gDetalle.Row - 1;
    end
    else if gDetalle.Col = 5 then
    begin

    end
    else if gDetalle.Col = 6 then
    begin

    end


  end;
end;

procedure TfInformeImpuestosPagados.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(3, gDetalle.Row);
end;

procedure TfInformeImpuestosPagados.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
var
  ID: string;
  Fecha: string;
  Importe: string;
  ndRedondeado: Double;
  ndImporteRedondeo: Double;

begin

  prTraducirCodigoBarras(ATexto, ID, Fecha, Importe, IdDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, FPorcentajeRecargo);

//  if fxBuscarCedulon(ID, Fecha, Importe, edMes.text, spAnio.Text, chCuota50.Checked,
//    gDetalle, niIndice, niColID, niColImporte) then
//  begin
//    MostrarDialogoAceptar('El cedulón ya se encuentra cargado en la grilla o base de datos');
//    Exit;
//  end;

  gDetalle.Cells[2, Fila] := Copy(ATexto, IdDesde, IDHasta - IDDesde + 1);
//  gDetalle.Cells[3, Fila] := Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),1,2) + '/' +
//    Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),3,2) + '/' +
//    Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),5,4);
  gDetalle.Cells[4, Fila] := FormatDatetime('dd/mm/yyyy', StrTODate(Fecha));
  gDetalle.Cells[5, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100));
  gDetalle.Cells[8, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100)*ToFloat(gDetalle.Cells[5,Fila])/100);
  gDetalle.Cells[9, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100)*ToFloat(gDetalle.Cells[6,Fila])/100);

//  ndRedondeado := ToFloat(gDetalle.Cells[4, Fila]);
//
//  ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
//  gDetalle.Cells[4, Fila] := FormatFloat('0.00', ndRedondeado);
//  ndRedondeado := fxRedondearImporte(ToFloat(gDetalle.Cells[7, Fila]), ndImporteredondeo);
//  gDetalle.Cells[7, Fila] := FormatFloat('0.00', ndRedondeado);
//  ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
//  gDetalle.Cells[7, Fila] := FormatFloat('0.00', ndRedondeado);
//  ndRedondeado := fxRedondearImporte(ToFloat(gDetalle.Cells[8, Fila]), ndImporteredondeo);
//  gDetalle.Cells[8, Fila] := FormatFloat('0.00', ndRedondeado);
//  ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
//  gDetalle.Cells[8, Fila] := FormatFloat('0.00', ndRedondeado);


  if (Fila + 1 <= gDetalle.RowCount - 1) and (gDetalle.Col = 2) then
    gDetalle.EditCell(2, Fila + 1);

end;

procedure TfInformeImpuestosPagados.SeleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.SetCheckBoxState(0, I, True);
end;

procedure TfInformeImpuestosPagados.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edit1.Text:='';
    edit2.Text:='';
  end;

  if Trim(edit1.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfInformeImpuestosPagados.actGrabarExecute(Sender: TObject);
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
  Fecha: TDateTime;
  FechaPago: TDateTime;
  ActualizaAutomatizacion: Boolean;
  ValorInquilino, ValorPropietario: Double;
  Es4, Es5, Es2, Es9, Es27: Boolean;
begin
  Codigo := edCodigo.Text;
  Descripcion := edEmpresa.Text;

//  ActualizaAutomatizacion := MostrarDialogoSiNo('¿Actualizar datos de automatización para estos inquilinos?');
  ActualizaAutomatizacion := False;

  DM.IniciarTransaccion;
  q := CrearQuery;
  qAutomatizacion := CrearQuery;
  qValorAutomatizacion := CrearQuery;
  qCampoAutomatizacion := CrearQuery;
  try
    try
      q.Sql.Text :=
        'Delete from CabezaCedulones '+
        ' where Codigo = :Codigo' +
        '   and Mes = :Mes ' +
        '   and Anio = :Anio '+
        '   and Cuota50 = :Cuota50';
      q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
      q.ParamByName('Mes').AsString := Mes;
      q.ParamByName('Anio').AsString := Anio;
      if Cuota50 then
        q.ParamByName('Cuota50').AsInteger := 1
      else
        q.ParamByName('Cuota50').AsInteger := 0;
      q.ExecSQL;

      q.Sql.Text :=
        'Delete from CuerpoCedulones '+
        ' where Codigo = :Codigo' +
        '   and Mes = :Mes ' +
        '   and Anio = :Anio '+
        '   and Cuota50 = :Cuota50';
      q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
      q.ParamByName('Mes').AsString := Mes;
      q.ParamByName('Anio').AsString := Anio;
      if Cuota50 then
        q.ParamByName('Cuota50').AsInteger := 1
      else
        q.ParamByName('Cuota50').AsInteger := 0;
      q.ExecSQL;

      q.Sql.Text :=
        ' INSERT INTO CABEZACEDULONES (CODIGO, MES, ANIO, CUOTA50)'+
        ' VALUES (:CODIGO, :MES, :ANIO, :CUOTA50)';
      q.ParamByName('Codigo').AsString := Codigo;
      q.ParamByName('MES').AsString := Mes;
      q.ParamByName('ANIO').AsString := Anio;
      if Cuota50 then
        q.ParamByName('CUOTA50').AsInteger := 1
      else
        q.ParamByName('CUOTA50').AsInteger := 0;
      q.ExecSQL;

      q.Sql.Text :=
        ' INSERT INTO CUERPOCEDULONES (CODIGO, CODINQ, MES, ANIO, CUOTA50, FECHAPAGO, CUENTA, '+
        '                        VENCIMIENTO, IMPORTE, PORCENTAJEINQUILINO, PORCENTAJEPROPIETARIO, IMPORTEINQUILINO, IMPORTEPROPIETARIO, PAGADO)'+
        ' VALUES (:CODIGO, :CODINQ, :MES, :ANIO, :CUOTA50, :FECHAPAGO, :CUENTA, '+
        '         :VENCIMIENTO, :IMPORTE, :PORCENTAJEINQUILINO, :PORCENTAJEPROPIETARIO, :IMPORTEINQUILINO, :IMPORTEPROPIETARIO, :PAGADO)';

      if fProgreso = nil then
        Application.CreateForm(TfProgreso, fProgreso)
      else
        fProgreso.Show;

      fProgreso.Maximo := gDetalle.RowCount - 1;
      fProgreso.Leyenda := 'Grabando cedulones. Por favor espere...';

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        fProgreso.Posicion := I;
        q.Close;
        q.ParamByName('Codigo').AsString := Codigo;
        q.ParamByName('CODINQ').AsString := gDetalle.Cells[1, I];
        q.ParamByName('MES').AsString := Mes;
        q.ParamByName('ANIO').AsString := Anio;
        if Cuota50 then
          q.ParamByName('CUOTA50').AsInteger := 1
        else
          q.ParamByName('CUOTA50').AsInteger := 0;


        q.ParamByName('FECHAPAGO').AsDateTime := FechaPago;
        q.ParamByName('CUENTA').AsString := gDetalle.Cells[3, I];
        try
          Fecha := StrToDate(gDetalle.Cells[4,I]);
        except
          Fecha := 01/01/1900;
        end;
        q.ParamByName('Vencimiento').AsDateTime := Fecha;
        q.ParamByName('IMPORTE').AsFloat := ToFloat(gDetalle.Cells[5,I]);
        q.ParamByName('PORCENTAJEINQUILINO').AsFloat := ToFloat(gDetalle.Cells[6,I]);
        q.ParamByName('PORCENTAJEPROPIETARIO').AsFloat := ToFloat(gDetalle.Cells[7,I]);
        q.ParamByName('IMPORTEINQUILINO').AsFloat := ToFloat(gDetalle.Cells[8,I]);
        q.ParamByName('IMPORTEPROPIETARIO').AsFloat := ToFloat(gDetalle.Cells[9,I]);
        q.ParamByName('PAGADO').AsInteger := 0;

        q.ExecSQL;

        ValorInquilino :=ToFloat(gDetalle.Cells[7,I]);
        ValorPropietario :=ToFloat(gDetalle.Cells[8,I]);

        if Trim(gDetalle.Cells[3, I]) <> '' then
        begin
          if ActualizaAutomatizacion then
          begin
            if DatoFijo = '04' then // DGR
            begin
              qCampoAutomatizacion.Sql.Text := 'Select DGR9, DGR4, DGR27 from Automatizacion Where Codinq = :Codinq';
              qCampoAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              qCampoAutomatizacion.Open;

              Es9 := (qCampoAutomatizacion.FieldByName('DGR9').AsFloat <> 0) or (ValorInquilino <> 0);
              Es4 := qCampoAutomatizacion.FieldByName('DGR4').AsFloat <> 0;
              Es27 := (qCampoAutomatizacion.FieldByName('DGR27').AsFloat <> 0) or (ValorPropietario <> 0);

              if Es9 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set DGR9=:DGR9 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('DGR9').AsString := FormatFloat('0.00', ValorInquilino);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
              if Es4 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set DGR4=:DGR4 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('DGR4').AsString := FormatFloat('0.00', ValorInquilino);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
              if Es27 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set DGR27=:DGR27 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('DGR27').AsString := FormatFloat('0.00', ValorPropietario);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
            end;
            if DatoFijo = '02' then // AGUAS CORDOBESAS
            begin
              qCampoAutomatizacion.Sql.Text := 'Select AGUA9, AGUA2, AGUA27 from Automatizacion Where Codinq = :Codinq';
              qCampoAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              qCampoAutomatizacion.Open;

              Es9 := (qCampoAutomatizacion.FieldByName('AGUA9').AsFloat <> 0) or (ValorInquilino <> 0);
              Es2 := qCampoAutomatizacion.FieldByName('AGUA2').AsFloat <> 0;
              Es27 := (qCampoAutomatizacion.FieldByName('AGUA27').AsFloat <> 0) or (ValorPropietario <> 0);

              if Es9 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set AGUA9=:AGUA9 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('AGUA9').AsString := FormatFloat('0.00', ValorInquilino);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
              if Es2 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set AGUA2=:AGUA2 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('AGUA2').AsString := FormatFloat('0.00', ValorInquilino);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
              if Es27 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set AGUA27=:AGUA27 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('AGUA27').AsString := FormatFloat('0.00', ValorPropietario);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
            end;
            if DatoFijo = '05' then // TASA MUNICIPAL
            begin
              qCampoAutomatizacion.Sql.Text := 'Select MUNI9, MUNI5, MUNI27 from Automatizacion Where Codinq = :Codinq';
              qCampoAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              qCampoAutomatizacion.Open;

              Es9 := (qCampoAutomatizacion.FieldByName('MUNI9').AsFloat <> 0) or (ValorInquilino <> 0);
              Es5 := qCampoAutomatizacion.FieldByName('MUNI5').AsFloat <> 0;
              Es27 := (qCampoAutomatizacion.FieldByName('MUNI27').AsFloat <> 0) or (ValorPropietario <> 0);

              if Es9 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set MUNI9=:MUNI9 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('MUNI9').AsString := FormatFloat('0.00', ValorInquilino);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
              if Es5 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set MUNI5=:MUNI5 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('MUNI5').AsString := FormatFloat('0.00', ValorInquilino);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
              if Es27 then
              begin
                qAutomatizacion.Sql.Text :=
                  ' Update Automatizacion Set MUNI27=:MUNI27 Where Codinq=:Codinq';
                qAutomatizacion.ParamByName('MUNI27').AsString := FormatFloat('0.00', ValorPropietario);
                qAutomatizacion.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
                qAutomatizacion.ExecSQL;
              end;
            end;
          end;
        end;
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


procedure TfInformeImpuestosPagados.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  pCodigo: string;
  pVale: string;
  mes, anio, perimpu: string;
  Suma: Double;
  stDescripcion: string;
begin
//  if TipoInforme <> tiComisionesNoCobradas then
  begin
    FormatSettings.DecimalSeparator := ',';
    FormatSettings.ThousandSeparator := '.';
  end;

  try
  gDetalle.ClearNormalCells;
  gDetalle.RowCount := 2;
  pCodigo := edCodigo.Text;
  pVale := edVale.Text;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  if not (TipoInforme in [tiAutomatizadoNoPagado, tiComisionesNoCobradas, tiRepetidos]) then
  begin
    if ToInt(pCodigo) = 0 then
    begin
      MostrarDialogoAceptar('Debe seleccionar la empresa.');
      Exit;
    end;

//    if ToInt(pVale) = 0 then
//    begin
//      MostrarDialogoAceptar('Debe seleccionar un vale.');
//      Exit;
//    end;
  end;

  case ToInt(pCodigo) of
    1: stDescripcion := 'D.G.R';
    2: stDescripcion := 'AGUAS';
    3: stDescripcion := 'TASA';
  end;

  q := DM.fxCrearQuery(opOptimizaAlPalo);
  try
    case TipoInforme of
      tiComisionesNoCobradas: begin
        q.Sql.Text :=
          ' select * from ( '+
          '  Select cU.cODINQ, CU.iNQUILINO, CU.Coditem, CU.Item as Descripcion, CAST(cu.iMPORTE AS DOUBLE PRECISION) AS iMPORTE, ca.idtransaccion '+
          '  from CUERPORECIBOS cU '+
          '  inner join cabezarecibos cr on cr.codinq = cu.codinq '+
          '                             and cr.tipo = cu.tipo '+
          '                             and cr.letra = cu.letra '+
          '                             and cr.numero = cu.numero '+
          '  Left Join caja ca on ca.codinq = cu.codinq '+
          '                   and ca.tipo = cu.tipo '+
          '                   and ca.letra = cu.letra '+
          '                   and ca.numero = cu.numero '+
          '  where cu.coditem = ''12'' '+
          '    and cu.tipo = ''LI'' ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and cr.Fecha >= :FechaDesde '+
            '            and cr.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(Edit1.Text);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(Edit2.Text);
        end;
        q.SQL.Add(
          '  ) '+
          '  where idtransaccion is null ');
      end;

      tiValeNoAutomatizado: begin

        q.Sql.Text :=
          ' select V.*, CA.Codigo as CodigoVale, CA.Descripcion as Vale, I.Inquilino, I.Propietario, V.Codigoitem as coditem, Case when V.Descripcion containing(''DIFERENCIA'') THEN V.SALE ELSE V.ENTRA END AS IMPORTE '+
          '   from cuerpovales v '+
          '  INNER JOIN CABEZAVALES CA ON CA.codigo = V.codigo '+
          '  Inner join Inmuebles I on I.Codinq = V.Codinq '+
          ' where V.Sale = 0 and v.codigoitem in (''09'', ''27'', ''69'', ''76'') ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and v.Fecha >= :FechaDesde '+
            '            and v.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(Edit1.Text);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(Edit2.Text);
        end;

        if Trim(EdDatofijo.Text) <> '' then
          q.SQL.Add('             and V.Coditem = :Coditem ');
        q.SQL.Add(
          '   and ca.Cerrado = 0 '+
          '   and v.descripcion containing ('''+ stDescripcion +''') '+
          '   and not (v.descripcion containing (''DIFERENCIA'')) '+
          '   and ((v.descripcion containing (''IMP Y/O SERVICIOS'')) OR (v.descripcion containing (''IMPUESTOS A DESCONTAR''))) '+
          '  and v.descripcion containing (''/20'') ');
        if edVale.Text <> '' then
          q.SQL.Add(
            '  and CA.Codigo = :CodigoVale ');
        q.SQL.Add(
          '   AND NOT EXISTS(SELECT I.CODINQ '+
          '                   FROM ITEMAUTOM I '+
          '                   WHERE V.DESCRIPCION CONTAINING(I.item) '+
          '                     AND V.DESCRIPCION CONTAINING(I.PERIODO) '+
          '                     AND I.CODITEM IN (''09'', ''27'', ''69'', ''76'') '+
          '                     AND I.codinq = V.codinq '+
          '                     AND I.coditem = V.codigoitem )'+
          ' ORDER BY V.codinq, V.Descripcion, V.FECHA ');
      end;

      tiValeNoAutomatizadoDiferencia: begin
        q.Sql.Text :=
          ' select V.*, CA.Codigo as CodigoVale, CA.Descripcion as Vale, I.Inquilino, I.Propietario, V.Codigoitem as coditem, Case when V.Descripcion containing(''DIFERENCIA'') THEN V.SALE ELSE V.ENTRA END AS IMPORTE '+
          '   from cuerpovales v '+
          '  INNER JOIN CABEZAVALES CA ON CA.codigo = V.codigo '+
          '  Inner join Inmuebles I on I.Codinq = V.Codinq '+
          ' where v.codigoitem in (''09'', ''27'', ''69'', ''76'') ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and v.Fecha >= :FechaDesde '+
            '            and v.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(Edit1.Text);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(Edit2.Text);
        end;

        if Trim(EdDatofijo.Text) <> '' then
          q.SQL.Add('             and V.Coditem = :Coditem ');
        q.SQL.Add(
          '   and ca.Cerrado = 0 and v.sale = 0 '+
          '   and v.descripcion containing ('''+ stDescripcion +''') '+
          '   and (v.descripcion containing (''DIFERENCIA'')) '+
          '  and v.descripcion containing (''/20'') ');
        if edVale.Text <> '' then
          q.SQL.Add(
            '  and CA.Codigo = :CodigoVale ');
        q.SQL.Add(
          '   AND NOT EXISTS(SELECT I.CODINQ '+
          '                   FROM ITEMAUTOM I '+
          '                   WHERE V.DESCRIPCION CONTAINING(I.item) '+
          '                     AND V.DESCRIPCION CONTAINING(I.PERIODO) '+
          '                     AND I.CODITEM IN (''09'', ''27'', ''69'', ''76'') '+
          '                     AND I.codinq = V.codinq '+
          '                     AND I.coditem = V.codigoitem )'+
          ' ORDER BY V.codinq, V.Descripcion, V.FECHA ');
      end;
      tiAutomatizadoNoPagado: begin
        q.SQL.Text :=
          ' Select I.Codinq, I.Coditem, I.Item||'' ''||i.Periodo as Descripcion, II.Inquilino, Cast(I.Importe as Double Precision) as Importe, I.Registro, ii.pROPIETARIO '+
          '   from (Select I.COdinq, I.Coditem, I.Item, I.Periodo, I.Importe, I.Registro '+
          '           From Itemautom I '+
          '          Where 1 = 1 '; //I.coditem not in (''09'', ''27'', ''69'', ''76'') ';
        if Trim(EdDatofijo.Text) <> '' then
          q.SQL.Add('             and I.Coditem = :Coditem ');
        q.SQL.Add(
          '            and I.Importe <> '''' '+
          '            and Cast(I.Importe as double precision) <> 0 '+
          '            and I.Fecha >= ''20230101'' ');
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and I.Fecha >= :FechaDesde '+
            '            and I.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsString := Formatdatetime('yyyymmdd', StrToDate(Edit1.Text));
          q.ParamByName('FechaHasta').AsString := Formatdatetime('yyyymmdd', StrToDate(Edit2.Text));
        end;
        q.SQL.Add(
          ') I '+
          '  Inner Join Inmuebles II on II.Codinq = I.Codinq '+
          '  where not exists (Select R.Codinq '+
          '                   from CuerpoRecibos R '+
          '                  Inner Join CabezaRecibos CA '+
          '                        on CA.Codinq = R.Codinq '+
          '                       and Ca.tipo = R.TIpo '+
          '                       and ca.Letra = r.Letra '+
          '                       and Ca.Numero = r.Numero '+
          '                  where R.codinq = I.Codinq '+
          '                    and R.coditem = I.Coditem '+
          '                    and R.Importe <> '''' '+
          '                    and CA.Fecha >= ''01/01/2023'' ' +
//          '                    and R.coditem not in (''09'', ''27'') '+
          '                    and R.item = I.Item '+
          '                    and Cast(R.Importe as double precision) <> 0 '+
          '                    and R.periodo = I.Periodo) '+
          '                  Order by I.Codinq ');
      end;
      tiValeNoCobrado: begin
        q.SQL.Text :=
          '  select V.*, CA.Codigo as CodigoVale, CA.Descripcion as Vale, I.Inquilino, I.Propietario, V.Codigoitem as coditem, Case when V.Descripcion containing(''DIFERENCIA'') THEN V.SALE ELSE V.ENTRA END AS IMPORTE '+
          '    from cuerpovales v '+
          '   INNER JOIN CABEZAVALES CA ON CA.codigo = V.codigo '+
          '            Inner join Inmuebles I on I.Codinq = V.Codinq '+
          '           where v.codigoitem in (''09'', ''27'', ''69'', ''76'') ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and v.Fecha >= :FechaDesde '+
            '            and v.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(Edit1.Text);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(Edit2.Text);
        end;
        if Trim(EdDatofijo.Text) <> '' then
          q.SQL.Add('             and V.Coditem = :Coditem ');
        q.SQL.Add(
          '             and ca.Cerrado = 0 '+
          '             and v.descripcion containing ('''+ stdescripcion +''') '+
          '             and not (v.descripcion containing (''DIFERENCIA'')) '+
          '            and v.descripcion containing (''/20'') ');
        if edVale.Text <> '' then
          q.SQL.Add(
            '  and CA.Codigo = :CodigoVale ');
        q.SQL.Add(
          '             AND NOT EXISTS(SELECT I.CODINQ '+
          '                             FROM CUERPORECIBOS I '+
          '                             WHERE V.DESCRIPCION CONTAINING(I.item) '+
          '                               AND V.DESCRIPCION CONTAINING(I.PERIODO) '+
          '                               AND I.CODITEM IN (''09'', ''27'', ''69'', ''76'') '+
          '                               AND I.codinq = V.codinq '+
          '                               AND I.coditem = V.codigoitem ) '+
          '           ORDER BY V.codinq, V.Descripcion, V.FECHA ');
      end;
      tiValeNoCobradoDiferencias: begin
        q.SQL.Text :=
          '  select V.*, CA.Codigo as CodigoVale, CA.Descripcion as Vale, I.Inquilino, I.Propietario, V.Codigoitem as coditem, Case when V.Descripcion containing(''DIFERENCIA'') THEN V.SALE ELSE V.ENTRA END AS IMPORTE '+
          '    from cuerpovales v '+
          '   INNER JOIN CABEZAVALES CA ON CA.codigo = V.codigo '+
          '            Inner join Inmuebles I on I.Codinq = V.Codinq '+
          '           where v.codigoitem in (''09'', ''27'', ''69'', ''76'') ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and v.Fecha >= :FechaDesde '+
            '            and v.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(Edit1.Text);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(Edit2.Text);
        end;

        if Trim(EdDatofijo.Text) <> '' then
          q.SQL.Add('             and V.Coditem = :Coditem ');
        q.SQL.Add(
          '             and ca.Cerrado = 0 '+
          '             and v.descripcion containing ('''+ stdescripcion +''') '+
          '             and (v.descripcion containing (''DIFERENCIA'')) '+
          '            and v.descripcion containing (''/20'') ');
        if edVale.Text <> '' then
          q.SQL.Add(
            '  and CA.Codigo = :CodigoVale ');
        q.SQL.Add(
          '             AND NOT EXISTS(SELECT I.CODINQ '+
          '                             FROM CUERPORECIBOS I '+
          '                             WHERE V.DESCRIPCION CONTAINING(I.item) '+
          '                               AND V.DESCRIPCION CONTAINING(I.PERIODO) '+
          '                               AND I.CODITEM IN (''09'', ''27'', ''69'', ''76'') '+
          '                               AND I.codinq = V.codinq '+
          '                               AND I.coditem = V.codigoitem ) '+
          '           ORDER BY V.codinq, V.Descripcion, V.FECHA ');
      end;
      tiRepetidos: begin
        q.SQL.Text :=
          ' Select I.Codinq, II.Inquilino, II.Propietario, I.Coditem,  I.Item||'' ''||i.Periodo as Descripcion,'+
          ' cast(case when I.IMPORTE = '''' then ''0.00'' else i.importe end as double precision) as IMPORTE, count(*) as CANTIDAD '+
          '   from ItemAutom i '+
          '  Inner join Inmuebles II on II.Codinq = I.Codinq '+
          '  where I.fecha >= ''20230101'' '+
          '    and I.Coditem not in (''46'',''67'',''15'', ''28'',''29'') '+
          '  group by 1,2,3,4,5 '+
          '  Having Count(*) > 1 '+
          '  Order by I.Codinq, I.coditem';
      end;
      tiValesRepetidos: begin
        gDetalle.Cells[5,0] := 'Total';
        q.SQL.Text :=
          '  select CU.COdigo as CodigoVale, cu.codinq, CU.Codigoitem as Coditem, cu.descripcion, Sum(CU.Entra) as Importe, I.Inquilino,I.Propietario, count(*) '+
          '  from cuerpovales cu '+
          '  inner join cabezavales ca on ca.codigo = cu.codigo '+
          '  Inner Join Inmuebles I on I.Codinq = CU.COdinq '+
          '  where ca.cerrado = 0 '+
          '    and ca.codigoempresa in (1,2,3) '+
          '    and cu.entra > 0 ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add(
            '            and CU.Fecha >= :FechaDesde '+
            '            and CU.Fecha <= :FechaHasta ');
          q.ParamByName('FechaDesde').AsDatetime := StrToDate(Edit1.Text);
          q.ParamByName('FechaHasta').AsDatetime := StrToDate(Edit2.Text);
        end;

        if Trim(EdDatofijo.Text) <> '' then
          q.SQL.Add('             and CU.Codigotem = :Coditem ');
//        q.SQL.Add(
//          '             and ca.Cerrado = 0 '+
//          '             and CU.descripcion containing ('''+ stdescripcion +''') '+
//          '             and (CU.descripcion containing (''DIFERENCIA'')) '+
//          '            and CU.descripcion containing (''/20'') ');
        if edVale.Text <> '' then
          q.SQL.Add(
            '  and CA.Codigo = :CodigoVale ');
        q.SQL.Add(
          '  group by 1,2,3,4,6,7 '+
          '  Having Count(*) > 1 '+
          '  Order by CU.Codinq, CU.Descripcion');

      end;
    end;
    if ToInt(edVale.Text) <> 0 then
      q.ParamByName('CodigoVale').AsInteger := ToInt(edVale.Text);

    if  not(TipoInforme in [tiValesRepetidos, tiRepetidos]) then
    begin
      if Trim(EdDatofijo.Text) <> '' then
        q.ParamByName('Coditem').AsString := edDatoFijo.Text;
    end;

    q.Open;

    if q.IsEmpty then
    begin
      MostrarDialogoAceptar('No hay datos a mostrar');
      Exit;
    end;
    I := 1;
    q.DisableControls;

    gDetalle.BeginUpdate;
    try
      Suma := 0;
      while not q.eof  do
      begin
        gDetalle.AddCheckBox(0,I,false,false);
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Coditem').AsString;
        gDetalle.Cells[4,I] := q.FieldbyName('Descripcion').AsString;
      //  if TipoInforme <> tiValesRepetidos then
          gDetalle.Cells[5,I] := FormatFloat('#,##0.00', q.FieldbyName('Importe').AsFloat);
        if TipoInforme = tiAutomatizadoNoPagado then
          gDetalle.Cells[6,I] := q.FieldbyName('Registro').AsString;
        if TipoInforme = tiRepetidos then
          gDetalle.Cells[6,I] := q.FieldbyName('Cantidad').AsString;

        if not (TipoInforme in [tiComisionesNoCobradas, tiAutomatizadoNoPagado, tiValesRepetidos]) then
        begin
          gDetalle.Cells[7,I] := q.FieldbyName('CodigoVale').AsString;
          gDetalle.Cells[8,I] := q.FieldbyName('Vale').AsString;
        end;
        gDetalle.Cells[9,I] := q.FieldbyName('Propietario').AsString;

        Suma := Suma + q.FieldbyName('Importe').AsFloat;
        q.Next;
        Inc(I);
        if I < 2 then
          gDetalle.RowCount := 2
        else
          gDetalle.RowCount := I+1;

     end;
    finally
      gDetalle.EndUpdate;
      q.EnableControls;
    end;
    if I < 2 then
      gDetalle.RowCount := 2
    else
      gDetalle.RowCount := I;

    edTotal.Text := FormatFloat('#,##0.00', Suma);

    Exit;
  finally
//    if TipoInforme <> tiComisionesNoCobradas then
    begin
      FormatSettings.DecimalSeparator := '.';
      FormatSettings.ThousandSeparator := ',';
    end;
  end;

    if ToInt(pCodigo) = 0 then
    begin
      MostrarDialogoAceptar('Debe seleccionar la empresa.');
      Exit;
    end;

    q.Sql.Text :=
      ' Select E.* from EmpresasImpuestos E' +
      ' where Codigo = :Codigo';
    q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
    q.Open;

    FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
    edEmpresa.Text := q.FieldbyName('Descripcion').AsString;
//    edEmpresa.Properties.Readonly := True;

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
//      q.Sql.Text :=
//        ' Select I.Codinq, I.Inquilino' +
//        '   from Inmuebles I' +
//        '  Inner Join Automatizacion A on A.Codinq = I.Codinq ' +
//        '  Where A.Codinq = :Codigo ' +
//        '  order by I.Codinq ';
//      q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
//      q.Open;
//
//      I := 1;
//      while not q.eof  do
//      begin
//        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
//        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
////        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
////        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
//        q.Next;
//        Inc(I);
//      end;
//
//      if I < 2 then
//        gDetalle.RowCount := 2
//      else
//        gDetalle.RowCount := I;

      Exit;
    end;


  finally
    FreeAndNil(q);
  end;
end;

procedure TfInformeImpuestosPagados.btnEliminarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  gDetalle.BeginUpdate;
  try
    if gDetalle.Cells[6,gDetalle.Row] = '' then
      Exit;
    if not MostrarDialogoSiNo('¿Esta seguro de eliminar el item?') then
      Exit;

    DM.IniciarTransaccion;
    try
      q.SQL.text := ' Delete from Itemautom where Registro = :ID';
      q.ParamByName('ID').AsString := gDetalle.Cells[5,GDetalle.Row];
      q.ExecSQL();

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento eliminado correctamente');
      ActualizarCLick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    gDetalle.EndUpdate;
  end;
end;

procedure TfInformeImpuestosPagados.BorrarCeduln1Click(Sender: TObject);
var
  descripcion: String;
  I: Integer;
  Estado: Boolean;

begin
  if TipoInforme = tiValeNoAutomatizado then
  begin
    for I := 1 to gDetalle.RowCount -1 do
    begin
      Dm.IniciarTransaccion;
      try
        if gDetalle.GetCheckboxState(0, I, Estado) then
        begin
          if Estado then
          begin
            if gDetalle.Cells[3, I] = '27' then
            begin
              descripcion := 'IMPUESTOS A DESCONTAR';
              InsertarItemautom(gDetalle.Cells[1, I],
                              FormatDatetime('YYYYMM',date) + '10',
                              Descripcion,
                              Copy(gDetalle.Cells[4, I], 23, 50),
                              AnsiReplaceStr(AnsiReplaceStr(gDetalle.Cells[5,I], '.', ''), ',','.'),
                              gDetalle.Cells[9,I],
                              gDetalle.Cells[3,I],
                              0);
            end;

            if gDetalle.Cells[3, I] = '09' then
            begin
              descripcion := 'IMP Y/O SERVICIOS';
              InsertarItemautom(gDetalle.Cells[1, I],
                              FormatDatetime('YYYYMM',date) + '05',
                              Descripcion,
                              Copy(gDetalle.Cells[4, I], 19, 50),
                              AnsiReplaceStr(AnsiReplaceStr(gDetalle.Cells[5,I], '.', ''), ',','.'),
                              gDetalle.Cells[9,I],
                              gDetalle.Cells[3,I],
                              0);
            end;
          end;
        end;
        DM.ConfirmarTransaccion;
      except
        DM.CancelarTransaccion;
      end;
    end;
  end;

  if TipoInforme = tiValeNoAutomatizadoDiferencia then
  begin
    for I := 1 to gDetalle.RowCount -1 do
    begin
      Dm.IniciarTransaccion;
      try
        if gDetalle.GetCheckboxState(0, I, Estado) then
        begin
          if Estado then
          begin
            if gDetalle.Cells[3, I] = '27' then
            begin
              descripcion := 'IMPUESTOS A DESCONTAR';
              InsertarItemautom(gDetalle.Cells[1, I],
                              FormatDatetime('YYYYMM',date) + '10',
                              Descripcion,
                              Copy(gDetalle.Cells[4, I], 23, 50),
                              AnsiReplaceStr(AnsiReplaceStr(gDetalle.Cells[5,I], '.', ''), ',','.'),
                              gDetalle.Cells[9,I],
                              gDetalle.Cells[3,I],
                              0);
            end;

            if gDetalle.Cells[3, I] = '09' then
            begin
              descripcion := 'IMP Y/O SERVICIOS';
              InsertarItemautom(gDetalle.Cells[1, I],
                              FormatDatetime('YYYYMM',date) + '05',
                              Descripcion,
                              Copy(gDetalle.Cells[4, I], 19, 50),
                              AnsiReplaceStr(AnsiReplaceStr(gDetalle.Cells[5,I], '.', ''), ',','.'),
                              gDetalle.Cells[9,I],
                              gDetalle.Cells[3,I],
                              0);
            end;
          end;
        end;
        DM.ConfirmarTransaccion;
      except
        DM.CancelarTransaccion;
      end;
    end;
  end;

  ActualizarClick(nil);
end;

procedure TfInformeImpuestosPagados.cbValesClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.Sql.Text :=
      ' Select Codigo From CabezaVales where Descripcion = :Descripcion ';
    q.ParambyName('Descripcion').AsString := cbVales.Text;
    q.Open;

    edVale.Text := q.FieldbyName('Codigo').AsString;
//    ActualizarClick(nil);
  finally
    FreeAndNil(q);
  end;
end;

procedure TfInformeImpuestosPagados.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.SetCheckBoxState(0, I, False);

end;

procedure TfInformeImpuestosPagados.edEmpresaClick(Sender: TObject);
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

    qVales.Connection := DM.Conexion;
    qVales.Close;
    qVales.ParamByName('Empresa').AsInteger := ToInt(edCodigo.Text);
    qVales.Open;
    cbVales.Properties.Items.Clear;
    while not qVales.Eof do
    begin
      cbVales.Properties.Items.Add(qVales.FieldbyName('Descripcion').AsString);
      qVales.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfInformeImpuestosPagados.edEmpresaPropertiesChange(Sender: TObject);
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

procedure TfInformeImpuestosPagados.edEmpresaPropertiesEditValueChanged(
  Sender: TObject);
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

procedure TfInformeImpuestosPagados.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfInformeImpuestosPagados.Edit1KeyPress(Sender: TObject;
  var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit1.Text;
  if Key = #13 then
  begin
    if Length(Edit1.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit1.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit1.Text := Fecha;
    Edit2.setfocus;
  end;
end;

procedure TfInformeImpuestosPagados.Edit2Change(Sender: TObject);
begin
  if edit2.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfInformeImpuestosPagados.Edit2KeyPress(Sender: TObject;
  var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit2.Text;
  if Key = #13 then
  begin
    if Length(Edit2.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit2.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit2.Text := Fecha;
    Actualizar.setfocus;
  end;
end;

procedure TfInformeImpuestosPagados.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edEmpresa.SetFocus;
end;

procedure TfInformeImpuestosPagados.actBorrarUpdate(Sender: TObject);
begin
//  actBorrar.Enabled := (Trim(edtCodigo.Text) <> '');
end;

procedure TfInformeImpuestosPagados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfInformeImpuestosPagados.Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: Boolean = True; boEsCopia: Boolean = False);
var
  q: TFXQuery;
  I: Integer;
  ano, perimpu, dgrcuota: string;
begin
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  if ToInt(pCodigo) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
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
      if Cuota50 then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImporteInquilino, C.ImportePropietario, C.FechaPago, A.Cuotas ' +
        '   from Inmuebles I' +
        '  Inner Join Automatizacion A on A.Codinq = I.Codinq ' +
        '   Left Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '     or not Exists (Select I2.Codinq '+
        '           From Inmuebles I2 ' +
        '          Where I2.Codinq = C.Codinq)' +
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50  then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

//      mes:=edit1.text;
      perimpu:=periodoimpuestos(mes,ano);


      I := 1;
      while not q.eof  do
      begin
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Cuenta').AsString;
        if q.FieldbyName('Vencimiento').IsNull then
          gDetalle.Cells[4,I] := '30/12/1899'
        else
          gDetalle.Cells[4,I] := FormatDatetime('dd/mm/yyyy', q.FieldbyName('Vencimiento').AsDatetime);
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[9,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
        gDetalle.Cells[10,I] := Perimpu;

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
      if Cuota50 then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

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
      if Cuota50 then
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
          if Cuota50  then
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
          if Cuota50  then
            q.ParambyName('Cuota50').AsInteger := 1
          else
            q.ParambyName('Cuota50').AsInteger := 0;
          q.ExecSQL;
          DM.ConfirmarTransaccion;
          MostrarDialogoAceptar('Datos eliminados correctamente.');
          if Assigned(fABMImpuestosPagados) then
            fABMImpuestosPagados.ActualizarClick(nil);
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
(*
  if (Operacion in [toNuevo, toModificar]) then
    edtDescripcion.SetFocus;
  if (Operacion in [toModificar, toEliminar]) then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select * from EmpresasImpuestos where Codigo=:Codigo';
      q.ParamByName('Codigo').AsString := pCodigo;
      q.Open;

      gDetalle.Cells[1,1] := q.FieldbyName('Identificacion').AsString;
      gDetalle.Cells[2,1] := q.FieldbyName('IdentificacionDesde').AsString;
      gDetalle.Cells[3,1] := q.FieldbyName('IdentificacionHasta').AsString;
      gDetalle.Cells[2,2] := q.FieldbyName('FechaDesde').AsString;
      gDetalle.Cells[3,2] := q.FieldbyName('FechaHasta').AsString;
      gDetalle.Cells[2,3] := q.FieldbyName('ImporteDesde').AsString;
      gDetalle.Cells[3,3] := q.FieldbyName('ImporteHasta').AsString;
      edtCodigo.Text := q.FieldByName('Codigo').AsString;
      edtDescripcion.Text := q.FieldByName('Descripcion').AsString;
    finally
      FreeAndNil(q);
    end;
  end;
  btnGrabar.Visible := (Operacion in [toNuevo, toModificar]);

  edtDescripcion.SetFocus;

  if (Operacion in [toNuevo, toModificar]) then
    gDetalle.Options := gDetalle.Options + [goediting]
  else
    gDetalle.Options := gDetalle.Options - [goediting];

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMImpuestosYServicios) then
      FABMImpuestosYServicios.ActualizarClick(nil);
  end;
  *)
end;

end.
