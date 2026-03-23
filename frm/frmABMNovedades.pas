unit frmABMNovedades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  frmContratosEscalonados, Menus, ppModule, raCodMod, AdvObj, BaseGrid, AdvGrid,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, ppMemo, StrUtils, FXQuery,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, ppDesignLayer, AdvGlowButton, cxGroupBox;

type
  TfAbmNovedades = class(TForm)
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
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText17: TppDBText;
    ppLabel20: TppLabel;
    plReporteppField6: TppField;
    gDetalle: TAdvStringGrid;
    plReporteppField7: TppField;
    plReporteppField8: TppField;
    plReporteppField9: TppField;
    plReporteppField10: TppField;
    ppLabel21: TppLabel;
    ppDBText18: TppDBText;
    gImpresion: TStringAlignGrid;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
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
    edDesde: TEdit;
    edDescripcion: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    TodosDescripcion: TCheckBox;
    chPendientesRespuesta: TCheckBox;
    edFecha: TcxMaskEdit;
    edFechaHasta: TcxMaskEdit;
    chTodasFechas: TCheckBox;
    edFechaCobroDesde: TcxMaskEdit;
    edFechaCobroHasta: TcxMaskEdit;
    chTodasFechasCobro: TCheckBox;
    chRespondidos: TCheckBox;
    chVerLeidos: TCheckBox;
    chVerNoLeidos: TCheckBox;
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
    procedure btnNuevoClick(Sender: TObject);
    procedure gDetalleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure VerContratoEscalonado1Click(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure edFechaHastaExit(Sender: TObject);
    procedure edFechaCobroDesdeExit(Sender: TObject);
    procedure edFechaCobroHastaExit(Sender: TObject);
    procedure chTodasFechasClick(Sender: TObject);
    procedure edFechaPropertiesChange(Sender: TObject);
    procedure edFechaHastaPropertiesChange(Sender: TObject);
    procedure edFechaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure chPendientesRespuestaClick(Sender: TObject);
    procedure chRespondidosClick(Sender: TObject);
    procedure chVerLeidosClick(Sender: TObject);
    procedure chVerNoLeidosClick(Sender: TObject);
    procedure edFechaKeyPress(Sender: TObject; var Key: Char);
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure edFechaCobroDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edFechaCobroHastaKeyPress(Sender: TObject; var Key: Char);
    procedure gDetalleFixedCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbmNovedades: TfAbmNovedades;

implementation

uses frmInmuebles, frmPrincipal, frmDatosFijos, frmABMInmuebles,
  frmCargaNovedades;

{$R *.dfm}

procedure TfAbmNovedades.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  Titulos: string;
begin
  q := CrearQuery;
  try
    q.SQL.Text := 'Select N.*, I.Inquilino, I.Propietario from Novedades N Inner Join Inmuebles I on I.Codinq = N.Codinq where 1=1';
    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' and N.Codinq >=:desde and N.Codinq <=:Hasta ');
      q.ParamByName('Desde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
      q.ParamByName('Hasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
    end;

    if not TodosDescripcion.Checked then
    begin
      q.SQL.Add(' and Upper(I.Inquilino) like :descripcion ');
      q.ParamByName('Descripcion').AsString := edDescripcion.Text  + '%';
    end;

    if not chTodasFechas.Checked then
    begin
      q.SQL.Add(' and ((N.Fecha >= :FechaDesde) and (N.Fecha <= :FechaHasta)) ');
      q.ParamByName('FechaDesde').AsDateTime := StrToDate(edFecha.Text);
      q.ParamByName('FechaHasta').AsDateTime := StrToDate(edFechaHasta.Text);
    end;

    if not chTodasFechasCobro.Checked then
    begin
      q.SQL.Add(' and ((N.FechaRelacion >= :FechaDesdeCobro) and (N.FechaRelacion <= :FechaHastaCobro)) ');
      q.ParamByName('FechaDesdeCobro').AsDateTime := StrToDate(edFechaCobroDesde.Text);
      q.ParamByName('FechaHastaCobro').AsDateTime := StrToDate(edFechaCobroHasta.Text);
    end;

    if not((chPendientesRespuesta.Checked) and (chRespondidos.Checked)) then
    begin
      if chPendientesRespuesta.Checked then
      begin
        q.SQL.Add(' and Trim(N.Respuesta) = :Respuesta ');
        q.ParambyName('Respuesta').AsString := '';
      end;

      if chRespondidos.Checked then
      begin
        q.SQL.Add(' and Trim(N.Respuesta) <> :Respuesta ');
        q.ParambyName('Respuesta').AsString := '';
      end;
    end;

    if not((chVerLeidos.Checked) and (chVerNoLeidos.Checked)) then
    begin
      if chVerLeidos.Checked then
      begin
        q.SQL.Add(' and Trim(N.Leida) = :Leida ');
        q.ParambyName('Leida').AsInteger := 1;
      end;

      if chVerNoLeidos.Checked then
      begin
        q.SQL.Add(' and Trim(N.Leida) = :Leida ');
        q.ParambyName('Leida').AsInteger := 0;
      end;
    end;
    q.SQL.Add(' order by I.Propietario, I.Codinq ');
    q.Open;

    Titulos := gDetalle.Rows[0].Text;
    gDetalle.Clear;
    gDetalle.Rows[0].Text := Titulos;
    I := 1;
    while not q.Eof do
    begin
      gDetalle.Alignments[0,I] := taLeftJustify;
      gDetalle.Alignments[1,I] := taLeftJustify;
      gDetalle.Alignments[2,I] := taLeftJustify;
      gDetalle.Alignments[3,I] := taLeftJustify;
      gDetalle.Alignments[4,I] := taLeftJustify;
      gDetalle.Alignments[5,I] := taLeftJustify;
      gDetalle.Alignments[6,I] := taLeftJustify;
      gDetalle.Alignments[7,I] := taLeftJustify;
      gDetalle.Alignments[8,I] := taLeftJustify;
      gDetalle.Alignments[9,I] := taLeftJustify;
      gDetalle.Cells[0,I] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[1,I] := q.FieldByName('Inquilino').AsString;
      gDetalle.Cells[2,I] := q.FieldByName('IDNovedad').AsString;
      gDetalle.Cells[3,I] := FormatDatetime('dd/mm/yyyy',q.FieldByName('Fecha').AsDatetime);
      gDetalle.Cells[4,I] := FormatDatetime('dd/mm/yyyy',q.FieldByName('FechaRelacion').AsDatetime);
      gDetalle.Cells[5,I] := q.FieldByName('Mensaje').AsString;
      gDetalle.Cells[6,I] := q.FieldByName('Respuesta').AsString;
      gDetalle.Cells[7,I] := q.FieldByName('Propietario').AsString;
      gDetalle.Cells[8,I] := q.FieldByName('UsuarioCarga').AsString;
      gDetalle.Cells[9,I] := q.FieldByName('UsuarioRespuesta').AsString;
      Inc(I);
      q.Next;
    end;
    if i>2 then
      gDetalle.RowCount := I
    else
      gDetalle.RowCount := 2;
    gDetalle.Sort(0);
  finally
    FreeAndNil(q);
  end;
end;

function TfAbmNovedades.TituloGetFieldValue(aFieldName: string): Variant;
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
end;

procedure TfAbmNovedades.TodosCodigosClick(Sender: TObject);
begin
  if chTodasFechasCobro.Checked then
  begin
    edFechaCobroDesde.Text:='';
    edFechaCobroHasta.Text:='';
  end;

  if edFechaCobroDesde.Text = '  /  /    '  then
    chTodasFechasCobro.Checked := True;
end;

procedure TfAbmNovedades.TodosDescripcionClick(Sender: TObject);
begin
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
end;

procedure TfAbmNovedades.VerContratoEscalonado1Click(Sender: TObject);
begin
  if gDetalle.Cells[2,gDetalle.Row] = '' then
    Exit;

  if FCargaNovedades = nil then
    Application.CreateForm(TFCargaNovedades, FCargaNovedades)
  else
    FCargaNovedades.Show;

  FCargaNovedades.Cargar(gDetalle.Cells[2,gDetalle.Row],toModificar);
  FCargaNovedades.FOperacion := toNuevo;
end;

procedure TfAbmNovedades.btnEliminarClick(Sender: TObject);
begin
  if gDetalle.Cells[2,gDetalle.Row] = '' then
    Exit;

  if FCargaNovedades = nil then
    Application.CreateForm(TFCargaNovedades, FCargaNovedades)
  else
    FCargaNovedades.Show;

  FCargaNovedades.Cargar(gDetalle.Cells[2,gDetalle.Row],toEliminar);

end;

procedure TfAbmNovedades.btnImprimirClick(Sender: TObject);
var
  I: Integer;
  //gImpresion: TStringAlignGrid;
begin
 // gImpresion := TStringAlignGrid.Create(nil);
  try
    gImpresion.ColCount := gDetalle.ColCount;
    if gDetalle.Cells[0,1] = '' then
      Exit;

    for I := 0 to gDetalle.ColCount - 1 do
      gImpresion.Cells[I,0] := gDetalle.Cells[I,0];

    for I := 1 to gDetalle.RowCount - 1 do
    begin
      gImpresion.Rows[I] := gDetalle.Rows[I];
      gImpresion.RowCount := I+1;
    end;

    ImprimirReporte (Reporte, plReporte, gImpresion);
  finally
   // FreeAndNil(gImpresion);
  end;
end;

procedure TfAbmNovedades.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[2,gDetalle.Row] = '' then
    Exit;

  if FCargaNovedades = nil then
    Application.CreateForm(TFCargaNovedades, FCargaNovedades)
  else
    FCargaNovedades.Show;

  FCargaNovedades.Cargar(gDetalle.Cells[2,gDetalle.Row],toModificar);
end;

procedure TfAbmNovedades.btnNuevoClick(Sender: TObject);
begin
  if FCargaNovedades = nil then
    Application.CreateForm(TFCargaNovedades, FCargaNovedades)
  else
    FCargaNovedades.Show;

  FCargaNovedades.Cargar('',toNuevo);
end;

procedure TfAbmNovedades.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfAbmNovedades.chPendientesRespuestaClick(Sender: TObject);
begin
  if not chPendientesRespuesta.Checked then
  begin
    chRespondidos.Checked := True;
    Exit;
  end;

end;

procedure TfAbmNovedades.chRespondidosClick(Sender: TObject);
begin
  if not chRespondidos.Checked then
  begin
    chPendientesRespuesta.Checked := True;
    Exit;
  end;
end;

procedure TfAbmNovedades.chTodasFechasClick(Sender: TObject);
begin
  if chTodasFechas.Checked then
  begin
    edFecha.Text:='';
    edFechaHasta.Text:='';
  end;

  if edFecha.Text = '  /  /    '  then
    chTodasFechas.Checked := True;
end;

procedure TfAbmNovedades.chVerLeidosClick(Sender: TObject);
begin
  if not chVerLeidos.Checked then
  begin
    chVerNoLeidos.Checked := True;
    Exit;
  end;
end;

procedure TfAbmNovedades.chVerNoLeidosClick(Sender: TObject);
begin
  if not chVerNoLeidos.Checked then
  begin
    chVerLeidos.Checked := True;
    Exit;
  end;
end;

procedure TfAbmNovedades.edFechaCobroHastaExit(Sender: TObject);
begin
  if edFechaCobroHasta.Text <> '  /  /    '  then
  begin
    try
      StrToDate(edFechaCobroHasta.Text);
    Except
      edFechaCobroHasta.Text := FormatDateTime('dd/mm/yyyy', Date);
    end;

    edFechaCobroHasta.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edFechaCobroHasta.Text));
  end;
  chTodasFechas.Checked := edFechaCobroHasta.Text = '  /  /    ';
end;

procedure TfAbmNovedades.edFechaCobroHastaKeyPress(Sender: TObject;
  var Key: Char);
var
  Fecha: String;
begin
  if Key = #13 then
  begin
    Fecha := edFechaCobroHasta.Text;
    if Length(Trim(Fecha)) = 8 then
    begin
      Fecha      := TransformaFecha(Trim(AnsiReplaceStr(Fecha, '/','')));
      edFechaCobroHasta.Text := Fecha;
    end;
    Actualizar.SetFocus;
  end;
end;

procedure TfAbmNovedades.edFechaHastaExit(Sender: TObject);
begin
  if edFechaHasta.Text <> '  /  /    '  then
  begin
    try
      StrToDate(edFechaHasta.Text);
    Except
      edFechaHasta.Text := FormatDateTime('dd/mm/yyyy', Date);
    end;

    edFechaHasta.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edFechaHasta.Text));
  end;
  chTodasFechas.Checked := edFechaHasta.Text = '  /  /    ';
end;

procedure TfAbmNovedades.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
var
  Fecha: String;
begin
  if Key = #13 then
  begin
    Fecha := edFechaHasta.Text;
    if Length(Trim(Fecha)) = 8 then
    begin
      Fecha      := TransformaFecha(Trim(AnsiReplaceStr(Fecha, '/','')));
      edFechaHasta.Text := Fecha;
    end;
    edFechaCobroDesde.SetFocus;
  end;
end;

procedure TfAbmNovedades.edFechaHastaPropertiesChange(Sender: TObject);
begin
(*  if edFechaHasta.Text <> '' then
    chtodasFechas.Checked:=False
  else
    chTodasFechas.Checked:=True; *)
end;

procedure TfAbmNovedades.edFechaKeyPress(Sender: TObject; var Key: Char);
var
  Fecha: String;
begin
  if Key = #13 then
  begin
    Fecha := edFecha.Text;
    if (Fecha = '  /  /    ') or (Fecha = '05/  /    ') or (Fecha = '15/  /    ') then
    begin
(*      Fecha := DateToStr(Date());
      Delete(Fecha, 3, 8);
      if Fecha = '31' then
        Fecha := DateToStr(Date() - 31)
      else
        Fecha := DateToStr(Date() - 30);
      Delete(Fecha, 1, 2);
      if Fecha = '15' then
        Fecha      := '15' + Fecha
      else if Fecha = '05' then
        Fecha      := '05' + Fecha;

      edFecha.Text := Fecha; *)
    end;
    if Length(Trim(Fecha)) = 8 then
    begin
      Fecha      := TransformaFecha(Trim(AnsiReplaceStr(Fecha, '/','')));
      edFecha.Text := Fecha;
    end;
    edFechaHasta.SetFocus;
  end;
end;

procedure TfAbmNovedades.edFechaPropertiesChange(Sender: TObject);
begin
  if edFecha.Text <> '' then
    chTodasFechas.Checked:=False
  else
    chTodasFechas.Checked:=True;
end;

procedure TfAbmNovedades.edFechaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TfAbmNovedades.edDescripcionChange(Sender: TObject);
begin
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
end;

procedure TfAbmNovedades.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;


procedure TfAbmNovedades.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edHasta.Text := edDesde.text;
end;


procedure TfAbmNovedades.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfAbmNovedades.edFechaCobroDesdeExit(Sender: TObject);
begin
  if edFechaCobroDesde.Text <> '  /  /    '  then
  begin
    try
      StrToDate(edFechaCobroDesde.Text);
    Except
      edFechaCobroDesde.Text := FormatDateTime('dd/mm/yyyy', Date);
    end;

    edFechaCobroDesde.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edFechaCobroDesde.Text));
    edFechaCobroHasta.Text := edFechaCobroDesde.Text;
  end;
  chTodasFechasCobro.Checked := edFechaCobroDesde.Text = '  /  /    ';
end;

procedure TfAbmNovedades.edFechaCobroDesdeKeyPress(Sender: TObject;
  var Key: Char);
var
  Fecha: String;
begin
  if Key = #13 then
  begin
    Fecha := edFechaCobroDesde.Text;
    if Length(Trim(Fecha)) = 8 then
    begin
      Fecha      := TransformaFecha(Trim(AnsiReplaceStr(Fecha, '/','')));
      edFechaCobroDesde.Text := Fecha;
    end;
    edFechaCobroHasta.SetFocus;
  end;
end;

procedure TfAbmNovedades.edFechaExit(Sender: TObject);
begin
  if edFecha.Text <> '  /  /    '  then
  begin
    try
      StrToDate(edFecha.Text);
    Except
      edFecha.Text := FormatDateTime('dd/mm/yyyy', Date);
    end;

    edFecha.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edFecha.Text));
    edFechaHasta.Text := edFecha.Text;
  end;
  chTodasFechas.Checked := edFecha.Text = '  /  /    ';
end;

procedure TfAbmNovedades.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TfAbmNovedades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fABMNovedades := nil;
end;

procedure TfAbmNovedades.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfAbmNovedades.gDetalleDblClick(Sender: TObject);
begin
  if Trim(gDetalle.Cells[0, gDetalle.row]) = '' then
    Exit;
  if FInmuebles = nil then
    Application.CreateForm(TFInmuebles, FInmuebles)
  else
    FInmuebles.Show;
  FInmuebles.Cargar(gDetalle.Cells[0, gDetalle.Row], toMostrar);
end;

procedure TfAbmNovedades.gDetalleFixedCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ARow = 0 then
    gDetalle.Sort(ACol);

end;

procedure TfAbmNovedades.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
//  gDetalle.SortColumn(Col, True,'S');
end;

end.
