unit frmPlanillaCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  Menus, ComCtrls, strUtils, frmframeCajas, Generics.Collections, ActnList, DBClient,
  Provider, ppDesignLayer, System.Actions, FXQuery, Data.db, AdvGlowButton,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox;

type
  TfPlanillaCaja = class(TForm)
    Panel2: TPanel;
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
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel41: TppLabel;
    Region: TppRegion;
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
    popEliminar: TPopupMenu;
    EliminarRecibo1: TMenuItem;
    PageControl1: TPageControl;
    General: TTabSheet;
    gDetalle: TStringAlignGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Shape1: TShape;
    Label5: TLabel;
    N1: TMenuItem;
    CambiarSobre1: TMenuItem;
    ActionList1: TActionList;
    actEliminar: TAction;
    Label7: TLabel;
    Label12: TLabel;
    N2: TMenuItem;
    PasaralHistorico1: TMenuItem;
    btnSalir: TAdvGlowButton;
    btnNuevo: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    pnFiltros: TPanel;
    Actualizar: TAdvGlowButton;
    Label1: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    TodosCodigos: TcxCheckBox;
    Edit8: TEdit;
    Edit6: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    edItem: TEdit;
    edUsuario: TEdit;
    TodosC: TcxCheckBox;
    TodosCo: TcxCheckBox;
    TodosItem: TcxCheckBox;
    TodosUsuarios: TcxCheckBox;
    cbCaja: TcxLookupComboBox;
    TodasCajas: TcxCheckBox;
    chMismoPropietario: TcxCheckBox;
    Label2: TLabel;
    edtTotal: TcxTextEdit;
    Label14: TLabel;
    edDepositos: TcxTextEdit;
    edEfectivo: TcxTextEdit;
    N3: TMenuItem;
    GenerarMovimientoenVale1: TMenuItem;
    Label16: TLabel;
    procedure ActualizarClick(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edDesdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Change(Sender: TObject);
    procedure edDescripcionChange(Sender: TObject);
    procedure TodosDescripcionClick(Sender: TObject);
    procedure TodosAfectaClick(Sender: TObject);
    procedure cbAfectaClick(Sender: TObject);
    procedure TodosDestinoClick(Sender: TObject);
    procedure cbDestinoChange(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gDetalleFixedColClick(Sender: TObject; col: Integer);
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function TituloGetFieldValue(aFieldName: string): Variant;
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Change(Sender: TObject);
    procedure EliminarRecibo1Click(Sender: TObject);
    procedure TodosCClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure TodosCoClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure edItemChange(Sender: TObject);
    procedure TodosItemClick(Sender: TObject);
    procedure gDetalleDblClick(Sender: TObject);
    procedure CambiarSobre1Click(Sender: TObject);
    procedure actEliminarExecute(Sender: TObject);
    procedure actEliminarUpdate(Sender: TObject);
    procedure TodosUsuariosClick(Sender: TObject);
    procedure edUsuarioChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PasaralHistorico1Click(Sender: TObject);
    procedure TodasCajasClick(Sender: TObject);
    procedure GenerarMovimientoenVale1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    qCajas: TFXQuery;
    ds: TDatasource;

  public
    EsCierreCaja: Boolean; { Private declarations }
    ListaSobres: TListaSobres;
    boEsCajaDiaria: Boolean;
    boBuscaItemsRepetidos: Boolean;
    FCodigoVale: Integer;
    FIncrementa: Boolean;

    procedure prInicializar;
  end;

var
  fPlanillaCaja: TfPlanillaCaja;
  fPlanillaCajaChica: TfPlanillaCaja;
  fPlanillaCajaRepetidos: TfPlanillaCaja;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos, frmMovimientosCaja, frmCierresCaja,
  frmConsultaSobre, frmValeCaja;

{$R *.dfm}

procedure TfPlanillaCaja.actEliminarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if gDetalle.Cells[6,gDetalle.Row] = '' then
      Exit;

    DM.IniciarTransaccion;
    try
      q.SQL.text := ' Delete from CajaDetalles where idtransaccion = :ID';
      q.ParamByName('ID').AsString := gDetalle.Cells[6,gDetalle.Row];
      q.ExecSQL();

      q.SQL.text := ' Delete from Caja where idtransaccion = :ID';
      q.ParamByName('ID').AsString := gDetalle.Cells[6,gDetalle.Row];
      q.ExecSQL();

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento eliminado correctamente');
      ActualizarCLick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfPlanillaCaja.actEliminarUpdate(Sender: TObject);
begin
  actEliminar.Enabled := Pagecontrol1.ActivePageIndex = 0;
end;

procedure TfPlanillaCaja.ActualizarClick(Sender: TObject);
var
  q, qSaldo: TFXQuery;
  qSobres: TFXQuery;
  SumaRI, RI, I, J, K: Integer;
  Pagina: Integer;
  Suma: Double;
  SumaR: Double;
  f: TFraCaja;
  R: TFraCaja;
  P: TPagecontrol;
  Encontrado: boolean;
  EncontradoR: boolean;
  Sobre: TSobre;
  Tiempo: TDateTime;
  Nexo: string;
  ndTotal, ndDepositos, ndEfectivo: Double;
  CodigoDesde, CodigoHasta: String;
  stRepetidos: string;
begin
  q := DM.fxCrearQuery(opOptimizaAlPalo);
  qSobres := CrearQuery;
  Tiempo := Now;

  for J := 0 to ListaSobres.Count - 1 do
  begin
    ListaSobres.Items[J].F.gDetalle.Vaciar;
    ListaSobres.Items[J].F.edtTotal.Text := '0.00';
    ListaSobres.Items[J].R.edtTotal.Text := '0.00';
    ListaSobres.Items[J].R.gDetalle.Vaciar;
    ListaSobres.Items[J].Total := 0;
  end;

  try
    gDetalle.Vaciar;

    if not boBuscaItemsRepetidos then
    begin
      if chMismoPropietario.Checked then
      begin
        q.SQL.Text := ' Select Ca.*, C.Tipo, C.Letra, C.Numero, c.Usuario, D.descripcion as Caja from CajaDetalles CA '+
                    ' inner join inmuebles I on CA.codinq = I.codinq              '+
                    ' inner join caja c on CA.idtransaccion = c.idtransaccion'+
                    ' Inner Join Cajas d on d.codigocaja = c.codigocaja '+
                    ' and c.codinq in (select codinq from inmuebles I1 where I.propietario in ( '+
                    ' Select propietario from inmuebles I2 where i2.codinq=:codinq)) ';
        q.ParamByName('Codinq').AsString := edit2.Text;
        nEXO := ' And ';
      end
      else
      begin
        q.SQL.Text := ' Select Ca.*, C.Tipo, C.Letra, C.Numero, c.uSUARIO, D.descripcion as Caja '+
                      '   from CajaDetalles CA '+
                    '    inner join caja c on CA.idtransaccion = c.idtransaccion '+
                    '    Inner Join Cajas d on d.codigocaja = c.codigocaja ';
        Nexo := ' Where ';
      end;
    end
    else
    begin
      q.SQL.Text := ' Select Ca.Codinq, CA.Coditem, CA.Item, Ca.Periodo, Ca.Entra, Ca.Sale, Count(*) as Veces '+
                    '   from CajaDetalles CA '+
                    '  inner join caja c on CA.idtransaccion = c.idtransaccion '+
                    '  Inner Join Cajas d on d.codigocaja = c.codigocaja '+
                    '  Where Not CA.Coditem in (''12'', ''121'', ''28'',''601'', ''604'') ';
      Nexo := ' And ';
    end;

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(Nexo + ' C.Fecha >=:desde and C.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text);
      Nexo := ' And ';
    end;

    if not TodasCajas.Checked then
    begin
      q.SQL.Add(Nexo + ' D.CodigoCaja =:Caja ');
      q.ParamByName('Caja').AsInteger := cbCaja.EditValue;
      Nexo := ' And ';
    end;

    if not chMismoPropietario.Checked then
    begin
      if not TodosC.Checked then
      begin
        q.SQL.Add(Nexo + ' CA.Codinq >=:desdeC and CA.Codinq <=:HastaC ');
        q.ParamByName('DesdeC').AsString := edit2.Text;
        q.ParamByName('HastaC').AsString := Edit1.text;
        Nexo := ' And ';
      end;
    end;

    CodigoDesde := edit3.Text;
    CodigoHasta := edit4.text;

    if CodigoDesde = '00' then
      CodigoDesde := '0';
    if CodigoHasta = '00' then
      CodigoHasta := '0';

    if not TodosCo.Checked then
    begin
      q.SQL.Add(Nexo + ' CA.Coditem >=:desdeCo and Ca.Coditem <=:HastaCo ');
      q.ParamByName('DesdeCo').AsString := CodigoDesde;
      q.ParamByName('HastaCo').AsString := CodigoHasta;
      Nexo := ' And ';
    end;

    if not TodosItem.Checked then
    begin
      q.SQL.Add(Nexo + ' (CA.PERIODO) LIKE :iTEM ');
      q.ParamByName('Item').AsString := editem.Text + '%';
      Nexo := ' And ';
    end;

    if not TodosUsuarios.Checked then
    begin
      q.SQL.Add(Nexo + ' (C.USUARIO) LIKE :USUARIO ');
      q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
      Nexo := ' And ';
    end;

    if boBuscaItemsRepetidos then
    begin
      q.SQL.Add(' Group by 1,2,3,4,5,6 Having Count(*) > 1 ');
      q.SQL.Add(' Order by /*CA.Fecha desc,*/ CA.Codinq, CA.Coditem ');
    end
    else
      q.SQL.Add(' Order by Fecha desc, Codinq, Coditem ');

    q.Open;

    gDetalle.Vaciar;
    I := 1;
    gDetalle.BeginUpdate;
    Suma := 0;
    ndDepositos := 0;
    ndEfectivo := 0;
    q.DisableControls;
    try
      while not q.Eof do
      begin
        if (q.FieldByName('Entra').AsFloat = 0) and (q.FieldByName('Sale').AsFloat = 0) then
        begin
          q.Next;
          Continue;
        end;
        if boEsCajaDiaria then
        begin
          if (q.FieldByName('Letra').AsString = 'D') or (q.FieldByName('Letra').AsString = 'T') then
          begin
            q.Next;
            Continue;
          end;
        end;

        gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldByName('ITem').AsString  + ' ' + q.FieldByName('Periodo').AsString;
        gDetalle.Cells[3,I] := FormatFloat('$ #,##0.00',q.FieldByName('Entra').AsFloat);
        gDetalle.Cells[4,I] := FormatFloat('$ #,##0.00',q.FieldByName('Sale').AsFloat);
        if not boBuscaItemsRepetidos then
        begin
          gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
          gDetalle.Cells[6,I] := q.FieldByName('IDTransaccion').AsString;
          if q.FieldByName('Tipo').AsString = 'FA'  then
            gDetalle.Cells[7,I] := 'Factura'
          else if q.FieldByName('Tipo').AsString = 'LI'  then
            gDetalle.Cells[7,I] := 'Liquidación'
          else if q.FieldByName('Tipo').AsString = 'RE'  then
            gDetalle.Cells[7,I] := 'Recibo'
          else if q.FieldByName('Tipo').AsString = 'MA'  then
            gDetalle.Cells[7,I] := 'Manual';

          gDetalle.Cells[8,I] := q.FieldByName('Letra').AsString;
          gDetalle.Cells[9,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
          gDetalle.Cells[11,I] := q.FieldByName('IDTransaccion').AsString;
          gDetalle.Cells[12,I] := q.FieldByName('Usuario').AsString;

          if (q.FieldByName('Letra').AsString = 'D') or (q.FieldByName('Letra').AsString = 'T') then
            ndDepositos := ndDepositos + q.FieldByName('Entra').AsFloat - q.FieldByName('Sale').AsFloat
          else
            ndEfectivo := ndEfectivo + q.FieldByName('Entra').AsFloat - q.FieldByName('Sale').AsFloat;
        end
        else
        begin
          gDetalle.Cells[11,I] := q.FieldByName('Veces').AsString;
        end;
        gDetalle.Cells[10,I] := q.FieldByName('Coditem').AsString;
        gDetalle.Cells[13,I] := FormatFloat('0.00',q.FieldByName('Entra').AsFloat);
        gDetalle.Cells[14,I] := FormatFloat('0.00',q.FieldByName('Sale').AsFloat);

        Suma := Suma + q.FieldByName('Entra').AsFloat - q.FieldByName('Sale').AsFloat;
        Inc(I);
        q.Next;
      end;

      if i>2 then
        gDetalle.RowCount := I
      else
        gDetalle.RowCount := 2;

      gDetalle.Row := 1;
    finally
      q.EnableControls;
      gDetalle.EndUpdate;
    end;

    edDepositos.Text := FormatFloat(',0.00', ndDepositos);
    edEfectivo.Text := FormatFloat(',0.00', ndEfectivo);
    edtTotal.Text := FormatFloat(',0.00', Suma);

    Application.ProcessMessages;

    if (PageControl1.ActivePage.Caption <> 'General') OR (EsCierreCaja) then
    begin
      q.SQL.Text := ' SELECT IDTRANSACCION, CODINQ, CODITEM, FECHA, ITEM, PERIODO, ENTRA, SALE, TIPO, LETRA, '+
                    '  NUMERO, USUARIO, SOBRE, NOMBRESOBRE FROM ( '+
                    ' select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                    '   from CAJADETALLES CA '+
                    '  inner join CAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                    '  inner join conceptos co on co.codigo = ca.coditem '+
                    '  inner join sobres s on s.codigo = co.sobre where s.Codigo=:codigo and ca.coditem <> :alq1';

      q.ParamByName('Alq1').AsString := '01';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
      end;

      if not TodosC.Checked then
      begin
        q.SQL.Add(' and CA.Codinq >=:desdeC and CA.Codinq <=:HastaC ');
        q.ParamByName('DesdeC').AsString := edit2.Text;
        q.ParamByName('HastaC').AsString := Edit1.text;
      end;
      if not TodosUsuarios.Checked then
      begin
        q.SQL.Add(' and (C.USUARIO) LIKE :USUARIO ');
        q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
      end;

      if not TodosCo.Checked then
      begin
        q.SQL.Add(' and CA.Coditem >=:desdeCo and Ca.Coditem <=:HastaCo ');
        q.ParamByName('DesdeCo').AsString := edit3.Text;
        q.ParamByName('HastaCo').AsString := Edit4.text;
      end;

      q.SQL.aDD(' UNION select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                    '   from CAJADETALLES CA '+
                    '  inner join CAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                    '  inner join conceptos co on co.codigo = ca.coditem '+
                    '  inner join sobres s on s.codigo = co.OTROsobre where s.Codigo=:codigo and ca.coditem <> :alq1');

      q.ParamByName('Alq1').AsString := '01';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
      end;

      if not TodosC.Checked then
      begin
        q.SQL.Add(' and CA.Codinq >=:desdeC and CA.Codinq <=:HastaC ');
        q.ParamByName('DesdeC').AsString := edit2.Text;
        q.ParamByName('HastaC').AsString := Edit1.text;
      end;
      if not TodosUsuarios.Checked then
      begin
        q.SQL.Add(' and (C.USUARIO) LIKE :USUARIO ');
        q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
      end;

      if not TodosCo.Checked then
      begin
        q.SQL.Add(' and CA.Coditem >=:desdeCo and Ca.Coditem <=:HastaCo ');
        q.ParamByName('DesdeCo').AsString := edit3.Text;
        q.ParamByName('HastaCo').AsString := Edit4.text;
      end;
      q.SQL.Add (' UNION select CA1.IDTRANSACCION, CA1.CODINQ, CA1.CODITEM, CA1.FECHA, CA1.ITEM, CA1.periodo,  CA1.SALE, CA1.ENTRA, C1.TIPO, C1.LETRA, C1.NUMERO, c1.uSUARIO, s1.codigo as sobre, s1.descripcion as nombresobre '+
                    '   from CAJADETALLES CA1 '+
                    '  inner join CAJA C1 on CA1.IDTRANSACCION = C1.IDTRANSACCION '+
                    '  inner join conceptos co1 on co1.CODIGO = ca1.coditem '+
                    '  inner join sobres s1 on s1.codigo = co1.DESCUENTA where s1.Codigo=:codigo ');

      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and C1.Fecha >=:desde and C1.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
      end;

      if not TodosC.Checked then
      begin
        q.SQL.Add(' and CA1.Codinq >=:desdeC and CA1.Codinq <=:HastaC ');
        q.ParamByName('DesdeC').AsString := edit2.Text;
        q.ParamByName('HastaC').AsString := Edit1.text;
      end;

      if not TodosCo.Checked then
      begin
        q.SQL.Add(' and CA1.Coditem >=:desdeCo and Ca1.Coditem <=:HastaCo ');
        q.ParamByName('DesdeCo').AsString := edit3.Text;
        q.ParamByName('HastaCo').AsString := Edit4.text;
      end;
      if not TodosUsuarios.Checked then
      begin
        q.SQL.Add(' and (C1.USUARIO) LIKE :USUARIO ');
        q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
      end;

      q.SQL.Add ('union '+
       ' select CA2.IDTRANSACCION, CA2.CODINQ, CA2.CODITEM, CA2.FECHA, CA2.ITEM, CA2.PERIODO, CA2.ENTRA, '+
       '      CA2.SALE, C2.TIPO, C2.LETRA, '+
       '      C2.NUMERO, c2.uSUARIO,S2.CODIGO as SOBRE, S2.DESCRIPCION as NOMBRESOBRE '+
       ' from CAJADETALLES CA2 '+
       ' inner join CAJA C2 on CA2.IDTRANSACCION = C2.IDTRANSACCION '+
       ' inner join CONCEPTOS CO2 on CO2.CODIGO = CA2.CODITEM '+
       ' inner join SOBRES S2 on S2.CODIGO = CO2.SOBRE '+
       ' where S2.CODIGO = :CODIGO and ca2.coditem = :aLQ and ca2.entra > 0 ');

      q.ParamByName('aLQ').AsString := '01';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and C2.Fecha >=:desde and C2.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
      end;

      if not TodosC.Checked then
      begin
        q.SQL.Add(' and CA2.Codinq >=:desdeC and CA2.Codinq <=:HastaC ');
        q.ParamByName('DesdeC').AsString := edit2.Text;
        q.ParamByName('HastaC').AsString := Edit1.text;
      end;
      if not TodosUsuarios.Checked then
      begin
        q.SQL.Add(' and (C2.USUARIO) LIKE :USUARIO ');
        q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
      end;

      if not TodosCo.Checked then
      begin
        q.SQL.Add(' and CA2.Coditem >=:desdeCo and Ca2.Coditem <=:HastaCo ');
        q.ParamByName('DesdeCo').AsString := edit3.Text;
        q.ParamByName('HastaCo').AsString := Edit4.text;
      end;

      q.SQL.Add ('union '+
                 ' SELECT ALQ.IDTRANSACCION, ALQ.CODINQ, ALQ.CODITEM, ALQ.FECHA, ALQ.ITEM, ALQ.PERIODO, ALQ.ENTRA, ALQ.SALE - coalesce(COM.ENTRA,0) AS SALE, ALQ.TIPO, ALQ.LETRA, '+
                 '        ALQ.NUMERO, ALQ.USUARIO, ALQ.SOBRE, ALQ.NOMBRESOBRE '+
                 ' FROM ( '+
                 ' select CA3.IDTRANSACCION, CA3.CODINQ, CA3.CODITEM, CA3.FECHA, CA3.ITEM, CA3.PERIODO, CA3.ENTRA, CA3.SALE, C3.TIPO, C3.LETRA, '+
                 '        C3.NUMERO, C3.USUARIO, S3.CODIGO as SOBRE, S3.DESCRIPCION as NOMBRESOBRE '+
                 ' from CAJADETALLES CA3 '+
                 ' inner join CAJA C3 on CA3.IDTRANSACCION = C3.IDTRANSACCION '+
                 ' inner join CONCEPTOS CO3 on CO3.CODIGO = CA3.CODITEM '+
                 ' inner join SOBRES S3 on S3.CODIGO = CO3.SOBRE '+
                 ' where S3.CODIGO = :CODIGO and ca3.coditem = :Alq3 and ca3.SALE > 0 ');
                if not TodosC.Checked then
                begin
                  q.SQL.Add(' and CA3.Codinq >=:desdeC and CA3.Codinq <=:HastaC ');
                  q.ParamByName('DesdeC').AsString := edit2.Text;
                  q.ParamByName('HastaC').AsString := Edit1.text;
                end;

                if not TodosCodigos.Checked then
                begin
                  q.SQL.Add(' and CA3.Fecha >=:desde and CA3.Fecha <=:Hasta ');
                  q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
                  q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
                end;
                q.SQL.Add('  ) AS ALQ                                                                            ');

                q.SQL.Add(' LEFT JOIN '+
                 ' (select CA4.IDTRANSACCION, CA4.CODINQ, CA4.CODITEM, CA4.FECHA, CA4.ITEM, CA4.PERIODO, CA4.ENTRA, CA4.SALE, C4.TIPO, C4.LETRA, '+
                 '        C4.NUMERO, C4.USUARIO, S4.CODIGO as SOBRE, S4.DESCRIPCION as NOMBRESOBRE '+
                 ' from CAJADETALLES CA4 '+
                 ' inner join CAJA C4 on CA4.IDTRANSACCION = C4.IDTRANSACCION '+
                 ' inner join CONCEPTOS CO4 on CO4.CODIGO = CA4.CODITEM '+
                 ' inner join SOBRES S4 on S4.CODIGO = CO4.SOBRE '+
                 ' where CO4.DESCUENTA = :CODIGO and ca4.coditem = :COMision and ca4.ENTRA > 0 ');
                if not TodosC.Checked then
                begin
                  q.SQL.Add(' and CA4.Codinq >=:desdeC and CA4.Codinq <=:HastaC ');
                  q.ParamByName('DesdeC').AsString := edit2.Text;
                  q.ParamByName('HastaC').AsString := Edit1.text;
                end;
                if not TodosUsuarios.Checked then
                begin
                  q.SQL.Add(' and (C4.USUARIO) LIKE :USUARIO ');
                  q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
                end;

                if not TodosCodigos.Checked then
                begin
                  q.SQL.Add(' and CA4.Fecha >=:desde and CA4.Fecha <=:Hasta ');
                  q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
                  q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
                end;
                q.SQL.Add('  ) AS COM ');
                q.SQL.Add( ' ON ALQ.TIPO=COM.TIPO AND ALQ.LETRA=COM.LETRA AND ALQ.NUMERO=COM.NUMERO AND ALQ.FECHA=COM.FECHA AND ALQ.CODINQ=COM.CODINQ ');
                if not TodosC.Checked then
                begin
                  q.SQL.Add(' WHERE ALQ.Codinq >=:desdeC and ALQ.Codinq <=:HastaC ');
                  q.ParamByName('DesdeC').AsString := edit2.Text;
                  q.ParamByName('HastaC').AsString := Edit1.text;
                end;

      q.ParamByName('aLQ3').AsString := '01';
      q.ParamByName('Comision').AsString := '12';

      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' and alq.Fecha >=:desde and alq.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit6.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit8.Text)+1;
      end;

      if not TodosC.Checked then
      begin
        q.SQL.Add(' and alq.Codinq >=:desdeC and alq.Codinq <=:HastaC ');
        q.ParamByName('DesdeC').AsString := edit2.Text;
        q.ParamByName('HastaC').AsString := Edit1.text;
      end;
      if not TodosUsuarios.Checked then
      begin
        q.SQL.Add(' and (alq.USUARIO) LIKE :USUARIO ');
        q.ParamByName('USUARIO').AsString := edUSUARIO.Text + '%';
      end;

      if not TodosCo.Checked then
      begin
        q.SQL.Add(' and alq.Coditem >=:desdeCo and alq.Coditem <=:HastaCo ');
        q.ParamByName('DesdeCo').AsString := edit3.Text;
        q.ParamByName('HastaCo').AsString := Edit4.text;
      end;

      q.SQL.Add(') Order by Fecha desc, Codinq, Coditem ');
  //    q.SQL.Add(' Order by ca1.Codinq, ca1.Sobre, ca1.Coditem ');
      Q.Prepared := True;

      if EsCierreCaja then
      begin
        qSobres.SQL.Text := 'Select Codigo from sobres ';
      end
      else
      begin
        qSobres.SQL.Text := 'Select Codigo from sobres Where Codigo = :Sobre or Depende = :Sobre';
        qSobres.Parambyname('Sobre').AsInteger := PageControl1.ActivePage.Tag;
      end;
      qSobres.Open;

      while not qSobres.Eof do
      begin
        q.Close;
        q.Parambyname('Codigo').AsInteger := qSobres.FieldByName('Codigo').AsInteger;
        q.Open;

        RI := 1;

        for I := 0 to ListaSobres.Count - 1 do
        begin
          Encontrado := False;

          if ListaSobres.Items[I].Codigo = qSobres.FieldByName('Codigo').AsString then
          begin
            Sobre := ListaSobres.Items[I];
  //          F := ListaSobres.Items[I].F;
  //          R := ListaSobres.Items[I].R;
  //          p := ListaSobres.Items[I].Pgc;

            Sobre.PGC.ActivePageIndex := 0;
            Sobre.PGC.Activepage.BringToFront;
            Sobre.PGC.ActivePage.Repaint;

            if Sobre.R.Gdetalle.cells[2,1] = '' then
              RI := Sobre.R.gDetalle.RowCount-1
            else
              RI := Sobre.R.gDetalle.RowCount;
  (*
            for J := 0 to R.gDetalle.RowCount - 1 do
              if R.Gdetalle.cells[2,J] = '' then
              begin
                RI := J;
                Break;
              end;
  *)
            Encontrado := True;
            Break;
          end;
        end;

        if Encontrado then
        begin
          Sobre.R.gDetalle.BeginUpdate;
          Sobre.f.gDetalle.BeginUpdate;
          Sobre.f.edtTotal.Text := FormatFloat('0.00', 0);
          try
            Sobre.f.gDetalle.Vaciar;

            I := 1;

            Sobre.r.gDetalle.ColorRow[RI] := clSkyBlue;
            Sobre.r.gDetalle.Cells[2,RI] := Sobre.Descripcion;
            if RI < 2 then
              Sobre.r.gDetalle.RowCount := 2
            else
              Sobre.r.gDetalle.RowCount := RI + 1;

            SumaRI := RI;
            Inc(RI);
            Suma := 0;
            if q.eof then
            begin
              Sobre.R.gDetalle.Cells[3, SumaRI] := 'Saldo $: ';
              Sobre.R.gDetalle.Cells[4, SumaRI] := FormatFLoat('0.00', Suma + ndTotal);
            end;
            Suma := Suma + ToFloat(Sobre.F.gDetalle.Cells[3,1]) - ToFloat(Sobre.F.gDetalle.Cells[4,1]);

            while not q.Eof do
            begin
              if (q.FieldByName('Entra').AsFloat = 0) and (q.FieldByName('Sale').AsFloat = 0) then
              begin
                q.Next;
                Continue;
              end;

              Sobre.F.gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
              Sobre.F.gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
              Sobre.F.gDetalle.Cells[2,I] := q.FieldByName('ITem').AsString  + ' ' + q.FieldByName('Periodo').AsString;
              Sobre.F.gDetalle.Cells[3,I] := FormatFloat('0.00',q.FieldByName('Entra').AsFloat);
              Sobre.F.gDetalle.Cells[4,I] := FormatFloat('0.00',q.FieldByName('Sale').AsFloat);
              Sobre.F.gDetalle.Cells[6,I] := q.FieldByName('IDTransaccion').AsString;
              Sobre.f.gDetalle.Cells[10,I] := q.FieldByName('Coditem').AsString;
              Sobre.F.gDetalle.Cells[12,I] := q.FieldByName('uSUARIO').AsString;

              if q.FieldByName('Tipo').AsString = 'FA'  then
                Sobre.F.gDetalle.Cells[7,I] := 'Factura'
              else if q.FieldByName('Tipo').AsString = 'LI'  then
                Sobre.F.gDetalle.Cells[7,I] := 'Liquidación'
              else if q.FieldByName('Tipo').AsString = 'RE'  then
                Sobre.F.gDetalle.Cells[7,I] := 'Recibo'
              else if q.FieldByName('Tipo').AsString = 'MA'  then
                Sobre.F.gDetalle.Cells[7,I] := 'Manual';

              Sobre.F.gDetalle.Cells[8,I] := q.FieldByName('Letra').AsString;
              Sobre.F.gDetalle.Cells[9,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);

              Suma := Suma + q.FieldByName('Entra').AsFloat - q.FieldByName('Sale').AsFloat;

              Sobre.R.gDetalle.Cells[0,RI] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
              Sobre.R.gDetalle.Cells[1,RI] := q.FieldByName('Codinq').AsString;
              Sobre.R.gDetalle.Cells[2,RI] := q.FieldByName('ITem').AsString  + ' ' + q.FieldByName('Periodo').AsString;
              Sobre.R.gDetalle.Cells[3,RI] := FormatFloat('0.00',q.FieldByName('Entra').AsFloat);
              Sobre.R.gDetalle.Cells[4,RI] := FormatFloat('0.00',q.FieldByName('Sale').AsFloat);
              Sobre.R.gDetalle.Cells[6,RI] := q.FieldByName('IDTransaccion').AsString;
              Sobre.R.gDetalle.Cells[10,rI] := q.FieldByName('Coditem').AsString;
              Sobre.r.gDetalle.Cells[12,rI] :=  q.FieldByName('uSUARIO').AsString;

              if q.FieldByName('Tipo').AsString = 'FA'  then
                Sobre.R.gDetalle.Cells[7,RI] := 'Factura'
              else if q.FieldByName('Tipo').AsString = 'LI'  then
                Sobre.R.gDetalle.Cells[7,RI] := 'Liquidación'
              else if q.FieldByName('Tipo').AsString = 'RE'  then
                Sobre.R.gDetalle.Cells[7,RI] := 'Recibo'
              else if q.FieldByName('Tipo').AsString = 'MA'  then
                Sobre.R.gDetalle.Cells[7,RI] := 'Manual';

              Sobre.R.gDetalle.Cells[8,RI] := q.FieldByName('Letra').AsString;
              Sobre.R.gDetalle.Cells[9,RI] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);

              Sobre.f.edtTotal.Text := FormatFLoat('0.00', Suma);
              Sobre.R.gDetalle.Cells[3, SumaRI] := 'Saldo $: ';
              Sobre.R.gDetalle.Cells[4, SumaRI] := FormatFLoat('0.00', Suma);

              Sumar := 0;
              for J := 0 to Sobre.r.gDetalle.RowCount - 1 do
                if Sobre.R.gdetalle.ColorRow[J] = clSkyBlue then
                  Sumar := Sumar + ToFloat(Sobre.R.gDetalle.Cells[4, J]);
              Sobre.R.edtTotal.Text := FormatFloat('0.00', Sumar);
              Sobre.Total := Suma;
              Q.Next;
              Inc(I);
              Inc(RI);
            end;
            if I < 2 then
              Sobre.F.gDetalle.RowCount := 2
            else
              Sobre.F.gDetalle.RowCount := I;
            if RI < 2 then
              Sobre.R.gDetalle.RowCount := 2
            else
              Sobre.R.gDetalle.RowCount := RI;


(*
            for I := 1 to Sobre.R.gDetalle.RowCount- 1 do
              if Sobre.R.gDetalle.ColorRow[I] <> clSkyBlue then
                Sobre.R.gDetalle.RowHeights[I] := -1;
*)
          finally
            Sobre.F.gDetalle.EndUpdate;
            Sobre.R.gDetalle.EndUpdate;
          end;
        end;
        qSobres.Next;
      end;
      Pagecontrol1.ActivePage := General;
      Pagecontrol1.ActivePageIndex := 0;
      pagecontrol1.Activepage.BringToFront;
      Pagecontrol1.ActivePage.Repaint;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qSobres);
  end;
  Label12.Caption := FormatDateTime('hh:nn:ss.zzzz', Now - Tiempo);
end;

function TfPlanillaCaja.TituloGetFieldValue(aFieldName: string): Variant;
begin
(*
  if aFieldName = 'Filtro por Articulo' then
  begin
    if TodosCodigos.Checked then
      Result := 'Todos'
    else
      Result := EdDesde.Text + ' - ' + edHasta.Text;
  end
  else if aFieldName = 'Filtro por Descripción' then
  begin
    if TodosDescripcion.Checked then
      Result := 'Todos'
    else
      Result := edDescripcion.Text;
  end

  else if aFieldName = 'Filtro por Afecta a' then
  begin
    if todosAfecta.Checked then
      Result := 'Todos'
    else
      Result := cbAfecta.Text;
  end
  else if aFieldName = 'Filtro por Destino' then
  begin
    if todosDestino.Checked then
      Result := 'Todos'
    else
      Result := cbDestino.Text;
  end;
*)
end;

procedure TfPlanillaCaja.TodasCajasClick(Sender: TObject);
begin
  if todasCajas.Checked then
    cbCaja.EditValue := -1;

  if cbCaja.EditValue = -1  then
    todasCajas.Checked := True;
end;

procedure TfPlanillaCaja.TodosAfectaClick(Sender: TObject);
begin
(*
  if todosAfecta.Checked then
    cbAfecta.itemindex := -1;

  if Trim(cbAfecta.Text) = ''  then
    todosAfecta.Checked := True;
*)
end;

procedure TfPlanillaCaja.TodosCClick(Sender: TObject);
begin
  if todosC.Checked then
  begin
    edit2.Text:='';
    edit1.Text:='';
  end;

  if Trim(edit2.Text) = ''  then
    todosC.Checked := True;

end;

procedure TfPlanillaCaja.TodosCoClick(Sender: TObject);
begin
  if todosCO.Checked then
  begin
    edit3.Text:='';
    edit4.Text:='';
  end;

  if Trim(edit3.Text) = ''  then
    todosCo.Checked := True;
end;

procedure TfPlanillaCaja.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edit6.Text:='';
    edit8.Text:='';
  end;

  if Trim(edit6.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfPlanillaCaja.TodosDescripcionClick(Sender: TObject);
begin
(*
  if todosDescripcion.Checked then
    edDescripcion.Text:='';

  if Trim(edDescripcion.Text) = ''  then
     todosDescripcion.Checked := True;
*)
end;

procedure TfPlanillaCaja.TodosDestinoClick(Sender: TObject);
begin
(*
  if todosDestino.Checked then
    cbDestino.itemindex := -1;

  if Trim(cbDestino.Text) = ''  then
     todosDestino.Checked := True;
*)
end;


procedure TfPlanillaCaja.BitBtn1Click(Sender: TObject);
begin
  if FCierresCaja = nil then
    Application.CreateForm(TFCierresCaja, FCierresCaja);
  FCierresCaja.Hide;
  FCierresCaja.FormStyle := fsNormal;
  FCierresCaja.ShowModal;
end;

procedure TfPlanillaCaja.BitBtn2Click(Sender: TObject);
var
  I: Integer;
  J: Integer;
  TabPrincipal: TTabsheet;
  TabGeneral: TTabsheet;
  TabResumen: TTabsheet;
  PagePrincipal: TPageControl;
  FrameGeneral: TFraCaja;
  FrameResumen: TFraCaja;
  qSobrePrincipal: TFXQuery;
  qSobreSecundario: TFXQuery;
  Sobre: TSobre;

  function CrearFrame(pParent: TWinCOntrol; pName, pCodigo: String): TFraCaja;
  begin
    Result := TFraCaja.Create(pParent);
    Result.Parent := PParent;
    Result.Name := pName;
    Result.Align := alClient;
    Result.Visible := True;
    Result.Label1.Caption := pCodigo;
  end;

  function CrearSolapa(pParent: TPageCOntrol; pName, pCaption: String; Indice, pCodigo: Integer): TTabSheet;
  begin
    Result := TTabSheet.Create(pParent);
    Result.PageControl := PParent;
    Result.Name := pName;
    Result.Caption := pCaption;
    Result.Visible := True;
    Result.PageIndex := Indice;
    Result.Tag := pCodigo;
  end;

  function CrearPageControl(pParent: TWinCOntrol; pName: String): TPageControl;
  begin
    Result := TPageControl.Create(pParent);
    Result.Parent:= PParent;
    Result.Name := pName;
    Result.Visible := True;
    Result.Align := alClient;
    Result.ActivePageIndex := 0;
  end;

begin
  qSobrePrincipal := CrearQuery;
  qSobreSecundario := CrearQuery;
  try
    qSobrePrincipal.SQL.Text := ' Select * from sobres where principal = 1 and Activo = 1 order by descripcion';
    qSobrePrincipal.Open;

    I := 1;

    while not qSobrePrincipal.eof do
    begin
      sobre := TSobre.Create;

      TabPrincipal := CrearSolapa(PageControl1, 'tbs' + qSobrePrincipal.FieldByName('Codigo').AsString, qSobrePrincipal.FieldByName('Descripcion').AsString, i, qSobrePrincipal.FieldByName('Codigo').AsInteger);
      PagePrincipal := CrearPageControl(TabPrincipal, 'pgc' + qSobrePrincipal.FieldByName('Codigo').AsString);
      TabGeneral := CrearSolapa(PagePrincipal, 'tbsGeneral' + qSobrePrincipal.FieldByName('Codigo').AsString, qSobrePrincipal.FieldByName('Descripcion').AsString, 0, -1);

      FrameGeneral :=  CrearFrame(tabGeneral, 'fra' + qSobrePrincipal.FieldByName('Codigo').AsString, qSobrePrincipal.FieldByName('Codigo').AsString);
      TabResumen := CrearSolapa(PagePrincipal, 'tbsResumen' + qSobrePrincipal.FieldByName('Codigo').AsString, 'Resumen', 1, -1);
      FrameResumen :=  CrearFrame(tabResumen, 'fraResumen' + qSobrePrincipal.FieldByName('Codigo').AsString, qSobrePrincipal.FieldByName('Codigo').AsString);

      TabGeneral.PAgeIndex := 1;
      TabResumen.PageIndex := 0;

      Sobre.Codigo := qSobrePrincipal.FieldByName('Codigo').AsString;
      Sobre.Descripcion := qSobrePrincipal.FieldByName('Descripcion').AsString;
      Sobre.Pgc := PagePrincipal;
      Sobre.Tbs := TabGeneral;
      Sobre.F   := FrameGeneral;
      Sobre.R   := FrameResumen;
      Sobre.Total := 0;

      ListaSobres.Add(Sobre);

      qSobreSecundario.SQL.Text := ' Select * from sobres where principal = 0 and activo = 1 and depende=:depende order by descripcion';
      qSobreSecundario.ParamByName('Depende').AsString := qSobrePrincipal.FieldByName('Codigo').AsString;
      qSobreSecundario.Open;

      J := 2;
      while not qSobreSecundario.Eof do
      begin
        TabGeneral := CrearSolapa(PagePrincipal, 'tbs' + qSobreSecundario.FieldByName('Codigo').AsString, qSobreSecundario.FieldByName('Descripcion').AsString, J, -1);
        FrameGeneral :=  CrearFrame(tabGeneral, 'fra' + qSobreSecundario.FieldByName('Codigo').AsString, qSobreSecundario.FieldByName('Codigo').AsString);

        sobre := TSobre.Create;
        Sobre.Codigo := qSobreSecundario.FieldByName('Codigo').AsString;
        Sobre.Descripcion := qSobreSecundario.FieldByName('Descripcion').AsString;
        Sobre.Pgc := PagePrincipal;
        Sobre.Tbs := TabGeneral;
        Sobre.F   := FrameGeneral;
        Sobre.R   := FrameResumen;
        Sobre.Total := 0;
        ListaSobres.Add(Sobre);

        Inc(J);
        qSobreSecundario.Next;
      end;

      Inc(i);
      qSobrePrincipal.Next;
    end;

    General.TabVisible := True;
    Pagecontrol1.ActivePage := General;
    Pagecontrol1.ActivePageIndex := 0;
    pagecontrol1.Activepage.BringToFront;
    Pagecontrol1.ActivePage.Repaint;


  finally
    FreeAndNil(qSobrePrincipal);
    FreeAndNil(qSobreSecundario);
  end;
end;

procedure TfPlanillaCaja.BitBtn3Click(Sender: TObject);
begin
  if FConsultarSobre = nil then
    Application.CreateForm(TFConsultarSobre, FConsultarSobre)
  else
    FConsultarSobre.Show;
end;

procedure TfPlanillaCaja.btnEliminarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  gDetalle.BeginUpdate;
  try
    if PageControl1.ActivePage <> General then
    begin
      MostrarDialogoAceptar('Debe posicionarse en la solapa "General" para eliminar un item.');
      Exit;
    end;

    if gDetalle.Cells[6,gDetalle.Row] = '' then
      Exit;
    if not MostrarDialogoSiNo('¿Esta seguro de eliminar el item?') then
      Exit;

    DM.IniciarTransaccion;
    try
      for I := 1 to gDetalle.RowCount -1 do
      begin
        if gDetalle.ColorRow[I] = clYellow then
        begin
          q.SQL.text := ' Delete from CajaDetalles where idtransaccion = :ID';
          q.ParamByName('ID').AsString := gDetalle.Cells[6,I];
          q.ExecSQL();

          q.SQL.text := ' Delete from Caja where idtransaccion = :ID';
          q.ParamByName('ID').AsString := gDetalle.Cells[6,I];
          q.ExecSQL();
        end;
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento eliminado correctamente');
      ActualizarCLick(nil);
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    gDetalle.EndUpdate;
  end;
end;

procedure TfPlanillaCaja.btnModificarClick(Sender: TObject);
begin
  if gDetalle.Cells[0,gDetalle.Row] = '' then
    Exit;

  if FDatosFijos = nil then
    Application.CreateForm(TFDatosFijos, FDatosFijos)
  else
    FDatosFijos.Show;
  FDatosFijos.Cargar(gDetalle.Cells[0,gDetalle.Row],toModificar);
end;

procedure TfPlanillaCaja.btnNuevoClick(Sender: TObject);
begin
  if FMovimientosCaja = nil then
    Application.CreateForm(TFMovimientosCaja, FMovimientosCaja)
  else
    FMovimientosCaja.Show;
  FMovimientosCaja.Cargar('',toNuevo);
end;

procedure TfPlanillaCaja.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfPlanillaCaja.CambiarSobre1Click(Sender: TObject);
var
  sobre: String;
  q: TFXQuery;
  I: Integer;

begin
  Sobre := InputBox('Código de Nuevo Dato Fijo','','');
  q := CrearQuery;
  try
    if sobre <> '' then
    begin
      q.SQL.Text := ' Select Codigo from conceptos where codigo=:CODITEM';
      Q.ParamByName('CODITEM').AssTRING := Sobre;
      q.Open;

      if q.IsEmpty  then
      begin
        MostrarDIalogoAceptar('El codigo de dato fijo no existe. Verifique por favor.');
        Exit;
      end;

      DM.IniciarTransaccion;
      try
        for I := 1 to gdetalle.RowCount - 1 do
        begin
          if gDetalle.ColorRow[I] = clYellow then
          begin
            q.SQL.Text := ' UPDATE CAJADETALLES SET CODITEM=:CODITEM WHERE IDTRANSACCION=:ID';
            q.ParamByName('id').AssTRING := GDETALLE.Cells[11, i];
            Q.ParamByName('CODITEM').AssTRING := Sobre;
            q.ExecSql;
          end;
        end;
        DM.ConfirmarTransaccion;
      except
        DM.CancelarTransaccion;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfPlanillaCaja.cbAfectaClick(Sender: TObject);
begin
//  todosafecta.Checked := False;
end;

procedure TfPlanillaCaja.cbDestinoChange(Sender: TObject);
begin
//  TodosDestino.Checked := False;
end;

procedure TfPlanillaCaja.TodosItemClick(Sender: TObject);
begin
  if todosItem.Checked then
    edItem.Text:='';

  if Trim(editem.Text) = ''  then
    todosItem.Checked := True;
end;

procedure TfPlanillaCaja.TodosUsuariosClick(Sender: TObject);
begin
  if todosUsuarios.Checked then
    edUsuario.Text:='';

  if Trim(edUsuario.Text) = ''  then
    todosUsuarios.Checked := True;
end;

procedure TfPlanillaCaja.edDescripcionChange(Sender: TObject);
begin
(*
  if edDescripcion.Text <> '' then
    todosDescripcion.Checked:=False
  else
    todosDescripcion.Checked:=True;
*)
end;

procedure TfPlanillaCaja.edDesdeChange(Sender: TObject);
begin
(*
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
*)
end;


procedure TfPlanillaCaja.edDesdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  edHasta.Text := edDesde.text;
end;


procedure TfPlanillaCaja.edDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;


procedure TfPlanillaCaja.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
    todosc.Checked:=False
  else
    todosc.Checked:=True;
end;

procedure TfPlanillaCaja.Edit1Exit(Sender: TObject);
begin
  if edit1.Text <> '' then
    edit1.Text := FormatFloat('0000', ToFloat(edit1.Text));
end;

procedure TfPlanillaCaja.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edit1.Text := FormatFloat('0000', ToFloat(edit1.Text,1));
    Actualizar.setfocus;
  end;
end;

procedure TfPlanillaCaja.Edit2Change(Sender: TObject);
begin
  Edit1.Text:=Edit2.Text;
  if edit2.Text <> '' then
    todosc.Checked:=False
  else
    todosc.Checked:=True;

end;

procedure TfPlanillaCaja.Edit2Exit(Sender: TObject);
begin
  if edit2.Text <> '' then
    edit2.Text := FormatFloat('0000', ToFloat(edit2.Text));

end;

procedure TfPlanillaCaja.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edit2.Text := FormatFloat('0000', ToFloat(edit2.Text,1));
    Edit1.SetFocus;
  end;
end;

procedure TfPlanillaCaja.Edit3Change(Sender: TObject);
begin
  Edit4.Text:=Edit3.Text;

  if edit3.Text <> '' then
    todosco.Checked:=False
  else
    todosco.Checked:=True;
end;

procedure TfPlanillaCaja.Edit3Exit(Sender: TObject);
begin
  if edit3.Text <> '' then
    edit3.Text := FormatFloat('00', ToFloat(edit3.Text));
end;

procedure TfPlanillaCaja.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edit3.Text := FormatFloat('00', ToFloat(edit3.Text,1));
    Edit4.SetFocus;
  end;
end;

procedure TfPlanillaCaja.Edit4Change(Sender: TObject);
begin
  if edit4.Text <> '' then
    todosco.Checked:=False
  else
    todosco.Checked:=True;

end;

procedure TfPlanillaCaja.Edit4Exit(Sender: TObject);
begin
  if edit4.Text <> '' then
    edit4.Text := FormatFloat('00', ToFloat(edit4.Text));
end;

procedure TfPlanillaCaja.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if edit4.Text <> '' then
      edit4.Text := FormatFloat('00', ToFloat(edit4.Text));
    Actualizar.setfocus;
  end;
end;

procedure TfPlanillaCaja.Edit6Change(Sender: TObject);
begin
  Edit8.Text:=Edit6.Text;
  if edit6.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfPlanillaCaja.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit6.Text;
  if Key = #13 then
  begin
    if Length(Edit6.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit6.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit6.Text := Fecha;
    Edit8.setfocus;
  end;
end;

procedure TfPlanillaCaja.Edit8Change(Sender: TObject);
begin
  if edit8.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfPlanillaCaja.Edit8KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit8.Text;
  if Key = #13 then
  begin
    if Length(Edit8.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit8.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit8.Text := Fecha;
    Actualizar.setfocus;
  end;
end;

procedure TfPlanillaCaja.edItemChange(Sender: TObject);
begin
  if edItem.Text <> '' then
    todosItem.Checked:=False
  else
    todosItem.Checked:=True;
end;

procedure TfPlanillaCaja.edUsuarioChange(Sender: TObject);
begin
  if edUsuario.Text <> '' then
    todosUsuarios.Checked:=False
  else
    todosUsuarios.Checked:=True;

end;

procedure TfPlanillaCaja.EliminarRecibo1Click(Sender: TObject);
begin
  if MostrarDialogoSiNo('¿Esta seguro de eliminar el recibo?') then
  begin
    DM.IniciarTransaccion;
    try
      EliminarRecibo(gDetalle.Cells[1, gDetalle.Row],'RE', gDetalle.Cells[3, gDetalle.Row], gDetalle.Cells[5, gDetalle.Row]);
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Recibo eliminado correctamente.');
      ActualizarClick(nil);
    except
      DM.CancelarTransaccion;
    end;
  end;
end;

procedure TfPlanillaCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaSobres);
  action := caFree;
  fPlanillaCaja := nil;
  fPlanillaCajaChica := nil;
  fPlanillaCajaRepetidos := nil;
end;

procedure TfPlanillaCaja.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);

  Edit6.Text := FormatDatetime('dd/mm/yyyy', Date());
  Edit8.Text := FormatDatetime('dd/mm/yyyy', Date());
  ListaSobres := TListaSobres.Create;
  EsCierreCaja := False;
  ds := TDatasource.Create(nil);

  qCajas := CrearQuery;
  qCajas.sql.text := 'Select * from cajas';
  qCajas.Open;

  ds.DataSet := qCajas;
  cbCaja.Properties.ListSource := ds;
  boEsCajaDiaria := False;
  bitbtn2Click(nil);
end;

procedure TfPlanillaCaja.gDetalleDblClick(Sender: TObject);
begin
  if gDetalle.ColorRow[gDetalle.Row] = gDetalle.Color then
  begin
    gDetalle.ColorRow[gDetalle.Row] := clYellow;
    Exit;
  end;
  if gDetalle.ColorRow[gDetalle.Row] = clYellow then
  begin
    gDetalle.ColorRow[gDetalle.Row] := gDetalle.Color;
    Exit;
  end;
end;

procedure TfPlanillaCaja.gDetalleFixedColClick(Sender: TObject; col: Integer);
begin
  if Col = 0 then
    gDetalle.SortColumn(Col, False, 'D')
//    Multisort(gDetalle, [0,1], ['D','S'])
  else
    gDetalle.SortColumn(Col, True,'S');


end;

procedure TfPlanillaCaja.GenerarMovimientoenVale1Click(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  ndEntra, ndSale: Double;
  niLinea: Integer;
  FContinua: Boolean;
  ndImporte: Double;
begin

  if fValeCaja = nil then
    Application.CreateForm(TfValeCaja, fValeCaja);

  FIncrementa := gDetalle.Cells[3, gDetalle.Row] <> '0.00';
  fValeCaja.prInicializar(FCodigoVale, FIncrementa);
  FContinua := fValeCaja.Showmodal = mrOk;

  if FContinua  then
  begin
    DM.IniciarTransaccion;
    q := CrearQuery;
    try
      try
        for I := 0 to gDetalle.RowCount -1 do
        begin
          if gDetalle.ColorRow[I] = clYellow then
          begin
            if gDetalle.Cells[13, I] <> '0.00' then
              ndImporte := ToFloat(gDetalle.Cells[13, I]);
            if gDetalle.Cells[14, I] <> '0.00' then
              ndImporte := ToFloat(gDetalle.Cells[14, I]);

            if FIncrementa then
            begin
              ndEntra := ndImporte;
              ndSale :=  0;
            end
            else
            begin
              ndEntra :=  0;
              ndSale := ndImporte;
            end;

            q.SQL.Text := ' Select Max(Linea) as Linea from CuerpoVales where codigo=:Codigo';
            Q.ParamByName('CODIGO').AsInteger := FCodigoVale;
            q.Open;

            niLinea := q.FieldByName('Linea').AsInteger + 1;

            InsertarCuerpoVale(FCodigoVale,
                               niLinea,
                               gDetalle.Cells[1, I],
                               gDetalle.Cells[10, I],
                               gDetalle.Cells[2, I],
                               StrToDate(gDetalle.Cells[0, I]),
                               ndEntra, ndSale, '0', 1, 1);
          end;
        end;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar( 'Datos grabados correctamente.');
      except
        DM.CancelarTransaccion;
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

procedure TfPlanillaCaja.PageControl1Change(Sender: TObject);
begin
  btnEliminar.Visible := Pagecontrol1.ActivePage = General;
end;

procedure TfPlanillaCaja.PasaralHistorico1Click(Sender: TObject);
var
  q, q1: TFXQuery;
  I: Integer;
  Seleccion: Boolean;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  Label2.Visible := True;
  Seleccion := False;
  DM.IniciarTransaccion;
  try
    try
      for I := 1 to gDetalle.RowCount -1 do
      begin
        if gDetalle.ColorRow[I] = clYellow then
        begin
          Seleccion := True;
          q.SQL.Text := ' Insert into HistoricoCaja '+
                        ' Select C.* From Caja C '+
                        '  Inner Join CajaDetalles D on C.IdTransaccion = D.IDTransaccion '+
                        '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                        '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                        '  Where C.IDTransaccion = :ID ';
          q.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[11,I]);
          q.ExecSql;

          q1.SQL.Text := ' Insert into HistoricoCajaDetalles '+
                         ' Select D.* From CajaDetalles D '+
                         '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                         '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                         '  Where D.IDTransaccion = :ID ';
          q1.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[11,I]);
          q1.ExecSql;

          q1.SQL.Text := ' delete From CajaDetalles '+
                         ' Where IDTransaccion = :id';
          q1.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[11,I]);
          q1.ExecSql;

          q1.SQL.Text := ' delete From Caja '+
                         ' Where IDTransaccion = :id';
          q1.ParambyName('ID').AsInteger := StrToInt(gDetalle.Cells[11,I]);
          q1.ExecSql;
        end;
      end;

      DM.ConfirmarTransaccion;
      if not Seleccion  then
        MostrarDialogoAceptar('No hay nada seleccionado para pasar al histórico.')
      else
      begin
        ActualizarClick(nil);
        MostrarDialogoAceptar('Datos pasados al historico satisfactoriamente.');
      end;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

procedure TfPlanillaCaja.prInicializar;
var
  I: Integer;
begin
  if boEsCajaDiaria then
  begin
     edit6.Text := FormatDatetime('dd/mm/yyyy', Date);
     edit8.Text := FormatDatetime('dd/mm/yyyy', Date);
     TodosCodigos.Checked := False;
     edUsuario.Text := fPrincipal.fUsuario;
     TodosUsuarios.Checked := False;
     cbCaja.EditValue := fPrincipal.fCodigoCaja;
     TodasCajas.checked := False;
     General.Caption := 'Caja Diaria - Usuario: ' + fPrincipal.fUsuario + ' - Fecha: ' + FormatDatetime('dd/mm/yyyy', Date);
     advGlowbutton1.Visible := False;
     advGlowbutton2.Visible := False;
     btnEliminar.Visible := True;
     btnNuevo.Visible := True;
     pnFiltros.Height := 30;

     TodosCodigos.Visible := False;
     TodosUsuarios.Visible := False;
     chMismoPropietario.Visible := False;

     for I := 1 to PageControl1.PageCount -1 do
       PageControl1.Pages[I].TabVisible := False;
     ActualizarClick(nil);
  end;

  if boBuscaItemsRepetidos then
  begin
//     edit6.Text := FormatDatetime('dd/mm/yyyy', Date);
//     edit8.Text := FormatDatetime('dd/mm/yyyy', Date);
//     TodosCodigos.Checked := False;
//     edUsuario.Text := fPrincipal.fUsuario;
//     TodosUsuarios.Checked := False;
//     cbCaja.EditValue := fPrincipal.fCodigoCaja;
//     TodasCajas.checked := False;
//    General.Caption := 'Caja Diaria - Usuario: ' + fPrincipal.fUsuario + ' - Fecha: ' + FormatDatetime('dd/mm/yyyy', Date);
     advGlowbutton1.Visible := False;
     advGlowbutton2.Visible := False;
     btnEliminar.Visible := True;
     btnNuevo.Visible := True;
     pnFiltros.Height := 30;
     gDetalle.ColWidths[0] := -1;
     gDetalle.ColWidths[5] := -1;
     gDetalle.ColWidths[6] := -1;
     gDetalle.ColWidths[7] := -1;
     gDetalle.ColWidths[8] := -1;
     gDetalle.ColWidths[9] := -1;
     gDetalle.ColWidths[12] := -1;
     gDetalle.Cells[11,0] := 'Veces';

     TodosCodigos.Visible := False;
     TodosUsuarios.Visible := False;
     chMismoPropietario.Visible := False;

     for I := 1 to PageControl1.PageCount -1 do
       PageControl1.Pages[I].TabVisible := False;
     ActualizarClick(nil);
  end
end;

end.

