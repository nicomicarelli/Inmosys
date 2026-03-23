unit frmListadoLiquidados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, Spin, FXQuery, ppDesignLayer, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  AdvGlowButton, cxGroupBox;

type
  TfListadoLiquidados = class(TForm)
    plReporte: TppJITPipeline;
    plReporteppField2: TppField;
    plReporteppField3: TppField;
    plReporteppField4: TppField;
    Reporte: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppParameterList1: TppParameterList;
    ppLabel8: TppLabel;
    gDetalle: TStringAlignGrid;
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    plReporteppField5: TppField;
    VerDatosInmueblwe1: TMenuItem;
    Titulo: TppJITPipeline;
    TituloppField1: TppField;
    TituloppField4: TppField;
    TituloppField5: TppField;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    plReporteppField1: TppField;
    plReporteppField6: TppField;
    Reporte2: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppRegion1: TppRegion;
    ppLabel14: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppLabel19: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppParameterList2: TppParameterList;
    plReporte2: TppJITPipeline;
    ppField1: TppField;
    ppField6: TppField;
    plReporte2ppField1: TppField;
    plReporte2ppField2: TppField;
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    bitbtn1: TAdvGlowButton;
    gDetalle1: TStringAlignGrid;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    Actualizar: TAdvGlowButton;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edHastaChange(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnGrabarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FSoloNoLiquidados: Boolean;
  end;

var
  fListadoLiquidados: TfListadoLiquidados;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMContratos;

{$R *.dfm}

procedure TfListadoLiquidados.ActualizarClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I, J: Integer;
  Existe: Boolean;

begin
  q := CrearQuery;
  q1 := CrearQuery;
  GdETALLE.Vaciar;
  GdETALLE1.Vaciar;

  try
    q.SQL.Text := ' select distinct C.CODINQ, I.INQUILINO, i.PROPIETARIO '+
                  ' from CUERPORECIBOS C '+
                  ' inner join INMUEBLES I on I.CODINQ = C.CODINQ '+
                  ' where C.TIPO = :TIPO and         '+
                  '       (C.PERIODO like :PERIODO or C.PERIODO like :PERIODO2)';
    q.ParamByName('TIPO').AsString := 'LI';
    q.ParamByName('Periodo').AsString := '%' + Combobox1.Text+ '/'+ Inttostr(SpinEdit1.Value) + '%';
    q.ParamByName('Periodo2').AsString := '%' + FormatFloat('00', Combobox1.ItemIndex + 1) + '/'+ Inttostr(SpinEdit1.Value) + '%';

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and C.Codinq >=:desde and C.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q.SQL.Add(' order by I.PROPIETARIO, C.CODINQ ');
    q.Open;

    q1.SQL.Text := ' select distinct C.CODINQ, I.INQUILINO, I.Propietario '+
                   '  from CabezaRECIBOS CA  '+
                   '  Inner Join CUERPORECIBOS C on c.codinq = ca.codinq and ca.tipo = c.tipo and ca.letra = c.letra and ca.tipo = :Tipo '+
                   '  inner join INMUEBLES I on I.CODINQ = CA.CODINQ '+
                   '  where CA.TIPO = :TIPO '; //and '+
    q1.ParamByName('TIPO').AsString := 'LI';

    if not TodosCodigos.Checked then
    begin
      q1.SQL.Add(' and C.Codinq >=:desde and C.Codinq <=:Hasta ');
      q1.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q1.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q1.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q1.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    q1.SQL.Add(' order by C.Codinq ');
    q1.Open;

    gDetalle.Vaciar;
    I := 1;

    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Propietario').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[4,I] := SpinEdit1.text;
      if Pos('ENERO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'ENERO';
        gDetalle.Cells[6,I] := '1';
      end
      else if Pos('FEBRERO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'FEBRERO';
        gDetalle.Cells[6,I] := '2';
      end
      else if Pos('MARZO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'MARZO';
        gDetalle.Cells[6,I] := '3';
      end
      else if Pos('ABRIL', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'ABRIL';
        gDetalle.Cells[6,I] := '4';
      end
      else if Pos('MAYO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'MAYO';
        gDetalle.Cells[6,I] := '5';
      end
      else if Pos('JUNIO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'JUNIO';
        gDetalle.Cells[6,I] := '6';
      end
      else if Pos('JULIO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'JULIO';
        gDetalle.Cells[6,I] := '7';
      end
      else if Pos('AGOSTO', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'AGOSTO';
        gDetalle.Cells[6,I] := '8';
      end
      else if (Pos('SETIEMBRE', Combobox1.text) > 0) or (Pos('SEPTIEMBRE', Combobox1.text) > 0) then
      begin
        gDetalle.Cells[3,I] := 'SETIEMBRE';
        gDetalle.Cells[6,I] := '9';
      end
      else if Pos('OCTUBRE', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'OCTUBRE';
        gDetalle.Cells[6,I] := '10';
      end
      else if Pos('NOVIEMBRE', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'NOVIEMBRE';
        gDetalle.Cells[6,I] := '11';
      end
      else if Pos('DICIEMBRE', Combobox1.text) > 0 then
      begin
        gDetalle.Cells[3,I] := 'DICIEMBRE';
        gDetalle.Cells[6,I] := '12';
      end;


      Inc(I);

      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;

    I := 1;

    while not q1.Eof do
    begin
      Existe := False;
      for J := 1 to gDetalle.RowCount - 1 do
      begin
        if q1.FieldByName('Codinq').AsString = gDetalle.Cells[0, J]  then
        begin
          Existe := True;
          Break;
        end;
      end;

      if not Existe then
      begin
        gDetalle1.Cells[0,I] := q1.FieldByName('Codinq').AsString;
        gDetalle1.Cells[1,I] := q1.FieldByName('Propietario').AsString;
        gDetalle1.Cells[2,I] := q1.FieldByName('Inquilino').AsString;
        gDetalle1.Cells[3,I] := 'NO LIQUIDADO';

        Inc(I);
      end;

      q1.Next;
    end;

    if i>2 then
      gDetalle1.RowCount := I
    else
      gDetalle1.RowCount := 2;

  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

function TfListadoLiquidados.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por mes' then
  begin
      Result := combobox1.Text + '/' + spinedit1.Text;
  end
  else if aFieldName = 'Filtro por Inquilino' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end
end;

procedure TfListadoLiquidados.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfListadoLiquidados.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfListadoLiquidados.BitBtn1Click(Sender: TObject);
begin
    ImprimirReporte ( Reporte2,  plReporte2,  gDetalle1 ) ;
end;

procedure TfListadoLiquidados.btnGrabarClick(Sender: TObject);
begin
    ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfListadoLiquidados.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfListadoLiquidados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfListadoLiquidados.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfListadoLiquidados.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfListadoLiquidados.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfListadoLiquidados.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfListadoLiquidados.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfListadoLiquidados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fListadoLiquidados := nil;
end;

procedure TfListadoLiquidados.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  spinEdit1.Text := FormatDatetime('YYYY', Date);
  Combobox1.ItemIndex :=ToINt(FormatDatetime('MM',Date)) -1;
  FSoloNoLiquidados := False;
end;

procedure TfListadoLiquidados.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfListadoLiquidados.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 2 then
    gDetalle.SortColumn(5, True,'N')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

end.
