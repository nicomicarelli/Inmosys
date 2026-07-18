unit recsinm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db,
  Funciones, ImgList, ComCtrls, ToolWin, sqlExpr,
  ppDB, ppDBJIT, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppParameter, Grids, ALIGRID, ppDesignLayer, FXQuery, system.UITypes,
  AdvGlowButton, ppModule, raCodMod, dxGDIPlusClasses, ppVar;

type
  Tfrecsinm = class(TForm)
    ImageList1: TImageList;
    plDatos: TppJITPipeline;
    plDatosppField1: TppField;
    plDatosppField2: TppField;
    plDatosppField3: TppField;
    plDatosppField4: TppField;
    plDatosppField5: TppField;
    plDatosppField6: TppField;
    rEPORTE: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    reporteduplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppParameterList2: TppParameterList;
    Panel3: TPanel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Combobox1: TEdit;
    Edit4: TEdit;
    cbxDatoFijo: TComboBox;
    edtCodigo: TEdit;
    ReporteFijo: TppReport;
    ppTitleBand2: TppTitleBand;
    ppShape3: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText13: TppDBText;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppShape4: TppShape;
    ppVariable4: TppVariable;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
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
    ReporteFijoDuplicado: TppReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText14: TppDBText;
    ppLabel28: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppShape2: TppShape;
    ppVariable1: TppVariable;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
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
    plDatosppField7: TppField;
    plDatosppField8: TppField;
    gImpresion: TStringAlignGrid;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure btnCerrarClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function plDatosGetFieldValue(aFieldName: string): Variant;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure cbxDatoFijoExit(Sender: TObject);
  private
    { Private declarations }
  public
    Class procedure Ejecutar;
  end;

var
  frecsinm: Tfrecsinm;

implementation

uses frmPrincipal, frmDatos, recrinm, frmConfirmacionRecibos;

{$R *.DFM}

class procedure Tfrecsinm.Ejecutar;
begin
end;

procedure Tfrecsinm.btnImprimirClick(Sender: TObject);
var
  fecha: string;
  Importe: string;
  Monto: Currency;
  Texto: string;
  Numero: String;
  q: TFXQuery;
begin
  Fecha := edit2.Text;
  Fecha := transformarfecha(Fecha);
  Fecha := 'Córdoba, ' + Fecha;
  Importe := edit4.Text;
  Monto := ToFloat(Importe);

  Texto := 'Seña y por el lapso de ' + edit5.Text + '. Todo referido al inmueble ubicado en calle '+
           Combobox1.Text + '. Acogiendose ambos interesados a lo dispuesto por los  art. 1059  y 1060 del Código Civil (De las obligaciones '+
           'en general). Asimismo estará sujeta a pérdida de la misma en caso de incumplimiento y/o satisfacción de los informes solicitados por la inmobiliaria. También las partes acuerdan que el interesado '+
           'deberá abonar la comisión inmobiliaria liberando a la parte locadora de la carga estipulada en el artículo 1209 de la ley 26.994.-' +
           'De conformidad con los terminos del presente recibo ';

  q := CrearQuery;
  try
    q.SQL.Text := 'Select Count(*) + 1 as Cantidad from Cabezarecibos where Tipo = ''RE'' ';
    q.Open;

    Numero := Inttostr(q.FieldByName('Cantidad').AsInteger);
  finally
    FreeAndNil(q);
  end;

  gImpresion.Vaciar;
  gImpresion.Cells[0,1] := edit1.Text;
  gImpresion.Cells[1,1] := edit3.Text;
  gImpresion.Cells[2,1] := Fecha;
  gImpresion.Cells[3,1] := cbxDatofijo.text;
  gImpresion.Cells[4,1] := edtCodigo.Text;
  gImpresion.Cells[5,1] := cbxDatofijo.text;
  gImpresion.Cells[6,1] := 'SEÑA: ' + Combobox1.text;
  gImpresion.Cells[7,1] := edit4.Text;
  gImpresion.Cells[8,1] := '$ ' + edit4.Text;
  gImpresion.Cells[9,1] := ImporteEnLetras(Monto);
  gImpresion.Cells[10,1] := edtCodigo.Text;
  gImpresion.Cells[13,1] := Texto;
  gImpresion.Cells[14,1] := Numero;

  ImprimirReporte(ReporteFijo, NIL,NIL,'',false,'',nil,'','Recibo de Seña ORIGINAL');
  ImprimirReporte(ReporteFijoDuplicado, nil,nil,'',false,'',nil,'','Recibo de Seña DUPLICADO');


  if fConfirmacionRecibos = nil then
    Application.CreateForm(TFConfirmacionRecibos, FConfirmacionRecibos)
  else
    FConfirmacionRecibos.Show;

  fConfirmacionRecibos.EsLiquidacion := False;
  fConfirmacionRecibos.FormStyle := fsNormal;
  fConfirmacionRecibos.VIsible := False;
  fConfirmacionRecibos.FCodinq := Edit1.text;
  fConfirmacionRecibos.FGrilla := gIMpresion;
  fConfirmacionRecibos.ShowModal;

end;

procedure Tfrecsinm.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrecsinm.cbxDatoFijoClick(Sender: TObject);
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
      edtCodigo.Text := Fields[0].AsString;
      Codigo := edtCodigo.Text;
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
            MostrarDialogoAceptar('Dato fijo invalido para este caso'+#13+'Por favor Verifique...');
            edtCodigo.setfocus;
          end;
          if edtCodigo.Text = '' then
            cbxDatoFijo.Text := '';
        end;
      end;
      //ACtDatoFijo.Execute;
    end;
  finally
    FreeAndNil(ibqConsulta);
  end;
end;

procedure Tfrecsinm.cbxDatoFijoExit(Sender: TObject);
begin
  if length(edtCodigo.Text)=0 then
    cbxDatoFijo.Text:='';
end;

procedure Tfrecsinm.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  q: TFXQuery;
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
        Combobox1.Text := FieldbyName('Ubicacion').AsString;
      end;
      if Codigo <> '' then
        Edit2.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure Tfrecsinm.Edit2KeyPress(Sender: TObject; var Key: Char);
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
    Edit3.SetFocus;
  end;
end;

procedure Tfrecsinm.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;

begin
  if key=#13 then
  begin
    Importe := Edit4.Text;
    if Importe = '' then
      Importe := '0.00';
    Edit4.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit5.SetFocus;
  end;
end;

procedure Tfrecsinm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  FRecSinm := nil;
end;

procedure Tfrecsinm.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function Tfrecsinm.plDatosGetFieldValue(aFieldName: string): Variant;
var
  Fecha:     string;
  Letras:    string;
  Inquilino: string;
  Importe:   string;
  Dias:      string;
  I:         Integer;
  J:         Integer;
  Monto:     Currency;
  Numero:    String;
  Texto: String;
  q: TFXQuery;
begin
  Fecha     := Edit2.Text;
  Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);
  Inquilino := Edit3.Text;
  Letras    := Edit4.Text;
  Monto     := ToFloat(Letras);
  Letras    := UpperCase(ImporteEnLetras(Monto));
  J         := Length(Letras);
  for I := J to 120 do
    Letras := Letras + '-';
  Importe   := Edit4.Text;
  Dias      := Edit5.Text;

  Texto := 'Son Pesos: ' + Letras +'(' + Floattostr(Monto) + ')' + #13#10+
           'Seña y por el lapso de ' + edit5.Text + '. Todo referido al inmueble ubicado en calle '+
           Combobox1.Text + '. Acogiendose ambos interesados a lo dispuesto por los  art. 1059  y 1060 del Código Civil (De las obligaciones '+
           'en general). Asimismo estará sujeta a pérdida de la misma en caso de incumplimiento y/o satisfacción de los informes solicitados por la inmobiliaria. También las partes acuerdan que el interesado '+
           'deberá abonar la comisión inmobiliaria liberando a la parte locadora de la carga estipulada en el artículo 1209 de la ley 26.994.-' +
           'De conformidad con los terminos del presente recibo ';

  q := CrearQuery;
  try
    q.SQL.Text := 'Select Count(*) + 1 as Cantidad from Cabezarecibos where Tipo = ''RE'' ';
    q.Open;

    Numero := Inttostr(q.FieldByName('Cantidad').AsInteger);
  finally
    FreeAndNil(q);
  end;

  if aFieldName = 'Fecha' then
    Result := Fecha;
  if aFieldName = 'Nombre' then
    Result := Inquilino;
  if aFieldName = 'Letras' then
    Result := Letras;
  if aFieldName = 'Importe' then
    Result := '$' + Importe;
  if aFieldName = 'Dias' then
    Result := Dias;
  if aFieldName = 'Inmueble' then
    Result := Combobox1.Text;
  if aFieldName = 'Texto' then
    Result := Texto;
  if aFieldName = 'Numero' then
    Result := Numero;


end;

procedure Tfrecsinm.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Dias: Integer;

begin
  if Key=#13 then
  begin
    if Edit5.Text = '' then
      Edit5.Text := '1';

    if length(edit5.Text) > 2 then
      Exit;

    Dias := StrToInt(Edit5.text);
    if (Dias < 1) or (Dias > 20) then
      MessageDlg('Ingrese un numero de 1 a 20', mtinformation, [mbok], 0)
    else
      Edit5.Text := DiasHabiles(Dias);
  end;
end;

procedure Tfrecsinm.edtCodigoEnter(Sender: TObject);
begin
  if length(edtCodigo.Text) = 0 then
    cbxDatoFijo.Text := '';
end;

procedure Tfrecsinm.edtCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Coditem: string;
  Nro:     string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if key=#13 then
    begin
      Coditem := edtCodigo.Text;
      if edtCodigo.Text <> '' then
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
            cbxDatoFijo.Text := q.Fieldbyname('Descripcion').AsString;
          end
          ELSE
            edtCodigo.Text := '';
      end;
    end;
//    actDatoFijo.Execute;
   END;
  finally
    FreeAndNil(q);
  end;
end;

procedure Tfrecsinm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus;
end;

procedure Tfrecsinm.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrecsinm.ToolButton5Click(Sender: TObject);
var
  Fecha:     string;
  Letras:    string;
  Inquilino: string;
  Importe:   string;
  Ubicacion: string;
  Dias:      string;
  I:         Integer;
  J:         Integer;
  Monto:     Currency;
begin
  if MessageDlg('¿Esta seguro de imprimir el recibo?', mtConfirmation, [mbok,mbNo], 0)= mrOk then
  begin
    Inquilino := Edit3.Text;
    Ubicacion := Combobox1.Text;
    Importe   := Edit4.Text;
    Fecha     := Edit2.Text;
    Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);

    Letras    := Edit4.Text;
    Monto     := ToFloat(Letras);
    Letras    := UpperCase(ImporteEnLetras(Monto));
    Dias      := Edit5.Text;
    J         := Length(Letras);
    for I := J to 120 do
      Letras := Letras + '-';

  end;
end;

procedure Tfrecsinm.ToolButton1Click(Sender: TObject);
begin
  Edit1.Text     := '';
  Edit2.Text     := '';
  Edit3.Text     := '';
  Edit4.Text     := '';
  Edit5.Text     := '';
  Combobox1.Text := '';
end;

procedure Tfrecsinm.ToolButton4Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
