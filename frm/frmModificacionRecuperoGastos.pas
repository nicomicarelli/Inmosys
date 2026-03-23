unit frmModificacionRecuperoGastos;

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
  TFModificacionGastosRecupero = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    dsEmpresas: TDataSource;
    dsInquilinos: TDataSource;
    popOpciones: TPopupMenu;
    SeleccionarTodos1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    qEmpresas: TFXQuery;
    qInquilinos: TFXQuery;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    edImporte: TcxTextEdit;
    gDetalle: TAdvStringGrid;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    chTodos: TRadioButton;
    chTransfiere: TRadioButton;
    chExcepto: TRadioButton;

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
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure DeseleccionarTodos1Click(Sender: TObject);
    procedure edImporteKeyPress(Sender: TObject; var Key: Char);
  private
    FOperacion: TTipoOperacion;
    FPorcentajeRecargo: Double;
  public
    DatoFijo: String;
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, CantCodigos: Integer;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
  end;

var
  FModificacionGastosRecupero: TFModificacionGastosRecupero;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos;
{$R *.DFM}

procedure TFModificacionGastosRecupero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FModificacionGastosRecupero := nil;
end;

procedure TFModificacionGastosRecupero.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TFModificacionGastosRecupero.gDetalleEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 5 then
  begin
    if ToFloat(gDetalle.Cells[ACol, ARow]) < 0 then
    begin
      MostrarDialogoAceptar('Valor debe ser mayor a 0');
      gDetalle.Cells[ACol, ARow] := '0.00';
    end;
    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := gDetalle.Row + 1;
  end;
end;

procedure TFModificacionGastosRecupero.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2,3: HAlign := taLeftJustify;
    4,5: HAlign := taRightJustify;
  end;
end;

procedure TFModificacionGastosRecupero.gDetalleKeyPress(Sender: TObject; var Key: Char);
var
  stCodigo: string;
begin
  if gDetalle.Col in [5] then
    if not (CharInSet(Key, ['0'..'9',#8,#13])) then
      Key := #0;

  if Key = #13 then
  begin
    if gDetalle.Col = 5 then
    begin
      gDetalle.Cells[5, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, gDetalle.Row]));
    end
  end;
end;

procedure TFModificacionGastosRecupero.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(gDetalle.Col, gDetalle.Row);
end;

procedure TFModificacionGastosRecupero.SeleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.SetCheckboxState(0, I, True);
end;

procedure TFModificacionGastosRecupero.actGrabarExecute(Sender: TObject);
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
  Estado: Boolean;

begin
  Codigo := edImporte.Text;

  ActualizaAutomatizacion := MostrarDialogoSiNo('¿Actualizar datos de automatización para estos inquilinos?', mbYes);

  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      if fProgreso = nil then
        Application.CreateForm(TfProgreso, fProgreso)
      else
        fProgreso.Show;

      fProgreso.Maximo := gDetalle.RowCount - 1;
      fProgreso.Leyenda := 'Grabando cedulones. Por favor espere...';

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        fProgreso.Posicion := I;

        if Trim(gDetalle.Cells[5, I]) <> '' then
        begin
          ValorInquilino :=ToFloat(gDetalle.Cells[5,I]);

          if ActualizaAutomatizacion and (gDetalle.GetCheckboxState(0,I,Estado)) and (Estado) then
          begin
            if (ToFloat(gDetalle.Cells[5,I]) = 0) then
              Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set RecuperoGastos=:Recupero Where Codinq=:Codinq';
              q.ParamByName('Recupero').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;
          end;
        end;
        Application.ProcessMessages;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Recupero de gastos actualizados');
      Close;
    Except
      on e: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar los cedulones.' + #13#10 +
                              'Detalles Técnicos: ' + e.message);
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFModificacionGastosRecupero.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  pCodigo: string;
begin
  if ToFloat(edImporte.Text) = 0 then
  begin
    MostrarDialogoAceptar('Debe introducir un importe');
    Exit;
  end;

  btnGrabar.Enabled := True;

  q := CrearQuery;
  try
    q.Sql.Text :=
      ' Select I.Codinq, I.Inquilino, I.Propietario, A.RecuperoGastos ' +
      '   from Inmuebles I' +
      '  Inner Join Automatizacion A on A.Codinq = I.Codinq ';
    if chExcepto.checked then
      q.Sql.Add('  Where A.Transfiere = 0 ')
    else if chTransfiere.Checked then
      q.Sql.Add('  Where A.Transfiere = 1 ');
    q.Sql.Add('  Order by I.Codinq ');

    q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.AddCheckBox(0, I, True, False);
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Propietario').AsString;
        gDetalle.Cells[4,I] := FormatFloat('0.00', ToFloat(q.FieldbyName('RecuperoGastos').AsString));
        gDetalle.Cells[5,I] := FormatFloat('0.00', ToFloat(edImporte.text));
        gDetalle.RowCount := gDetalle.RowCount + 1;
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
end;

procedure TFModificacionGastosRecupero.AdvGlowButton1Click(Sender: TObject);
begin
  gDetalle.SearchFooter.Visible := not gdetalle.SearchFooter.Visible;
  if gDetalle.SearchFooter.Visible then
    gDetalle.SearchPanel.EditControl.Setfocus;
end;

procedure TFModificacionGastosRecupero.BorrarCeduln1Click(Sender: TObject);
begin
  gDetalle.Cells[2,gDetalle.Row] := '';
  gDetalle.Cells[3,gDetalle.Row] := '30/12/1899';
  gDetalle.Cells[4,gDetalle.Row] := '0,00';
end;

procedure TFModificacionGastosRecupero.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.SetCheckboxState(0, I, False);
end;

procedure TFModificacionGastosRecupero.edImporteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = ',') then
    Key := '.';

  if not (Key in ['0'..'9', #8, ',','.']) then
    Key := #0;
end;

procedure TFModificacionGastosRecupero.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.

