unit frmReciboLocatarioSaliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db,
  Funciones, ImgList, ComCtrls, ToolWin, sqlExpr,
  ppDB, ppDBJIT, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppParameter, Grids, ALIGRID, ppDesignLayer, FXQuery, system.UITypes,
  AdvGlowButton, ppModule, raCodMod, ppVar, ppStrtch, ppMemo;

type
  TFReciboLocatarioSaliente = class(TForm)
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
    raCodeModule1: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    plDatosppField9: TppField;
    ppDBMemo1: TppDBMemo;
    plDatosppField10: TppField;
    ppDBText3: TppDBText;
    Label8: TLabel;
    Edit7: TEdit;
    ComboBox2: TComboBox;
    ReporteDuplicado: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppVariable2: TppVariable;
    ppDBText2: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBText4: TppDBText;
    ppDetailBand1: TppDetailBand;
    raCodeModule2: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
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
    procedure ComboBox2Click(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Class procedure Ejecutar;
  end;

var
  FReciboLocatarioSaliente: TFReciboLocatarioSaliente;

implementation

uses frmPrincipal, frmDatos, recrinm, frmConfirmacionRecibos,
  frmReciboDevolucion;

{$R *.DFM}

class procedure TFReciboLocatarioSaliente.Ejecutar;
begin
end;

procedure TFReciboLocatarioSaliente.btnImprimirClick(Sender: TObject);
var
  fecha: string;
  Importe: string;
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
  gImpresion.Cells[6,1] := EDIT5.TEXT;
  gImpresion.Cells[7,1] := edit4.Text;
  gImpresion.Cells[8,1] := '$ ' + edit4.Text;
  gImpresion.Cells[9,1] := ImporteEnLetras(Importe);
  gImpresion.Cells[10,1] := edtCodigo.Text;


  if fConfirmacionRecibos = nil then
    Application.CreateForm(TFConfirmacionRecibos, FConfirmacionRecibos)
  else
    FConfirmacionRecibos.Show;

  fConfirmacionRecibos.EsDevolucion := False;
  fConfirmacionRecibos.EsLiquidacion := False;
  fConfirmacionRecibos.FormStyle := fsNormal;
  fConfirmacionRecibos.VIsible := False;
  fConfirmacionRecibos.FCodinq := Edit1.text;
  fConfirmacionRecibos.FGrilla := gIMpresion;
  fConfirmacionRecibos.ShowModal;

end;

procedure TFReciboLocatarioSaliente.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFReciboLocatarioSaliente.cbxDatoFijoClick(Sender: TObject);
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

procedure TFReciboLocatarioSaliente.cbxDatoFijoExit(Sender: TObject);
begin
  if length(edtCodigo.Text)=0 then
    cbxDatoFijo.Text:='';
end;

procedure TFReciboLocatarioSaliente.ComboBox2Click(Sender: TObject);
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
      ParamByName('descripcion').AsString := Combobox2.Text;
      Open;
      Edit7.Text := Fields[0].AsString;
      Codigo := Edit7.Text;
      if Edit7.Text<>'' then
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
            Combobox2.Text := Fields[1].AsString;
          end
          else
          begin
            Edit7.Text   := '';
            Combobox2.Text := '';
            MostrarDialogoAceptar('Dato fijo invalido para este caso'+#13+'Por favor Verifique...');
            Edit7.setfocus;
          end;
          if Edit7.Text = '' then
            Combobox2.Text := '';
        end;
      end;
      //ACtDatoFijo.Execute;
    end;
  finally
    FreeAndNil(ibqConsulta);
  end;
end;

procedure TFReciboLocatarioSaliente.ComboBox2Exit(Sender: TObject);
begin
  if length(Edit7.Text)=0 then
    Combobox2.Text:='';
end;

procedure TFReciboLocatarioSaliente.Edit1KeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboLocatarioSaliente.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboLocatarioSaliente.Edit4KeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboLocatarioSaliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  FReciboLocatarioSaliente := nil;
end;

procedure TFReciboLocatarioSaliente.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TFReciboLocatarioSaliente.plDatosGetFieldValue(aFieldName: string): Variant;
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
  if aFieldName = 'Recibos' then
    Result := edit5.text;
  if aFieldName = 'FechaRecibo' then
    Result := edit6.text;
  if aFieldName = 'Inmueble' then
    Result := Combobox1.Text;
  if aFieldName = 'Texto' then
    Result := ' Presupuestos de arreglos pendientes de la entrega del inmueble en cuestión ' + edit5.text +'.'+ #13#10 + ' De conformidad con los terminos del presente recibo.';
end;

procedure TFReciboLocatarioSaliente.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Dias: Integer;

begin
  if Key=#13 then
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TFReciboLocatarioSaliente.Edit6KeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboLocatarioSaliente.Edit7Enter(Sender: TObject);
begin
  if length(Combobox2.Text) = 0 then
    Combobox2.Text := '';
end;

procedure TFReciboLocatarioSaliente.Edit7KeyPress(Sender: TObject;
  var Key: Char);
var
  Coditem: string;
  Nro:     string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if key=#13 then
    begin
      Coditem := Edit7.Text;
      if Edit7.Text <> '' then
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
            Combobox2.Text := q.Fieldbyname('Descripcion').AsString;
          end
          ELSE
            Edit7.Text := '';
      end;
    end;
//    actDatoFijo.Execute;
   END;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFReciboLocatarioSaliente.edtCodigoEnter(Sender: TObject);
begin
  if length(edtCodigo.Text) = 0 then
    cbxDatoFijo.Text := '';
end;

procedure TFReciboLocatarioSaliente.edtCodigoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboLocatarioSaliente.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Edit4.SetFocus;
end;

procedure TFReciboLocatarioSaliente.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFReciboLocatarioSaliente.ToolButton5Click(Sender: TObject);
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

procedure TFReciboLocatarioSaliente.ToolButton1Click(Sender: TObject);
begin
  Edit1.Text     := '';
  Edit2.Text     := '';
  Edit3.Text     := '';
  Edit4.Text     := '';
  Edit5.Text     := '';
  Combobox1.Text := '';
end;

procedure TFReciboLocatarioSaliente.ToolButton4Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
