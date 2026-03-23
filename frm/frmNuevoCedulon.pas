unit frmNuevoCedulon;

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
  cxGroupBox, AdvPanel, fxConnection;

CONST
  WM_AFTER_SHOW = WM_USER + 300;

type
  TProcesoThread = class(TThread)
  private
    FEnProceso: Boolean;
    FCOdigo: string;
    FOperacion: TTipoOperacion;
    FMes: string;
    FAnio: string;
    FCuota50: Boolean;
    FEmpresa: string;
    FMaximo: Integer;

    FFila: Integer;

    FMensaje: string;

    Conn: TFXConnection; // Si usas FireDAC
    q: TFXQuery;
    function ConectarBD(RutaBD:string): Boolean;
    procedure MostrarMensaje;
    procedure CargarGrilla;
    procedure SetearFilasGrilla;
    procedure ActualizarProgreso;
    procedure PrepararProgreso;

  protected
    procedure Execute; override;
  public
    function EstaEnProceso: Boolean;
    constructor Create(pCodigo: Integer; pOperacion: TTipoOperacion; pMes, pAnio: String);
  end;

  TfAsignacionBoletas = class(TForm)
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
    qEmpresas: TFXQuery;
    pnlFondo: TAdvPanel;
    gbxBotones: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    chCuota50: TcxCheckBox;
    edFecha: TcxMaskEdit;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    edCodigo: TcxTextEdit;
    gDetalle: TAdvStringGrid;
    edEmpresa: TcxComboBox;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnBuscar: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    btnRastrear: TAdvGlowButton;
    Progreso: TProgressBar;
    lbProgreso: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnRastrearClick(Sender: TObject);
    procedure gDetalleSearchFooterAction(Sender: TObject; Value: string; ACol,
      ARow: Integer; SearchAction: TSearchAction);
    procedure ActualizarClick(Sender: TObject);
    procedure edEmpresaClick(Sender: TObject);
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure edEmpresaPropertiesChange(Sender: TObject);
    procedure edEmpresaPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FOperacion: TTipoOperacion;
    FPorcentajeRecargo: Double;
    procedure WMAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  public
    DatoFijo: String;
    HiloEnProceso: Boolean;
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, CantCodigos: Integer;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: Boolean = True; boEsCopia: Boolean = False);
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
    procedure prControlarBotones(pboEnabled: Boolean);
  end;

var
  fAsignacionBoletas: TfAsignacionBoletas;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos,
  ABMImpuestosPagados, frmLecturaIA;
{$R *.DFM}

procedure TfAsignacionBoletas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fAsignacionBoletas := nil;
end;

procedure TfAsignacionBoletas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := not HiloEnProceso;
end;

procedure TfAsignacionBoletas.FormCreate(Sender: TObject);
var
  Fila: Integer;
begin
  fPrincipal.Center(Self);
  qEmpresas.Connection := DM.Conexion;
  qEmpresas.Open;
  spAnio.Text := FormatDateTime('YYYY', Date);
  edMes.ItemIndex := ToInt(FormatDateTime('mm', Date))-1;

  while not qEmpresas.Eof do
  begin
    edEmpresa.Properties.Items.Add(qEmpresas.FieldbyName('Descripcion').AsString);
    qEmpresas.Next;
  end;
end;

procedure TfAsignacionBoletas.FormShow(Sender: TObject);
var
  Fila: Integer;
begin
  if Operacion = toNuevo then
  begin
    qInquilinos.Connection := DM.Conexion;
    qInquilinos.Open;
    edFecha.Text := FormatDatetime('05/mm/yyyy', Date);
    Fila := 1;
    while not qInquilinos.eof do
    begin
      gDetalle.Cells[0, Fila] := qInquilinos.FieldByName('Codinq').AsString;
      gDetalle.Cells[1, Fila] := qInquilinos.FieldByName('Inquilino').AsString;
      Inc(Fila);
      qInquilinos.Next;
    end;
    gDetalle.RowCount := Fila;
    Application.processMessages;
  end
  else
    PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
//  if Operacion = toNuevo then
//    TProcesoThread.Create;
end;

procedure TfAsignacionBoletas.gDetalleEditCellDone(Sender: TObject; ACol,
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

procedure TfAsignacionBoletas.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2: HAlign := taLeftJustify;
    3: HAlign := taCenter;
    4,5,6,7,8: HAlign := taRightJustify;
  end;
end;

procedure TfAsignacionBoletas.gDetalleKeyPress(Sender: TObject; var Key: Char);
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
      gDetalle.Cells[4, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row]));
      gDetalle.Cells[7, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row])*ToFloat(gDetalle.Cells[5, gDetalle.Row])/100);
      gDetalle.Cells[8, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row])*ToFloat(gDetalle.Cells[6, gDetalle.Row])/100);
      if gDetalle.Row + 1 <= gDetalle.RowCount -1 then
        gDetalle.Row := gDetalle.Row + 1
      else
        gDetalle.Row := gDetalle.Row - 1;
    end
  end;
end;

procedure TfAsignacionBoletas.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(2, gDetalle.Row);
end;

procedure TfAsignacionBoletas.prControlarBotones(pboEnabled: Boolean);
begin
  btnGrabar.Enabled := pboEnabled;
  Actualizar.Enabled := pboEnabled;
  btnBuscar.Enabled := pboEnabled;
  btnRastrear.Enabled := pboEnabled;
  cxGroupbox2.Enabled := pboEnabled;
end;

procedure TfAsignacionBoletas.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
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
  gDetalle.Cells[3, Fila] := FormatDatetime('dd/mm/yyyy', StrTODate(Fecha));
  gDetalle.Cells[4, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100));
  gDetalle.Cells[7, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100)*ToFloat(gDetalle.Cells[5,Fila])/100);
  gDetalle.Cells[8, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100)*ToFloat(gDetalle.Cells[6,Fila])/100);

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

procedure TfAsignacionBoletas.WMAfterShow(var Msg: TMessage);
begin

end;

procedure TfAsignacionBoletas.actGrabarExecute(Sender: TObject);
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
  Mes := edMes.Text;
  Anio := spAnio.Text;
  Cuota50 := chCuota50.Checked;

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
        q.ParamByName('CODINQ').AsString := gDetalle.Cells[0, I];
        q.ParamByName('MES').AsString := Mes;
        q.ParamByName('ANIO').AsString := Anio;
        if Cuota50 then
          q.ParamByName('CUOTA50').AsInteger := 1
        else
          q.ParamByName('CUOTA50').AsInteger := 0;

        try
          FechaPago := StrToDate(edFecha.Text);
        except
          FechaPago := StrToDate(FormatDatetime('05/mm/yyyy', Date));
        end;

        edFecha.Text := FormatDateTime('dd/mm/yyyy', FechaPago);

        q.ParamByName('FECHAPAGO').AsDateTime := FechaPago;
        q.ParamByName('CUENTA').AsString := gDetalle.Cells[2, I];
        try
          Fecha := StrToDate(gDetalle.Cells[3,I]);
        except
          Fecha := 01/01/1900;
        end;
        q.ParamByName('Vencimiento').AsDateTime := Fecha;
        q.ParamByName('IMPORTE').AsFloat := ToFloat(gDetalle.Cells[4,I]);
        q.ParamByName('PORCENTAJEINQUILINO').AsFloat := ToFloat(gDetalle.Cells[5,I]);
        q.ParamByName('PORCENTAJEPROPIETARIO').AsFloat := ToFloat(gDetalle.Cells[6,I]);
        q.ParamByName('IMPORTEINQUILINO').AsFloat := ToFloat(gDetalle.Cells[7,I]);
        q.ParamByName('IMPORTEPROPIETARIO').AsFloat := ToFloat(gDetalle.Cells[8,I]);
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


procedure TfAsignacionBoletas.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  pCodigo: string;
  mes, anio, perimpu: string;
begin
  if HiloEnProceso then
    Exit;

  pCodigo := edCodigo.Text;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;

  if ToInt(pCodigo) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
    btnGrabar.Enabled := False;
    Exit;
  end;

  TProcesoThread.Create(ToInt(pCodigo), FOperacion, edMes.Text, spAnio.text);
  Exit; //Este EXIT no lo saques, por que toda la logica que sigue esta dentro del hilo.
        // Nico M. 07/03/2026


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
      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario ' +
        '   from Inmuebles I' +
        '   Left Join PorcentajeCobro C on C.Codinq = I.Codinq ' +
        '  Where C.Codigo = :Codigo ' +
        '    and (C.PorcentajeInquilino > 0' +
        '     or C.PorcentajePropietario > 0) ' +
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

      edMes.Text := q.FieldbyName('Mes').AsString;
      spAnio.Text := q.FieldbyName('Anio').AsString;

     mes:=edMes.text;
     anio:=spAnio.text;
     perimpu:=periodoimpuestos(mes,anio);

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImportePropietario, C.ImporteInquilino ' +
        '   from Inmuebles I' +
        '   Left Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where (C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '    and I.Codinq <> '''')'+
        '     OR Not exists (Select I2.Codinq' +
        '                      from Inmuebles I2' +
        '                     Where I2.Codinq = C.Codinq)' +
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
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[4,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
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

procedure TfAsignacionBoletas.btnRastrearClick(Sender: TObject);
begin
  // Logica de IA
  if ToInt(edCodigo.text) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
    btnGrabar.Enabled := False;
    Exit;
  end;
  if FlecturaIA = nil then
    Application.CreateForm(TFlecturaIA, FlecturaIA)
  else
    FlecturaIA.Show;
  FlecturaIA.Empresa := ToInt(edCodigo.Text);
end;

procedure TfAsignacionBoletas.BorrarCeduln1Click(Sender: TObject);
begin
  gDetalle.Cells[2,gDetalle.Row] := '';
  gDetalle.Cells[3,gDetalle.Row] := '30/12/1899';
  gDetalle.Cells[4,gDetalle.Row] := '0,00';
  gDetalle.Cells[7,gDetalle.Row] := '0,00';
  gDetalle.Cells[8,gDetalle.Row] := '0,00';
end;

procedure TfAsignacionBoletas.DatosKeyPress(Sender: TObject; var Key: Char);
begin
(*  q := CrearQuery;
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
          SQL.Add('select * from conceptos where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          MostrarDialogoAceptar(
            'Ya existe un Dato Fijo con ese Código. Verifique por favor.',
            mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          edtCodigo.SetFocus;
      end;
      if not(Key in ['0' .. '9', #8]) then
        Key := #0;
    end;

    if (TWinControl(Sender).Name = 'edtInquilinoPropietario') then
    begin
      if not(Key in ['0' .. '2', #8, #13]) then
        Key := #0;
      if Key = #13 then
      begin
        if edtInquilinoPropietario.Text = '' then
          edtInquilinoPropietario.SetFocus
        else
        begin
          cboAfecta.ItemIndex := StrToInt(edtInquilinoPropietario.Text);
          edtListadoInforme.SetFocus;
        end;
      end;
    end;

    if (TWinControl(Sender).Name = 'edtListadoInforme') then
    begin
      if not(Key in ['0' .. '3', #8, #13]) then
        Key := #0;
      if Key = #13 then
        if edtListadoInforme.Text = '' then
          edtListadoInforme.SetFocus
        else
        begin
          cboListado.ItemIndex := StrToInt(edtListadoInforme.Text);
          edtSobreDestino.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtSobreDestino') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtSobreDestino.Text = '' then
          edtSobreDestino.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtSobreDestino.Text;
          q.Open;

          cboSobre.ItemIndex := cboSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtDescuenta.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtOtroSobre') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtOtroSobre.Text = '' then
          edtOtroSobre.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtOtroSobre.Text;
          q.Open;

          cboOtroSobre.ItemIndex := cboOtroSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtDescuenta.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtDescuenta') then
    begin
      if not(Key in ['0' .. '4', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtDescuenta.Text = '' then
          edtDescuenta.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtDescuenta.Text;
          q.Open;

          cboDescuenta.ItemIndex := cboDescuenta.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          btnGrabar.SetFocus;
        end;
    end;
  finally
    FreeAndNil(q);
  end; *)
end;

procedure TfAsignacionBoletas.edEmpresaClick(Sender: TObject);
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

procedure TfAsignacionBoletas.edEmpresaPropertiesChange(Sender: TObject);
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

procedure TfAsignacionBoletas.edEmpresaPropertiesEditValueChanged(
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

procedure TfAsignacionBoletas.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edEmpresa.SetFocus;
end;

procedure TfAsignacionBoletas.actBorrarUpdate(Sender: TObject);
begin
//  actBorrar.Enabled := (Trim(edtCodigo.Text) <> '');
end;

procedure TfAsignacionBoletas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAsignacionBoletas.Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: Boolean = True; boEsCopia: Boolean = False);
var
  q: TFXQuery;
  I: Integer;
  ano, perimpu, dgrcuota: string;
begin
  if ToInt(pCodigo) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
    btnGrabar.Enabled := False;
    Exit;
  end;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  TProcesoThread.Create(ToInt(pCodigo), Operacion, Mes, Anio);
  Exit;
  btnGrabar.Enabled := True;

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
      ano:=spanio.text;
      perimpu:=periodoimpuestos(mes,ano);

      dgrcuota := cuotadgr(Inttostr(edmes.Itemindex),ano, q.fieldbyName('Cuotas').AsInteger);

      I := 1;
      while not q.eof  do
      begin
        edFecha.Text := FormatDateTime('dd/mm/yyyy', q.FieldbyName('FechaPago').AsDateTime);
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Cuenta').AsString;
        if q.FieldbyName('Vencimiento').IsNull then
          gDetalle.Cells[3,I] := '30/12/1899'
        else
          gDetalle.Cells[3,I] := FormatDatetime('dd/mm/yyyy', q.FieldbyName('Vencimiento').AsDatetime);
        gDetalle.Cells[4,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
        gDetalle.Cells[9,I] := Perimpu;

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
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[4,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
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

{ TProcesoThread }

constructor TProcesoThread.Create(pCodigo: Integer; pOperacion: TTipoOperacion; pMes, pAnio: String);
begin
  inherited Create(False);
  FCodigo := Inttostr(pCodigo);
  FOperacion := pOperacion;
  FMes := pMes;
  FAnio := pAnio;
  FreeOnTerminate := True;
end;

function TProcesoThread.EstaEnProceso: Boolean;
begin
  Result := FEnProceso;
end;
procedure TProcesoThread.SetearFilasGrilla;
begin
  TThread.Synchronize(nil, procedure begin
    FAsignacionBoletas.gDetalle.RowCount := FFila;
  end);
end;

procedure TProcesoThread.CargarGrilla;
begin
  TThread.Synchronize(nil, procedure begin
    with fAsignacionBoletas do
    begin
      if FOperacion = toNuevo then
      begin
        gDetalle.Cells[0,FFila] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,FFila] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[5,FFila] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,FFila] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
      end
      else
      begin
        gDetalle.Cells[0,FFila] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,FFila] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2,FFila] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[3,FFila] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[4,FFila] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[5,FFila] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,FFila] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[7,FFila] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[8,FFila] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
      end;
    end;
  end);
end;

procedure TProcesoThread.Execute;
var
  Ruta: string;
  perimpu: string;
begin
  Conn := TFxConnection.Create(nil);
  q := TFxQuery.Create(nil);
  Ruta := ObtenerRutaBD;
  try
    try
      if ConectarBD(Ruta) then
        q.Connection := Conn;
    except
      on E: Exception do
      begin
        TThread.Synchronize(nil, procedure begin MostrarDialogoAceptar('No fue posible conectar con la Base de datos'); end);
        Exit; // Si no hay DB, no podemos seguir con la lógica de cruce
      end;
    end;

    TThread.Synchronize(nil, procedure
    begin
      fAsignacionBoletas.HiloEnProceso := True;
      fAsignacionBoletas.prControlarBotones(False);
    end);

      if FOperacion = toNuevo then
      begin
        q.Sql.Text :=
          'Select codigo from CabezaCedulones '+
          ' where Codigo = :Codigo' +
          '   and Mes = :Mes ' +
          '   and Anio = :Anio '+
          '   and Cuota50 = :Cuota50';
        q.ParamByName('Codigo').AsInteger := ToInt(FCodigo);
        q.ParamByName('Mes').AsString := FMes;
        q.ParamByName('Anio').AsString := FAnio;
        if FCuota50 then
          q.ParamByName('Cuota50').AsInteger := 1
        else
          q.ParamByName('Cuota50').AsInteger := 0;
        q.Open;

        if not q.IsEmpty then
        begin
          FMensaje := 'Ya fueron cargados los siguientes cedulones: '+#13#10 +
          ' Empresa: '+ FEmpresa + #13#10 +
          ' Periodo: '+ FMes + '/' + FAnio;

          Synchronize(MostrarMensaje);
          Exit;
        end;

      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(FCodigo);
      q.Open;

      TThread.Synchronize(nil, procedure
      begin
        with FAsignacionBoletas do
        begin
          FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
          edEmpresa.Text := q.FieldbyName('Descripcion').AsString;

          DatoFijo := q.FieldbyName('Identificacion').AsString;
          idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
          idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
          FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
          FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
          ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
          ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
          CantCodigos := q.FieldbyName('CantCodigos').AsInteger;
        end;
      end);

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario ' +
        '   from Inmuebles I' +
        '   Left Join PorcentajeCobro C on C.Codinq = I.Codinq ' +
        '  Where C.Codigo = :Codigo ' +
        '    and (C.PorcentajeInquilino > 0' +
        '     or C.PorcentajePropietario > 0) ' +
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(FCodigo);
      q.Open;

      FFila := 1;
      while not q.eof  do
      begin
        CargarGrilla;
        q.Next;
        Inc(FFila);
      end;
      if FFila < 2 then
        FFila := 2;
      SetearFilasGrilla;
    end
    else
    begin
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(FCodigo);
      q.Open;

      TThread.Synchronize(nil, procedure
      begin
        with FAsignacionBoletas do
        begin
          lbProgreso.Visible := True;
          edEmpresa.Text := q.FieldbyName('Descripcion').Text;
          edEmpresa.Properties.Readonly := True;
          FEmpresa := q.FieldbyName('Descripcion').Text;

          DatoFijo := q.FieldbyName('Identificacion').AsString;
          idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
          idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
          FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
          FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
          ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
          ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
          CantCodigos := q.FieldbyName('CantCodigos').AsInteger;
          FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
        end;
      end);

      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(FCodigo);
      q.ParambyName('Mes').AsString := FMes;
      q.ParambyName('Anio').AsString := FAnio;
      if FCuota50 then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      TThread.Synchronize(nil, procedure
      begin
        fAsignacionBoletas.chCuota50.Checked := FCuota50;
        fAsignacionBoletas.spAnio.Text := FAnio;
        fAsignacionBoletas.edMes.Text := FMes;
      end);

      perimpu := periodoimpuestos(Fmes,Fanio);

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImportePropietario, C.ImporteInquilino ' +
        '   from Inmuebles I' +
        '   Left Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where (C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '    and I.Codinq <> '''')'+
        '     OR Not exists (Select I2.Codinq' +
        '                      from Inmuebles I2' +
        '                     Where I2.Codinq = C.Codinq)' +
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsString := FCodigo;
      q.ParambyName('Mes').AsString := FMes;
      q.ParambyName('Anio').AsString := FAnio;
      if FCuota50  then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;
      FMaximo := q.RecordCount;
      Synchronize(PrepararProgreso);

      FFila := 1;
      while not q.eof  do
      begin
        CargarGrilla;
        Synchronize(ActualizarProgreso);
        q.Next;
        Inc(FFila);
      end;

      if FFila < 2 then
        FFila := 2;
      SetearFilasGrilla;
    end;

  finally
    q.Free;
    Conn.Connected := False;
    Conn.Free;
    TThread.Synchronize(nil, procedure begin
      fAsignacionBoletas.HiloEnProceso := False;
      fAsignacionBoletas.lbProgreso.Visible := False;
      fAsignacionBoletas.Progreso.Visible := False;
      fAsignacionBoletas.HiloEnProceso := False;

      fAsignacionBoletas.prControlarBotones(True);

      // Esto esta mal. Debe hacerse solo en caso de error
      //fAsignacionBoletas.Close;
    end);
  end;
end;

procedure TProcesoThread.MostrarMensaje;
begin
  TThread.Synchronize(nil, procedure begin
    MostrarDialogoAceptar(FMensaje);
  end);
end;

function TProcesoThread.ConectarBD(RutaBD:string): Boolean;
begin
  with Conn do
  begin
    Connected := False;
    Params.Clear;
    Params.Add('DriverName=Firebird');
    Params.Add('Database=' + RutaBD);
    Params.Add('DriverID=FB');
    Params.Add('RoleName=RoleName');
    Params.Add('User_Name=sysdba');
    Params.Add('Password=masterkey');
    Params.Add('ServerCharSet=');
    Params.Add('SQLDialect=3');
    Params.Add('ErrorResourceFile=');
    Params.Add('LocaleCode=0000');
    Params.Add('BlobSize=-1');
    Params.Add('CommitRetain=False');
    Params.Add('WaitOnLocks=True');
    Params.Add('IsolationLevel=ReadCommitted');
    Params.Add('Trim Char=False');
    Params.Add('VendorLib=FBClient.dll');
    Connected := True;
  end;
  Result := Conn.Connected;
end;

procedure TProcesoThread.ActualizarProgreso;
begin
  fAsignacionBoletas.Progreso.Position := FAsignacionBoletas.Progreso.Position + 1;
  if fAsignacionBoletas.Progreso.Position = fAsignacionBoletas.Progreso.Max then
  begin
    fAsignacionBoletas.Progreso.Visible := False;
    fAsignacionBoletas.lbProgreso.Visible := False;
  end;
end;

procedure TProcesoThread.PrepararProgreso;
begin
  fAsignacionBoletas.Progreso.Min := 0;
  fAsignacionBoletas.Progreso.Max := FMaximo;
  fAsignacionBoletas.Progreso.Position := 0;
  fAsignacionBoletas.Progreso.Visible := True;
  fAsignacionBoletas.lbProgreso.Visible := True;
end;

end.
