unit recrinmvta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db, ImgList,
  ComCtrls, ToolWin, ppDB, ppDBJIT, ppParameter, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, sqlExpr, ppDesignLayer,
  FXQuery, AdvGlowButton, ppModule, raCodMod, dxGDIPlusClasses, ppVar;

type
  Tfrecrinmvta = class(TForm)
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
    ReporteFijoDuplicado: TppReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDBText17: TppDBText;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppShape2: TppShape;
    ppVariable1: TppVariable;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppVariable2: TppVariable;
    ppImage1: TppImage;
    ppHeaderBand3: TppHeaderBand;
    ppImage2: TppImage;
    ppVariable3: TppVariable;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ReporteFijo: TppReport;
    ppTitleBand2: TppTitleBand;
    ppShape3: TppShape;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText18: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppShape4: TppShape;
    ppVariable4: TppVariable;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppVariable5: TppVariable;
    ppImage3: TppImage;
    ppHeaderBand4: TppHeaderBand;
    ppImage4: TppImage;
    ppVariable6: TppVariable;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList4: TppParameterList;
    plDatosppField5: TppField;
    plDatosppField10: TppField;
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
  frecrinmvta: Tfrecrinmvta;

implementation

uses FrmPrincipal, FrmDatos, Funciones;

{$R *.DFM}
procedure Tfrecrinmvta.btnImprimirClick(Sender: TObject);
begin
  ImprimirReporte(ReporteFijo, nil,nil,'',false,'',nil,'','Recibo de Seña ORIGINAL');
  ImprimirReporte(ReporteFijoDuplicado, nil,nil,'',false,'',nil,'','Recibo de Seña DUPLICADO');
end;

procedure Tfrecrinmvta.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrecrinmvta.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinmvta.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinmvta.Edit4KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinmvta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fRecrinmVta := nil;
end;

procedure Tfrecrinmvta.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function Tfrecrinmvta.plDatosGetFieldValue(aFieldName: string): Variant;
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
  Numero:    String;
  Texto: String;
  q: TFXQuery;

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
  Texto := 'Son Pesos: ' + Letras +'(' + Floattostr(Monto) + ')' + #13#10+
           'Reserva del inmueble ubicado en calle ' + Combobox1.Text  + ' que se compromete adquirir por el precio total de ' + Edit7.text  +
           ' La correspondiente escritura deberá firmarse el ' + Edit6.text + ' en la escribanía ' + Edit5.text +
           ' quien interviene en esta operación y cobrará en dicho acto el monto correspondiente a la escritura traslativa de dominio y el 3% '+
           ' en concepto de comisión al corredor inmobiliario sobre el total de la venta. Si en la fecha indicada precedentemente el presunto comprador '+
           ' no se presentara a firmar la escritura respectiva, o si la operación no pudiera concretarse por cualquier motivo que presenten las partes, '+
           'la suma entregada será devuelta y el propietario del inmueble podrá disponer libremente de la propiedad motivo de la presente.'+
           #13#10+
           #13#10+
           'De conformidad con los términos del presente recibo.';

  q := CrearQuery;
  try
    q.SQL.Text := 'Select Count(*) + 1 as Cantidad from Cabezarecibos where Tipo = ''RE'' ';
    q.Open;

    Numero := Inttostr(q.FieldByName('Cantidad').AsInteger);
  finally
    FreeAndNil(q);
  end;


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
  if aFieldName = 'Texto' then
    Result := Texto;
  if aFieldName = 'Numero' then
    Result := Numero;
end;



procedure Tfrecrinmvta.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edit4.SetFocus;
end;

procedure Tfrecrinmvta.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinmvta.Edit7KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinmvta.ToolButton1Click(Sender: TObject);
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
