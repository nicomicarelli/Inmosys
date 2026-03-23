unit frmABMInmuebles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, ppModule, raCodMod, ppDesignLayer, FXQuery,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox;

type
  TfAbmInmuebles = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField1: TppField;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    TituloppField2: TppField;
    TituloppField3: TppField;
    Reporte: TppReport;
    ppParameterList1: TppParameterList;
    gDetalle: TStringAlignGrid;
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    plReporteppField5: TppField;
    ppTotales: TppField;
    TituloppField5: TppField;
    TituloppField6: TppField;
    TituloppField7: TppField;
    TituloppField8: TppField;
    TituloppField9: TppField;
    TituloppField10: TppField;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
    ppLabel8: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppVariable1: TppVariable;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    ppDBText7: TppDBText;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppLabel15: TppLabel;
    ppDBText9: TppDBText;
    ppLabel16: TppLabel;
    ppDBText14: TppDBText;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppLabel18: TppLabel;
    ppDBText16: TppDBText;
    ppLabel19: TppLabel;
    ppDBText17: TppDBText;
    ppLabel20: TppLabel;
    plReporteppField6: TppField;
    plReporteppField7: TppField;
    plReporteppField8: TppField;
    plReporteppField9: TppField;
    ReporteExcel: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel21: TppLabel;
    ppRegion1: TppRegion;
    ppLabel25: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLine4: TppLine;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine5: TppLine;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel39: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppDBText32: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    plReporteppField10: TppField;
    plReporteppField11: TppField;
    cxGroupBox1: TcxGroupBox;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    btnModificar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    al10: TLabel;
    al15: TLabel;
    al20: TLabel;
    al25: TLabel;
    al30: TLabel;
    Totales: TLabel;
    Desocupadas: TLabel;
    Label14: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    cbFechaPago: TComboBox;
    cbLiquida: TComboBox;
    TodosFPago: TCheckBox;
    TodosLiquida: TCheckBox;
    edtFecha: TEdit;
    TodosVtos: TCheckBox;
    cboRazonSocial: TComboBox;
    chTodosRazonsocial: TCheckBox;
    Actualizar: TAdvGlowButton;
    chPrelegales: TCheckBox;
    chDiferencias: TCheckBox;
    chDesocupados: TCheckBox;
    chLegales: TCheckBox;
    Label15: TLabel;
    Prelegales: TLabel;
    Label17: TLabel;
    Legales: TLabel;
    chJuicio: TCheckBox;
    chJuicioPVE: TCheckBox;
    Label16: TLabel;
    Juicio: TLabel;
    ReporteCatastro: TppReport;
    ppParameterList3: TppParameterList;
    PopupMenu1: TPopupMenu;
    ImprimirenExcel1: TMenuItem;
    Imprimiridentificacincatastral1: TMenuItem;
    plReporteppField12: TppField;
    plReporteppField13: TppField;
    plReporteppField14: TppField;
    ppTitleBand3: TppTitleBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppRegion2: TppRegion;
    ppLabel27: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel28: TppLabel;
    ppDBText20: TppDBText;
    ppLabel29: TppLabel;
    ppDBText21: TppDBText;
    ppLabel30: TppLabel;
    ppDBText22: TppDBText;
    ppLabel31: TppLabel;
    ppVariable2: TppVariable;
    ppDBText23: TppDBText;
    ppLabel32: TppLabel;
    ppDBText24: TppDBText;
    ppLabel33: TppLabel;
    ppDBText25: TppDBText;
    ppLabel34: TppLabel;
    ppDBText26: TppDBText;
    ppLabel35: TppLabel;
    ppDBText27: TppDBText;
    ppLabel45: TppLabel;
    ppDBText28: TppDBText;
    ppLabel46: TppLabel;
    ppHeaderBand3: TppHeaderBand;
    ppLine7: TppLine;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine8: TppLine;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine9: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    raCodeModule3: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppPageStyle1: TppPageStyle;
    ppDesignLayer4: TppDesignLayer;
    Observaciones: TppField;
    ppLabel53: TppLabel;
    ppDBText43: TppDBText;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaChange(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure TodosFPagoClick(Sender: TObject);
    procedure cbFechaPagoClick(Sender: TObject);
    procedure TodosLiquidaClick(Sender: TObject);
    procedure cbLiquidaChange(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure btnNuevoClick(Sender: TObject);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure VerContratoEscalonado1Click(Sender: TObject);
    procedure edtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure TodosVtosClick(Sender: TObject);
    procedure edtFechaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chTodosRazonsocialClick(Sender: TObject);
    procedure cboRazonSocialChange(Sender: TObject);
    procedure ImprimirenExcel1Click(Sender: TObject);
    procedure Imprimiridentificacincatastral1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbmInmuebles: TfAbmInmuebles;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos;

{$R *.dfm}

procedure TfAbmInmuebles.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  stNexo: string;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from Inmuebles where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and Codinq >=:desde and Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    if not TodosFPago.Checked then
    begin
      q.SQL.Add(' and FechaPago = :FechaPago ');
      q.ParamByName('FechaPago').AsString := cbFechaPago.Text;
    end;

    if not TodosVtos.Checked then
    begin
      q.SQL.Add(' and Fechafin = :Fechafin ');
      q.ParamByName('Fechafin').AsDate := Strtodate(edtfecha.Text);
    end;

    if chPrelegales.Checked or chlegales.Checked or chJuicio.Checked or chJuicioPVE.Checked then
    begin
      q.SQL.Add(' and (');
      stNexo := '';

      if chPrelegales.Checked then
      begin
        q.SQL.Add(' Prelegales = 1 ');
        stNexo := 'or';
      end;

      if chlegales.Checked then
      begin
        q.SQL.Add(stNexo + ' Legales = 1 ');
        stNexo := 'or';
      end;

      if chJuicio.Checked then
      begin
        q.SQL.Add(stNexo +' JuicioDesalojo = 1 ');
        stNexo := 'or';
      end;

      if chJuicioPVE.Checked then
      begin
        q.SQL.Add(stNexo +' JuicioPVE = 1 ');
        stNexo := 'or';
      end;
      q.SQL.Add(' )');
    end;

    if chDesocupados.Checked then
      q.SQL.Add(' and Desocupado = 1 ');

    if chDiferencias.Checked then
      q.SQL.Add(' and DevuelveDiferencias = 0 ');

    if not TodosLiquida.Checked then
    begin
      q.SQL.Add(' and Liquidacion = :Liquida ');
      if cbLiquida.Text = 'Si' then
        q.ParamByName('Liquida').AsString := 'S';
      if cbLiquida.Text = 'No' then
        q.ParamByName('Liquida').AsString := 'N';
      if cbLiquida.Text = 'Impuestos' then
        q.ParamByName('Liquida').AsString := 'I';
    end;

    if not chTodosRazonSocial.Checked then
    begin
      q.SQL.Add(' and RazonSocial = :RazonSocial ');
      q.ParamByName('RazonSocial').AsInteger := cboRazonSocial.ItemIndex;
    end;

    q.SQL.Add(' order by Propietario, Codinq ');
    q.Open;
    gDetalle.Vaciar;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[2,I] := FormatDatetime('dd/mm/yyyy',q.FieldByName('FechaFin').AsDatetime);
      gDetalle.Cells[3,I] := FormatFloat('0.00', q.FieldByName('Alquiler').AsFloat);
      gDetalle.Cells[4,I] := q.FieldByName('FechaPago').AsString;
      if q.FieldByName('Liquidacion').AsString = 'S' then
        gDetalle.Cells[5,I] := 'Si';
      if q.FieldByName('Liquidacion').AsString = 'N' then
        gDetalle.Cells[5,I] := 'No';
      if q.FieldByName('Liquidacion').AsString = 'I' then
        gDetalle.Cells[5,I] := 'Impuestos';
      gDetalle.Cells[6,I] := q.FieldByName('Telefono').AsString;
      gDetalle.Cells[7,I] := q.FieldByName('Propietario').AsString;
      gDetalle.Cells[8,I] := FormatDatetime('dd/mm/yyyy',q.FieldByName('FechaInicio').AsDatetime);
      gDetalle.Cells[9,I] := q.FieldByName('DNIPropietario').AsString;
      gDetalle.Cells[10,I] := q.FieldByName('Ubicacion').AsString;
      gDetalle.Cells[11,I] := q.FieldByName('Nomenclaturacatastral').AsString;
      gDetalle.Cells[12,I] := q.FieldByName('Unidadfuncional').AsString;
      gDetalle.Cells[13,I] := q.FieldByName('NumeroCuenta').AsString;
      gDetalle.Cells[14,I] := q.FieldByName('Observaciones').AsString;

      Inc(I);

      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    q.SQL.Text :=' select count(*) as total, '+
                 ' (select count(*) from inmuebles I where (i.desocupado = 1 or i.inquilino = :d1) or (I.INQUILINO=:d2) or (I.INQUILINO=:D3)) AS DESOCUPADAS, '+
                 ' (select count(*) from inmuebles I where (i.fechapago LIKE :D10)) AS al10, '+
                 ' (select count(*) from inmuebles I where (i.fechapago LIKE :D15)) AS al15, '+
                 ' (select count(*) from inmuebles I where (i.fechapago LIKE :D20)) AS al20, '+
                 ' (select count(*) from inmuebles I where (i.fechapago LIKE :D25)) AS al25, '+
                 ' (select count(*) from inmuebles I where (i.fechapago LIKE :D30)) AS al30,  '+
                 ' (select count(*) from inmuebles I where (i.Prelegales = 1)) AS PRELEGALES, '+
                 ' (select count(*) from inmuebles I where (i.Legales = 1)) AS LEGALES, '+
                 ' (select count(*) from inmuebles I where (i.JuicioDesalojo = 1) or (i.JuicioPVE = 1)) AS JUICIO '+
                 ' from inmuebles ';
    q.ParamByName('d1').AsString := 'DESOCUPADA';
    q.ParamByName('d2').AsString := 'DESOCUPADO';
    q.ParamByName('d3').AsString := '';
    q.ParamByName('d10').AsString := '% al 10';
    q.ParamByName('d15').AsString := '% al 15';
    q.ParamByName('d20').AsString := '% al 20';
    q.ParamByName('d25').AsString := '% al 25';
    q.ParamByName('d30').AsString := '% al 30';
    q.Open;

    al10.Caption := q.FieldByName('al10').AsString;
    al15.Caption := q.FieldByName('al15').AsString;
    al20.Caption := q.FieldByName('al20').AsString;
    al25.Caption := q.FieldByName('al25').AsString;
    al30.Caption := q.FieldByName('al30').AsString;
    Totales.caption := q.FieldByName('Total').AsString;
    desocupadas.caption := q.FieldByName('Desocupadas').AsString;
    Prelegales.caption := q.FieldByName('Prelegales').AsString;
    Legales.caption := q.FieldByName('Legales').AsString;
    Juicio.caption := q.FieldByName('Juicio').AsString;
  finally
    FreeAndNil(q);
  end;
end;

function TfAbmInmuebles.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Inmueble' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Inquilino' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end

  else if aFieldName = 'Filtro por Fecha de Pago' then
  begin
    if todosFPago.Checked then
      Result := 'Todos'
    else
      Result := cbFechaPago.Text;
  end
  else if aFieldName = 'Filtro por Liquida' then
  begin
    if todosLiquida.Checked then
      Result := 'Todos'
    else
      Result := cbLiquida.Text;
  end
  else if aFieldName = 'Totales' then
  begin
    Result := Totales.Caption;
  end
  else if aFieldName = 'Desocupadas' then
  begin
    Result := Desocupadas.Caption;
  end
  else if aFieldName = '1º al 10' then
  begin
    Result := al10.Caption;
  end
  else if aFieldName = '1º al 15' then
  begin
    Result := al15.Caption;
  end
  else if aFieldName = '1º al 20' then
  begin
    Result := al20.Caption;
  end
  else if aFieldName = '1º al 25' then
  begin
    Result := al25.Caption;
  end
  else if aFieldName = '1º al 30' then
  begin
    Result := al30.Caption;
  end;
end;

procedure TfAbmInmuebles.TodosFPagoClick(Sender: TObject);
begin
  if todosFPago.Checked then
    cbFechaPago.itemindex := -1;

  if Trim(cbFechaPago.Text) = ''  then
    todosFPago.Checked := True;
end;

procedure TfAbmInmuebles.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfAbmInmuebles.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmInmuebles.TodosLiquidaClick(Sender: TObject);
begin
  if todosLiquida.Checked then
    cbLiquida.itemindex := -1;

  if Trim(cbLiquida.Text) = ''  then
     todosLiquida.Checked := True;
end;

procedure TfAbmInmuebles.TodosVtosClick(Sender: TObject);
begin
  if todosVtos.Checked then
    edtFecha.Text:='';

  if Trim(edtFecha.Text) = ''  then
     todosVtos.Checked := True;
end;

procedure TfAbmInmuebles.VerContratoEscalonado1Click(Sender: TObject);
var
  Tecla: Char;
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FrmContratos = nil then
    Application.CreateForm(TFrmContratos, FrmContratos)
  else
    FrmContratos.Show;
  frmContratos.Edit1.Text := gDetalle.Cells[0,gDetalle.Row];
  Tecla := #13;
  frmContratos.Edit1.OnKeyPress(nil, Tecla);
end;

procedure TfAbmInmuebles.BitBtn1Click(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( ReporteExcel,  plReporte,  gDetalle ) ;

end;

procedure TfAbmInmuebles.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0,gDetalle.Row],toEliminar);
end;

procedure TfAbmInmuebles.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfAbmInmuebles.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfAbmInmuebles.btnNuevoClick(Sender: TObject);
begin
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar('',toNuevo);
end;

procedure TfAbmInmuebles.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmInmuebles.cbFechaPagoClick(Sender: TObject);
begin
  todosFPago.Checked := False;
end;

procedure TfAbmInmuebles.cbLiquidaChange(Sender: TObject);
begin
  TodosLiquida.Checked := False;
end;

procedure TfAbmInmuebles.cboRazonSocialChange(Sender: TObject);
begin
  chTodosRazonSocial.Checked := False;
end;

procedure TfAbmInmuebles.chTodosRazonsocialClick(Sender: TObject);
begin
  if chTodosRazonSocial.Checked then
  begin
    cboRazonSocial.ItemIndex := -1;
    Exit;
  end;

  if not chTodosRazonSocial.Checked then
  begin
    cboRazonSocial.ItemIndex := 0;
    Exit;
  end;
end;

procedure TfAbmInmuebles.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmInmuebles.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmInmuebles.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfAbmInmuebles.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmInmuebles.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmInmuebles.edtFechaChange(Sender: TObject);
begin
  if edtFecha.Text <> '' then
    todosVtos.Checked:=False
  else
    todosVtos.Checked:=True;
end;

procedure TfAbmInmuebles.edtFechaKeyPress(Sender: TObject; var Key: Char);
var
  Dia:   string;
  Fecha: string;

begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    Dia := edtFecha.Text;
    if Length(Dia) = 0 then
      Dia := '5';
    if Length(Dia) = 10 then
      Fecha := Dia;
    if length(Dia) <> 10 then
    begin
      Fecha := FormatDatetime('dd/mm/yyyy', Date());
      Delete(Fecha, 1, 2);
      if Dia = '5' then
        Fecha := '05' + Fecha;
      if Dia = '10' then
        Fecha := '10' + Fecha;
      if (Dia <> '5') and (Dia <> '10') then
        Fecha := TransformaFecha(Dia);
    end;
    edtFecha.Text := Fecha;
  end;
end;

procedure TfAbmInmuebles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMInmuebles := nil;
end;

procedure TfAbmInmuebles.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmInmuebles.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmInmuebles.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  gDetalle.SortColumn(Col, True,'S');
end;

procedure TfAbmInmuebles.ImprimirenExcel1Click(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( ReporteExcel,  plReporte,  gDetalle ) ;
end;

procedure TfAbmInmuebles.Imprimiridentificacincatastral1Click(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( ReporteCatastro,  plReporte,  gDetalle ) ;

end;

end.
