unit frmCodigosBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, ImgList, AdvGlowButton, cxTextEdit, StdCtrls, StrUtils,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfCodigosBarras = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edId: TcxTextEdit;
    edImporte: TcxTextEdit;
    ImageList1: TImageList;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure edImporteKeyPress(Sender: TObject; var Key: Char);
  private
    FFila: Integer;
    FPantalla: Integer;
    { Private declarations }
  public
    ID: String;
    Importe: string;
    Fecha: string;
    IDDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta: Integer;
    FPorcentajeRecargo: Double;
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String; pCodigoBarras: Integer);
    procedure Preparar(pIDDesde, pIDHasta, pFechaDesde, pFechaHasta, pImporteDesde, pImporteHasta: Integer; pPorcentajeRecargo:Double);
    procedure Cargar(stCodigo: string; Fila: Integer; Pantalla: Integer);
    { Public declarations }
  end;

var
  fCodigosBarras: TfCodigosBarras;

implementation

uses frmNuevoCedulon, Funciones;

{$R *.dfm}

{ TfCodigosBarras }

procedure TfCodigosBarras.btnGrabarClick(Sender: TObject);
var
  ndRedondeado, ndImporteRedondeo: Double;
begin
  if FPantalla = 1 then
  begin
    if Assigned(fAsignacionBoletas) then
    begin
      prInterpretarCodigoBarras(FFila, edImporte.Text, 1);
      fAsignacionBoletas.gDetalle.Cells[2, FFila] := ID;
      prInterpretarCodigoBarras(FFila, edImporte.Text, 2);

      fAsignacionBoletas.gDetalle.Cells[3, FFila] := Fecha;

      fAsignacionBoletas.gDetalle.Cells[4, FFila] := Importe;

      ndRedondeado := ToFloat(fAsignacionBoletas.gDetalle.Cells[4, FFila]);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[4, FFila] := FormatFloat('0.00', ndRedondeado);

      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', (ToFloat(Importe) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[5,FFila],',','.'))/100));
      ndRedondeado := ToFloat(fAsignacionBoletas.gDetalle.Cells[7, FFila]);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', ndRedondeado);

      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', (ToFloat(Importe) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[6,FFila],',','.'))/100));
      ndRedondeado := ToFloat(fAsignacionBoletas.gDetalle.Cells[8, FFila]);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', ndRedondeado);

//      ndRedondeado := fxRedondearImporte(ToFloat(fAsignacionBoletas.gDetalle.Cells[7, FFila]), ndImporteredondeo);
(*      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', ndRedondeado);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', ndRedondeado);
      ndRedondeado := fxRedondearImporte(ToFloat(fAsignacionBoletas.gDetalle.Cells[8, Fila]), ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', ndRedondeado);
      ndRedondeado := fxRedondearImporte(ndRedondeado, ndImporteredondeo);
      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', ndRedondeado);
*)
//      fAsignacionBoletas.gDetalle.Cells[7, FFila] := FormatFloat('0.00', (ToFloat(Importe) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[5,FFila],',','.'))/100));
//      fAsignacionBoletas.gDetalle.Cells[8, FFila] := FormatFloat('0.00', (ToFloat(Importe) *(1+FPorcentajeRecargo/100) * ToFloat(AnsiReplaceStr(fAsignacionBoletas.gDetalle.Cells[6,FFila],',','.'))/100));


      if (FFila + 1 <= fAsignacionBoletas.gDetalle.RowCount - 1) and (fAsignacionBoletas.gDetalle.Col = 2) then
        fAsignacionBoletas.gDetalle.EditCell(2, FFila + 1);
    end;
  end;
  Close;

end;

procedure TfCodigosBarras.btnSalirClick(Sender: TObject);
begin
  if FPantalla = 1 then
  begin
    if Assigned(fAsignacionBoletas) then
      fAsignacionBoletas.gDetalle.Cells[2, FFila] := '';
  end;
  Close;
end;

procedure TfCodigosBarras.Cargar(stCodigo: string; Fila, Pantalla: Integer);
begin
  edID.Text := stCodigo;
  FFila := Fila;
  FPantalla := Pantalla;
end;

procedure TfCodigosBarras.edImporteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnGrabarClick(nil);

end;

procedure TfCodigosBarras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fCodigosBarras := nil;
end;

procedure TfCodigosBarras.Preparar(pIDDesde, pIDHasta, pFechaDesde, pFechaHasta,
  pImporteDesde, pImporteHasta: Integer; pPorcentajeRecargo:Double);
begin
  IDDesde := pIDDesde;
  IDHasta := pIDHasta;
  FechaDesde := pFechaDesde;
  FechaHasta := pFechaHasta;
  ImporteDesde := pImporteDesde;
  ImporteHasta := pImporteHasta;
  fPorcentajeRecargo := pPorcentajeRecargo;
end;

procedure TfCodigosBarras.prInterpretarCodigoBarras(Fila: Integer; ATexto: String; pCodigoBarras: Integer);
begin
  if pCodigoBarras = 1 then
    ID := Copy(edID.Text, IdDesde, IDHasta - IDDesde + 1)
  else
  begin
    if (FechaDesde = 0) or (FechaHasta = 0) then
      Fecha := '01/01/1900'
    else
      Fecha := Copy(Copy(edImporte.Text, FechaDesde, FechaHasta - FechaDesde+1),1,2) + '/' +
        Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),3,2) + '/' +
        Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),5,4);

    Importe := FormatFloat('0.00', Funciones.ToFloat(Copy(edImporte.Text, ImporteDesde, ImporteHasta - ImporteDesde+1))/100);
  end;

end;

end.
