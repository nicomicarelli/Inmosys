unit recrinm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db,
  Funciones, ImgList, ComCtrls, ToolWin, sqlExpr,
  ppDB, ppDBJIT, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppParameter, Grids, ALIGRID, FXQuery, ppDesignLayer, System.UITypes,
  AdvGlowButton, ppModule, raCodMod, ppStrtch, ppSubRpt, dxGDIPlusClasses, ppVar;

type
  Tfrecrinm = class(TForm)
    Panel3: TPanel;
    Reporte: TppReport;
    plDatos: TppJITPipeline;
    plDatosppField1: TppField;
    plDatosppField2: TppField;
    plDatosppField3: TppField;
    plDatosppField4: TppField;
    plDatosppField5: TppField;
    plDatosppField6: TppField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Combobox1: TEdit;
    Edit4: TEdit;
    edtCodigo: TEdit;
    cbxDatoFijo: TComboBox;
    Label5: TLabel;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    gImpresion: TStringAlignGrid;
    Label1: TLabel;
    Edit6: TEdit;
    ppDBText13: TppDBText;
    plDatosppField7: TppField;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
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
    procedure cbxDatoFijoExit(Sender: TObject);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Class procedure Ejecutar;
  end;

var
  frecrinm: Tfrecrinm;

implementation

uses frmPrincipal, frmDatos, frmConfirmacionRecibos;

{$R *.DFM}

class procedure Tfrecrinm.Ejecutar;
begin
  with Tfrecrinm.Create(Application) do
    ShowModal;
end;

procedure Tfrecrinm.btnImprimirClick(Sender: TObject);
var
  fecha: string;
  Importe: string;
  Texto: string;
  Monto: Currency;
begin
  Fecha := edit2.Text;
  Fecha := transformarfecha(Fecha);
  Fecha := 'Córdoba, ' + Fecha;
  Importe := edit4.Text;
  Monto := ToFloat(Importe);

  Texto := ' RECIBI, de/la Sr./a ' + edit3.Text + ' DNI Nº ' + Edit6.text + ' la suma de Pesos '+
           ImporteEnLetras(Monto) + ' ($ ' + Edit4.Text + ') en concepto de reserva de locación por el término '+
           ' de setenta y dos (72 hs)., con relación al inmueble sito en calle ' + Combobox1.text + ' de esta ciudad de Córdoba. ' +
           'La presente reserva no implica principio de ejecución del contrato locativo. Si por cualquier circunstancia la '+
           'eventual locación no se celebrara por cuestiones ajenas a esta Administración y/o por culpa del interesado '+
           '(incumplimiento de los requisitos y/o insatisfacción de los informes solicitados por la inmobiliaria, '+
           'respecto de las garantías ofrecidas), dentro del plazo acordado, perderá de pleno derecho reserva entregada, '+
           'en concepto de recupero de gastos por pedidos de informes, pagos de tasas, etc., en los que haya incurrido '+
           'la Administración y como pago por su gestión realizada en vano, por culpa del interesado. '+
           'Por el contrario, si el potencial locatario cumplimenta con los requisitos exigidos por la Administración, '+
           'y eventualmente se concretara la firma del contrato de locación, la reserva recibida '+
           '–previa deducción de los gastos por pedidos de informes, tasas, etc.- adquirirá el carácter de “seña” '+
           'en los términos de los arts. 1059 y 1060 del Código Civil y su saldo será considerado como parte del precio '+
           'de la locación que eventualmente se fije en el supuesto de celebrarse el contrato locativo. ';
//
//
//
//  Texto := 'RECIBI, de/la Sr./a ' + edit3.Text + ' DNI Nº ' + Edit6.text + ' la suma de Pesos '+
//  ImporteEnLetras(Importe) + ' ($ ' + Edit4.Text + ') en concepto de reserva de locación por el término '+
//  'de setenta y dos (72 hs., con relación al inmueble sito en calle ' + Combobox1.text + ' de esta ciudad de Córdoba. '+
//  'La presente reserva no implica principio de ejecución del contrato locativo. Si por cualquier circunstancia la '+
//  'eventual locación no se concretara, se procedera a la devolución de la reserva previa deducción de los gastos (pedidos '+
//  'de informes, tasas, etc.), poniendo a disposición del interesado el saldo de la misma por un plazo de cuarenta y ocho (48) hs., '+
//  'y vencido este último, se considera perdida la reserva. CONSTE.- ';

  gImpresion.Vaciar;
  gImpresion.Cells[0,1] := edit1.Text;
  gImpresion.Cells[1,1] := edit3.Text;
  gImpresion.Cells[2,1] := Fecha;
  gImpresion.Cells[3,1] := cbxDatofijo.text;
  gImpresion.Cells[4,1] := edtCodigo.Text;
  gImpresion.Cells[5,1] := cbxDatofijo.text;
  gImpresion.Cells[6,1] := 'RESERVA :' + Combobox1.text;
  gImpresion.Cells[7,1] := edit4.Text;
  gImpresion.Cells[8,1] := '$ ' + edit4.Text;
  gImpresion.Cells[9,1] := ImporteEnLetras(Monto);
  gImpresion.Cells[10,1] := edtCodigo.Text;
  gImpresion.Cells[13,1] := Texto;
  ImprimirReporte(Reporte, nil,nil,'',false,'',nil,'','Recibo de Seña ORIGINAL');
  ImprimirReporte(ReporteDuplicado, nil,nil,'',false,'',nil,'','Recibo de Seña DUPLICADO');

(*  Fecha := edit2.Text;
  Fecha := transformarfecha(Fecha);
  Fecha := 'Córdoba, ' + Fecha;
  Importe := edit4.Text;
  gImpresion.Vaciar;
  gImpresion.Cells[0,1] := edit1.Text;
  gImpresion.Cells[1,1] := edit3.Text;
  gImpresion.Cells[2,1] := Fecha;
  gImpresion.Cells[3,1] := cbxDatofijo.text;
  gImpresion.Cells[4,1] := edtCodigo.Text;
  gImpresion.Cells[5,1] := cbxDatofijo.text;
  gImpresion.Cells[6,1] := 'RESERVA :' + Combobox1.text;
  gImpresion.Cells[7,1] := edit4.Text;
  gImpresion.Cells[8,1] := '$ ' + edit4.Text;
  gImpresion.Cells[9,1] := ImporteEnLetras(Importe);
  gImpresion.Cells[10,1] := edtCodigo.Text;
  gImpresion.Cells[13,1] := Texto;
*)

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

procedure Tfrecrinm.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrecrinm.cbxDatoFijoClick(Sender: TObject);
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
            messagedlg('Dato fijo invalido para este caso'+#13+'Por favor Verifique...',mtwarning,[mbOk],0);
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

procedure Tfrecrinm.cbxDatoFijoExit(Sender: TObject);
begin
  if length(edtCodigo.Text)=0 then
    cbxDatoFijo.Text:='';
end;

procedure Tfrecrinm.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinm.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinm.Edit4KeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  FRecRinm := nil;
end;

procedure Tfrecrinm.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function Tfrecrinm.plDatosGetFieldValue(aFieldName: string): Variant;
var
  Fecha:     string;
  Letras:    string;
  Inquilino: string;
  Importe:   string;
  Dias:      string;
  I:         Integer;
  J:         Integer;
  Monto: Currency;
begin
  Fecha     := Edit2.Text;
  Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);
  Inquilino := Edit3.Text;
  Letras    := Edit4.Text;
  Letras    := UpperCase(ImporteEnLetras(Monto));
  J         := Length(Letras);
  for I := J to 120 do
    Letras := Letras + '-';
  Importe   := Edit4.Text;
  Dias      := Edit5.Text;


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
    Result := gImpresion.Cells[13,1];
end;

procedure Tfrecrinm.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Dias: Integer;

begin
  if Key=#13 then
  begin
    if Edit5.Text = '' then
      Edit5.Text := '1';

    if length(edit5.Text) > 2 then
      Exit;

    if Edit5.Text = '' then
      Edit5.Text := '1';
    Dias := StrToInt(Edit5.text);
    if (Dias < 1) or (Dias > 20) then
      MessageDlg('Ingrese un numero de 1 a 20', mtinformation, [mbok], 0)
    else
      Edit5.Text := DiasHabiles(Dias);
  end;
end;

procedure Tfrecrinm.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus;
end;

procedure Tfrecrinm.edtCodigoEnter(Sender: TObject);
begin
  if length(edtCodigo.Text) = 0 then
    cbxDatoFijo.Text := '';
end;

procedure Tfrecrinm.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrecrinm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit6.SetFocus;
end;

procedure Tfrecrinm.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrecrinm.ToolButton5Click(Sender: TObject);
var
  Fecha:     string;
  Letras:    string;
  Inquilino: string;
  Importe:   string;
  Ubicacion: string;
  Dias:      string;
  I:         Integer;
  J:         Integer;
  Monto: Currency;
begin
  Monto := ToFloat(Letras);
  if MessageDlg('¿Esta seguro de imprimir el recibo?', mtConfirmation, [mbok,mbNo], 0)= mrOk then
  begin
    Inquilino := Edit3.Text;
    Ubicacion := Combobox1.Text;
    Importe   := Edit4.Text;
    Fecha     := Edit2.Text;
    Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);
    Letras    := Edit4.Text;
    Letras    := UpperCase(ImporteEnLetras(Monto));
    Dias      := Edit5.Text;
    J         := Length(Letras);
    for I := J to 120 do
      Letras := Letras + '-';

  end;
end;

procedure Tfrecrinm.ToolButton1Click(Sender: TObject);
begin
  Edit1.Text     := '';
  Edit2.Text     := '';
  Edit3.Text     := '';
  Edit4.Text     := '';
  Edit5.Text     := '';
  Combobox1.Text := '';
end;

procedure Tfrecrinm.ToolButton4Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
