unit frmNuevoMovimientoImpuestos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, Math,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Spin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, AdvObj, BaseGrid, AdvGrid, AdvGlowButton,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  FMTBcd, AdvDBLookupComboBox, frameInquilinos, cxSpinEdit, strUtils,
  dxSkinSeven, cxCheckBox, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, fxQuery, System.Actions,
  cxGroupBox, AdvPanel;

type
  TfNuevoMovimientoImpuestos = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    dsEmpresas: TDataSource;
    dsInquilinos: TDataSource;
    popOpciones: TPopupMenu;
    SeleccionarTodos1: TMenuItem;
    DeseleccionarTodos1: TMenuItem;
    pnlFondo: TAdvPanel;
    gbxBotones: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    chCuota50: TcxCheckBox;
    edFecha: TcxMaskEdit;
    edMes: TcxComboBox;
    spAnio: TcxSpinEdit;
    edCodigo: TcxTextEdit;
    edEmpresa: TcxComboBox;
    gDetalle: TAdvStringGrid;
    chLeido: TcxCheckBox;
    chDiferencia: TcxCheckBox;
    qEmpresas: TFXQuery;
    qInquilinos: TFXQuery;
    Actualizar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    btnBuscar: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    Label5: TLabel;
    edDifInquilino: TcxTextEdit;
    edDifProp: TcxTextEdit;
    Label6: TLabel;
    edDifInquilinoFavor: TcxTextEdit;
    edDifPropFavor: TcxTextEdit;
    Label7: TLabel;
    chSoloContra: TcxCheckBox;
    N1: TMenuItem;
    ModificarABMAutomatizacin1: TMenuItem;
    AdvGlowButton1: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure gDetalleSearchFooterAction(Sender: TObject; Value: string;
      ACol, ARow: Integer; SearchAction: TSearchAction);
    procedure ActualizarClick(Sender: TObject);
    procedure edEmpresaClick(Sender: TObject);
    procedure gDetalleEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure BorrarCeduln1Click(Sender: TObject);
    procedure Deseleccionartodos1Click(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure chLeidoClick(Sender: TObject);
    procedure chDiferenciaClick(Sender: TObject);
    procedure ModificarABMAutomatizacin1Click(Sender: TObject);
    procedure btnAutomatizacionClick(Sender: TObject);
    procedure edFechaKeyPress(Sender: TObject; var Key: Char);

  private
    FOperacion: TTipoOperacion;
    FPorcentajeRecargo: Double;
  public
    DatoFijo: String;
    idDesde, idHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, CantCodigos: Integer;
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
    procedure prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
  end;

var
  FNuevoMovimientoImpuestos: TFNuevoMovimientoImpuestos;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios,
  frmNuevoImpuesto, frmProgreso, frmCodigosBarras, ABMIdentificacionImpuestos,
  ABMGeneracionMovimientos, frmautomatizacion;
{$R *.DFM}

procedure TFNuevoMovimientoImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevoMovimientoImpuestos := nil;
end;

procedure TFNuevoMovimientoImpuestos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  qEmpresas.Connection := DM.Conexion;
  qEmpresas.Open;

  while not qEmpresas.Eof do
  begin
    edEmpresa.Properties.Items.Add(qEmpresas.FieldbyName('Descripcion').AsString);
    qEmpresas.Next;
  end;

  qInquilinos.Connection := DM.Conexion;
  qInquilinos.Open;
  edFecha.Text := FormatDatetime('05/mm/yyyy', IncMonth(Date));
  edMes.Enabled := False;
  spAnio.Enabled := False;
  gDetalle.Colwidths[2] := gDetalle.Colwidths[2] + Round(gDetalle.Colwidths[7]/2);
  gDetalle.Colwidths[3] := gDetalle.Colwidths[3] + Round(gDetalle.Colwidths[7]/2);
  gDetalle.Colwidths[7] := -1;
end;

procedure TFNuevoMovimientoImpuestos.gDetalleEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
  if ACol = 5 then
  begin
    if ToFloat(gDetalle.Cells[ACol, ARow]) > 100 then
    begin
      MostrarDialogoAceptar('El porcentaje de asignación debe ser un valor entre 0 y 100%');
      gDetalle.Cells[ACol, ARow] := '100.00';
      gDetalle.Cells[ACol + 1, ARow] := '0.00';
    end;
    gDetalle.Cells[ACol, ARow] := FormatFloat('0.00', ToFloat(gDetalle.Cells[ACol, ARow]));
    gDetalle.Cells[ACol, ARow] := gDetalle.Cells[ACol, ARow];

    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := gDetalle.Row + 1;
  end;

  if ACol = 6 then
  begin
    if ToFloat(gDetalle.Cells[ACol, ARow]) > 100 then
    begin
      MostrarDialogoAceptar('El porcentaje de asignación debe ser un valor entre 0 y 100%');
      gDetalle.Cells[ACol, ARow] := '100.00';
      gDetalle.Cells[ACol - 1, ARow] := '0.00';
    end;

    gDetalle.Cells[ACol, ARow]     := FormatFloat('0.00', ToFloat(gDetalle.Cells[ACol, ARow]));
    gDetalle.Cells[ACol, ARow]     := FormatFloat('0.00', ToFloat(gDetalle.Cells[ACol, ARow]));

    if gDetalle.Row + 1 <= gDetalle.RowCount - 1 then
      gDetalle.Row := gDetalle.Row + 1;
  end;
end;

procedure TFNuevoMovimientoImpuestos.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2,3: HAlign := taLeftJustify;
    4,5,6,7,8,9,10: HAlign := taRightJustify;
  end;
end;

procedure TFNuevoMovimientoImpuestos.gDetalleKeyPress(Sender: TObject; var Key: Char);
var
  stCodigo: string;
begin
  if gDetalle.Col in [1,2,3] then
    if not (CharInSet(Key, ['0'..'9',#8,#13])) then
      Key := #0;

  if Key = #13 then
  begin
    if gDetalle.Col = 2 then
    begin
      if edCodigo.Text = '' then
      begin
        MostrarDialogoAceptar('Debe seleccionar la empresa relacionada. Verifique por favor.');
        Exit;
      end;

      if CantCodigos = 1 then
      begin
          prInterpretarCodigoBarras(gDetalle.Row, gDetalle.Cells[gDetalle.Col, gDetalle.Row]);
      end
      else
      begin
        stCodigo := gDetalle.Cells[gDetalle.Col, gDetalle.Row];

        if fCodigosBarras = nil then
          Application.CreateForm(TfCodigosBarras, fCodigosBarras)
        else
          fCodigosBarras.Show;
        fCodigosBarras.Preparar(IDDesde, IDHasta, FechaDesde, FechaHasta, ImporteDesde, ImporteHasta, FPorcentajeRecargo);
        fCodigosBarras.Cargar(stCodigo, gDetalle.Row, 1);
        fCodigosBarras.Hide;
        fCodigosBarras.ShowModal;
      end;
    end
    else if gDetalle.Col = 4 then
    begin
      gDetalle.Cells[4, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row]));
      gDetalle.Cells[7, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row])*ToFloat(gDetalle.Cells[5, gDetalle.Row])/100);
      gDetalle.Cells[8, gDetalle.Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[4, gDetalle.Row])*ToFloat(gDetalle.Cells[6, gDetalle.Row])/100);
      if gDetalle.Row + 1 <= gDetalle.RowCount -1 then
        gDetalle.Row := gDetalle.Row + 1
      else
        gDetalle.Row := gDetalle.Row - 1;
    end
    else if gDetalle.Col = 5 then
    begin

    end
    else if gDetalle.Col = 6 then
    begin

    end


  end;
end;

procedure TFNuevoMovimientoImpuestos.gDetalleSearchFooterAction(Sender: TObject;
  Value: string; ACol, ARow: Integer; SearchAction: TSearchAction);
begin
  gDetalle.EditCell(gDetalle.Col, gDetalle.Row);
end;

procedure TfNuevoMovimientoImpuestos.ModificarABMAutomatizacin1Click(
  Sender: TObject);
var
  Tecla: Char;
begin
  if fAutomatizacion = nil then
    Application.CreateForm(TfAutomatizacion, fAutomatizacion)
  else
    fAutomatizacion.Show;
  fAutomatizacion.Edit1.Text := gDetalle.Cells[1, gDetalle.Row];
  Tecla := #13;
  fAutomatizacion.Edit1KeyPress(nil, Tecla);
end;

procedure TFNuevoMovimientoImpuestos.prInterpretarCodigoBarras(Fila: Integer; ATexto: String);
begin
  gDetalle.Cells[2, Fila] := Copy(ATexto, IdDesde, IDHasta - IDDesde + 1);
  gDetalle.Cells[3, Fila] := Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),1,2) + '/' +
    Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),3,2) + '/' +
    Copy(Copy(ATexto, FechaDesde, FechaHasta - FechaDesde+1),5,4);
  gDetalle.Cells[4, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100));
  gDetalle.Cells[7, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100)*ToFloat(gDetalle.Cells[5,Fila])/100);
  gDetalle.Cells[8, Fila] := FormatFloat('0.00', (ToFloat(Copy(ATexto, ImporteDesde, ImporteHasta - ImporteDesde+1))/100)*(1+FPorcentajeRecargo/100)*ToFloat(gDetalle.Cells[6,Fila])/100);

  if (Fila + 1 <= gDetalle.RowCount - 1) and (gDetalle.Col = 2) then
    gDetalle.EditCell(2, Fila + 1);

end;

procedure TFNuevoMovimientoImpuestos.SeleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    gDetalle.SetCheckboxState(0, I, True);
  end;
end;

procedure TFNuevoMovimientoImpuestos.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Descripcion: string;
  Mes: Integer;
  Anio: string;
  q: TFXQuery;
  qConsulta: TFXQuery;
  qValorAutomatizacion: TFXQuery;
  qCampoAutomatizacion: TFXQuery;
  Cuota50: Boolean;
  I: Integer;
  Fecha: string;
  Fecha27: string;
  FechaCtaCte: TDateTime;
  FechaCtaCte27: TDateTime;
  ActualizaAutomatizacion: Boolean;
  ValorInquilino, ValorPropietario: Double;
  Es4, Es5, Es2, Es9, Es27: Boolean;
  Estado: Boolean;
  dgrCuota: string;
  Registro: Integer;
  Perimpu: string;
  ImporteInq: string;
  ImporteProp: string;
  ndMonto: Double;

begin
  if not MostrarDialogoSiNo('Si algun movimiento por diferencia ya existe, este NO SERA GENERADO. Si desea agregarlo, debera ser cargado manualmente. ¿Desea continuar?', mbNO) then
    Exit;

  if not MostrarDialogoSiNo('SE INSERTARAN LAS DIFERENCIAS. ¿Desea continuar?', mbNO) then
    Exit;

  Codigo := edCodigo.Text;
  Descripcion := edEmpresa.Text;
  Mes := edMes.ItemIndex+1;
  Anio := spAnio.Text;
  Cuota50 := chCuota50.Checked;

  q := CrearQuery;
  qConsulta := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
        if fProgreso = nil then
          Application.CreateForm(TfProgreso, fProgreso)
        else
          fProgreso.Show;

        fProgreso.Maximo := gDetalle.RowCount - 1;
        fProgreso.Leyenda := 'Grabando cedulones. Por favor espere...';

        qConsulta.Sql.Text := 'Select cuotas from Automatizacion A Where Codinq = :Codinq';

        perimpu:=periodoimpuestos(FormatFloat('00', MES),anio);

        for I := 1 to gDetalle.RowCount - 1 do
        begin
          fProgreso.Posicion := I;
          if gDetalle.GetCheckboxState(0, I, Estado) and (not Estado) then
            Continue;
          if gDetalle.RowHeights[I] = 0 then
            Continue;

          fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
          fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

          FechaCtaCte := (StrToDate(edFecha.Text));
          FechaCtaCte27 := StrToDate(FormatDateTime('10/MM/YYYY',(StrToDate(edFecha.Text))));

          if chLeido.checked then
          begin
            ImporteInq := gDetalle.Cells[4, I];
            ImporteProp := gDetalle.Cells[5, I];
          end
          else
          begin
            ImporteInq := gDetalle.Cells[6, I];
            ImporteProp := gDetalle.Cells[8, I];
          end;

          if chLeido.Checked then
          begin
            if DatoFijo = '04' then
            begin
              qConsulta.Close;
              qConsulta.ParambyName('Codinq').AsString := gDetalle.Cells[1, I];
              qConsulta.Open;
              dgrcuota := cuotadgr(IntToStr(mes),anio, qConsulta.fieldbyName('Cuotas').AsInteger);

              // Aqui va DGR9
              if ToFloat(gDetalle.Cells[6,I]) <> 0 then
              begin
                fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
                fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

                FechaCtaCte := (StrToDate(edFecha.Text));
                FechaCtaCte27 := StrToDate(FormatDateTime('10/MM/YYYY',(StrToDate(edFecha.Text))));

                if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
                begin
                  if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'IMP Y/O SERVICIOS','D.G.R. ' + DGRCUOTA, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '09',3, True);
                  end;
                end
                else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
                begin
                  if (mes < 11) then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'IMP Y/O SERVICIOS','D.G.R. ' + DGRCUOTA, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '09',3, True);
                  end;
                end
                else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'IMP Y/O SERVICIOS','D.G.R. ' + DGRCUOTA, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '09',3, True);
                end;
              end;

              if ToFloat(gDetalle.Cells[7,I]) <> 0 then
              begin
                fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
                fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

                FechaCtaCte := (StrToDate(edFecha.Text));
                FechaCtaCte27 := StrToDate(FormatDateTime('10/MM/YYYY',(StrToDate(edFecha.Text))));

                if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
                begin
                  if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'D.G.R. ','PAGO ' + DGRCUOTA, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '04',3, True);
                  end
                end
                else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
                begin
                  if (mes<11) then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'D.G.R. ','PAGO ' + DGRCUOTA, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '04',3, True);
                  end;
                end
                else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'D.G.R. ','PAGO ' + DGRCUOTA, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '04',3, True);
                end;
              end;

              if ToFloat(gDetalle.Cells[8,I]) <> 0 then
              begin
                fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
                fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

                FechaCtaCte := (StrToDate(edFecha.Text));
                FechaCtaCte27 := StrToDate(FormatDateTime('10/MM/YYYY',(StrToDate(edFecha.Text))));
                if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
                begin
                  if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMPUESTOS A DESCONTAR','D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                  end;
                end
                else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
                begin
                  if (mes < 11) then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMPUESTOS A DESCONTAR','D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                  end;
                end
                else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMPUESTOS A DESCONTAR','D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                end;
              end;
            end
            else if DatoFijo = '02' then
            begin
              if ToFloat(gDetalle.Cells[6,I]) <> 0 then
              begin
                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMP Y/O SERVICIOS','AGUAS CORDOBESAS ' + PERIMPU, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '09',3, True);
              end;
              if ToFloat(gDetalle.Cells[7,I]) <> 0 then
              begin
                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'AGUAS CORDOBESAS','PAGO ' + PERIMPU, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '02',3, True);
              end;
              if ToFloat(gDetalle.Cells[8,I]) <> 0 then
              begin
                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha27,'IMPUESTOS A DESCONTAR','AGUAS CORDOBESAS ' + PERIMPU, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
              end;
            end
            else if DatoFijo = '05' then
            begin
              if ToFloat(gDetalle.Cells[6,I]) <> 0 then
              begin
                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMP Y/O SERVICIOS','TASA MUNICIPAL ' + PERIMPU, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '09',3, True);
              end;
              if ToFloat(gDetalle.Cells[7,I]) <> 0 then
              begin
                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'TASA MUNICIPAL ','PAGO ' + PERIMPU, gDetalle.Cells[4, I], Trim(gDetalle.Cells[2, I]), '02',3, True);
              end;
              if ToFloat(gDetalle.Cells[8,I]) <> 0 then
              begin
                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha27,'IMPUESTOS A DESCONTAR','TASA MUNICIPAL ' + PERIMPU, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
              end;
            end;
            Application.ProcessMessages;
          end;

          if chDiferencia.Checked then
          begin
            if DatoFijo = '04' then
            begin
              qConsulta.Close;
              qConsulta.ParambyName('Codinq').AsString := gDetalle.Cells[1, I];
              qConsulta.Open;
              dgrcuota := cuotadgr(IntToStr(mes),anio, qConsulta.fieldbyName('Cuotas').AsInteger);

              // Aqui va DGR9
              if ToFloat(gDetalle.Cells[6,I]) <> 0 then
              begin
                fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
                fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

                FechaCtaCte := (StrToDate(edFecha.Text));

                ndMonto := ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);

                if ndMonto > 0.009 then
                begin
                  if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
                  begin
                    if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
                    begin
                      Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'IMP Y/O SERVICIOS','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '09',3, True);
                    end;
                  end
                  else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
                  begin
                    if (mes < 11) then
                    begin
                      Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'IMP Y/O SERVICIOS','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '09',3, True);
                    end;
                  end
                  else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'IMP Y/O SERVICIOS','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '09',3, True);
                  end;
                end
                else if ndMonto < -0.009 then
                begin
//                  if gDetalle.Cells[11, I] = '1' then
//                  begin
//                    if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
//                    begin
//                      if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
//                      begin
//                        Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'REINTEGRO','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '69',3, True);
//                      end;
//                    end
//                    else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
//                    begin
//                      if (mes < 11) then
//                      begin
//                        Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'REINTEGRO','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '69',3, True);
//                      end;
//                    end
//                    else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
//                    begin
//                      Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'REINTEGRO','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '69',3, True);
//                    end;
//                  end;
                end;
              end;

              if ToFloat(gDetalle.Cells[7,I]) <> 0 then
              begin
                fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
                fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

                FechaCtaCte := (StrToDate(edFecha.Text));

                ndMonto := ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[7, I]);

                if ndMonto > 0.009 then
                begin
                  if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
                  begin
                    if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
                    begin
                      Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'D.G.R. ','PAGO DIFERENCIA ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '04',3, True);
                    end
                  end
                  else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
                  begin
                    if (mes<11) then
                    begin
                      Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'D.G.R. ','PAGO DIFERENCIA ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '04',3, True);
                    end;
                  end
                  else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'D.G.R. ','PAGO DIFERENCIA ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '04',3, True);
                  end;
                end
                ELSE if ndMonto < -0.009 then
                begin
//                  if gDetalle.Cells[11, I] = '1' then
//                  begin
//                    if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
//                    begin
//                      if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
//                      begin
//                        Registro := InsertarItemAutom(gDetalle.Cells[1, I], fecha, 'REINTEGRO ','D.G.R. PAGO DIFERENCIA ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '76',3, True);
//                      end
//                    end
//                    else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
//                    begin
//                      if (mes<11) then
//                      begin
//                        Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO ','D.G.R. PAGO DIFERENCIA ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '76',3, True);
//                      end;
//                    end
//                    else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
//                    begin
//                      Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO ','D.G.R. PAGO DIFERENCIA ' + DGRCUOTA, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '76',3, True);
//                    end;
//                  end;
                end;
              end;

              if ToFloat(gDetalle.Cells[8,I]) <> 0 then
              begin
                fecha := FormatDateTime('YYYYMMDD', (StrToDate(edFecha.Text)));
                fecha27 := FormatDateTime('YYYYMM10', (StrToDate(edFecha.Text)));

                FechaCtaCte := (StrToDate(edFecha.Text));

                ndMonto := ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]);

                if ndMonto > 0.009 then
                begin
                  if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
                  begin
                    if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
                    begin
                      Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'GASTOS A DESCONTAR','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', (ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I])) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                    end;
                  end
                  else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
                  begin
                    if (mes < 11) then
                    begin
                      Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'GASTOS A DESCONTAR','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', (ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I])) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                    end;
                  end
                  else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
                  begin
                    Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMPUESTOS A DESCONTAR','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', (ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I])) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                  end;
                end
                else if ndMonto < -0.009 then
                begin
//                  if gDetalle.Cells[11, I] = '1' then
//                  begin
//                    if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
//                    begin
//                      if (mes = 1) or (mes = 3) or (mes = 6) or (mes = 9) then
//                      begin
//                        Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', (ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I])) * -1), Trim(gDetalle.Cells[3, I]), '76',3, True);
//                      end;
//                    end
//                    else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
//                    begin
//                      if (mes < 11) then
//                      begin
//                        Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', (ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I])) * -1), Trim(gDetalle.Cells[3, I]), '76',3, True);
//                      end;
//                    end
//                    else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
//                    begin
//                      Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO','DIFERENCIA D.G.R. ' + DGRCUOTA, FormatFloat('0.00', (ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I])) * -1), Trim(gDetalle.Cells[3, I]), '76',3, True);
//                    end;
//                  end;
                end;
              end;
            end
            else if DatoFijo = '02' then
            begin
              if ToFloat(gDetalle.Cells[6,I]) <> 0 then
              begin
                ndMonto := ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);
                if ndMonto > 0.009 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMP Y/O SERVICIOS','DIFERENCIA AGUAS CORDOBESAS ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '09',3, True)
                end
                else if ndMonto < -0.009 then
                begin
//                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO','DIFERENCIA AGUAS CORDOBESAS ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '69',3, True)
                end;

              end;
              if ToFloat(gDetalle.Cells[7,I]) <> 0 then
              begin
                ndMonto := ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[7, I]);
                if ndMonto > 0.009 then
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'AGUAS CORDOBESAS','PAGO DIFERENCIA ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '02',3, True)
//                else if ndMonto < -0.009 then
  //                Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'AGUAS CORDOBESAS','REINTEGRO DIFERENCIA ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '76',3, True);
              end;
              if ToFloat(gDetalle.Cells[8,I]) <> 0 then
              begin
                ndMonto := ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]);
                if ndMonto > 0.009 then
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha27,'IMPUESTOS A DESCONTAR','DIFERENCIA AGUAS CORDOBESAS ' + PERIMPU, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '27',3, True)
//                else if ndMonto < -0.009 then
//                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha27,'REINTEGRO','DIFERENCIA AGUAS CORDOBESAS ' + PERIMPU, FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]) * -1), Trim(gDetalle.Cells[3, I]), '76',3, True);
              end;
            end
            else if DatoFijo = '05' then
            begin
              if ToFloat(gDetalle.Cells[6,I]) <> 0 then
              begin
                ndMonto := ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);
                if ndMonto > 0.009 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'IMP Y/O SERVICIOS','DIFERENCIA TASA MUNICIPAL ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '09',3, True);
                end
//                ELSE if ndMonto < -0.009 then
//                begin
//                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO','DIFERENCIA TASA MUNICIPAL ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '69',3, True);
//                end

              end;
              if ToFloat(gDetalle.Cells[7,I]) <> 0 then
              begin
                ndMonto := ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[7, I]);
                if ndMonto > 0.009 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'TASA MUNICIPAL ','PAGO DIFERENCIA ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '02',3, True);
                end
//                ELSE if ndMonto < -0.009 then
//                begin
//                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha,'REINTEGRO ','DIFERENCIA ' + PERIMPU, FormatFloat('0.00', ndMonto), Trim(gDetalle.Cells[2, I]), '76',3, True);
//                end
              end;
              if ToFloat(gDetalle.Cells[8,I]) <> 0 then
              begin
                ndMonto := ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]);
                if ndMonto > 0.009 then
                begin
                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha27,'IMPUESTOS A DESCONTAR','TASA MUNICIPAL DIFERENCIA ' + PERIMPU, FormatFloat('0.00', ndMonto * -1), Trim(gDetalle.Cells[3, I]), '27',3, True);
                end
//                ELSE if ndMonto < -0.009 then
//                begin
//                  Registro := InsertarItemAutom(gDetalle.Cells[1, I],fecha27,'REINTEGRO','TASA MUNICIPAL DIFERENCIA ' + PERIMPU, FormatFloat('0.00', ndMonto * -1), Trim(gDetalle.Cells[3, I]), '76',3, True);
//                end;
              end;
            end;
            Application.ProcessMessages;
          end;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
      if Assigned(fABMIdentificacionImpuestos) then
        fABMIdentificacionImpuestos.ActualizarClick(nil);
      Close;
    Except
      on e: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar los cedulones.' + #13#10 +
                              'Detalles Técnicos: ' + e.message);
        if Assigned(fABMIdentificacionImpuestos) then
          fABMIdentificacionImpuestos.ActualizarClick(nil);
      end;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qConsulta);
    FreeAndNil(qValorAutomatizacion);
    FreeAndNil(qCampoAutomatizacion);
  end;
end;

procedure TFNuevoMovimientoImpuestos.ActualizarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  pCodigo: string;
  ndTotalInq, ndTotalProp: Double;
  ndTotalInqFavor, ndTotalPropFavor: Double;
begin
  pCodigo := edCodigo.Text;
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;
  ndTotalInq := 0;
  ndTotalProp := 0;
  ndTotalInqFavor := 0;
  ndTotalPropFavor := 0;

  q := CrearQuery;
  try
    if ToInt(pCodigo) = 0 then
    begin
      MostrarDialogoAceptar('Debe seleccionar la empresa.');
      btnGrabar.Enabled := False;
      Exit;
    end;

    q.Sql.Text :=
      ' Select E.* from EmpresasImpuestos E' +
      ' where Codigo = :Codigo';
    q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
    q.Open;

    FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
    edEmpresa.Text := q.FieldbyName('Descripcion').AsString;
    edEmpresa.Properties.Readonly := True;

    DatoFijo := q.FieldbyName('Identificacion').AsString;
    idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
    idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
    FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
    FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
    ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
    ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
    CantCodigos := q.FieldbyName('CantCodigos').AsInteger;

    if FOperacion = toNuevo then
    begin
      if DatoFijo = '04' then
      begin
        q.Sql.Text :=
          ' Select I.Codinq, I.Inquilino, I.Propietario, A.DGR9 as Codigo9, A.DGR4 as CodigoX, A.DGR27 as Codigo27, C.ImporteInquilino, C.ImportePropietario, c.FechaPago, I.DevuelveDiferencias '+
          '   from Inmuebles I' +
          '  Inner Join Automatizacion A on A.Codinq = I.Codinq ' +
          '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
          '  Where C.Codigo = :Codigo ' +
          '    and I.Activo = 1 '+
          '    and C.Mes = :Mes '+
          '    and C.Anio = :Anio '+
          '  order by I.Codinq ';
        q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.ParambyName('Mes').AsString := edMes.Text;
        q.ParambyName('Anio').AsString := spAnio.Text;
        q.Open;
      end
      else if DatoFijo = '02' then
      begin
        q.Sql.Text :=
          ' Select I.Codinq, I.Inquilino, I.Propietario, A.Agua9 as Codigo9, A.Agua2 as CodigoX, A.Agua27 as Codigo27, C.ImporteInquilino, C.ImportePropietario, C.FechaPago, I.DevuelveDiferencias ' +
          '   from Inmuebles I' +
          '  Inner Join Automatizacion A on A.Codinq = I.Codinq ' +
          '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
          '  Where C.Codigo = :Codigo ' +
          '    and I.Activo = 1 '+
          '    and C.Mes = :Mes '+
          '    and C.Anio = :Anio '+
          '  order by I.Codinq ';
        q.ParambyName('Mes').AsString := edMes.Text;
        q.ParambyName('Anio').AsString := spAnio.Text;
        q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.Open;
      end
      else if DatoFijo = '05' then
      begin
        q.Sql.Text :=
          ' Select I.Codinq, I.Inquilino, I.Propietario, A.Muni9 as Codigo9, A.Muni5 as CodigoX, A.Muni27 as Codigo27,  C.ImporteInquilino, C.ImportePropietario, c.FechaPago, I.DevuelveDiferencias ' +
          '   from Inmuebles I' +
          '  Inner Join Automatizacion A on A.Codinq = I.Codinq ' +
          '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
          '  Where C.Codigo = :Codigo ' +
          '    and I.Activo = 1 '+
          '    and C.Mes = :Mes '+
          '    and C.Anio = :Anio '+
          '  order by I.Codinq ';
        q.ParambyName('Mes').AsString := edMes.Text;
        q.ParambyName('Anio').AsString := spAnio.Text;
        q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.Open;
      end;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.AddCheckBox(0, I, True, False);
        edFecha.Text := FormatDateTime('dd/mm/yyyy', q.FieldbyName('FechaPago').AsDateTime);
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Propietario').AsString;
        gDetalle.Cells[4,I] := FormatFloat('0.00', ToFloat(q.FieldbyName('ImporteInquilino').AsString));
        gDetalle.Cells[5,I] := FormatFloat('0.00', ToFloat(q.FieldbyName('ImportePropietario').AsString));
        gDetalle.Cells[6,I] := FormatFloat('0.00', ToFloat(q.FieldbyName('Codigo9').AsString));
        gDetalle.Cells[7,I] := FormatFloat('0.00', ToFloat(q.FieldbyName('CodigoX').AsString));
        gDetalle.Cells[8,I] := FormatFloat('0.00', ABS(ToFloat(q.FieldbyName('Codigo27').AsString)));
        gDetalle.Cells[11,I] := q.FieldbyName('dEVUELVEDIFERENCIAS').AsString;
        gDetalle.Readonly[1,I] := True;
        gDetalle.Readonly[2,I] := True;
        gDetalle.Readonly[3,I] := True;
        gDetalle.Readonly[4,I] := True;
        gDetalle.Readonly[5,I] := True;
        gDetalle.Readonly[6,I] := True;
        gDetalle.Readonly[7,I] := True;
        gDetalle.Readonly[8,I] := True;
        gDetalle.RowCount := gDetalle.RowCount + 1;
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;
    end;

    if FOperacion <> toNuevo then
    begin
      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := edMes.Text;
      q.ParambyName('Anio').AsInteger := ToInt(spAnio.Text);
      if chCuota50.Checked then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      edMes.ItemIndex := edMes.Properties.Items.Indexof(q.FieldbyName('Mes').AsString);
      spAnio.Text := q.FieldbyName('Anio').AsString;

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.FechaPago, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImportePropietario, C.ImporteInquilino, I.DevuelveDiferencias ' +
        '   from Inmuebles I' +
        '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and I.Activo = 1 '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '    and I.Codinq <> '''''+
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := edMes.Text;
      q.ParambyName('Anio').AsInteger := ToInt(spAnio.Text);
      if chCuota50.Checked  then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.AddCheckBox(0, I, True, False);
        edFecha.Text := FormatDateTime('dd/mm/yyyy', q.FieldbyName('FechaPago').AsDateTime);
        gDetalle.Cells[1,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[4,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[9,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
        gDetalle.Cells[11,I] := q.FieldbyName('dEVUELVEDIFERENCIAS').AsString;
        gDetalle.RowCount := gDetalle.RowCount + 1;
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;
    end;
  finally
    FreeAndNil(q);
  end;
  for I := 1 to gDetalle.RowCount - 1 do
  begin
    if (ToFloat(gDetalle.Cells[6, I]) <> 0) and (ToFloat(gDetalle.Cells[4, I]) <> 0) and
      ((ToFloat(gDetalle.Cells[4, I]) <> (ToFloat(gDetalle.Cells[6, I])))) then
    begin
      gDetalle.Cells[9, I] := FormatFloat('0.00', RoundTo(ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]), -1));
      if ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]) > 0 then
      begin
        gDetalle.RowColor[I] := RGB(255,185,185);
        ndTotalInq := ndTotalInq + ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);
      end
      else
      begin
        gDetalle.RowColor[I] := clMoneyGreen;
        ndTotalInqFavor := ndTotalInqFavor + ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);
        if gDetalle.Cells[11,I] = '0' then
          gDetalle.SetCheckBoxState(0, I, False);


      end;
    end;

    if (ToFloat(gDetalle.Cells[8, I]) <> 0) and (ToFloat(gDetalle.Cells[5, I]) <> 0) and
      ((ToFloat(gDetalle.Cells[5, I]) <> (ToFloat(gDetalle.Cells[8, I])))) then
    begin
      gDetalle.Cells[10, I] := FormatFloat('0.00', RoundTo(ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]),-1));
      if ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]) > 0 then
      begin
        gDetalle.RowColor[I] := RGB(255,185,185);
        ndTotalProp := ndTotalProp + ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]);
      end
      else
      begin
        gDetalle.RowColor[I] := clMoneyGreen;
        ndTotalPropFavor := ndTotalPropFavor + ToFloat(gDetalle.Cells[5, I]) - ToFloat(gDetalle.Cells[8, I]);
        if gDetalle.Cells[11,I] = '0' then
          gDetalle.SetCheckBoxState(0, I, False);
      end;
    end;

    if (ToFloat(gDetalle.Cells[6, I]) = 0) and (ToFloat(gDetalle.Cells[7, I]) <> 0)
      and (ToFloat(gDetalle.Cells[4, I]) <> 0) and
      ((ToFloat(gDetalle.Cells[4, I]) <> (ToFloat(gDetalle.Cells[7, I])))) then
    begin
      gDetalle.Cells[9, I] := FormatFloat('0.00', RoundTo(ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[7, I]),-1));
      if ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]) > 0 then
      begin
        gDetalle.RowColor[I] := RGB(255,185,185);
        ndTotalInq := ndTotalInq + ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);
      end
      else
      begin
        gDetalle.RowColor[I] := clMoneyGreen;
        ndTotalInqFavor := ndTotalInqFavor + ToFloat(gDetalle.Cells[4, I]) - ToFloat(gDetalle.Cells[6, I]);
        if gDetalle.Cells[11,I] = '0' then
          gDetalle.SetCheckBoxState(0, I, False);
      end;
    end;
  end;
  edDifInquilino.Text := FormatFloat('0.00', ndTotalInq);
  edDifProp.Text := FormatFloat('0.00', ndTotalProp);
  edDifInquilinoFavor.Text := FormatFloat('0.00', ndTotalInqFavor);
  edDifPropFavor.Text := FormatFloat('0.00', ndTotalPropFavor);

  if chSoloContra.Checked then
  begin
    for i := 1 to GdETALLE.RowCount - 1 do
    begin
      if (ToFloat(gdetalle.Cells[9, I]) <= 0) and (ToFloat(gdetalle.Cells[10, I]) <= 0) then
      begin
        gDetalle.RowHeights[I]:= 0;
      end;
    end;
  end
  else
  begin
    for i := 1 to GdETALLE.RowCount - 1 do
      gDetalle.RowHeights[I]:= 19;
  end;
end;

procedure TFNuevoMovimientoImpuestos.AdvGlowButton1Click(Sender: TObject);
var
  q, qUpdate: TFXQuery;
  I: Integer;
  Estado: Boolean;

begin
  q := DM.fxCrearQuery();
  qUpdate := DM.fxCrearQuery();
  if not MostrarDialogoSiNO('ANTES de realizar esta tarea verifique que la pantalla de ABM Automatización se encuentre cerrada en TODAS las máquinas. ¿Desea continuar?') then
    Exit;

  DM.IniciarTransaccion;
  try
    try
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
      q.Open;

      DatoFijo := q.FieldbyName('Identificacion').AsString;

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        if gDetalle.GetCheckboxState(0, I, Estado) and (not Estado) then
          Continue;

        q.Sql.Text :=
          ' Select * from PorcentajeCobro' +
          ' where Codigo = :Codigo'+
          '   and Codinq = :Codinq ';
        q.ParambyName('Codigo').AsInteger := ToInt(edCodigo.Text);
        q.ParambyName('Codinq').AsString := gDetalle.Cells[1,I];
        q.Open;

        if DatoFijo = '02' then //Agua
        begin
          qUpdate.SQL.Text :=
            'Update Automatizacion Set Agua9 = :Agua9, Agua27 = :Agua27 where Codinq = :Codinq';
          qUpdate.ParamByName('Agua9').AsString := FormatFloat('0.00', TOFloat(gDetalle.Cells[4, I]));
          qUpdate.ParamByName('Agua27').AsString := FormatFloat('0.00', TOFloat(gDetalle.Cells[5, I]));
          qUpdate.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
          qUpdate.ExecSQL;
        end;
        if DatoFijo = '04' then //DGR
        begin
          qUpdate.SQL.Text :=
            'Update Automatizacion Set DGR9 = :DGR9, DGR27 = :DGR27 where Codinq = :Codinq';
          qUpdate.ParamByName('DGR9').AsString := FormatFloat('0.00', TOFloat(gDetalle.Cells[4, I]));
          qUpdate.ParamByName('DGR27').AsString := FormatFloat('0.00', TOFloat(gDetalle.Cells[5, I]));
          qUpdate.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
          qUpdate.ExecSQL;
        end;
        if DatoFijo = '05' then //Muni
        begin
          qUpdate.SQL.Text :=
            'Update Automatizacion Set Muni9 = :Muni9, Muni27 = :Muni27 where Codinq = :Codinq';
          qUpdate.ParamByName('Muni9').AsString := FormatFloat('0.00', TOFloat(gDetalle.Cells[4, I]));
          qUpdate.ParamByName('Muni27').AsString := FormatFloat('0.00', TOFloat(gDetalle.Cells[5, I]));
          qUpdate.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
          qUpdate.ExecSQL;
        end;
      end;

      dm.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos en ABM Automatización actualizados correctamente.');
    except
      on E:Exception do
      begin
        dm.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al actualizar Datos en ABM Automatización.' + E.Message);
      end;
    end;
  finally
    freeAndNil(q);
    freeAndNil(qUpdate);
  end;
end;

procedure TFNuevoMovimientoImpuestos.BorrarCeduln1Click(Sender: TObject);
begin
  gDetalle.Cells[2,gDetalle.Row] := '';
  gDetalle.Cells[3,gDetalle.Row] := '30/12/1899';
  gDetalle.Cells[4,gDetalle.Row] := '0,00';
end;

procedure TFNuevoMovimientoImpuestos.DeseleccionarTodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gDetalle.RowCount - 1 do
    gDetalle.SetCheckboxState(0, I, False);
end;

procedure TFNuevoMovimientoImpuestos.edEmpresaClick(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.Sql.Text :=
      ' Select Codigo From EmpresasImpuestos where Descripcion = :Descripcion ';
    q.ParambyName('Descripcion').AsString := edEmpresa.Text;
    q.Open;

    edCodigo.Text := q.FieldbyName('Codigo').AsString;
    ActualizarClick(nil);
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNuevoMovimientoImpuestos.edFechaKeyPress(Sender: TObject;
  var Key: Char);
var
  Fecha: string;

begin
  TRY
    Fecha := edFecha.Text;
  FINALLY

  END;
  if Key = #13 then
  begin
    if Fecha = '  /  /    '  then
    begin
      try
        StrToDate(Fecha);
      Except
        edFecha.Text := FormatDateTime('05/mm/yyyy', Date);
      end;
    end;

    edFecha.Text := FormatDateTime('05/mm/yyyy', StrToDate(edFecha.Text));
  end;
end;

procedure TfNuevoMovimientoImpuestos.btnAutomatizacionClick(Sender: TObject);
var
  Codigo: string;
  Descripcion: string;
  Mes: string;
  Anio: string;
  q: TFXQuery;
  qAutomatizacion: TFXQuery;
  qValorAutomatizacion: TFXQuery;
  qCampoAutomatizacion: TFXQuery;
  Cuota50: Boolean;
  I: Integer;
  Fecha: TDateTime;
  FechaPago: TDateTime;
  ActualizaAutomatizacion: Boolean;
  ValorInquilino, ValorPropietario: Double;
  Es4, Es5, Es2, Es9, Es27: Boolean;
  Estado: Boolean;

begin
  Codigo := edCodigo.Text;

  ActualizaAutomatizacion := MostrarDialogoSiNo('¿Actualizar datos de automatización para estos inquilinos?', mbYes);

  DM.IniciarTransaccion;
  q := CrearQuery;
  try
    try
      if fProgreso = nil then
        Application.CreateForm(TfProgreso, fProgreso)
      else
        fProgreso.Show;

      fProgreso.Maximo := gDetalle.RowCount - 1;
      fProgreso.Leyenda := 'Grabando cedulones. Por favor espere...';

      for I := 1 to gDetalle.RowCount - 1 do
      begin
        fProgreso.Posicion := I;

        if Trim(gDetalle.Cells[5, I]) <> '' then
        begin
          ValorInquilino :=ToFloat(gDetalle.Cells[5,I]);

          if ToInt(Codigo) = 2 then
          begin
            if ActualizaAutomatizacion and (gDetalle.GetCheckboxState(0,I,Estado)) and (Estado) then
            begin
              if (ToFloat(gDetalle.Cells[5,I]) = 0) then
                Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set Agua9=:Agua9 Where Codinq=:Codinq';
              q.ParamByName('Agua9').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;

              if (ToFloat(gDetalle.Cells[7,I]) = 0) then
                Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set Agua27=:Agua27 Where Codinq=:Codinq';
              q.ParamByName('Agua27').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[7, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;
            end;
          end;
          if ToInt(Codigo) = 2 then
          begin
            if ActualizaAutomatizacion and (gDetalle.GetCheckboxState(0,I,Estado)) and (Estado) then
            begin
              if (ToFloat(gDetalle.Cells[5,I]) = 0) then
                Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set DGR9=:DGR9 Where Codinq=:Codinq';
              q.ParamByName('DGR9').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;

              if (ToFloat(gDetalle.Cells[7,I]) = 0) then
                Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set DGR27=:DGR27 Where Codinq=:Codinq';
              q.ParamByName('DGR27').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[7, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;
            end;
          end;
          if ToInt(Codigo) = 2 then
          begin
            if ActualizaAutomatizacion and (gDetalle.GetCheckboxState(0,I,Estado)) and (Estado) then
            begin
              if (ToFloat(gDetalle.Cells[5,I]) = 0) then
                Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set MUNI9=:MUNI9 Where Codinq=:Codinq';
              q.ParamByName('MUNI9').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[5, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;

              if (ToFloat(gDetalle.Cells[7,I]) = 0) then
                Continue;

              q.Sql.Text :=
                ' Update Automatizacion Set MUNI27=:MUNI27 Where Codinq=:Codinq';
              q.ParamByName('MUNI27').AsString := FormatFloat('0.00', ToFloat(gDetalle.Cells[7, I]));
              q.ParamByName('Codinq').AsString := gDetalle.Cells[1, I];
              q.ExecSQL;
            end;
          end;
        end;
        Application.ProcessMessages;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos de automatización actualizados');
      Close;
    Except
      on e: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar los cedulones.' + #13#10 +
                              'Detalles Técnicos: ' + e.message);
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoMovimientoImpuestos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNuevoMovimientoImpuestos.Cargar(pCodigo: string; Operacion: TTipoOperacion; Mes: string = 'ENERO'; Anio: string = '2015'; Cuota50: string = 'SI'; boEsCopia: Boolean = False);
var
  q: TFXQuery;
  I: Integer;
begin
  FOperacion := Operacion;
  edCodigo.Text := pCodigo;

  btnGrabar.Enabled := True;
  if ToInt(pCodigo) = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar la empresa.');
    btnGrabar.Enabled := False;
    Exit;
  end;

  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;
      DatoFijo := q.FieldbyName('Identificacion').AsString;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, P.PorcentajeInquilino, P.PorcentajePropietario ' +
        '   from Inmuebles I' +
        '   Left Join PorcentajeCobro P on P.Codinq = I.Codinq ' +
        '  where P.Codigo = :Codigo' +
        '  Order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;

      if q.IsEmpty then
      begin
        MostrarDialogoAceptar('Debe asignar los porcentajes de pago para esta empresa.');
        Close;
        Exit;
      end;
      I := 1;
      while not q.eof  do
      begin
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        q.Next;
        Inc(I);
      end;

      if I < 2 then
        gDetalle.RowCount := 2
      else
        gDetalle.RowCount := I;

    finally
      FreeAndNil(q);
    end;
  end
  else if Operacion = toModificar then
  begin
    q := CrearQuery;
    try
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;
      edEmpresa.Text := q.FieldbyName('Descripcion').Text;
      edEmpresa.Properties.Readonly := True;

      DatoFijo := q.FieldbyName('Identificacion').AsString;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;
      FPorcentajeRecargo := q.FieldbyName('PorcentajeRecargo').AsFloat;

      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      edMes.ItemIndex := edMes.Properties.Items.Indexof(q.FieldbyName('Mes').AsString);
      spAnio.Text := q.FieldbyName('Anio').AsString;
      if not boEscopia then
      begin
        edMes.Enabled := False;
        spAnio.Enabled := False;
      end
      else
        FOperacion := toNuevo;

      chCuota50.Checked := q.FieldbyName('Cuota50').AsString = '1';

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta, C.ImporteInquilino, C.ImportePropietario ' +
        '   from Inmuebles I' +
        '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[4,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        gDetalle.Cells[7,I] := FormatFloat('0.00', q.FieldbyName('ImporteInquilino').AsFloat);
        gDetalle.Cells[8,I] := FormatFloat('0.00', q.FieldbyName('ImportePropietario').AsFloat);
        q.Next;
        Inc(I);
      end;

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
      q.Sql.Text :=
        ' Select E.* from EmpresasImpuestos E' +
        ' where Codigo = :Codigo';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.Open;
      edEmpresa.Text := q.FieldbyName('Descripcion').Text;
      edEmpresa.Properties.Readonly := True;

      DatoFijo := q.FieldbyName('Identificacion').AsString;
      idDesde := q.FieldbyName('IdentificacionDesde').AsInteger;
      idHasta := q.FieldbyName('IdentificacionHasta').AsInteger;
      FechaDesde := q.FieldbyName('FechaDesde').AsInteger;
      FechaHasta := q.FieldbyName('FechaHasta').AsInteger;
      ImporteDesde := q.FieldbyName('ImporteDesde').AsInteger;
      ImporteHasta := q.FieldbyName('ImporteHasta').AsInteger;
      CantCodigos := q.FieldbyName('CantCodigos').AsInteger;

      q.Sql.Text :=
        ' Select C.Mes, C.Anio, C.Cuota50 '+
        '   From CabezaCedulones C ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      edMes.ItemIndex := edMes.Properties.Items.Indexof(q.FieldbyName('Mes').AsString);
      spAnio.Text := q.FieldbyName('Anio').AsString;
      if not boEscopia then
      begin
        edMes.Enabled := False;
        spAnio.Enabled := False;
      end
      else
        FOperacion := toNuevo;

      chCuota50.Checked := q.FieldbyName('Cuota50').AsString = '1';

      q.Sql.Text :=
        ' Select I.Codinq, I.Inquilino, C.PorcentajeInquilino, C.PorcentajePropietario, C.Vencimiento, C.Importe, C.Cuenta ' +
        '   from Inmuebles I' +
        '  Inner Join CuerpoCedulones C on C.Codinq = I.Codinq ' +
        '  where C.Codigo = :Codigo '+
        '    and C.Mes = :Mes '+
        '    and C.Anio = :Anio '+
        '    and C.Cuota50 = :Cuota50'+
        '  order by I.Codinq ';
      q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
      q.ParambyName('Mes').AsString := Mes;
      q.ParambyName('Anio').AsInteger := ToInt(Anio);
      if Cuota50 = 'SI' then
        q.ParambyName('Cuota50').AsInteger := 1
      else
        q.ParambyName('Cuota50').AsInteger := 0;
      q.Open;

      I := 1;
      while not q.eof  do
      begin
        gDetalle.Cells[0,I] := q.FieldbyName('Codinq').AsString;
        gDetalle.Cells[1,I] := q.FieldbyName('Inquilino').AsString;
        gDetalle.Cells[2,I] := q.FieldbyName('Cuenta').AsString;
        gDetalle.Cells[3,I] := q.FieldbyName('Vencimiento').AsString;
        gDetalle.Cells[4,I] := FormatFloat('0.00', q.FieldbyName('Importe').AsFloat);
        gDetalle.Cells[5,I] := FormatFloat('0.00', q.FieldbyName('PorcentajeInquilino').AsFloat);
        gDetalle.Cells[6,I] := FormatFloat('0.00', q.FieldbyName('PorcentajePropietario').AsFloat);
        q.Next;
        Inc(I);
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
            'Delete from CabezaCedulones C '+
                '  where C.Codigo = :Codigo '+
                '    and C.Mes = :Mes '+
                '    and C.Anio = :Anio '+
                '    and C.Cuota50 = :Cuota50';
          q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
          q.ParambyName('Mes').AsString := Mes;
          q.ParambyName('Anio').AsInteger := ToInt(Anio);
          if Cuota50 = 'SI' then
            q.ParambyName('Cuota50').AsInteger := 1
          else
            q.ParambyName('Cuota50').AsInteger := 0;
          q.ExecSQL;
          q.Sql.Text :=
            'Delete from CuerpoCedulones C '+
                '  where C.Codigo = :Codigo '+
                '    and C.Mes = :Mes '+
                '    and C.Anio = :Anio '+
                '    and C.Cuota50 = :Cuota50';
          q.ParambyName('Codigo').AsInteger := ToInt(pCodigo);
          q.ParambyName('Mes').AsString := Mes;
          q.ParambyName('Anio').AsInteger := ToInt(Anio);
          if Cuota50 = 'SI' then
            q.ParambyName('Cuota50').AsInteger := 1
          else
            q.ParambyName('Cuota50').AsInteger := 0;
          q.ExecSQL;
          DM.ConfirmarTransaccion;
          MostrarDialogoAceptar('Datos eliminados correctamente.');
          if Assigned(fABMIdentificacionImpuestos) then
            fABMIdentificacionImpuestos.ActualizarClick(nil);
        except
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Inmosys',
            'Ocurrio un error al eliminar el dato Fijo.', mtError);
        end;
        Close;
      end
      else
        Close;
    finally
      FreeAndNil(q);
    end;
  end;
(*
  if (Operacion in [toNuevo, toModificar]) then
    edtDescripcion.SetFocus;
  if (Operacion in [toModificar, toEliminar]) then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select * from EmpresasImpuestos where Codigo=:Codigo';
      q.ParamByName('Codigo').AsString := pCodigo;
      q.Open;

      gDetalle.Cells[1,1] := q.FieldbyName('Identificacion').AsString;
      gDetalle.Cells[2,1] := q.FieldbyName('IdentificacionDesde').AsString;
      gDetalle.Cells[3,1] := q.FieldbyName('IdentificacionHasta').AsString;
      gDetalle.Cells[2,2] := q.FieldbyName('FechaDesde').AsString;
      gDetalle.Cells[3,2] := q.FieldbyName('FechaHasta').AsString;
      gDetalle.Cells[2,3] := q.FieldbyName('ImporteDesde').AsString;
      gDetalle.Cells[3,3] := q.FieldbyName('ImporteHasta').AsString;
      edtCodigo.Text := q.FieldByName('Codigo').AsString;
      edtDescripcion.Text := q.FieldByName('Descripcion').AsString;
    finally
      FreeAndNil(q);
    end;
  end;
  btnGrabar.Visible := (Operacion in [toNuevo, toModificar]);

  edtDescripcion.SetFocus;

  if (Operacion in [toNuevo, toModificar]) then
    gDetalle.Options := gDetalle.Options + [goediting]
  else
    gDetalle.Options := gDetalle.Options - [goediting];

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMImpuestosYServicios) then
      FABMImpuestosYServicios.ActualizarClick(nil);
  end;
  *)
end;

procedure TfNuevoMovimientoImpuestos.chDiferenciaClick(Sender: TObject);
begin
  if chLeido.Checked then
    chLeido.Checked := not chDiferencia.Checked;
end;

procedure TfNuevoMovimientoImpuestos.chLeidoClick(Sender: TObject);
begin
  if chLeido.Checked then
    chDiferencia.Checked := not chLeido.Checked;
end;

end.
