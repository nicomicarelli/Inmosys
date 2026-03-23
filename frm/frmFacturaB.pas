unit frmFacturaB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  CheckLst, IBTable, IBCustomDataSet,
  ImgList, ToolWin, Funciones, FrmDatos, ActnList, sqlExpr, ALIGRID, ppDB,
  ppDBJIT, ppParameter, ppModule, raCodMod, ppBands, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, dbClient, Provider, strUtils,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, AdvObj, BaseGrid, AdvGrid, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, ppDesignLayer, System.Actions, FxQuery, AdvGlowButton;

type
  TFFacturaB = class(TForm)
    DataSource5: TDataSource;
    ImageList1: TImageList;
    aclAcciones: TActionList;
    actImprimir: TAction;
    actRecibos: TAction;
    actEliminarRecibo: TAction;
    actCalcularComisiones: TAction;
    plTitulo: TppJITPipeline;
    plTituloppField1: TppField;
    plTituloppField2: TppField;
    plTituloppField3: TppField;
    plTituloppField4: TppField;
    plTituloppField5: TppField;
    plTituloppField6: TppField;
    plTituloppField7: TppField;
    plTituloppField8: TppField;
    Reporte: TppReport;
    ppParameterList1: TppParameterList;
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppVariable1: TppVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppVariable9: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppVariable3: TppVariable;
    raCodeModule1: TraCodeModule;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppLabel3: TppLabel;
    ppVariable6: TppVariable;
    plTituloppField9: TppField;
    ReporteDuplicado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppVariable2: TppVariable;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppVariable4: TppVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppVariable5: TppVariable;
    ppSummaryBand2: TppSummaryBand;
    ppVariable7: TppVariable;
    ppLabel4: TppLabel;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    DataSource1: TDataSource;
    ImageList2: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    ppJITPipeline1: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    plTituloppField10: TppField;
    plTituloppField11: TppField;
    ppReport1: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDBText11: TppDBText;
    ppLabel5: TppLabel;
    ppVariable8: TppVariable;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppVariable10: TppVariable;
    ppDetailBand3: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppVariable11: TppVariable;
    ppSummaryBand3: TppSummaryBand;
    ppVariable12: TppVariable;
    ppLabel6: TppLabel;
    ppVariable13: TppVariable;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppVariable14: TppVariable;
    raCodeModule3: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppJITPipeline2: TppJITPipeline;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppReport2: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDBText16: TppDBText;
    ppLabel9: TppLabel;
    ppVariable15: TppVariable;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppVariable16: TppVariable;
    ppDetailBand4: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppVariable17: TppVariable;
    ppSummaryBand4: TppSummaryBand;
    ppVariable18: TppVariable;
    ppLabel10: TppLabel;
    ppVariable19: TppVariable;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppVariable20: TppVariable;
    raCodeModule4: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList4: TppParameterList;
    Panel3: TPanel;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Edit9: TEdit;
    BitBtn5: TBitBtn;
    gDetalle: TStringAlignGrid;
    gPropiedades: TStringAlignGrid;
    gImpresion: TStringAlignGrid;
    BitBtn1: TBitBtn;
    Edit4: TcxTextEdit;
    Edit1: TcxTextEdit;
    Edit2: TcxComboBox;
    Edit3: TcxTextEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    gLista: TAdvStringGrid;
    Edit5: TcxComboBox;
    Label3: TLabel;
    Edit12: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure actRecibosExecute(Sender: TObject);
    procedure actCalcularComisionesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    function plTituloGetFieldValue(aFieldName: string): Variant;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit5PropertiesChange(Sender: TObject);
    procedure gListaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    { Private declarations }
  public
    MasItemsp: TClientDataSet;
    dspMasItemsp: TDataSetProvider;
    LiqPrOrig: TClientDataSet;
    dspLiqPrOrig: TDataSetProvider;

  end;

var
  FFacturaB: TFFacturaB;

implementation

uses frmprincipal, frmLiquidacionComisiones, frmConfirmacionFacturas;
{$R *.DFM}

procedure TFFacturaB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(MasItemsp) then
    FreeAndNil(MasItemsp);

  if Assigned(dspMasItemsp) then
    FreeAndNil(dspMasItemsp);

  if Assigned(LiqPrOrig) then
    FreeAndNil(LiqPrOrig);

  if Assigned(dspLiqPrOrig) then
    FreeAndNil(dspLiqPrOrig);


  fFacturaB := nil;
  Action := caFree;
end;

procedure TFFacturaB.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  fPrincipal.center(self);
  MasItemsp := TClientDataSet.Create(nil);
  dspMasItemsp := TDataSetProvider.Create(nil);
  LiqPrOrig := TClientDataSet.Create(nil);
  dspLiqPrOrig := TDataSetProvider.Create(nil);

  q := CrearQuery;
  try
    q.Close;
    q.Sql.Clear;
    q.Sql.Add('select ubicacion from inmuebles order by ubicacion');
    q.Open;
    while not q.eof do
    begin
      Edit5.Properties.Items.Add(q.Fieldbyname('Ubicacion').AsString);
      q.Next;
    end;
    q.Sql.Clear;
    q.Sql.Add('select Inquilino from inmuebles order by Inquilino');
    q.Open;

    while not q.eof do
    begin
      Edit2.Properties.Items.Add(q.Fieldbyname('Inquilino').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFFacturaB.gListaGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2: HAlign := taLeftJustify;
  end;
end;

function TFFacturaB.plTituloGetFieldValue(aFieldName: string)
  : Variant;
begin
  if aFieldName = 'Fecha' then
    Result := gImpresion.Cells[2, 1]
  else if aFieldName = 'Codinq' then
    Result := gImpresion.Cells[0, 1]
  else if aFieldName = 'Total' then
    Result := gImpresion.Cells[8, 1]
  else if aFieldName = 'Letras' then
    Result := gImpresion.Cells[9, 1]
  else if aFieldName = 'Inquilino' then
    Result := gImpresion.Cells[1, 1]
  else if aFieldName = 'Iva' then
    Result := gImpresion.Cells[4, 1]
  else if aFieldName = 'Direccion' then
    Result := gImpresion.Cells[3, 1];

end;

procedure TFFacturaB.FormActivate(Sender: TObject);
var
  J: Integer;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    edit5.Properties.Items.Clear;
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select ubicacion from inmuebles order by ubicacion');
      Open;
      for J := 1 to RecordCount do
      begin
        edit5.Properties.Items.Add(Fields[0].AsString);
        Next;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFFacturaB.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Codigo:      string;
  I:           Integer;
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    if Key = #13  then
    begin
      Codigo     := Edit1.Text;
      Codigo     := LargoCodigo(Codigo);
      Edit1.Text := Codigo;
      With q do
      begin
        Close;
        Sql.Text := 'select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and a.codinq=:codinq';
        ParamByName('Codinq').AsString := Codigo;
        Open;

        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
        end
        else
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where codinq=:codinq');
          ParamByName('Codinq').AsString := Codigo;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit9.Text := Fields[14].AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino ' + Codigo + ' No cargado');
          end;
        end;
      end;
      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select codpro,propietario from inmuebles where propietario=:propietario');
        ParamByName('propietario').AsString:=Trim(Edit4.Text);
        Open;
        Edit4.Text := Fields[1].AsString;
      end;

      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from inmuebles where propietario=:propietario ORDER BY CODINQ');
        ParamByName('propietario').AsString:=Trim(Edit4.Text);
        Open;
  //      Edit4.Text := Fields[1].AsString;
        gLista.Clear;
        gLista.Cells[0, 0] := 'Seleccionar';
        gLista.Cells[1, 0] := 'Código';
        gLista.Cells[2, 0] := 'Inmueble';
        I := 1;
        While not eof do
        begin
          gLista.RowCount := gLista.RowCount + 1;
          gLista.AddCheckBox(0,I,false,false);
          gLista.Cells[1,I] := FieldByName('Codinq').AsString;
          gLista.Cells[2,I] := Fields[8].AsString;
          gLista.Readonly[1,I] := True;
          gLista.Readonly[2,I] := True;
          Inc(I);
          Next;
        end;
        if I < 2 then
          gLista.RowCount := 2
        else
          gLista.RowCount := I;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFFacturaB.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  if Key = #13 then
  begin
    Edit8.SetFocus;
    Fecha := Edit6.Text;
    if Fecha = '' then
    begin
      Fecha := DateToStr(Date() - 30);
      Delete(Fecha, 1, 2);
      Fecha := '15' + Fecha;
      Edit6.Text := Fecha;
    end;
    if Length(Fecha) = 6 then
      Edit6.Text := TransformaFecha(Fecha);
  end;
end;

procedure TFFacturaB.Edit7KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
begin
  Fecha := Edit7.Text;
  if Key = #13 then
  begin
    Edit7.Text := FechaCorrecta(Fecha);
    Edit6.SetFocus;
  end;
end;

procedure TFFacturaB.Edit8KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
  Dia: string;
  Mes: string;
  Ano: string;

begin
  if Key = #13 then
  begin
    Edit10.SetFocus;
    Fecha := Edit8.Text;
    if Fecha = '' then
    begin
      Fecha := Edit6.Text;
      Delete(Fecha, 3, 8);
      Dia := Fecha;
      Fecha := Edit6.Text;
      Delete(Fecha, 1, 3);
      Delete(Fecha, 3, 5);
      Mes := Fecha;
      Fecha := Edit6.Text;
      Delete(Fecha, 1, 6);
      Ano := Fecha;
      if Mes = '12' then
      begin
        Mes := '01';
        Ano := InttoStr(StrtoInt(Ano) + 1);
      end
      else
        Mes := InttoStr(StrtoInt(Mes) + 1);
      if Length(Mes) = 1 then
        Mes := '0' + Mes;
      Fecha := Dia + '/' + Mes + '/' + Ano;
      Edit8.Text := Fecha;
    end;
    if Length(Fecha) = 6 then
      Fecha := TransformaFecha(Fecha);
    Edit8.Text := Fecha;
  end;
end;

procedure TFFacturaB.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 q: TFXQuery;
 Tecla: Char;
begin
  q := CrearQuery;
  try
    if Key = #13  then
    begin
      With q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a,inmuebles i where a.codinq=i.codinq and a.inquilino=:inquilino');
        ParamByName('inquilino').AsString := Trim(Edit2.Text);
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := Fields[45].AsString;
          Tecla := #13;
          Edit1KeyPress(nil, Tecla);

        end
        else
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where inquilino=:inquilino');
          ParamByName('inquilino').AsString := Trim(Edit2.Text);
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino ' + Edit4.Text +' No cargado');
          end;
        end;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFFacturaB.Edit5KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: TFXQuery;
  qColor: TFXQuery;
  Tecla: Char;
begin
  q := CrearQuery;
  qColor := CrearQuery;
  Tecla:= #13;
  try
    if Key = #13 then
    begin
      if Edit5.Text <> '' then
      begin
        q.Sql.Text := 'Select Ubicacion from Inmuebles Where UPPER(ubicacion) like :Ubicacion';
        q.ParambyName('Ubicacion').AsString := '%' + Copy(Uppercase(Edit5.text),1,48) + '%';
        q.Open;

        Edit5.Properties.Items.Clear;
        while not q.eof do
        begin
          Edit5.Properties.Items.Add(q.FieldbyName('Ubicacion').AsString);
          q.Next;
        end;
        if Edit5.Properties.Items.Count = 1 then
          Edit5.ItemIndex := 0
        else
        begin
          Edit5.DroppedDown := True;
          Exit;
        end;
      end;

      gDetalle.Vaciar;
      gImpresion.Vaciar;
      Codigo     := Edit5.Text;
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and I.Ubicacion=:Ubicacion');
        ParamByName('Ubicacion').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Fecha      := FieldByName('FechaFin').AsString;
          Fecha      := FechaAlReves(Fecha);
          Hoy        := DatetoStr(Date());
          Hoy        := FechaAlReves(Hoy);
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit4.Text := Fields[3].AsString;
          Edit5.Text := Fields[4].AsString;
          Edit9.Text := FieldByName('CodPro').AsString;
          edit2.Text := FieldbyName('Inquilino').AsString;
          if StrToInt(Fecha) < StrToInt(hoy) then
          begin
            fecha := FieldbyName('FechaFin').AsString;
            SHOWMESSAGE('CONTRATO DE LOCACION VENCIDO');
            Edit1.SETFOCUS;
          end;
          if Edit5.Text <> '' then
            Edit1KeyPress(nil, Tecla);
        end
        else
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where Ubicacion = :Ubicacion');
          ParamByName('Ubicacion').AsString := Codigo;
          Open;
          if not IsEmpty then
          begin
            Edit1.Text := Fields[0].AsString;
            Edit2.Text := Fields[1].AsString;
            Edit4.Text := Fields[4].AsString;
            Edit5.Text := Fields[8].AsString;
            Edit9.Text := Fields[14].AsString;
            edit2.Text := FieldbyName('Inquilino').AsString;
          end
          else
          begin
            Edit2.Text := '';
            Edit4.Text := '';
            Edit5.Text := '';
            Showmessage('Inmueble correspondiente al inquilino '+Codigo+' No cargado');
          end;
        end;
        Edit7.setfocus;
      end;
//      Memo1.Lines.Clear;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFFacturaB.Edit5PropertiesChange(Sender: TObject);
var
  Codigo: string;
  Fecha:  string;
  Hoy:    string;
  q: TFXQuery;
  qColor: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  qColor := CrearQuery;
  try
    gDetalle.Vaciar;
    gImpresion.Vaciar;
    Codigo     := Edit5.Text;
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from automatizacion a ,inmuebles i where a.codinq=i.codinq and I.Ubicacion=:Ubicacion');
      ParamByName('Ubicacion').AsString := Codigo;
      Open;
      if not IsEmpty then
      begin
        Fecha      := FieldByName('FechaFin').AsString;
        Fecha      := FechaAlReves(Fecha);
        Hoy        := DatetoStr(Date());
        Hoy        := FechaAlReves(Hoy);
        Edit1.Text := Fields[0].AsString;
        Edit2.Text := Fields[1].AsString;
        Edit3.Text := Fields[2].AsString;
        Edit4.Text := Fields[3].AsString;
        Edit5.Text := Fields[4].AsString;
        Edit9.Text := FieldByName('CodPro').AsString;
        if StrToInt(Fecha) < StrToInt(hoy) then
        begin
          fecha := FieldbyName('FechaFin').AsString;
          Edit1.SETFOCUS;
        end;

        With q do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select codpro,propietario from inmuebles where propietario=:propietario');
          ParamByName('propietario').AsString:=Trim(Edit4.Text);
          Open;
          Edit4.Text := Fields[1].AsString;
        end;

        With q do
        begin
          Close;
          Sql.Clear;
          Sql.Add('select * from inmuebles where propietario=:propietario ORDER BY CODINQ');
          ParamByName('propietario').AsString:=Trim(Edit4.Text);
          Open;
    //      Edit4.Text := Fields[1].AsString;
          gLista.Clear;
          gLista.Cells[0, 0] := 'Seleccionar';
          gLista.Cells[1, 0] := 'Código';
          gLista.Cells[2, 0] := 'Inmueble';
          I := 1;
          While not eof do
          begin
            gLista.RowCount := gLista.RowCount + 1;
            gLista.AddCheckBox(0,I,false,false);
            gLista.Cells[1,I] := FieldByName('Codinq').AsString;
            gLista.Cells[2,I] := Fields[8].AsString;
            gLista.Readonly[1,I] := True;
            gLista.Readonly[2,I] := True;
            Inc(I);
            Next;
          end;
          if I < 2 then
            gLista.RowCount := 2
          else
            gLista.RowCount := I;
        end;
      end
      else
      begin
        Close;
        Sql.clear;
        Sql.Add('select * from inmuebles where Ubicacion = :Ubicacion');
        ParamByName('Ubicacion').AsString := Codigo;
        Open;
        if not IsEmpty then
        begin
          Edit1.Text := Fields[0].AsString;
          Edit2.Text := Fields[1].AsString;
          Edit3.Text := Fields[3].AsString;
          Edit4.Text := Fields[4].AsString;
          Edit5.Text := Fields[8].AsString;
          Edit9.Text := Fields[14].AsString;
          Edit2.ItemIndex := q.FieldByName('RazonSocial').AsInteger;
        end
        else
        begin
          Edit2.Text := '';
          Edit3.Text := '';
          Edit4.Text := '';
          Edit5.Text := '';
          Showmessage('Inmueble correspondiente al inquilino '+Codigo+' No cargado');
        end;
      end;
      Edit7.setfocus;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qColor);
  end;
end;

procedure TFFacturaB.Edit10KeyPress
  (Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    BitBtn5.SetFocus;
end;

procedure TFFacturaB.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin

      gLista.Clear;
      with q do
      begin
        Close;
        Sql.Clear;
        Sql.Add('Select * from inmuebles where propietario= :PROPIETARIO');
        ParamByName('PROPIETARIO').AsString := Trim(Edit4.Text);
        Open;
        Edit1.Text := Fields[0].AsString;
        edit2.Text := Fields[1].AsString;
        Edit4.Text := Fields[4].AsString;
        edit5.Text := Fields[8].AsString;
        Close;
        Sql.Clear;
        Sql.Add('Select * from automatizacion where propietario=:PROPIETARIO');
        ParamByName('PROPIETARIO').AsString := Trim(Edit4.Text);
        Open;
        if not IsEmpty then
        begin
          Close;
          Sql.Clear;
          Sql.Add('Select * from inmuebles where propietario=:PROPIETARIO');
          ParamByName('PROPIETARIO').AsString := Trim(Edit4.Text);
          Open;

          edit2.Properties.Items.Clear;
          gLista.Clear;
          gLista.Cells[0, 0] := 'Seleccionar';
          gLista.Cells[1, 0] := 'Código';
          gLista.Cells[2, 0] := 'Inmueble';
          I := 1;
          While not eof do
          begin
            edit2.Properties.Items.Add(Fields[1].AsString);
            gLista.RowCount := gLista.RowCount + 1;
            gLista.AddCheckBox(0,I,false,false);
            gLista.Cells[1,I] := FieldByName('Codinq').AsString;
            gLista.Cells[2,I] := Fields[8].AsString;
            gLista.Readonly[1,I] := True;
            gLista.Readonly[2,I] := True;
            Inc(I);
            Next;
          end;
          if I < 2 then
            gLista.RowCount := 2
          else
            gLista.RowCount := I;

        end;
      end;
      Edit7.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFFacturaB.BitBtn1Click(Sender: TObject);
begin
  gDetalle.Vaciar;
  actCalcularComisiones.Execute;
end;

procedure TFFacturaB.BitBtn5Click(Sender: TObject);
var
  I: Integer;

begin
  gDetalle.Vaciar;
  for I := 1 to gLista.RowCount - 1 do
    gLista.SetCheckboxState(0, I, True);
  actCalcularComisiones.Execute;
end;

procedure TFFacturaB.btnGrabarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  Valor: Double;
  stUbicacion: string;
begin
  q := CrearQuery;
  try
    I := 1;
    LiqProrig.Close;
    LiqPrOrig.Open;

    while not LiqPrOrig.eof do
    begin
      gImpresion.Cells[0, I] := LiqPrOrig.Fieldbyname('Codinq').AsString;
      gImpresion.Cells[1, I] := LiqPrOrig.Fieldbyname('Inquilino').AsString;
      gImpresion.Cells[2, I] := LiqPrOrig.Fieldbyname('Fecha').AsString;
      gImpresion.Cells[3, I] := LiqPrOrig.Fieldbyname('Direccion').AsString;
      gImpresion.Cells[4, I] := LiqPrOrig.Fieldbyname('Iva').AsString;
      gImpresion.Cells[5, I] := LiqPrOrig.Fieldbyname('Item').AsString;
      gImpresion.Cells[6, I] := LiqPrOrig.Fieldbyname('Periodo').AsString;
      gImpresion.Cells[7, I] := LiqPrOrig.Fieldbyname('Importe').AsString;
      gImpresion.Cells[8, I] := LiqPrOrig.Fieldbyname('Total').AsString;
      gImpresion.Cells[9, I] := LiqPrOrig.Fieldbyname('Letras').AsString;
      Valor := ToFloat(Copy(LiqPrOrig.Fieldbyname('Total').AsString,3,100));
      Valor := Valor - Valor /1.21;
      gImpresion.Cells[10, I] := '$ ' + FormatFloat('0.00', Valor);
      Valor := ToFloat(Copy(LiqPrOrig.Fieldbyname('Total').AsString,3,100));
      Valor := Valor /1.21;
      gImpresion.Cells[14, I] := '$ ' + FormatFloat('0.00', Valor);
      Inc(I);
      LiqPrOrig.Next;
    end;

    if I > 2 then
      gImpresion.RowCount := I
    else
      gImpresion.RowCount := 2;

    ImprimirReporte(Reporte, plReporte, gDetalle);
    ImprimirReporte(ReporteDuplicado, plReporte, gDetalle);

    stUbicacion := Edit5.Text;
    Edit5.Properties.OnChange := nil;

    if fConfirmacionFacturas = nil then
      Application.CreateForm(TfConfirmacionFacturas, fConfirmacionFacturas)
    else
      fConfirmacionFacturas.Show;

    fConfirmacionFacturas.EsLiquidacion := False;
    fConfirmacionFacturas.FormStyle := fsNormal;
    fConfirmacionFacturas.VIsible := False;
    fConfirmacionFacturas.FCodinq := Edit1.text;
    fConfirmacionFacturas.FGrilla := gDetalle;
    Edit5.Text := stUbicacion;

    fConfirmacionFacturas.ShowModal;
    Edit5.Properties.OnChange := Edit5PropertiesChange;

  finally
    FreeAndNil(q);
  end;
end;

procedure TFFacturaB.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFFacturaB.actRecibosExecute(Sender: TObject);
var
  Fecha: string;
  Importe: string;
  q: TFXQuery;
  Recibos: TFXQuery;

begin
  q := CrearQuery;
  Recibos := CrearQuery;
  try
    Fecha := Edit7.Text;
    Fecha := FechaAlReves(Fecha);
    with q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from liqprorig where usuario = :usuario');
      ParamByName('Usuario').AsString := fPrincipal.FUsuario;
      Open;
      Importe := Fieldbyname('Total').AsString;
    end;

    Delete(Importe, 1, 2);

  finally
    FreeAndNil(q);
    FreeAndNil(Recibos);
  end;
end;


procedure TFFacturaB.actCalcularComisionesExecute(Sender: TObject);
var
  Propietario: string;
  Inq: string;
  pro: string;
  fde: string;
  fha: string;
  Calle: string;
  Fecha: string;
  Num1: string;
  Letras: string;
  Suma: string;
  I, K: Integer;
  q: TFXQuery;
  qryConsulta: TFXQuery;
  Total: Double;
  MasItems: TClientDataset;
  dspMasItems: TDatasetProvider;
  Estado: Boolean;
begin
  q := CrearQuery;
  qryConsulta := CrearQuery;
  MasItems := TClientDataSet.Create(nil);
  dspMasItems := TDataSetProvider.Create(nil);

  q.sql.Text := 'Select * from masitems where 1=2';
  q.Open;
  dspMasItems.DataSet := q;
  masItems.Data := dspMasItems.Data;

  dm.IniciarTransaccion;
  try
    try
      Propietario := Edit4.Text;

      q.Sql.Text := 'Delete from masitems where usuario = :usuario';
      q.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
      q.ExecSQL;
      q.Sql.Text := 'Delete from LiqPrOrig where usuario = :usuario';
      q.ParamByName('Usuario').AsString := fPrincipal.FUsuario;
      q.ExecSQL;
      q.Sql.Text := 'Delete from MasItemsp where usuario = :usuario';
      q.ParamByName('Usuario').AsString := fPrincipal.fUsuario;
      q.ExecSQL;

      Inq := Edit1.Text;
      pro := Trim(Edit4.Text);
      fde := Edit6.Text;
      fha := Edit8.Text;
      fde := FechaAlReves(fde);
      fha := FechaAlReves(fha);

      with q do
      begin
        Close;
        Sql.Text :=
          ' select t.*, i.tributa '+
          '   from ITEMAUTOM t '+
          '  inner join inmuebles I on i.codinq = t.codinq '+
          '  where t.CODPRO = :CODPRO and '+
          '        t.FECHA >= :FECHAD and '+
          '        t.FECHA <= :FECHAH and '+
          '        ((t.CODITEM = 12) and (I.Tributa = 1)) '+
          '  order by CODINQ ';

        ParamByName('codpro').AsString := pro;
        ParamByName('fechad').AsString := fde;
        ParamByName('fechah').AsString := fha;
        Open;

        while not q.eof do
        begin
          InsertarMasItem(MasItems, q.Fieldbyname('Codinq').AsString, q.Fieldbyname('Fecha')
              .AsString, q.Fieldbyname('Item').AsString, q.Fieldbyname('Periodo')
              .AsString, q.Fieldbyname('Importe').AsString, q.Fieldbyname
              ('CodPro').AsString, q.Fieldbyname('CodItem').AsString,
            q.Fieldbyname('TipoIngreso').AsInteger, q.RecNo, '', '', q.Fieldbyname('Registro').AsInteger);
          q.Next;
        end;
      end;

      Q.SQL.TEXT := 'sELECT * FROM MASITEMSP WHERE 1=2';
      q.Open;

      dspMasItemsp.DataSet := q;
      MasItemsP.Data := dspMasItemsp.Data;

      for I := 1 to gLista.RowCount - 1 do
      begin
        if gLista.GetCheckboxState(0, I, Estado) then
        begin
          if not Estado then
            Continue;

          Calle := gLista.Cells[2, I];
          with q do
          begin
            Close;
            Sql.Clear;
            Sql.Add('select distinct * from inmuebles i where i.ubicacion like :calleu');
            ParamByName('calleu').AsString := Trim(Calle);
            Open;
          end;

          MasItems.Close;
          MasItems.Open;

          while not MasItems.eof do
          begin
            if MasItems.FieldByName('Codinq').AsString = q.FieldbyName('Codinq').AsString then
              InsertarMasItemP(MasItemsP,'(' + MasItems.Fields[0].AsString + ')UBICACION: ',
                q.FieldbyName('Ubicacion').AsString, MasItems.Fields[4].AsString);

            MasItems.Next;
          end;

          MasItemsp.Close;
          MasItemsp.Open;

          Suma := '0.00';
          while NOT MasItemsp.eof do
          begin
            Num1 := FormatFloat('0.00', ToFloat(AnsiReplaceStr(MasItemsp.Fields[2].AsString,',','.' )));
            Suma := FormatFloat('0.00', ToFloat(Suma));
            Suma := FormatFloat('0.00', ToFloat(Suma) + ToFloat(num1));
            MasItemsp.Next;
          end;

          Fecha := DateToStr(Date());
          Fecha := TransformarFecha(Fecha);
          Fecha := 'Córdoba, ' + Fecha;
          for K := 1 to (130 - Length(Letras)) do
            Letras := Letras + '-';
        end;
      end;

      // ARMADO DE LA IMPRESION

      q.Close;
      q.Sql.Clear;
      q.Sql.Add('select domicilio from inmuebles where propietario=:propietario');
      q.ParamByName('propietario').AsString := Propietario;
      q.Open;

      Letras := Importeenletras(Suma);
      MasItemsP.Close;
      MasItemsp.Open;

      Q.SQL.TEXT := 'sELECT * FROM LIQPRORIG WHERE 1=2';
      q.Open;

      dspLiqPrOrig.DataSet := q;
      LiqPrOrig.Data := dspLiqPrOrig.Data;

      while not MasItemsp.eof do
      begin
        InsertarLiqPrOrig(LiqPrOrig, MasItemsp.Fields[0].AsString, Edit4.Text, Fecha,
          q.Fields[0].AsString, Edit10.Text, MasItemsp.Fields[0].AsString,
          MasItemsp.Fields[1].AsString, '$ ' + MasItemsp.Fields[2].AsString,
          '$ ' + Suma, Uppercase(Letras),1,1);
        MasItemsp.Next;
        q.Next;
      end;

      LiqPrOrig.Close;
      LiqPrOrig.Open;

      while not LiqPrOrig.Eof do
      begin
        LiqPrOrig.Edit;
        LiqPrOrig.FieldByName('Letras').AsString := Uppercase(Letras);
        LiqPrOrig.Post;
        LiqPrOrig.Next;
      end;

      MasItemsp.Close;
      MasItemsP.Open;

      I := 1;
      while not MasItemsp.Eof do
      begin
        gDetalle.Cells[0, I] := MasItemsp.Fieldbyname('Codinq').AsString;
        gDetalle.Cells[1, I] := MasItemsp.Fieldbyname('Ubicacion').AsString;
        gDetalle.Cells[2, I] := FormatFloat('0.00', ToFloat(AnsiReplaceStr(MasItemsp.Fieldbyname('Importe').AsString,',','.')));
        Inc(I);
        MasItemsP.Next;
      end;

      if I > 2 then
        gDetalle.RowCount := I
      else
        gDetalle.RowCount := 2;

      Total := 0;
      for I := 1 to gDetalle.RowCount - 1 do
        Total := Total + ToFloat(gDetalle.Cells[2, I]);

      Edit12.Text := FormatFloat('0.00', Total);
      DM.ConfirmarTransaccion;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qryConsulta);
  end;
end;

end.

