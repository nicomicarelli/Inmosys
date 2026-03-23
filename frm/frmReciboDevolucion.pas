unit frmReciboDevolucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db,
  Funciones, ImgList, ComCtrls, ToolWin, sqlExpr,
  ppDB, ppDBJIT, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppParameter, Grids, ALIGRID, ppDesignLayer, FXQuery, system.UITypes,
  AdvGlowButton, ppModule, raCodMod, ppVar, ppStrtch, ppMemo;

type
  TFReciboDevolucion = class(TForm)
    ImageList1: TImageList;
    plDatos: TppJITPipeline;
    plDatosppField1: TppField;
    plDatosppField2: TppField;
    plDatosppField3: TppField;
    plDatosppField4: TppField;
    plDatosppField6: TppField;
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
    gImpresion: TStringAlignGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    plDatosppField5: TppField;
    Label1: TLabel;
    Edit6: TEdit;
    plDatosppField7: TppField;
    plDatosppField8: TppField;
    Reporte: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDBText14: TppDBText;
    ppLabel21: TppLabel;
    ppVariable1: TppVariable;
    ppDBText16: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    plDatosppField9: TppField;
    ppDBMemo1: TppDBMemo;
    plDatosppField10: TppField;
    ReporteDuplicado: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppVariable2: TppVariable;
    ppDBText2: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    RadioButton3: TRadioButton;
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
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Class procedure Ejecutar;
  end;

var
  FReciboDevolucion: TFReciboDevolucion;

implementation

uses frmPrincipal, frmDatos, recrinm, frmConfirmacionRecibos;

{$R *.DFM}

class procedure TFReciboDevolucion.Ejecutar;
begin
end;

procedure TFReciboDevolucion.btnImprimirClick(Sender: TObject);
var
  fecha: string;
  Importe: string;
  Texto: string;

begin
  if edtCodigo.Text = '' then
  begin
    MostrarDialogoAceptar('Debe proporcionar el dato fijo');
    Exit;
  end;

  ImprimirReporte(Reporte, nil,nil,'',false,'',nil,'','Recibo de Seña ORIGINAL');
  ImprimirReporte(ReporteDuplicado, nil,nil,'',false,'',nil,'','Recibo de Seña DUPLICADO');

  Fecha := edit2.Text;
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
  gImpresion.Cells[6,1] := 'DEVOLUCION DE SEÑA: ' + Combobox1.text;
  gImpresion.Cells[7,1] := edit4.Text;
  gImpresion.Cells[8,1] := '$ ' + edit4.Text;
  gImpresion.Cells[9,1] := ImporteEnLetras(Importe);
  gImpresion.Cells[10,1] := edtCodigo.Text;


  if fConfirmacionRecibos = nil then
    Application.CreateForm(TFConfirmacionRecibos, FConfirmacionRecibos)
  else
    FConfirmacionRecibos.Show;

  fConfirmacionRecibos.EsDevolucion := True;
  fConfirmacionRecibos.EsLiquidacion := False;
  fConfirmacionRecibos.FormStyle := fsNormal;
  fConfirmacionRecibos.VIsible := False;
  fConfirmacionRecibos.FCodinq := Edit1.text;
  fConfirmacionRecibos.FGrilla := gIMpresion;
  fConfirmacionRecibos.ShowModal;

end;

procedure TFReciboDevolucion.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFReciboDevolucion.cbxDatoFijoClick(Sender: TObject);
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

procedure TFReciboDevolucion.cbxDatoFijoExit(Sender: TObject);
begin
  if length(edtCodigo.Text)=0 then
    cbxDatoFijo.Text:='';
end;

procedure TFReciboDevolucion.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboDevolucion.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboDevolucion.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;

begin
  if key=#13 then
  begin
    Importe := Edit4.Text;
    if Importe = '' then
      Importe := '0.00';
    Edit4.Text := FormatFloat('0.00', ToFloat(Importe));
    Edit6.SetFocus;
  end;
end;

procedure TFReciboDevolucion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  FReciboDevolucion := nil;
end;

procedure TFReciboDevolucion.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TFReciboDevolucion.plDatosGetFieldValue(aFieldName: string): Variant;
var
  Fecha:     string;
  Letras:    string;
  Inquilino: string;
  Importe:   string;
  Dias:      string;
  I:         Integer;
  J:         Integer;
  TotalParcial: string;
begin
  Fecha     := Edit2.Text;
  Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);
  Inquilino := Edit3.Text;
  Letras    := Edit4.Text;
  Letras    := UpperCase(ImporteEnLetras(Letras));
  J         := Length(Letras);
  Importe   := Edit4.Text;
  Letras := Trim(Letras) + ' ($' + Importe + ')';
  Dias      := Edit5.Text;
  if Radiobutton1.checked then
    TotalParcial := 'TOTAL'
  else if Radiobutton2.checked then
    TotalParcial := 'PARCIAL'
  else if Radiobutton3.checked then
    TotalParcial := 'DOBLE';
  if aFieldName = 'Fecha' then
    Result := Fecha;
  if aFieldName = 'Nombre' then
    Result := Inquilino;
  if aFieldName = 'Direccion' then
    Result := Combobox1.text;
  if aFieldName = 'Letras' then
    Result := Letras;
  if aFieldName = 'Importe' then
    Result := '$' + Importe;
  if aFieldName = 'TOTAL' then
    if Radiobutton1.checked then
      Result := 'TOTAL'
    else if Radiobutton2.checked then
      Result := 'PARCIAL'
    else if Radiobutton3.checked then
      Result := 'DOBLE';
  if aFieldName = 'Recibos' then
    Result := edit5.text;
  if aFieldName = 'FechaRecibo' then
    Result := edit6.text;
  if aFieldName = 'Inmueble' then
    Result := Combobox1.Text;
  if aFieldName = 'Texto' then
     rESULT := 'Recibi de Salomon Inmobiliaria la suma de PESOS '+ ImporteEnLetras(Importe) + ' ($ ' + Edit4.Text + ') en concepto de devolucion de reserva '+
           'de locacion respecto del inmueble sito en calle '+ Combobox1.text + ' no teniendo nada que reclamar a Salomon Inmobiliaria por ningún concepto ';


//    Result := 'RECIBI la suma de PESOS ' + Letras + ' de total conformidad, en concepto de devolución de seña ' +
//       TotalParcial +' (art. 1059 C.C.), según recibos Nº ' + edit5.Text + ' de fecha ' + edit6.text + ', ' +
//      ' motivo por el cual “SALOMON INMOBILIARIA” deslinda toda responsabilidad al respecto, en razón de la decisión asumida por el propio Locador.-------------------------- '+ #13#10 +
//      ' De conformidad con los términos del recibo, no tengo más nada que reclamar en el futuro y por ningún concepto, a “SALOMON INMOBILIARIA”. CONSTE.---------------------------- ';

end;

procedure TFReciboDevolucion.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Dias: Integer;

begin
  if Key=#13 then
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TFReciboDevolucion.Edit6KeyPress(Sender: TObject; var Key: Char);
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
    Edit5.SetFocus;
  end;
end;

procedure TFReciboDevolucion.edtCodigoEnter(Sender: TObject);
begin
  if length(edtCodigo.Text) = 0 then
    cbxDatoFijo.Text := '';
end;

procedure TFReciboDevolucion.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboDevolucion.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus;
end;

procedure TFReciboDevolucion.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFReciboDevolucion.ToolButton5Click(Sender: TObject);
var
  Fecha:     string;
  Letras:    string;
  Inquilino: string;
  Importe:   string;
  Ubicacion: string;
  Dias:      string;
  I:         Integer;
  J:         Integer;

begin
  if MessageDlg('¿Esta seguro de imprimir el recibo?', mtConfirmation, [mbok,mbNo], 0)= mrOk then
  begin
    Inquilino := Edit3.Text;
    Ubicacion := Combobox1.Text;
    Importe   := Edit4.Text;
    Fecha     := Edit2.Text;
    Fecha     := 'Córdoba, ' + FechaEnLetras(Fecha);
    Letras    := Edit4.Text;
    Letras    := UpperCase(ImporteEnLetras(Letras));
    Dias      := Edit5.Text;
    J         := Length(Letras);
    for I := J to 120 do
      Letras := Letras + '-';

  end;
end;

procedure TFReciboDevolucion.ToolButton1Click(Sender: TObject);
begin
  Edit1.Text     := '';
  Edit2.Text     := '';
  Edit3.Text     := '';
  Edit4.Text     := '';
  Edit5.Text     := '';
  Combobox1.Text := '';
end;

procedure TFReciboDevolucion.ToolButton4Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
