unit frmmovimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ComCtrls, DBTables, Db, Grids, DBGrids, Buttons,
  ActnList, ImgList, ToolWin, Declaraciones, System.Actions, strUtils,
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
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox, AdvPanel, fxQuery;

type
  TfMovimientos = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ImageList1: TImageList;
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actBuscar: TAction;
    actCerrar: TAction;
    actDatoFijo: TAction;
    DataSource5: TDataSource;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    Panel3: TPanel;
    Label4: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    edtCodinq: TEdit;
    edtPropietario: TEdit;
    edtUbicacion: TComboBox;
    cbxInquilino: TEdit;
    pnlPanel: TPanel;
    Label7: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtFecha: TEdit;
    edtCodigo: TEdit;
    cbxDatoFijo: TComboBox;
    edtEstado: TEdit;
    edtDetalle: TEdit;
    edtImporte: TEdit;
    memDescripcion: TMemo;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label9: TLabel;
    chDiferencia: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNuevoClick(Sender: TObject);
    procedure edtCodinqKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtFechaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure cbxInquilinoKeyPress(Sender: TObject; var Key: Char);
    procedure edtUbicacionKeyPress(Sender: TObject; var Key: Char);
    procedure edtImporteKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3KeyPress(Sender: TObject; var Key: Char);
    procedure edtPropietarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtFechaEnter(Sender: TObject);
    procedure edtFechaExit(Sender: TObject);
    procedure edtEstadoEnter(Sender: TObject);
    procedure edtEstadoExit(Sender: TObject);
    procedure edtDetalleEnter(Sender: TObject);
    procedure cbxDatoFijoClick(Sender: TObject);
    procedure cbxDatoFijoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure actDatoFijoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure chDiferenciaClick(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
  end;

var
  fMovimientos: TfMovimientos;

implementation

uses frmPrincipal, Variants, frmDatos, Funciones, frmABMMovimientos;

{$R *.DFM}
procedure TfMovimientos.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
begin
  FOperacion := Operacion;
  edit1.Text := pCodigo;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := '';
    edtCodinq.Text := '';
    cbxInquilino.Text := '';
    cbxDatoFijo.Text := '';
    edtPropietario.Text := '';
    edtUbicacion.Text := '';
    edtFecha.text := '';
    edtEstado.Text := '';
    edtDetalle.text := '';
    memDescripcion.Text := '';
    edtImporte.text := '';
  end;

  if Operacion <> toNuevo then
  begin
    edtFecha.SetFocus;
    q := CrearQuery;
    try
      q.SQL.Text := 'Select I.*, IM.Inquilino, IM.Propietario, IM.Ubicacion from itemautom I inner join Inmuebles im on I.Codinq = IM.Codinq where I.Registro=:registro';
      q.ParamByName('Registro').AsInteger := StrtoInt(pCodigo);
      q.Open;

      edtCodinq.Text               := q.FieldbyName('Codinq').asstring;
      edtCodigo.Text               := q.FieldbyName('Coditem').asstring;
      cbxInquilino.Text            := q.Fieldbyname('Inquilino').asstring;
      edtPropietario.Text          := q.FieldbyName('Propietario').asstring;
      edtUbicacion.text            := q.FieldbyName('Ubicacion').asString;
      edtfecha.Text                := FechaConBarras(q.FieldbyName('Fecha').asstring);
      cbxDatoFijo.text             := q.FieldbyName('Item').asString;
      edtEstado.Text               := q.FieldbyName('TipoIngreso').asstring;
      edtDetalle.Text              := q.FieldbyName('Periodo').asString;
      edtImporte.Text              := q.FieldbyName('Importe').asString;

      btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
      edtCodinq.Enabled  := (Operacion in  [toNuevo]);
      edtCodigo.Enabled  := (Operacion in  [toNuevo]);
      cbxInquilino.Enabled  := (Operacion in  [toNuevo, toModificar]);
      edtPropietario.Enabled  := (Operacion in  [toNuevo, toModificar]);
      edtUbicacion.Enabled  := (Operacion in  [toNuevo, toModificar]);
      edtFecha.Enabled  := (Operacion in  [toNuevo, toModificar]);
      cbxDatoFijo.Enabled := (Operacion in  [toNuevo, toModificar]);
      edtEstado.Enabled   := (Operacion in  [toNuevo, toModificar]);
      edtDetalle.Enabled   := (Operacion in  [toNuevo, toModificar]);
      edtImporte.Enabled   := (Operacion in  [toNuevo, toModificar]);

    finally
      FreeAndNil(q);
    end;
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMMovimientos) then
      FABMMovimientos.ActualizarClick(nil);
  end;
end;


procedure TfMovimientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fMovimientos := nil;
end;

procedure TfMovimientos.btnNuevoClick(Sender: TObject);
begin
  actNuevo.Execute;
end;


procedure TfMovimientos.edtCodinqKeyPress(Sender: TObject; var Key: Char);
var
  Codinq: string;
  q: TFXQuery;

begin
  Codinq := edtCodinq.Text;
  q := CrearQuery;
  try
    if key=#13 then
    begin
      if length(Codinq) = 0 then
        edtCodinq.setfocus;
      Codinq := FormatFloat('0000', ToFloat(Codinq));
      edtCodinq.Text := Codinq;

      with q do
      begin
        Sql.Text := 'select * from automatizacion where codinq= :codinq';
        ParamByName('codinq').AsString := Codinq;
        Open;
        if not IsEmpty then
        begin
          edtCodinq.Text      := Fields[0].AsString;
          cbxInquilino.Text   := Fields[1].AsString;
          edtPropietario.Text := Fields[3].AsString;
          edtUbicacion.Text   := Fields[4].AsString;
        end
        else
        begin
          Sql.Text := 'select * from inmuebles where codinq= :codinq';
          ParamByName('codinq').AsString := Codinq;
          Open;
          if Not IsEmpty then
          begin
            edtCodinq.Text      := Fields[0].AsString;
            cbxInquilino.Text   := Fields[1].AsString;
            edtPropietario.Text := Fields[4].AsString;
            edtUbicacion.Text   := Fields[8].AsString;
          end
          else
          begin
            cbxInquilino.Text   := '';
            edtPropietario.Text := '';
            edtUbicacion.Text   := '';
            Showmessage('Inmueble correspondiente al inquilino '+ Codinq +' No cargado');
          end;
        end;
        edtFecha.setfocus;
        actNuevo.Execute;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.edtCodigoKeyPress(Sender: TObject; var Key: Char);
var
  Coditem: string;
  Fecha:   string;
  Nro:     string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if key=#13 then
    begin
      Coditem := edtCodigo.Text;

      chDiferencia.Visible := (toInt(Coditem) in [9,27,4,2,5,14]);

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
            Fecha := edtFecha.Text;
          end;
        end;
        Delete(Fecha,3,8);
        if validardatofijo(Fecha, Nro) then
        begin
          cbxDatoFijo.Text := q.Fieldbyname('Descripcion').AsString;
          edtEstado.setfocus;
        end
        else
        begin
          edtCodigo.Text := '';
          edtFecha.SetFocus;
          edtCodigo.SetFocus;
        end;
      end;
    end;
    actDatoFijo.Execute;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.edtFechaKeyPress(Sender: TObject; var Key: Char);
var
  Dia:   string;
  Fecha: string;
  q: TFXQuery;

begin
  q := CrearQuery;
  try
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
      Fecha := FechaAlReves(Fecha);

      with q do
      begin
        Sql.text := 'Select Coditem, Item, Periodo, Importe, TipoIngreso from ItemAutom Where fecha =:Fecha and Codinq= :Codinq';
        ParamByName('Fecha').AsString  := Fecha;
        ParamByName('Codinq').AsString := edtCodinq.Text;
        Open;
      end;
      edtCodigo.setfocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.edtEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'2', #13, #8])) then
    Key := #0;
  if (Length(edtEstado.text) = 1) and (not (CharInSet(Key,  [#8, #13]))) then
    Key := #0;
  if key=#13 then
  begin
    if edtEstado.Text = '' then
      edtEstado.Text := '0';
    edtDetalle.setfocus;
  end;
end;

procedure TfMovimientos.edtDetalleKeyPress(Sender: TObject; var Key: Char);
var
  CodFijo:     Integer;
  Codinq:      string;
  Ano:         string;
  Detalle:     string;
  Corresponde: string;
  MesPeriodo:  string;
  MesFecha:  string;
  Resto:       string;
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    case ToInt(edtCodigo.Text) of
      1, 2, 4, 5, 8, 12, 121, 13, 21, 24, 25, 28, 29, 36, 40, 41, 67, 400,401,402,503: begin
        if not (Key in ['0'..'9',#8,#13]) then
          Key := #0;
        end;
    end;


    if Key = #13 then
    begin
      try
      if Length(edtDetalle.Text) < 6 then
      begin
        CodFijo := StrToint(edtCodigo.Text);

        case CodFijo of
          1, 2, 4, 5, 8, 9, 12, 121, 13, 21, 24, 25, 28, 29, 36, 40, 41, 46, 67, 400,401,402,503: begin
            Codinq      := edtCodinq.Text;
            Detalle     := edtDetalle.Text;
            Delete(Detalle, 1, length(IntToStr(Codfijo)));
            MesPeriodo  := Detalle;
            Detalle     := DevuelveMes(StrToInt(Detalle));
            Ano         := edtFecha.Text;
            MesFecha    := Copy(edtFecha.Text,4,2);
            Delete(Ano, 1, 6);
            if (MesPeriodo = '12') and (MesFecha = '01') then
              Ano := Inttostr(ToInt(Ano) - 1);
            Corresponde := 'CORRESPONDE '+ Detalle + '/' + Ano;
          end;
          27: begin
            Codinq      := edtCodinq.Text;
            Detalle     := edtDetalle.Text;
            Delete(Detalle, 1, 1);
            MesPeriodo  := Detalle;
            Detalle     := DevuelveMes(StrToInt(Detalle));
            Ano         := edtFecha.Text;
            MesFecha    := Copy(edtFecha.Text,4,2);
            Delete(Ano, 1, 6);
            if (MesPeriodo = '12') and (MesFecha = '01') then
              Ano := Inttostr(ToInt(Ano) - 1);
            Corresponde := 'CORRESPONDE '+ Detalle + '/' + Ano;
          end;

        end;
        case CodFijo of
          1: begin
            edtDetalle.Text := Corresponde;
            q.Close;
            q.Sql.Clear;
            q.Sql.Add('select alquiler from automatizacion where codinq=:codinq');
            q.ParamByName('codinq').AsString := CodInq;
            q.Open;
            edtImporte.Text := q.FieldbyName('Alquiler').AsString;
          end;
          2: begin
            edtDetalle.Text := 'AGUAS CORDOBESAS PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
          end;
          4: begin
            Case StrToInt(EdtDetalle.Text) of
              41: edtDetalle.Text := 'D.G.R. 1RA. CUOTA /' + Ano;
              42: edtDetalle.Text := 'D.G.R. 2DA. CUOTA /' + Ano;
              43: edtDetalle.Text := 'D.G.R. 3RA. CUOTA /' + Ano;
              44: edtDetalle.Text := 'D.G.R. 4TA. CUOTA /' + Ano;
              45: edtDetalle.Text := 'D.G.R. 5TA. CUOTA /' + Ano;
              46: edtDetalle.Text := 'D.G.R. 6TA. CUOTA /' + Ano;
              47: edtDetalle.Text := 'D.G.R. 7MA. CUOTA /' + Ano;
              48: edtDetalle.Text := 'D.G.R. 8VA. CUOTA /' + Ano;
              49: edtDetalle.Text := 'D.G.R. 9NA. CUOTA /' + Ano;
              410: edtDetalle.Text := 'D.G.R. 10MA. CUOTA /' + Ano;
            end;
          end;
          5: begin
            edtDetalle.Text := 'TASA MUNICIPAL PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
          end;
          8: begin
            edtDetalle.Text:='SEGUN ART. 7MO. CONTRATO DE LOCACION PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;;
          end;
          9, 27: begin
            Case StrToInt(EdtDetalle.Text) of
              141: edtDetalle.Text := 'EXPS. COMUNES PER. 01/' + Ano;
              142: edtDetalle.Text := 'EXPS. COMUNES PER. 02/' + Ano;
              143: edtDetalle.Text := 'EXPS. COMUNES PER. 03/' + Ano;
              144: edtDetalle.Text := 'EXPS. COMUNES PER. 04/' + Ano;
              145: edtDetalle.Text := 'EXPS. COMUNES PER. 05/' + Ano;
              146: edtDetalle.Text := 'EXPS. COMUNES PER. 06/' + Ano;
              147: edtDetalle.Text := 'EXPS. COMUNES PER. 07/' + Ano;
              148: edtDetalle.Text := 'EXPS. COMUNES PER. 08/' + Ano;
              149: edtDetalle.Text := 'EXPS. COMUNES PER. 09/' + Ano;
              1410: edtDetalle.Text := 'EXPS. COMUNES PER. 10/' + Ano;
              1411: edtDetalle.Text := 'EXPS. COMUNES PER. 11/' + Ano;
              1412: edtDetalle.Text := 'EXPS. COMUNES PER. 12/' + Ano;

              21..29, 210..212: edtDetalle.Text := 'AGUAS CORDOBESAS PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
              41:               edtDetalle.Text := 'D.G.R. 1RA. CUOTA /' + Ano;
              42:               edtDetalle.Text := 'D.G.R. 2DA. CUOTA /' + Ano;
              43:               edtDetalle.Text := 'D.G.R. 3RA. CUOTA /' + Ano;
              44:               edtDetalle.Text := 'D.G.R. 4TA. CUOTA /' + Ano;
              45:               edtDetalle.Text := 'D.G.R. 5TA. CUOTA /' + Ano;
              46:               edtDetalle.Text := 'D.G.R. 6TA. CUOTA /' + Ano;
              47:               edtDetalle.Text := 'D.G.R. 7MA. CUOTA /' + Ano;
              48:               edtDetalle.Text := 'D.G.R. 8VA. CUOTA /' + Ano;
              49:               edtDetalle.Text := 'D.G.R. 9NA. CUOTA /' + Ano;
              410:              edtDetalle.Text := 'D.G.R. 10MA. CUOTA /' + Ano;
              51..59, 510..512: edtDetalle.Text := 'TASA MUNICIPAL PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
            end;
          end;
          12, 121: begin
            edtDetalle.Text := 'DE ALQUILER '+ Corresponde;
          end;

          13,21:begin
            Case StrToInt(EdtDetalle.Text) of
              2110: edtDetalle.Text := 'NO ESPERAR HASTA ULTIMO MOMENTO PARA';
              1310: edtDetalle.Text := 'PAGAR EL ALQUILER. EVITE PUNITORIOS.';
              1311: edtDetalle.Text := 'ABONANDOLOS RECUERDE UD. QUE FUE ADVERTIDO';
              2101: edtDetalle.Text := 'SEGUN ART. 3º CONTRATO LOCACION HAN VENCIDO';
              1301: edtDetalle.Text := 'LOS PLAZOS PARA EL PEDIDO DE ARREGLOS. PARA';
              1302: edtDetalle.Text := 'UNA MEJOR CONVIVENCIA CUMPLAMOS LO CONVERSADO.';
              1303: edtDetalle.Text := 'Y FIRMADO EN SU OPORTUNIDAD.';
              1304: edtDetalle.Text := 'NO INCLUYE VICIOS OCULTOS. MUCHAS GRACIAS.';
            end;
            //btnGrabar.click;
          end;
          24: begin
           edtDetalle.Text:='SEGUN ART. 2DO. CONTRATO DE LOCACION PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;;

          end;
          25: begin
            edtDetalle.Text := 'DE CONTRATO '+ Corresponde;

          end;
          41: begin
            edtDetalle.Text := Corresponde;

          end;
          28:begin
            Case StrToInt(EdtDetalle.Text) of
              281: edtDetalle.Text := 'EXPS. COMUNES PER. ENE/' + Ano;
              282: edtDetalle.Text := 'EXPS. COMUNES PER. FEB/' + Ano;
              283: edtDetalle.Text := 'EXPS. COMUNES PER. MAR/' + Ano;
              284: edtDetalle.Text := 'EXPS. COMUNES PER. ABR/' + Ano;
              285: edtDetalle.Text := 'EXPS. COMUNES PER. MAY/' + Ano;
              286: edtDetalle.Text := 'EXPS. COMUNES PER. JUN/' + Ano;
              287: edtDetalle.Text := 'EXPS. COMUNES PER. JUL/' + Ano;
              288: edtDetalle.Text := 'EXPS. COMUNES PER. AGO/' + Ano;
              289: edtDetalle.Text := 'EXPS. COMUNES PER. SEP/' + Ano;
              2810: edtDetalle.Text := 'EXPS. COMUNES PER. OCT/' + Ano;
              2811: edtDetalle.Text := 'EXPS. COMUNES PER. NOV/' + Ano;
              2812: edtDetalle.Text := 'EXPS. COMUNES PER. DIC/' + Ano;
            end;
           end;

          29: begin
            MesPeriodo := edtDetalle.Text;
            Delete(MesPeriodo, 1, 3);
            Case StrToInt(EdtDetalle.Text) of
              2921..2929, 29210..29212: edtDetalle.Text := 'AGUAS CORDOBESAS PER. '+ FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
              2941: edtDetalle.Text := 'D.G.R. 1RA. CUOTA /'+ Ano;
              2942: edtDetalle.Text := 'D.G.R. 2DA. CUOTA /'+ Ano;
              2943: edtDetalle.Text := 'D.G.R. 3RA. CUOTA /'+ Ano;
              2944: edtDetalle.Text := 'D.G.R. 4TA. CUOTA /'+ Ano;
              2945: edtDetalle.Text := 'D.G.R. 5TA. CUOTA /'+ Ano;
              2946: edtDetalle.Text := 'D.G.R. 6TA. CUOTA /'+ Ano;
              2947: edtDetalle.Text := 'D.G.R. 7MA. CUOTA /'+ Ano;
              2948: edtDetalle.Text := 'D.G.R. 8VA. CUOTA /'+ Ano;
              2949: edtDetalle.Text := 'D.G.R. 9NA. CUOTA /'+ Ano;
              29410: edtDetalle.Text := 'D.G.R. 10MA. CUOTA /'+ Ano;

              29450: edtDetalle.Text := 'D.G.R. CUOTA 50 /'+ Ano;
              2940: edtDetalle.Text := 'D.G.R. CUOTA UNICA/'+ Ano;

              2951..2959, 29510..29512: edtDetalle.Text := 'TASA MUNICIPAL PER. '+ FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
              29550: edtDetalle.Text := 'TASA MUNICIPAL CUOTA 50/' + Ano;
            end;
            if length(EdtDetalle.Text)<=6 then
              Case StrToInt(EdtDetalle.Text) of
                29141: edtDetalle.Text := 'EXPS. COMUNES PER. ENE/' + Ano;
                29142: edtDetalle.Text := 'EXPS. COMUNES PER. FEB/' + Ano;
                29143: edtDetalle.Text := 'EXPS. COMUNES PER. MAR/' + Ano;
                29144: edtDetalle.Text := 'EXPS. COMUNES PER. ABR/' + Ano;
                29145: edtDetalle.Text := 'EXPS. COMUNES PER. MAY/' + Ano;
                29146: edtDetalle.Text := 'EXPS. COMUNES PER. JUN/' + Ano;
                29147: edtDetalle.Text := 'EXPS. COMUNES PER. JUL/' + Ano;
                29148: edtDetalle.Text := 'EXPS. COMUNES PER. AGO/' + Ano;
                29149: edtDetalle.Text := 'EXPS. COMUNES PER. SET/' + Ano;
                291410: edtDetalle.Text := 'EXPS. COMUNES PER. OCT/' + Ano;
                291411: edtDetalle.Text := 'EXPS. COMUNES PER. NOV/' + Ano;
                291412: edtDetalle.Text := 'EXPS. COMUNES PER. DIC/' + Ano;
              end;
          end;
          36, 40, 400,401,402,503: begin
            Case StrToInt(EdtcODIGO.Text) of
              360, 400,503: edtDetalle.Text := 'NO A CUENTA DE TERCEROS PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
              361, 401: edtDetalle.Text := 'NO A CUENTA DE TERCEROS PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
              362, 402: edtDetalle.Text := 'NO A CUENTA DE TERCEROS PER. ' + FormatFloat('00', ToFloat(MesPeriodo)) + '/' + Ano;
            end;
          end;
          46,67:begin
            Case StrToInt(EdtDetalle.Text) of
              461: edtDetalle.Text := 'MES PROXIMO FECHA DE PAGO ELEGIDA TIENE VTO.';
              671: edtDetalle.Text := 'DIA NO HABIL. ANTICIPESE. EVITE PUNITORIOS.';
            end;
          end;
        end;
        edtImporte.setfocus;
      end;
      except
        On E: Exception do
          edtImporte.SetFocus;
      end;
      if (Key = #13) and (edtCodigo.Text = '28') then
        if Pos('EXPS. COMUNES', edtDetalle.text) > 0 then
        begin
          if Pos('PER.', edtDetalle.text) <> 15 then
          begin
            MostrarDialogoAceptar('Expensas Mal cargadas. Por favor Verifique. ');
            edtDetalle.text := '';
            edtDetalle.setfocus;
            Exit;
          end;
          Resto := Copy(edtDetalle.Text, 19, 200);
          if Length(Trim(Resto)) <> 8 then
          begin
            MostrarDialogoAceptar('Expensas Mal cargadas. Por favor Verifique. ');
            edtDetalle.text := '';
            edtDetalle.setfocus;
            Exit;
          end;
        end
        else
          edtImporte.setfocus;

      if (Key = #13) and (edtCodigo.Text = '29') then
      begin
        if POS('EXP', edtDetalle.text) > 0 then
        BEGIN
          if POS('EXPS. COMUNES ', EDTdETALLE.Text) = 0 THEN
          begin
            showmessage('DATO MAL CARGADO. POR FAVOR VERIFIQUE');
            EDTdETALLE.Text :='';
            EDTdETALLE.SETFOCUS;
          END
          ELSE
            EDTiMPORTE.SeTFOCUS;
        END;
      END;

    end;
    if Length(edtDetalle.Text) > 49 then
      edtImporte.SetFocus;
    if (Key = #13) and (edtCodigo.Text = '15') then
      edtImporte.SetFocus;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfMovimientos.cbxInquilinoKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      with q do
      begin
        Close;
        Sql.clear;
        Sql.Add('select * from automatizacion where inquilino=:inquilino');
        ParamByName('inquilino').AsString := cbxInquilino.Text;
        Open;
        if RecordCount > 0 then
        begin
          edtCodinq.Text      := Fields[0].AsString;
          cbxInquilino.Text   := Fields[1].AsString;
          edtPropietario.Text := Fields[3].AsString;
          edtUbicacion.Text   := Fields[4].AsString;
        end;
        if RecordCount = 0 then
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where inquilino= :inquilino');
          ParamByName('inquilino').AsString:=cbxInquilino.Text;
          open;
          if RecordCount > 0 then
          begin
            edtCodinq.Text      := Fields[0].AsString;
            cbxInquilino.Text   := Fields[1].AsString;
            edtPropietario.Text := Fields[4].AsString;
            edtUbicacion.Text   := Fields[8].AsString;
          end
          else
          begin
            cbxInquilino.Text   := '';
            edtPropietario.Text := '';
            edtUbicacion.Text   := '';
            Showmessage('Inmueble correspondiente al inquilino ' + cbxInquilino.Text + ' No cargado');
          end;
        end;
        edtFecha.SetFocus;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.chDiferenciaClick(Sender: TObject);
begin
  if Trim(edtDetalle.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar texto antes. Verifique por favor');
    chDiferencia.OnClick := nil;
    chDiferencia.Checked := False;
    chDiferencia.OnClick := chDiferenciaClick;
    Exit;
  end;

  if chDiferencia.Checked then
    edtDetalle.Text := 'DIFERENCIA ' + EDTDETALLE.Text
  else
    edtDetalle.Text := AnsiReplaceStr(EDTDETALLE.Text, 'DIFERENCIA ', '');
end;

procedure TfMovimientos.ComboBox1Click(Sender: TObject);
begin
  edtDetalle.Text := Combobox1.Text;
  Combobox1.Text := '';
end;

procedure TfMovimientos.ComboBox1DropDown(Sender: TObject);
var
  CodFijo: Integer;
  Codinq, Ano: String;
begin
  Combobox1.Clear;

  CodFijo := StrToint(edtCodigo.Text);
  case CodFijo of
    1:
    begin
      Codinq      := edtCodinq.Text;
      Ano         := edtFecha.Text;;
      Delete(Ano, 1, 6);
      combobox1.Items.Add('CORRESPONDE ENERO/' + Ano);
      combobox1.Items.Add('CORRESPONDE FEBRERO/' + Ano);
      combobox1.Items.Add('CORRESPONDE MARZO/' + Ano);
      combobox1.Items.Add('CORRESPONDE ABRIL/' + Ano);
      combobox1.Items.Add('CORRESPONDE MAYO/' + Ano);
      combobox1.Items.Add('CORRESPONDE JUNIO/' + Ano);
      combobox1.Items.Add('CORRESPONDE JULIO/' + Ano);
      combobox1.Items.Add('CORRESPONDE AGOSTO/' + Ano);
      combobox1.Items.Add('CORRESPONDE SEPTIEMBRE/' + Ano);
      combobox1.Items.Add('CORRESPONDE OCTUBRE/' + Ano);
      combobox1.Items.Add('CORRESPONDE NOVIEMBRE/' + Ano);
      combobox1.Items.Add('CORRESPONDE DICIEMBRE/' + Ano);
    end;
    2: begin
      Ano         := edtFecha.Text;;
      Delete(Ano, 1, 6);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 01/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 02/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 03/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 04/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 05/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 06/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 07/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 08/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 09/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 10/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 11/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 12/' + Ano);
    end;
    4: begin
      Ano         := edtFecha.Text;;
      Delete(Ano, 1, 6);
      combobox1.Items.Add('D.G.R. 1RA CUOTA /' + Ano);
      combobox1.Items.Add('D.G.R. 2DA CUOTA /' + Ano);
      combobox1.Items.Add('D.G.R. 3RA CUOTA /' + Ano);
      combobox1.Items.Add('D.G.R. 4TA CUOTA /' + Ano);
    end;
    5: begin
      Ano         := edtFecha.Text;;
      Delete(Ano, 1, 6);
      combobox1.Items.Add('TASA MUNICIPAL PER. 01/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 02/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 03/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 04/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 05/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 06/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 07/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 08/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 09/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 10/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 11/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 12/' + Ano);
    end;
    8: begin
      combobox1.Items.Add('SEGUN ART. 7MO DE CONTRATO DE LOCACION');
    end;
    9, 29: begin
      Ano         := edtFecha.Text;;
      Delete(Ano, 1, 6);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 01/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 02/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 03/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 04/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 05/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 06/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 07/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 08/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 09/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 10/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 11/' + Ano);
      combobox1.Items.Add('AGUAS CORDOBESAS PER. 12/' + Ano);
      combobox1.Items.Add('D.G.R. 1RA CUOTA /' + Ano);
      combobox1.Items.Add('D.G.R. 2DA CUOTA /' + Ano);
      combobox1.Items.Add('D.G.R. 3RA CUOTA /' + Ano);
      combobox1.Items.Add('D.G.R. 4TA CUOTA /' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 01/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 02/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 03/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 04/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 05/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 06/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 07/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 08/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 09/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 10/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 11/' + Ano);
      combobox1.Items.Add('TASA MUNICIPAL PER. 12/' + Ano);
    end;
    13, 21: begin
      combobox1.Items.Add('NO ESPERAR HASTA ULTIMO MOMENTO PARA');
      combobox1.Items.Add('PAGAR EL ALQUILER. EVITE PUNITORIOS.');
      combobox1.Items.Add('ABONANDOLOS RECUERDE UD. QUE FUE ADVERTIDO');
      combobox1.Items.Add('SEGUN ART. 3º CONTRATO LOCACION HAN VENCIDO');
      combobox1.Items.Add('LOS PLAZOS PARA EL PEDIDO DE ARREGLOS. PARA');
      combobox1.Items.Add('UNA MEJOR CONVIVENCIA CUMPLAMOS LO CONVERSADO');
      combobox1.Items.Add('Y FIRMADO EN SU OPORTUNIDAD.');
      combobox1.Items.Add('NO INCLUYE VICIOS OCULTOS. MUCHAS GRACIAS.');
    end;
    28: begin
      Ano         := edtFecha.Text;;
      Delete(Ano, 1, 6);

      combobox1.Items.Add('EXPS. COMUNES PER. ENE/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. FEB/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. MAR/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. ABR/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. MAY/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. JUN/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. JUL/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. AGO/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. SEP/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. OCT/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. NOV/' + Ano);
      combobox1.Items.Add('EXPS. COMUNES PER. DIC/' + Ano);
    end;
    36, 40: begin
      combobox1.Items.Add('CUOTA UNICA');
      combobox1.Items.Add('1º CUOTA DE (2)');
      combobox1.Items.Add('2º CUOTA DE (2)');
    end;
    46: begin
      combobox1.Items.Add('MES PROXIMO FECHA DE PAGO ELEGIDA TIENE VTO.');
      combobox1.Items.Add('DIA NO HABIL. ANTICIPESE. EVITE PUNITORIOS.');
    end;
  end;

end;

procedure TfMovimientos.edtUbicacionKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      with q do
      begin
        Close;
        Sql.clear;
        Sql.Add('select * from inmuebles where ubicacion= :ubicacion');
        ParamByName('ubicacion').AsString := edtUbicacion.Text;
        open;
        edtCodinq.Text      := Fields[0].AsString;
        cbxInquilino.Text   := Fields[1].AsString;
        edtPropietario.Text := Fields[3].AsString;
        edtUbicacion.Text   := Fields[4].AsString;
        if RecordCount = 0 then
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where ubicacion= :ubicacion');
          ParamByName('ubicacion').AsString := edtUbicacion.Text;
          open;
          if recordcount > 0 then
          begin
            edtCodinq.Text      := Fields[0].AsString;
            cbxInquilino.Text   := Fields[1].AsString;
            edtPropietario.Text := Fields[4].AsString;
            edtUbicacion.Text   := Fields[8].AsString;
          end
          else
          begin
            cbxInquilino.Text   := '';
            edtPropietario.Text := '';
            edtUbicacion.Text   := '';
            Showmessage('Inmueble correspondiente al Inquilino seleccionado no cargado');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.edtImporteKeyPress(Sender: TObject; var Key: Char);
var
  Importe: string;
  Codigo:  Integer;
begin
  if Key = #13 then
  begin
    Importe := edtImporte.Text;
    if (Importe = '') or (Importe = ' ') then
      Importe := '0.00';
    Importe := FormatFloat('0.00', ToFLoat(Importe));
    Codigo  := StrToInt(edtCodigo.Text);
    Case Codigo of
      10,11,45,61,49,75,27,34,54,52:
        if Importe[1] = '-' then
          edtImporte.Text := Importe
        else
          if Importe <> '0.00' then
            Importe := '-' + Importe;
    end;
    edtImporte.Text := Importe;

    if btnGrabar.Enabled then
      btnGrabar.Click;

    edtCodinq.SetFocus;
  end;
end;


procedure TfMovimientos.BitBtn3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
  begin
  end;

end;

procedure TfMovimientos.edtPropietarioKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if Key = #13 then
    begin
      with q do
      begin
        Close;
        Sql.clear;
        Sql.Add('select * from inmuebles where propietario=:propietario');
        ParamByName('propietario').AsString := edtPropietario.Text;
        Open;
        FetchAll;
        RecordCount;
        Close;
        Sql.Clear;
        Sql.Add('select * from automatizacion where propietario=:propietario');
        Open;
        ParamByName('propietario').AsString := edtPropietario.Text;

        if RecordCount > 0 then
        begin
          edtCodinq.Text      := Fields[0].AsString;
          cbxInquilino.Text   := Fields[1].AsString;
          edtPropietario.Text := Fields[3].AsString;
          edtUbicacion.Text   := Fields[4].AsString;
        end;
        if RecordCount = 0 then
        begin
          Close;
          Sql.clear;
          Sql.Add('select * from inmuebles where propietario=:propietario');
          ParamByName('propietario').AsString := edtPropietario.Text;
          Open;
          FetchAll;
          if Recordcount > 0 then
          begin
            edtCodinq.Text      := Fields[0].AsString;
            cbxInquilino.Text   := Fields[1].AsString;
            edtPropietario.Text := Fields[4].AsString;
            edtUbicacion.Text   := Fields[8].AsString;
          end
          else
          begin
            cbxInquilino.Text   :='';
            edtPropietario.Text :='';
            edtUbicacion.Text   :='';
            Showmessage('Inmueble correspondiente al Propietario '+'a'+' No cargado');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.edtFechaEnter(Sender: TObject);
begin
  label2.Visible := True;
  label3.Visible := True;
end;

procedure TfMovimientos.edtFechaExit(Sender: TObject);
var
  Fecha: TDatetime;
begin
  label2.Visible := False;
  label3.Visible := False;
  if not TryStrtoDate(edtFecha.Text, Fecha) then
  begin
     MostrarDialogoAceptar('Fecha Incorrecta. Verifique Por Favor.');
     edtFecha.Text := '';
     edtFecha.SetFocus;
  end;

end;

procedure TfMovimientos.edtEstadoEnter(Sender: TObject);
begin
  label10.Visible := True;
  label11.Visible := True;
  label12.Visible := True;
end;

procedure TfMovimientos.edtEstadoExit(Sender: TObject);
begin
  label10.Visible := False;
  label11.Visible := False;
  label12.Visible := False;
end;

procedure TfMovimientos.edtDetalleEnter(Sender: TObject);
begin
  memDescripcion.Lines.Clear;
  case StrToInt(edtCodigo.Text) of
    1:begin
      memDescripcion.Lines.add('En Detalle ingresar 1 que es el COD. FIJO de ALQUILER');
      memDescripcion.Lines.Add('el MES que se desea cobrar 11 es ENERO...112 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    2:begin
      memDescripcion.Lines.add('En Detalle ingresar 2 que es el COD. FIJO de AGUAS CORDOBESAS');
      memDescripcion.Lines.Add('el PERIODO que se desea cobrar 21 es ENERO...212 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    4:begin
      memDescripcion.Lines.add('En Detalle ingresar 4 que es el COD. FIJO de D.G.R.');
      memDescripcion.Lines.Add('41 es 1ra. cuota de año...44 es 4ta. couta del año');
      memDescripcion.Refresh;
    end;
    5:begin
      memDescripcion.Lines.add('En Detalle ingresar 5 que es el COD. FIJO de TASA MUNICIPAL');
      memDescripcion.Lines.Add('51 es ENERO...512 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    8:begin
      memDescripcion.Lines.add('En Detalle ingresar 8 que es el COD. FIJO de A CTA. IMP.');
      memDescripcion.Lines.Add('81 es ENERO...812 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    9, 27:begin
      memDescripcion.Lines.add('En Detalle ingresar 2 que es el COD. FIJO de AGUAS CORDOBESAS');
      memDescripcion.Lines.Add('4 es el COD. FIJO de DGR, 5 es el COD FIJO DE TASA MUN., 14 es EXPS. COMUNES ');
      memDescripcion.Lines.Add('ASI 210 es AGUAS CORDOBESAS MES DE OCTUBRE');
      memDescripcion.Refresh;
    end;
    12, 121:begin
      memDescripcion.Lines.add('En Detalle ingresar 12 que es el COD. FIJO de COMISION POR ADMINISTRACION');
      memDescripcion.Lines.Add('el PERIODO que se desea cobrar 121 es ENERO...1212 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    13,21:begin
      memDescripcion.Lines.add('En este código hay opciones fijas');
      memDescripcion.Lines.Add('2110 - NO ESPERAR HASTA ULTIMO MOMENTO PARA (1º Renglón)');
      memDescripcion.Lines.Add('1310 - PAGAR EL ALQUILER. EVITE PUNITORIOS. (2º Renglón)');
      memDescripcion.Lines.Add('1311 - ABONANDOLOS RECUERDE UD. QUE FUE ADVERTIDO (2º Renglón)');
      memDescripcion.Lines.Add('2101 - SEGUN ART. 3º CONTRATO LOCACION HAN VENCIDO (1º Renglón)');
      memDescripcion.Lines.Add('1301 - (1º Renglon) - 1302 (2º Renglón) - 1303 (3º Renglón) ');
      memDescripcion.Refresh;
    end;
    24:begin
      memDescripcion.Lines.add('En Detalle ingresar 24 que es el COD. FIJO de PUNITORIOS');
      memDescripcion.Lines.Add('el MES que se desea cobrar 241 es ENERO...2412 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    41:begin
      memDescripcion.Lines.add('En Detalle ingresar 41 que es el COD. FIJO de LIQUIDACION POR MORA');
      memDescripcion.Lines.Add('el MES que se desea cobrar 411 es ENERO...4112 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    25:begin
      memDescripcion.Lines.add('En Detalle ingresar 25 que es el COD. FIJO de SELLADO');
      memDescripcion.Lines.Add('el MES que se desea cobrar 251 es ENERO...2512 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
    28:begin
      memDescripcion.Lines.add('En Detalle ingresar 28 que es el COD. FIJO de INQUILINO ACREDITA ABONADO');
      memDescripcion.Lines.Add('el MES que se desea cobrar 281 es ENERO...2812 es DICIEMBRE');
      memDescripcion.Refresh;
    end;

    29:begin
      memDescripcion.Lines.add('En Detalle ingresar 29 + 2 que es el COD. FIJO de AGUAS CORDOBESAS');
      memDescripcion.Lines.Add('4 es el COD. FIJO de DGR, 5 es el COD FIJO DE TASA MUN.');
      memDescripcion.Lines.Add('ASI 210 es AGUAS CORDOBESAS MES DE OCTUBRE');
      memDescripcion.Refresh;
    end;
    36:begin
      memDescripcion.Lines.add('En Detalle ingresar 36 COD. FIJO de COMISION P/ CONF. CONTRATO');
      memDescripcion.Lines.Add('0 si la COMISION ES EN UNA SOLA CUOTA. SI LA COMISION ES EN');
      memDescripcion.Lines.Add('2 CUOTAS... 361 PARA LA 1º CUOTA Y 362 PARA LA 2º CUOTA');
      memDescripcion.Refresh;
    end;
    46,67:begin
      memDescripcion.Lines.add('En ESTE CODIGO HAY OPCIONES FIJAS ');
      memDescripcion.Lines.Add('461 pone MES PROXIMO FECHA DE PAGO ELEGIDA TIENE VTO.');
      memDescripcion.Lines.Add('671 pone DIA NO HABIL. ANTICIPESE. EVITE PUNITORIOS.');
      memDescripcion.Refresh;
    end;
    64:begin
      edtDetalle.Text:='EXPS. COM. XXXX ART. 7º CONTRATO';
      edtImporte.setfocus;
    end;
    70:begin
      edtDetalle.Text:='CBU 02009227-11000001005330 SUC. 922';
      edtImporte.setfocus;
    end;
    400, 401, 402, 503: begin
      memDescripcion.Lines.add('En Detalle ingresar 400, 401, 402 o 503 que es el COD. FIJO de COMISION CONF. CONTRATO');
      memDescripcion.Lines.Add('el MES que se desea cobrar 4001 es ENERO...40012 es DICIEMBRE');
      memDescripcion.Refresh;
    end;
  end;
end;

procedure tfMovimientos.cbxDatoFijoExit(sender:tobject);
begin
  if length(edtCodigo.Text)=0 then
    cbxDatoFijo.Text:='';
end;

procedure TfMovimientos.cbxDatoFijoClick(Sender: TObject);
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
            edtEstado.setfocus;
          end
          else
          begin
            edtCodigo.Text   := '';
            cbxDatoFijo.Text := '';
            MostrarDialogoAceptar('Dato fijo invalido para este caso'+#13+'Por favor Verifique...',mtwarning);
            edtCodigo.setfocus;
          end;
          if edtCodigo.Text = '' then
            cbxDatoFijo.Text := '';
        end;
      end;
      actDatoFijo.Execute;
    end;
  finally
    FreeAndNil(ibqConsulta);
  end;
end;

procedure TfMovimientos.edtCodigoEnter(Sender: TObject);
begin
  if length(edtCodigo.Text) = 0 then
    cbxDatoFijo.Text := '';

end;

procedure TfMovimientos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfMovimientos.actNuevoExecute(Sender: TObject);
begin
  edtCodigo.Text   := '';
  edtFecha.Text    := '';
  edtEstado.Text   := '';
  edtDetalle.Text  :='';
  edtImporte.Text  :='';
  cbxDatoFijo.Text :='';
  memDescripcion.lines.clear;
//  btnGrabar.Enabled := True;
end;

procedure TfMovimientos.actBorrarExecute(Sender: TObject);
var
  Codigo: String;
  q: TFXQuery;

begin
  if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
  begin
    DM.IniciarTransaccion;
    q := CrearQuery;
    try
      try
        Codigo := EdtCodigo.Text;
        q.SQL.Text := ' Delete From ItemAutom where Registro = :Registro';
        q.ParamByName('Registro').AsString := edit1.Text;
        q.ExecSQL;

        q.SQL.Text := ' Delete From CtaCteInquilino where IDMovimiento = :Registro';
        q.ParamByName('Registro').AsString := edit1.Text;
        q.ExecSQL;

        q.SQL.Text := ' Delete From CtaCtePropietario where IDMovimiento = :Registro';
        q.ParamByName('Registro').AsString := edit1.Text;
        q.ExecSQL;

        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar('Movimiento Eliminado Satisfactoriamente.');
      Except
        on e: exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Ocurrio un error al eliminar el movimiento. Datos Técnicos: ' + e.Message);
        end;
      end;
    finally
      FreeAndNil(q);
    end;
  end;
end;

procedure TfMovimientos.actDatoFijoExecute(Sender: TObject);
var
  Codigo: string;
  F:      string;
  G:      string;
  q:      TFXQuery;
begin
  q := CrearQuery;
  try
    Codigo := edtCodigo.Text;
    if length(Codigo) = 1 then
      Codigo := '0' + Codigo;
    with q do
    begin
      Sql.text := 'Select distinct * from conceptos where codigo=:codigo order by codigo';
      ParamByName('codigo').AsString := Codigo;
      Open;
      while not eof do
      begin
        f := Fields[2].AsString;
        g := Fields[3].AsString;
        if f = '0' then f := 'A';
        if f = '1' then f := 'I';
        if f = '2' then f := 'P';
        if g = '0' then g := 'T';
        if g = '1' then g := 'P';
        if g = '2' then g := 'I';
        if g = '3' then g := 'E';
        Next;
      end;
      Label9.Caption := F + ' - ' + G;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfMovimientos.actGrabarExecute(Sender: TObject);
var
  Coditem: string;
  Codinq:  string;
  Fecha:   string;
  Clave:   string;
  q: TFXQuery;
  qCtaCte: TFXQuery;
  Registro: Integer;
  qRegistro: TFXQuery;
  EsDebe: Boolean;
  dtFecha: TDatetime;
  Importe: Double;
  anio: Integer;
  MES: iNTEGER;
  stBuscar: string;
begin
  Registro := 0;

  if not TryStrtoDate(edtFecha.Text, dtFecha) then
  begin
     MostrarDialogoAceptar('Fecha Incorrecta. Verifique Por Favor.');
     Exit;
  end;
  if not TryStrtoFloat(edtImporte.Text, Importe) then
  begin
     MostrarDialogoAceptar('Importe Incorrecto. Verifique Por Favor.');
     Exit;
  end;
  edtImporte.Text := FormatFloat('0.00', ToFloat(edtImporte.Text));

  if Length(edtFecha.Text)<> 10  then
  begin
     MostrarDialogoAceptar('Fecha Incorrecta. Verifique Por Favor.');
     Exit;
  end;
  if Length(edtCodigo.Text)= 0  then
  begin
     MostrarDialogoAceptar('Falta el Concepto. Verifique Por Favor.');
     Exit;
  end;
  if Length(cbxDatoFijo.Text)= 0  then
  begin
     MostrarDialogoAceptar('Falta la descripcion . Verifique Por Favor.');
     Exit;
  end;
  if Length(edtDetalle.Text)= 0  then
  begin
     MostrarDialogoAceptar('Falta el detalle. Verifique Por Favor.');
     Exit;
  end;
  if Length(edtImporte.Text)=0  then
  begin
     MostrarDialogoAceptar('Fecha Incorrecta. Verifique Por Favor.');
     Exit;
  end;

  btnGrabar.Enabled := False;
  Fecha             := edtFecha.Text;
  Fecha             := Fechaalreves(Fecha);
  Codinq            := edtCodinq.text;
  Coditem           := edtCodigo.text;
  Clave             := Fecha + Codinq + Coditem;
  if edtEstado.text='' then
    edtEstado.Text :='0';
  Case StrtoInt(edtEstado.Text) of
    1: begin
         edtPropietario.Text := 'edtPropietario.Text';
       end;
  end;
  if Trim(EdtImporte.Text) = '' then
    edtImporte.Text := '0.00';
  if Trim(Edtestado.Text) = '' then
    edtEstado.Text := '0';

  ANIO := ToInt(Copy(Fecha, 1, 4));
  Mes  := ToInt(Copy(Fecha, 5, 2));

  stBuscar := 'CORRESPONDE ' + dEVUELVEMES(mES) + '/' + INttostr(ANIO);
  Codinq := edtCodinq.Text;
  Codinq := FormatFloat('0000', ToFloat(Codinq));

  q := CrearQuery;
  try
    q.Sql.text := ' Select C.* '+
                  '   from cuerporecibos c ' +
                  '  Where C.Tipo = ''LI''' +
                  '    and C.Codinq = :Codinq '+
                  '    and C.Periodo = :Periodo ';
    q.ParambyName('Codinq').AsString := Codinq;
    q.ParambyName('Periodo').AsString := stBuscar;
    q.Open;

    if not q.IsEmpty then
    begin
      if not MostrarDialogoSinO('Ya existe una liquidación para la fecha indicada. ¿Esta seguro de grabar los datos?',mtError, mbNO) then
        Exit;
    end
    else
      if not MostrarDialogoSinO('¿Esta seguro de grabar los datos?', mbYes) then
        Exit;
  finally
    q.Free;
  end;

  q := CrearQuery;
  qCtaCte := CrearQuery;
  qRegistro := CrearQuery;

  DM.IniciarTransaccion;
  try
    try
      Coditem := edtCodigo.Text;
      if Length(Coditem) = 1 then
        Coditem := '0' + Coditem;
      Codinq := edtCodinq.Text;
      Codinq := FormatFloat('0000', ToFloat(Codinq));

      if FOperacion = toNuevo then
      begin
        qRegistro.SQL.Text := ' Select * From ItemAutom Where Codinq = :Codinq and Item = :Item and Periodo = :Periodo ';
        qRegistro.ParambyName('COdinq').AsString := edtCodinq.text;
        qRegistro.ParambyName('Item').AsString := cbxDatofijo.text;
        qRegistro.ParambyName('Periodo').AsString := edtDetalle.text;
        qRegistro.Open;

        if not qRegistro.IsEmpty then
        begin
          if not MostrarDialogoSiNo('El item que intenta cargar ya se encuentra cargado. ¿Desea continuar de todos modos?', mbNO) then
            Exit;
        end;

        qRegistro.SQL.Text := ' Select Max(Registro) + 1 as Registro from itemautom ';
        qRegistro.Open;

        Registro := qRegistro.FieldByName('Registro').AsInteger;

        q.SQL.Text := ' INSERT INTO ITEMAUTOM (CODINQ, FECHA, ITEM, PERIODO, IMPORTE, CODPRO, CODITEM, CLAVE, TIPOINGRESO, REGISTRO, USUARIO) ' +
                                     ' VALUES (:CODINQ, :FECHA, :ITEM, :PERIODO, :IMPORTE, :CODPRO, :CODITEM, :CLAVE, :TIPOINGRESO, :Registro, :Usuario)';
      end
      else
      begin
        q.SQL.Text := ' UPDATE ITEMAUTOM SET CODINQ = :CODINQ , '+
                                            ' FECHA = :FECHA ,'+
                                            ' ITEM = :ITEM, '+
                                            ' PERIODO = :PERIODO, '+
                                            ' IMPORTE = :IMPORTE, '+
                                            ' CODPRO = :CODPRO, ' +
                                            ' CODITEM = :CODITEM, ' +
                                            ' CLAVE = :CLAVE, ' +
                                            ' usuario = :usuario, ' +
                                            ' TIPOINGRESO = :TIPOINGRESO' +
                                            ' WHERE REGISTRO = :REGISTRO ';
      end;

      q.ParamByName('CODINQ').AsString := edtCodinq.Text;
      q.ParamByName('FECHA').AsString :=  Fecha;
      q.ParamByName('ITEM').AsString :=   cbxDatoFijo.Text;
      q.ParamByName('PERIODO').AsString := edtDetalle.Text;
      q.ParamByName('IMPORTE').AsString := edtImporte.Text;
      q.ParamByName('CODPRO').AsString := edtPropietario.text;
      q.ParamByName('CODITEM').AsString := Coditem;
      q.ParamByName('CLAVE').AsString :=  Clave;
      q.ParamByName('TIPOINGRESO').AsString := edtEstado.Text;
      q.ParamByName('Usuario').AsString := FPrincipal.fUsuario;

      if FOperacion = toModificar then
      begin
        q.ParamByName('REGISTRO').AsString := edit1.Text;
        Registro := ToInt(Edit1.Text);
      end
      else if FOperacion = toNuevo then
        q.ParamByName('REGISTRO').AsInteger := Registro;

      q.ExecSQL();

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Movimiento Grabado Satisfactoriamente.');
    Except
      on e: exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al eliminar el movimiento. Datos Técnicos: ' + e.Message);
      end;
    end;
    Close;
  finally
    FreeAndNil(q);
    FreeAndNil(qRegistro);
    FreeAndNil(qCtaCte);
  end;
end;

end.


