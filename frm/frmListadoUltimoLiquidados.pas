unit frmListadoUltimoLiquidados;

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
  AdvGlowButton, cxGroupBox, cxCheckBox, frmListadoCobrados;

type
  TfListadoUltimoLiquidados = class(TForm)
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
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    Actualizar: TAdvGlowButton;
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    gDetalle: TStringAlignGrid;
    chDesocupados: TCheckBox;
    Label4: TLabel;
    Edit2: TEdit;
    chTodos: TcxCheckBox;
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
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    FSoloNoLiquidados: Boolean;
    FTipo: String;
  end;

var
  fListadoUltimoLiquidados: TfListadoUltimoLiquidados;
  fListadoUltimoPagados: TfListadoUltimoLiquidados;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMContratos;

{$R *.dfm}

procedure TfListadoUltimoLiquidados.ActualizarClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I, J: Integer;
  Existe: Boolean;

begin
  q := CrearQuery;
  q1 := CrearQuery;
  GdETALLE.Vaciar;

  try
    q.SQL.Text :=
      ' SELECT CODINQ, INQUILINO, PROPIETARIO, MAX(FECHA) as fecha, MAX(FECHARECIBO) AS FECHARECIBO FROM ( '+
      '   SELECT CODINQ, INQUILINO, PROPIETARIO, ANIO||''|''||LPAD(MES,2,''0'') AS FECHA, FECHARECIBO FROM ( '+
      '   select distinct C.CODINQ, I.INQUILINO, i.PROPIETARIO, C.ITEM, C.PERIODO, C.IVA, '+
      ' CASE WHEN POSITION(''ENE'', C.PERIODO) > 0 THEN 01 '+
      '      WHEN POSITION(''FEB'', C.PERIODO) > 0 THEN 02 '+
      '      WHEN POSITION(''MAR'', C.PERIODO) > 0 THEN 03 '+
      '      WHEN POSITION(''ABR'', C.PERIODO) > 0 THEN 04 '+
      '      WHEN POSITION(''MAY'', C.PERIODO) > 0 THEN 05 '+
      '      WHEN POSITION(''JUN'', C.PERIODO) > 0 THEN 06 '+
      '      WHEN POSITION(''JUL'', C.PERIODO) > 0 THEN 07 '+
      '      WHEN (POSITION(''AGO'', C.PERIODO) > 0) AND (POSITION(''PAGO'', C.PERIODO) = 0) THEN 08 '+
      '      WHEN POSITION(''SEPT'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''SET'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''OCT'', C.PERIODO) > 0 THEN 10 '+
      '      WHEN POSITION(''NOV'', C.PERIODO) > 0 THEN 11 '+
      '      WHEN POSITION(''DIC'', C.PERIODO) > 0 THEN 12 '+
      '      WHEN POSITION(''1/'', C.PERIODO) > 0 THEN 01 '+
      '      WHEN POSITION(''2/'', C.PERIODO) > 0 THEN 02 '+
      '      WHEN POSITION(''3/'', C.PERIODO) > 0 THEN 03 '+
      '      WHEN POSITION(''4/'', C.PERIODO) > 0 THEN 04 '+
      '      WHEN POSITION(''5/'', C.PERIODO) > 0 THEN 05 '+
      '      WHEN POSITION(''6/'', C.PERIODO) > 0 THEN 06 '+
      '      WHEN POSITION(''7/'', C.PERIODO) > 0 THEN 07 '+
      '      WHEN POSITION(''8/'', C.PERIODO) > 0 THEN 08 '+
      '      WHEN POSITION(''9/'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''10/'', C.PERIODO) > 0 THEN 10 '+
      '      WHEN POSITION(''11/'', C.PERIODO) > 0 THEN 11 '+
      '      WHEN POSITION(''12/'', C.PERIODO) > 0 THEN 12 '+
      '      WHEN POSITION(''1RA'', C.PERIODO) > 0 THEN 01 '+
      '      WHEN POSITION(''2DA'', C.PERIODO) > 0 THEN 02 '+
      '      WHEN POSITION(''3RA'', C.PERIODO) > 0 THEN 03 '+
      '      WHEN POSITION(''4TA'', C.PERIODO) > 0 THEN 04 '+
      '      WHEN POSITION(''5TA'', C.PERIODO) > 0 THEN 05 '+
      '      WHEN POSITION(''6TA/'', C.PERIODO) > 0 THEN 06 '+
      '      WHEN POSITION(''7MA'', C.PERIODO) > 0 THEN 07 '+
      '      WHEN POSITION(''8VA'', C.PERIODO) > 0 THEN 08 '+
      '      WHEN POSITION(''9NA'', C.PERIODO) > 0 THEN 09 '+
      '      WHEN POSITION(''10MA'', C.PERIODO) > 0 THEN 10 '+
      '      WHEN POSITION(''11VA'', C.PERIODO) > 0 THEN 11 '+
      '      WHEN POSITION(''12VA'', C.PERIODO) > 0 THEN 12 '+
      '      ELSE 00 '+
      ' END AS MES, '+
      ' SUBSTRING(C.PERIODO FROM CHAR_LENGTH(C.PERIODO) - 3 FOR 4 )AS ANIO, CA.FECHA AS FECHARECIBO '+
      '  from CUERPORECIBOS C '+
      ' Inner join Cabezarecibos CA on CA.Tipo = C.Tipo and CA.Letra = C.Letra and C.Numero = Ca.Numero and C.Codinq = CA.COdinq '+
      ' inner join INMUEBLES I on I.CODINQ = C.CODINQ '+
      ' where C.TIPO = :Tipo '+
      '   AND C.codiTEM IN (''01'', ''08'', ''30'') '+
      '   AND POSITION(''20'' , C.PERIODO) = (CHAR_LENGTH(C.PERIODO) -3) '+
      '   and (C.PERIODO like ''CORRESPONDE %/%'' or C.PERIODO like ''%__/____%'') ';

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

    if not chDesocupados.Checked then
      q.SQL.Add(' and ((I.inquilino <> ''DESOCUPADO'')) ');

    q.SQL.Add(
      ' GROUP BY 1,2,3,4,5,6,7,9 '+
      '        order by C.CODINQ, ANIO DESC , MES DESC '+
')) AA ');
    if not chTodos.Checked then
    begin
      q.SQL.Add('WHERE NOT EXISTS (SELECT CA.CODINQ '+
                '    FROM CABEZARECIBOS CA '+
                '   WHERE AA.CODINQ = CA.CODINQ '+
                '     AND CA.FECHA >= :FECHA)');
      q.ParamByName('Fecha').AsDateTime := strToDate(edit2.Text);
    end;

    q.SQL.Add(' GROUP BY 1,2,3 ');

    q.ParambyName('Tipo').AsString := FTipo;
    q.Open;

    gDetalle.Vaciar;
    I := 1;

    while not q.Eof do
    begin
      gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Propietario').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[4,I] := Copy(q.FieldByName('Fecha').AsString,1,4);
      gDetalle.Cells[5,I] := q.FieldByName('Fecha').AsString;
      if Pos('|01', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'ENERO';
      end
      else if Pos('|02', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'FEBRERO';
        gDetalle.Cells[6,I] := '2';
      end
      else if Pos('|03', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'MARZO';
        gDetalle.Cells[6,I] := '3';
      end
      else if Pos('|04', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'ABRIL';
        gDetalle.Cells[6,I] := '4';
      end
      else if Pos('|05', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'MAYO';
        gDetalle.Cells[6,I] := '5';
      end
      else if Pos('|06', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'JUNIO';
        gDetalle.Cells[6,I] := '6';
      end
      else if Pos('|07', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'JULIO';
        gDetalle.Cells[6,I] := '7';
      end
      else if Pos('|08', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'AGOSTO';
        gDetalle.Cells[6,I] := '8';
      end
      else if Pos('|09', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'SETIEMBRE';
        gDetalle.Cells[6,I] := '9';
      end
      else if Pos('|10', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'OCTUBRE';
        gDetalle.Cells[6,I] := '10';
      end
      else if Pos('|11', q.FieldByName('Fecha').AsString) > 0 then
      begin
        gDetalle.Cells[3,I] := 'NOVIEMBRE';
        gDetalle.Cells[6,I] := '11';
      end
      else if Pos('|12', q.FieldByName('Fecha').AsString) > 0 then
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

  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

function TfListadoUltimoLiquidados.TituloGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Filtro por Codigo' then
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
end;

procedure TfListadoUltimoLiquidados.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfListadoUltimoLiquidados.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfListadoUltimoLiquidados.btnGrabarClick(Sender: TObject);
begin
  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfListadoUltimoLiquidados.btnImprimirClick(Sender: TObject);
begin
  if gDetalle.Cells[0,1] = '' then
    Exit;

  ImprimirReporte ( Reporte,  plReporte,  gDetalle ) ;
end;

procedure TfListadoUltimoLiquidados.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfListadoUltimoLiquidados.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfListadoUltimoLiquidados.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfListadoUltimoLiquidados.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfListadoUltimoLiquidados.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfListadoUltimoLiquidados.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfListadoUltimoLiquidados.Edit2Change(Sender: TObject);
begin
  if edit2.Text <> '' then
    chtodos.Checked:=False
  else
    chtodos.Checked:=True;
end;

procedure TfListadoUltimoLiquidados.Edit2KeyPress(Sender: TObject;
  var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit2.Text;
  if Key = #13 then
  begin
    if Length(Edit2.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit2.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit2.Text := Fecha;
    Actualizar.setfocus;
  end;
end;

procedure TfListadoUltimoLiquidados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  if Assigned(fListadoUltimoLiquidados) then
    fListadoUltimoLiquidados := nil;
  if Assigned(fListadoUltimoPagados) then
    fListadoUltimoPagados := nil;
end;

procedure TfListadoUltimoLiquidados.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  FSoloNoLiquidados := False;
  Edit2.Text := FormatDatetime('dd/mm/yyyy', Date);
end;

procedure TfListadoUltimoLiquidados.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;

  if FTipo = 'RE' then
  begin
    if fListadoCobrados = nil then
      Application.CreateForm(TfListadoCobrados, fListadoCobrados)
    else
      fListadoCobrados.Show;
    fListadoCobrados.edDesde.Text :=  Trim(gDetalle.Cells[0, gDetalle.row]);
    fListadoCobrados.edHasta.Text :=  Trim(gDetalle.Cells[0, gDetalle.row]);
    fListadoCobrados.edFechaDesde.Text :=  FormatDatetime('dd/mm/yyyy', Date-365);
    fListadoCobrados.edFechaHasta.Text :=  FormatDatetime('dd/mm/yyyy', Date);
    fListadoCobrados.ActualizarClick(nil);
  end;
end;

procedure TfListadoUltimoLiquidados.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col in [3,4] then
    gDetalle.SortColumn(5, True,'S')
  else
    gDetalle.SortColumn(Col, True,'S');
end;

end.
