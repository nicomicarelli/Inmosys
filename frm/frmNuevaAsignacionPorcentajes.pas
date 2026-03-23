unit frmNuevaAsignacionPorcentajes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Spin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, AdvObj, BaseGrid, AdvGrid, AdvGlowButton,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StrUtils, FMTBcd, AdvDBLookupComboBox, frameInquilinos, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  System.Actions, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  fxQuery, cxGroupBox, AdvPanel, dbClient, frmClaveCaja;

type
  TfPorcentajesCobro = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    dsEmpresas: TDataSource;
    dsInquilinos: TDataSource;
    qEmpresas: TFXQuery;
    qInquilinos: TFXQuery;
    pnlFondo: TAdvPanel;
    lblDescripcion: TLabel;
    cxGroupBox2: TcxGroupBox;
    edEmpresa: TcxTextEdit;
    edCodigo: TcxTextEdit;
    gDetalle: TAdvStringGrid;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Shape1: TShape;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure gDetalleSearchFooterAction(Sender: TObject; Value: string; ACol,
      ARow: Integer; SearchAction: TSearchAction);
    procedure gDetalleCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure gDetalleFixedCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    FOperacion: TTipoOperacion;
  public
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta: Integer;
    cdsAnomalias: TClientDataset;

    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
  end;

var
  fPorcentajesCobro: TfPorcentajesCobro;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto;
{$R *.DFM}

procedure TfPorcentajesCobro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fPorcentajesCobro := nil;
end;

procedure TfPorcentajesCobro.FormCreate(Sender: TObject);
var
  Fila: Integer;
begin
  fPrincipal.Center(Self);

  cdsAnomalias := TClientDataset.Create(nil);
  cdsAnomalias.FieldDefs.Clear;
  cdsAnomalias.FieldDefs.Add('COdinq', ftString, 5);
  cdsAnomalias.FieldDefs.Add('Descripcion', ftString, 200);
  cdsAnomalias.CreateDataset;

  qEmpresas.Connection := DM.Conexion;
  qEmpresas.Open;

  qInquilinos.Connection := DM.Conexion;
  qInquilinos.Open;
  Fila := 1;
  while not qInquilinos.eof do
  begin
    gDetalle.Cells[0, Fila] := qInquilinos.FieldByName('Codinq').AsString;
    gDetalle.Cells[1, Fila] := qInquilinos.FieldByName('Inquilino').AsString;
    gDetalle.Cells[2, Fila] := '100,00';
    gDetalle.Cells[3, Fila] := '0,00';
    Inc(Fila);
    qInquilinos.Next;
  end;
  gDetalle.RowCount := Fila;

  gDetalle.SortSettings.Column := 0;
  gDetalle.QSort;

  gdetalle.SortIndexes.Clear;
  gDetalle.SortIndexes.Add(0);
  gDetalle.SortIndexes.Add(1);
  gDetalle.QSortIndexed;

end;

procedure TfPorcentajesCobro.gDetalleCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
begin
  doSort := ACol < 2;
end;

procedure TfPorcentajesCobro.gDetalleEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 2 then
  begin
    if ToFloat(AnsiReplaceStr(gDetalle.Cells[ACol, ARow],',','.')) > 100 then
    begin
      MostrarDialogoAceptar('El porcentaje de asignación debe ser un valor entre 0 y 100%');
      gDetalle.Cells[ACol, ARow] := '100.00';
    end;
    gDetalle.Cells[ACol, ARow] := FormatFloat('0.00', ToFloat(AnsiReplaceStr(gDetalle.Cells[ACol, ARow],',','.')));
    gDetalle.Cells[ACol, ARow] := AnsiReplaceStr(gDetalle.Cells[ACol, ARow], '.',',');
    gDetalle.Cells[ACol + 1, ARow] := AnsiReplaceStr(gDetalle.Cells[ACol + 1, ARow], '.',',');
    gDetalle.Cells[4, ARow] := 'Si';
    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := ARow + 1;
  end;

  if ACol = 3 then
  begin
    if ToFloat(AnsiReplaceStr(gDetalle.Cells[ACol, ARow],',','.')) > 100 then
    begin
      MostrarDialogoAceptar('El porcentaje de asignación debe ser un valor entre 0 y 100%');
      gDetalle.Cells[ACol, ARow] := '100.00';
    end;

    gDetalle.Cells[ACol, ARow] := FormatFloat('0.00', ToFloat(AnsiReplaceStr(gDetalle.Cells[ACol, ARow],',','.')));
    gDetalle.Cells[ACol, ARow]     := AnsiReplaceStr(gDetalle.Cells[ACol, ARow], '.',',');
    gDetalle.Cells[ACol - 1, ARow] := AnsiReplaceStr(gDetalle.Cells[ACol - 1, ARow], '.',',');
    gDetalle.Cells[4, ARow] := 'Si';

    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := ARow + 1;
  end;
end;

procedure TfPorcentajesCobro.gDetalleFixedCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  gDetalle.QSortIndexed;
end;

procedure TfPorcentajesCobro.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1: HAlign := taLeftJustify;
    2,3: HAlign := taRightJustify;
  end;
end;

procedure TfPorcentajesCobro.gDetalleKeyPress(Sender: TObject; var Key: Char);
begin
  if gDetalle.Col in [1,2,3] then
    if not (CharInSet(Key, ['0'..'9', '.' , ',' , #8, #13])) then
      Key := #0;
end;

procedure TfPorcentajesCobro.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(2, GdETALLE.Row);
  gDetalle.SearchPanel.EditControl.Text := '';
end;

procedure TfPorcentajesCobro.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
begin
  gDetalle.Cells[2, Fila] := Copy(ATexto, IdDesde, IDHasta - IDDesde + 1);
  gDetalle.Cells[3, Fila] := Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),1,2) + '/' +
    Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),3,2) + '/' +
    Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),5,4);
  gDetalle.Cells[4, Fila] := FormatFloat('0.00', ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100);
  edEmpresa.SetFocus;
end;

procedure TfPorcentajesCobro.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Descripcion: string;
  q: TFXQuery;
  I: Integer;
  Codinq: string;
  Resultado: Boolean;
begin
  Codigo := edCodigo.Text;
  Descripcion := edEmpresa.Text;
  cdsAnomalias.EmptyDataSet;

  q := CrearQuery;
  try
    for I := 1 to gDetalle.RowCount - 1 do
    begin
      Codinq := gDetalle.Cells[0, I];
      // Anomalias Agua
      if ToInt(edCodigo.Text) = 2 then
      begin
        q.SQL.Text :=
          ' Select Agua9, Agua27 '+
          '   From Automatizacion ' +
          '  where Codinq = :Codinq ';
        q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(Codinq));
        q.Open;

        if ToFLoat(q.FieldByName('Agua27').AsString) <> 0 then
        begin
          if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) = 0 then
          begin
            if Uppercase(gDetalle.Cells[4, I]) = 'SI' then
            begin
              cdsAnomalias.Append;
              cdsAnomalias.FieldByName('Codinq').AsString := Codinq;
              cdsAnomalias.FieldByName('Descripcion').AsString := FormatFloat('0000', ToFloat(Codinq)) + ' - NO COINCIDEN los porcentajes de cobro, con la automatizacion en AGUAS CORDOBESAS.';
              cdsAnomalias.Post;
            end;
          end;
        end;
        if ToFloat(q.FieldByName('Agua9').AsString) <> 0 then
        begin
          if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) = 0 then
          begin
            if Uppercase(gDetalle.Cells[4, I]) = 'SI' then
            begin
              cdsAnomalias.Append;
              cdsAnomalias.FieldByName('Codinq').AsString := Codinq;
              cdsAnomalias.FieldByName('Descripcion').AsString := FormatFloat('0000', ToFloat(Codinq)) + ' - NO COINCIDEN los porcentajes de cobro, con la automatizacion en AGUAS CORDOBESAS.';
              cdsAnomalias.Post;
            end;
          end;
        end;
      end;

      // Rentas
      if ToInt(edCodigo.Text) = 1 then
      begin
        q.SQL.Text :=
          ' Select DGR9, DGR27 '+
          '   From Automatizacion ' +
          '  where Codinq = :Codinq ';
        q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(Codinq));
        q.Open;

        if ToFLoat(q.FieldByName('DGR27').AsString) <> 0 then
        begin
          if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) = 0 then
          begin
            if Uppercase(gDetalle.Cells[4, I]) = 'SI' then
            begin
              cdsAnomalias.Append;
              cdsAnomalias.FieldByName('Codinq').AsString := Codinq;
              cdsAnomalias.FieldByName('Descripcion').AsString := FormatFloat('0000', ToFloat(Codinq)) + ' - NO COINCIDEN los porcentajes de cobro, con la automatizacion en RENTAS.';
              cdsAnomalias.Post;
            end;
          end;
        end;
        if ToFloat(q.FieldByName('DGR9').AsString) <> 0 then
        begin
          if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) = 0 then
          begin
            if Uppercase(gDetalle.Cells[4, I]) = 'SI' then
            begin
              cdsAnomalias.Append;
              cdsAnomalias.FieldByName('Codinq').AsString := Codinq;
              cdsAnomalias.FieldByName('Descripcion').AsString := FormatFloat('0000', ToFloat(Codinq)) + ' - NO COINCIDEN los porcentajes de cobro, con la automatizacion en RENTAS.';
              cdsAnomalias.Post;
            end;
          end;
        end;
      end;

      // Tasa Municipal
      if ToInt(edCodigo.Text) = 3 then
      begin
        q.SQL.Text :=
          ' Select Muni9, Muni27 '+
          '   From Automatizacion ' +
          '  where Codinq = :Codinq ';
        q.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(Codinq));
        q.Open;

        if ToFLoat(q.FieldByName('Muni27').AsString) <> 0 then
        begin
          if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) = 0 then
          begin
            if Uppercase(gDetalle.Cells[4, I]) = 'SI' then
            begin
              cdsAnomalias.Append;
              cdsAnomalias.FieldByName('Codinq').AsString := Codinq;
              cdsAnomalias.FieldByName('Descripcion').AsString := FormatFloat('0000', ToFloat(Codinq)) + ' - NO COINCIDEN los porcentajes de cobro, con la automatizacion en TASA MUNICIPAL.';
              cdsAnomalias.Post;
            end;
          end;
        end;
        if ToFloat(q.FieldByName('Muni9').AsString) <> 0 then
        begin
          if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) = 0 then
          begin
            if Uppercase(gDetalle.Cells[4, I]) = 'SI' then
            begin
              cdsAnomalias.Append;
              cdsAnomalias.FieldByName('Codinq').AsString := Codinq;
              cdsAnomalias.FieldByName('Descripcion').AsString := FormatFloat('0000', ToFloat(Codinq)) + ' - NO COINCIDEN los porcentajes de cobro, con la automatizacion en TASA MUNICIPAL.';
              cdsAnomalias.Post;
            end;
          end;
        end;
      end;
    end;

    if not cdsAnomalias.IsEmpty then
      if MostrarDialogoSiNo('ANOMALIA!!! '+ #13#10#13#10 + 'Si desea continuar deberá introducir su clave de autorización.'+#13#10+'¿Desea continuar?', mterror, mbNo)then
      begin
        if TFClaveCaja.Ejecutar(cdsAnomalias, Resultado) then
        begin
          if not Resultado then
            Exit;
        end
        else
          Exit;
      end
      else
        Exit;
  finally
    q.Free;
  end;

  DM.IniciarTransaccion;
  q := CrearQuery;
  try
    try
      cdsAnomalias.First;

      while not cdsAnomalias.eof do
      begin
        InsertarAnomalia(FormatFloat('0000', ToFloat(cdsAnomalias.FieldByName('Codinq').AsString)),
                         'Now',
                         '',
                         '',
                         FormatFloat('0000', ToFloat(cdsAnomalias.FieldByName('Codinq').AsString)),
                         cdsAnomalias.FieldByName('Codinq').AsString + ' - ' + 'IMPUESTOS ' + cdsAnomalias.FieldByName('Descripcion').AsString);
        cdsAnomalias.Next;
      end;

      q.Sql.Text :=
        'Delete from PorcentajeCobro where Codigo = :Codigo';
      q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
      q.ExecSQL;

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        q.Sql.Text :=
          'Insert Into PorcentajeCobro Values (:Codigo, :Codinq, :PorcentajeInquilino, :PorcentajePropietario)';
        q.ParamByName('Codigo').AsString := edCodigo.Text;
        q.ParamByName('Codinq').AsString := gDetalle.Cells[0,I];
        q.ParamByName('PorcentajeInquilino').AsFloat := ToFloat(AnsiReplaceStr(gDetalle.Cells[2,I], ',','.'));
        q.ParamByName('PorcentajePropietario').AsFloat := ToFloat(AnsiReplaceStr(gDetalle.Cells[3,I], ',','.'));
        q.ExecSQL;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
      Close;
    Except
      on e: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar los porcentajes de cobro.' + #13#10 +
                              'Detalles Técnicos: ' + e.message);
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfPorcentajesCobro.AdvGlowButton1Click(Sender: TObject);
begin
  gDetalle.Row := 1;
  gDetalle.SearchFooter.Visible := not gdetalle.SearchFooter.Visible;
  if gDetalle.SearchFooter.Visible then
    gDetalle.SearchPanel.EditControl.Setfocus;
end;

procedure TfPorcentajesCobro.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfPorcentajesCobro.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  qEmpresa: TFXQuery;
  I: Integer;

begin
  FOperacion := Operacion;

  qInquilinos.Close;
  qInquilinos.Connection := DM.Conexion;
  qInquilinos.Open;
  I := 1;
  while not qInquilinos.eof do
  begin
    gDetalle.Cells[0, I] := qInquilinos.FieldByName('Codinq').AsString;
    gDetalle.Cells[1, I] := qInquilinos.FieldByName('Inquilino').AsString;
    gDetalle.Cells[2, I] := '100,00';
    gDetalle.Cells[3, I] := '0,00';
    Inc(I);
    qInquilinos.Next;
  end;
  gDetalle.RowCount := I;

  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.Sql.Text := 'Select * from EmpresasImpuestos where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;
      edEmpresa.Text := q.FieldbyName('Descripcion').AsString;
      edCodigo.Text := pCodigo;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
    finally
      FreeAndNil(q);
    end;
  end
  else if Operacion = toModificar then
  begin
    q := CrearQuery;
    qEmpresa := CrearQuery;
    try
      q.Sql.Text := 'Select * from EmpresasImpuestos where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;
      edEmpresa.Text := q.FieldbyName('Descripcion').AsString;
      edCodigo.Text := pCodigo;
      q.Sql.Text :=
         ' select I.CODINQ, I.INQUILINO, '+
         '        Coalesce((Select P.porcentajeinquilino '+
         '           From PorcentajeCobro P '+
         '          Where P.Codinq = I.Codinq '+
         '            and P.Codigo = :Codigo),100) as PorcentajeInquilino, '+
         '        Coalesce((Select P.porcentajePropietario '+
         '           From PorcentajeCobro P '+
         '          Where P.Codinq = I.Codinq '+
         '            and P.Codigo = :Codigo),0) as PorcentajePropietario '+
         ' from INMUEBLES I ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      I := 1;
      while not q.Eof do
      begin
        gDetalle.Cells[0, I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1, I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2, I] := AnsiReplaceStr(FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat), '.',',');
        gDetalle.Cells[3, I] := AnsiReplaceStr(FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat), '.',',');

        if ToInt(pCodigo) = 2 then
        begin
          qEmpresa.SQL.Text :=
            ' Select Agua9, Agua27 '+
            '   From Automatizacion ' +
            '  where Codinq = :Codinq ';
          qEmpresa.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(q.FieldbyName('Codinq').AsString));
          qEmpresa.Open;

          if ToFLoat(qEmpresa.FieldByName('Agua27').AsString) <> 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) = 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('Agua9').AsString) <> 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) = 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('Agua27').AsString) = 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) <> 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('Agua9').AsString) = 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) <> 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
        end;

        if ToInt(pCodigo) = 1 then
        begin
          qEmpresa.SQL.Text :=
            ' Select DGR9, DGR27 '+
            '   From Automatizacion ' +
            '  where Codinq = :Codinq ';
          qEmpresa.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(q.FieldbyName('Codinq').AsString));
          qEmpresa.Open;

          if ToFLoat(qEmpresa.FieldByName('DGR27').AsString) <> 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) = 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('DGR9').AsString) <> 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) = 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('DGR27').AsString) = 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) <> 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('DGR9').AsString) = 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) <> 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
        end;

        if ToInt(pCodigo) = 3 then
        begin
          qEmpresa.SQL.Text :=
            ' Select Muni9, Muni27 '+
            '   From Automatizacion ' +
            '  where Codinq = :Codinq ';
          qEmpresa.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(q.FieldbyName('Codinq').AsString));
          qEmpresa.Open;

          if ToFLoat(qEmpresa.FieldByName('Muni27').AsString) <> 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) = 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('Muni9').AsString) <> 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) = 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('Muni27').AsString) = 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[3, I], ',','.')) <> 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
          if ToFLoat(qEmpresa.FieldByName('Muni9').AsString) = 0 then
            if toFloat(AnsiReplaceStr(gDetalle.Cells[2, I], ',','.')) <> 0 then
              gDetalle.ColorRect(0,I,4,I,clYellow);
        end;

        Inc(I);
        q.Next;
      end;

      if not q.IsEmpty then
        if I < 2 then
         gDetalle.RowCount := 2
       else
         gDetalle.RowCount := I;
    finally
      FreeAndNil(q);
    end;
  end
  else if Operacion = toEliminar then
  begin
    q := CrearQuery;
    try
      q.Sql.Text := 'Select * from EmpresasImpuestos where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;
      edEmpresa.Text := q.FieldbyName('Descripcion').AsString;
      edCodigo.Text := pCodigo;
      q.Sql.Text := 'Select p.*, I.Inquilino from PorcentajeCobro P Left Join Inmuebles I on I.Codinq = P.Codinq where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      I := 1;
      while not q.Eof do
      begin
        gDetalle.Cells[0, I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1, I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2, I] := AnsiReplaceStr(FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat), '.',',');
        gDetalle.Cells[3, I] := AnsiReplaceStr(FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat), '.',',');
        Inc(I);
        q.Next;
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;

      if MostrarDialogoSino('Inmosys',
        '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
      begin
        DM.IniciarTransaccion;
        try
          q.Sql.Text :=
            'Delete from PorcentajeCobro where Codigo = :Codigo';
          q.ParamByName('Codigo').AsInteger := ToInt(edCodigo.Text);
          q.ExecSQL;
          DM.ConfirmarTransaccion;
          MostrarDialogoAceptar( 'Datos eliminados correctamente.');

        except
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Inmosys',
            'Ocurrio un error al eliminar el dato Fijo.', mtError);
        end;
        Close;
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

end.
