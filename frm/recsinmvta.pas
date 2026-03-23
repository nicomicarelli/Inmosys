unit recsinmvta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db, ImgList,
  ComCtrls, ToolWin, ppDB, ppDBJIT, ppParameter, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, sqlExpr, ppDesignLayer,
  FXQuery, AdvGlowButton;

type
  TfrecSinmvta = class(TForm)
    plDatos: TppJITPipeline;
    plDatosppField1: TppField;
    plDatosppField2: TppField;
    plDatosppField3: TppField;
    plDatosppField4: TppField;
    plDatosppField6: TppField;
    plDatosppField7: TppField;
    plDatosppField8: TppField;
    plDatosppField9: TppField;
    Reporte: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText13: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText14: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText15: TppDBText;
    ppLabel23: TppLabel;
    ppDBText16: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppParameterList2: TppParameterList;
    Panel3: TPanel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label4: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Combobox1: TEdit;
    Edit1: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    function plDatosGetFieldValue(aFieldName: string): Variant;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frecSinmvta: TfrecSinmvta;

implementation

uses FrmPrincipal, FrmDatos, Funciones, recrinmvta;

{$R *.DFM}
procedure TfrecSinmvta.btnImprimirClick(Sender: TObject);
begin
  ImprimirReporte(Reporte, nil,nil,'',false,'',nil,'','Recibo de Seña ORIGINAL');
  ImprimirReporte(ReporteDuplicado, nil,nil,'',false,'',nil,'','Recibo de Seña DUPLICADO');
end;

procedure TfrecSinmvta.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrecSinmvta.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  q: tFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      Codigo     := Edit1.Text;
      Codigo     := LargoCodigo(Codigo);
      Edit1.Text := Codigo;
      with q do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select ubicacion from inmuebles where codinq= :Codinq');
        ParamByName('Codinq').AsString := Codigo;
        Open;
        Combobox1.Text := FieldByName('Ubicacion').AsString;
      end;
      if Codigo <> '' then
        Edit2.SetFocus;
    end;
  finally
    FreeAndNIl(q);
  end;
end;

procedure TfrecSinmvta.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  if Key = #13 then
  begin
    if Length(Edit2.Text) = 6 then
    begin
      Fecha := Edit2.text;
      Fecha := TransformaFecha(Fecha);
    end;
    if Length(Edit2.Text) = 0 then
      Fecha := FormatDatetime('dd/mm/yyyy', Date());
    Edit2.Text := Fecha;
    Edit6.SetFocus;
  end;
end;

procedure TfrecSinmvta.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;

begin
  if key=#13 then
  begin
    Importe := Edit4.Text;
    if Importe = '' then
      Importe := '0.00';
    Importe := ValidarNumero(Importe);
    Edit4.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit7.SetFocus;
  end;
end;

procedure TfrecSinmvta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fRecSinmVta := nil;
end;

procedure TfrecSinmvta.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TfrecSinmvta.plDatosGetFieldValue(aFieldName: string): Variant;
var
  Fecha:       string;
  FechaEsc:    string;
  Letras:      string;
  Inquilino:   string;
  ImporteSena: string;
  ImporteVta:  string;
  Ubicacion:   string;
  Escribania:  string;
  I:           Integer;
  J:           Integer;
  Monto:       Currency;
begin
  Inquilino := Edit3.Text;
  Ubicacion := Combobox1.Text;
  ImporteSena := Edit4.Text;
  ImporteVta  := Edit7.Text;
  Fecha     := Edit2.Text;
  FechaEsc  := Edit6.Text;
  Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);
  FechaEsc  := FechaEnLetras(FechaEsc);
  Letras    := Edit4.Text;
  Monto     := ToFloat(Letras);
  Letras    := UpperCase(ImporteEnLetras(Monto));
  Escribania:= Edit5.Text;
  J         := Length(Escribania);
  for I := J to 120 do
    Letras := Letras + '-';
  for I := J to 120 do
    Escribania := Escribania + '/';

  if afieldName='Fecha' then
    Result := Fecha;
  if afieldName='FechaVenta' then
    Result := FechaEsc;
  if afieldName='Nombre' then
    Result := Inquilino;
  if afieldName='Letas' then
    Result := Letras;
  if afieldName='ImporteSena' then
    Result := '$ ' + ImporteSena;
  if afieldName='ImporteVenta' then
    Result := '$ ' + ImporteVta;
  if afieldName='Inmueble' then
    Result := Ubicacion;
  if afieldName='Escribania' then
    Result := Escribania;
end;



procedure TfrecSinmvta.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edit4.SetFocus;
end;

procedure TfrecSinmvta.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  if Key = #13 then
  begin
    if Length(Edit6.Text) = 6 then
    begin
      Fecha := Edit6.text;
      Fecha := TransformaFecha(Fecha);
    end;
    if Length(Edit6.Text) = 0 then
      Fecha := FormatDatetime('dd/mm/yyyy', Date());
    Edit6.Text := Fecha;
    Edit3.SetFocus;
  end;
end;

procedure TfrecSinmvta.Edit7KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;

begin
  if key=#13 then
  begin
    Importe := Edit7.Text;
    if Importe = '' then
      Importe := '0.00';
    Edit7.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit5.SetFocus;
  end;
end;

procedure TfrecSinmvta.ToolButton1Click(Sender: TObject);
begin
  Edit1.Text     := '';
  Edit2.Text     := '';
  Edit3.Text     := '';
  Edit4.Text     := '';
  Edit5.Text     := '';
  Edit6.Text     := '';
  Edit7.Text     := '';
  Combobox1.Text := '';
  Edit1.SetFocus;
end;

end.

