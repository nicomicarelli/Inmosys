unit frmCambioAlquiler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, ALIGRID, StdCtrls, Buttons, sqlExpr, Funciones,
  Declaraciones, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppDB, ppDBJIT,
  ppParameter, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppCache,
  ppDesignLayer, FXQuery, AdvGlowButton;

type
  TfCambioAlquiler = class(TForm)
    gDetalle: TStringAlignGrid;
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
    chCambiar: TCheckBox;
    btnSalir: TAdvGlowButton;
    btnGrabar: TAdvGlowButton;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure gDetalleAfterEdit(Sender: TObject; col, row: Integer);
    procedure btnGrabarClick(Sender: TObject);
    procedure chCambiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCodigo: Integer;
    procedure Cargar(pRegistro: Integer; pCodigo: Integer);

  end;

var
  fCambioAlquiler: TfCambioAlquiler;

implementation

uses frmDatosFijos, frmPrincipal, frmdatos;

{$R *.dfm}

procedure TfCambioAlquiler.btnGrabarClick(Sender: TObject);
var
  q: TFXQuery;
  stDescripcion: string;
  Mes, Anio, Codigo, Registro: Integer;
  FechaMovimiento: TDatetime;
  MesL, AnioL: string;
  ID: Double;
begin
  if ToFloat(gDetalle.Cells[3,1]) <> ToFloat(gDetalle.Cells[3,2]) + ToFloat(gDetalle.Cells[3,3]) then
  begin
    if not MostrarDialogoSiNo('El monto del alquiler no coincide con la suma del ALQUILER A CUENTA + SALDO ALQUILER. '+#13#10 +
                       '¿Desea Continuar?') then
      Exit;
  end;

  Dm.IniciarTransaccion;
  q := CrearQuery;
  try
    try
      if FCodigo = 1 then
      begin
        chCambiar.Visible := True;

        q.SQL.Text :=
          ' Delete from Itemautom ' +
          '  Where Registro = :Registro';
        q.ParamByName('Registro').AsInteger := ToInt(gDetalle.Cells[4,1]);
        q.ExecSql;

        if chCambiar.Checked then
          stDescripcion := 'A CTA DE IMP. Y/O EXP. COM.'
        else
          stDescripcion := 'ALQUILER A CUENTA';

        FechaMovimiento := StrToDate('06' + '/' + Copy(gDetalle.Cells[6,3],5,2) + '/' + Copy(gDetalle.Cells[6,3],1,4));
        Registro := InsertarItemautom(gDetalle.Cells[5,2],
                          gDetalle.Cells[6,2],
                          stDescripcion,
                          gDetalle.Cells[2,2],
                          gDetalle.Cells[3,2],
                          gDetalle.Cells[7,2],
                          gDetalle.Cells[0,2],
                          3);

        if Abs(ToFloat(gDetalle.Cells[3,3])) >= 0.01 then
        begin
          FechaMovimiento := StrToDate('06' + '/' + Copy(gDetalle.Cells[6,3],5,2) + '/' + Copy(gDetalle.Cells[6,3],1,4));

          Registro := InsertarItemautom(gDetalle.Cells[5,3],
                            Copy(gDetalle.Cells[6,3],1,6) + '06',
                            'SALDO ALQUILER',
                            gDetalle.Cells[2,3],
                            gDetalle.Cells[3,3],
                            gDetalle.Cells[7,3],
                            gDetalle.Cells[0,3],
                            3);
        end;

        q.SQL.Text := 'Delete from CtaCteInquilino Where IDMovimiento = :Registro';
        q.ParamByName('Registro').AsInteger := ToInt(gDetalle.Cells[4,1]);
        q.ExecSQL();

        if gDetalle.Cells[0,3] = '30' then
        begin
          q.SQL.Text := 'Select Max(Codigo) + 1 as Codigo from Cabezavales ';
          q.Open;

          Codigo := q.FieldbyName('COdigo').AsInteger;

          MesL := Copy(gDetalle.Cells[2,3], Pos('CORRESPONDE ', gDetalle.Cells[2,3]) + 12, 30);
          MesL := Copy(MesL, 1, Pos('/', MesL)-1);
          Mes := DevuelveMes(Mesl);

          AnioL := Copy(gDetalle.Cells[2,3], Pos('CORRESPONDE ', gDetalle.Cells[2,3]) + 12, 30);
          AnioL := Copy(AnioL, Pos('/', Aniol)+1, 4);

          Anio := ToInt(AnioL);

          q.Sql.Text := 'INSERT INTO CABEZAVALES (CODIGO, DESCRIPCION, CODIGOCATEGORIA, '+
                        '  MES, ANIO, MONTO, PENDIENTE, CERRADO, CODIGOEMPRESA, CODINQ, CODITEM) '+
                        ' VALUES (:CODIGO, :DESCRIPCION, :CODIGOCATEGORIA, '+
                        '  :MES, :ANIO, :MONTO, :PENDIENTE, :CERRADO, null, :CODINQ, :CODITEM)';
          q.ParambyName('Codigo').AsInteger := Codigo;
          q.ParambyName('Descripcion').AsString := gDetalle.Cells[2,3];
          q.ParambyName('Codigocategoria').AsInteger := 15;
          q.ParambyName('mes').AsInteger := Mes;
          q.ParambyName('Anio').AsInteger := Anio;
          q.ParambyName('Monto').AsFloat := ToFLoat(gDetalle.Cells[3,3]);
          q.ParambyName('pendiente').AsFloat := ToFLoat(gDetalle.Cells[3,3]);
          q.ParambyName('Cerrado').AsInteger := 0;
          q.ParambyName('Codinq').AsString := gDetalle.Cells[5,3];
          q.ParambyName('Coditem').AsInteger := 30;
          q.ExecSql;

          q.Sql.Text := ' INSERT INTO CUERPOVALES(CODIGO, CODINQ, FECHA, LINEA, '+
                        '  CODIGOITEM, DESCRIPCION, ENTRA, SALE, ID, USUARIO, ESMANUAL, PASADOACAJA) '+
                        '  VALUES (:CODIGO, :CODINQ, :FECHA, :LINEA, '+
                        '  :CODIGOITEM, :DESCRIPCION, :ENTRA, :SALE, :ID, :USUARIO, 1, 0)';
          q.ParambyName('Codigo').AsInteger := Codigo;
          q.ParambyName('Codinq').AsString := gDetalle.Cells[5,3];
          q.ParambyName('Fecha').AsDatetime := Date;
          q.ParambyName('Linea').AsInteger := 1;
          q.ParambyName('Codigoitem').AsInteger := 30;
          q.ParambyName('Descripcion').AsString := gDetalle.Cells[2,3];
          q.ParambyName('Entra').AsFloat := ToFLoat(gDetalle.Cells[3,3]);
          q.ParambyName('Sale').AsFloat := 0;
          q.ParambyName('ID').AsFloat := 0;
          q.ParamByName('Usuario').AsString := fPrincipal.FUsuario;
          q.ExecSQL;
        end;
      end
      else if FCodigo = 30 then
      begin
        chCambiar.Visible := True;

        q.SQL.Text :=
          ' Delete from Itemautom ' +
          '  Where Registro = :Registro';
        q.ParamByName('Registro').AsInteger := ToInt(gDetalle.Cells[4,1]);
        q.ExecSql;

        FechaMovimiento := StrToDate('06' + '/' + Copy(gDetalle.Cells[6,3],5,2) + '/' + Copy(gDetalle.Cells[6,3],1,4));

        Registro := InsertarItemautom(gDetalle.Cells[5,3],
                          IntToStr(ToInt(gDetalle.Cells[6,3])-1),
                          'ALQUILER A CUENTA',
                          gDetalle.Cells[2,3],
                          gDetalle.Cells[3,3],
                          gDetalle.Cells[7,3],
                          gDetalle.Cells[0,3],
                          3);

        if Abs(ToFloat(gDetalle.Cells[3,2])) >= 0.01 then
        begin
          FechaMovimiento := StrToDate('07' + '/' + Copy(gDetalle.Cells[6,3],5,2) + '/' + Copy(gDetalle.Cells[6,3],1,4));

          Registro := InsertarItemautom(gDetalle.Cells[5,2],
                          Copy(gDetalle.Cells[6,3],1,6) + '06',
                          'SALDO ALQUILER',
                          gDetalle.Cells[2,2],
                          gDetalle.Cells[3,2],
                          gDetalle.Cells[7,2],
                          gDetalle.Cells[0,2],
                          3);

        end;
        q.SQL.Text := 'Delete from CtaCteInquilino Where IDMovimiento = :Registro';
        q.ParamByName('Registro').AsInteger := ToInt(gDetalle.Cells[4,1]);
        q.ExecSQL();
      end;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Se actualizo el Alquiler satisfactoriamente.');
    Except
      DM.CancelarTransaccion;
    end;
    Close;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfCambioAlquiler.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfCambioAlquiler.Cargar(pRegistro: Integer; pCodigo: Integer);
var
  q: TFXQuery;
  qRegistro: TFXQuery;
  Registro: String;
begin
  FCodigo := pCodigo;

  q := CrearQuery;
  qRegistro := CrearQuery;

  try
    qRegistro.SQL.Text := 'Select Gen_ID(GEN_ITEMAUTOM, 1) as ID from RDB$DATABASE ';
    qRegistro.Open;

    Registro := qRegistro.FieldByName('ID').AsString;

    if pCodigo = 1 then
    begin
      q.SQL.Text :=
        ' Select Coditem, Item, Periodo, Importe, Registro, Codinq, Fecha, CodPro ' +
        '   From ItemAutom '+
        '  Where Registro = :Registro';
      q.ParamByName('Registro').AsInteger := pRegistro;
      q.Open;

      gDetalle.Cells[0, 1] := q.FieldByName('Coditem').AsString;
      gDetalle.Cells[1, 1] := q.FieldByName('Item').AsString;
      gDetalle.Cells[2, 1] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[3, 1] := FormatFloat('0.00', q.FieldByName('Importe').AsFloat);
      gDetalle.Cells[4, 1] := q.FieldByName('Registro').AsString;
      gDetalle.Cells[5, 1] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[6, 1] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[7, 1] := q.FieldByName('CodPro').AsString;

      gDetalle.Cells[0, 2] := '20';
      gDetalle.Cells[1, 2] := 'ALQUILER A CUENTA';
      gDetalle.Cells[2, 2] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[3, 2] := FormatFloat('0.00', q.FieldByName('Importe').AsFloat);
      gDetalle.Cells[4, 2] := Registro;
      gDetalle.Cells[5, 2] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[6, 2] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[7, 2] := q.FieldByName('CodPro').AsString;

      gDetalle.Cells[0, 3] := '30';
      gDetalle.Cells[1, 3] := 'SALDO ALQUILER';
      gDetalle.Cells[2, 3] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[3, 3] := FormatFloat('0.00', 0);
      gDetalle.Cells[4, 3] := Inttostr(StrToInt(Registro) +1);
      gDetalle.Cells[5, 3] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[6, 3] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[7, 3] := q.FieldByName('CodPro').AsString;
    end;

    if pCodigo = 30 then
    begin
      q.SQL.Text :=
        ' Select Coditem, Item, Periodo, Importe, Registro, Codinq, Fecha, CodPro ' +
        '   From ItemAutom '+
        '  Where Registro = :Registro';
      q.ParamByName('Registro').AsInteger := pRegistro;
      q.Open;

      gDetalle.Cells[0, 1] := '30';
      gDetalle.Cells[1, 1] := 'SALDO ALQUILER';
      gDetalle.Cells[2, 1] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[3, 1] := FormatFloat('0.00', q.FieldByName('Importe').AsFloat);
      gDetalle.Cells[4, 1] := q.FieldByName('Registro').AsString;
      gDetalle.Cells[5, 1] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[6, 1] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[7, 1] := q.FieldByName('CodPro').AsString;

      gDetalle.Cells[0, 2] := '30';
      gDetalle.Cells[1, 2] := 'NUEVO SALDO ALQUILER';
      gDetalle.Cells[2, 2] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[3, 2] := FormatFloat('0.00', q.FieldByName('Importe').AsFloat);
      gDetalle.Cells[4, 2] := Registro;
      gDetalle.Cells[5, 2] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[6, 2] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[7, 2] := q.FieldByName('CodPro').AsString;

      gDetalle.Cells[0, 3] := '20';
      gDetalle.Cells[1, 3] := 'ALQUILER A CUENTA';
      gDetalle.Cells[2, 3] := q.FieldByName('Periodo').AsString;
      gDetalle.Cells[3, 3] := FormatFloat('0.00', 0);
      gDetalle.Cells[4, 3] := Inttostr(StrToInt(Registro) +1);
      gDetalle.Cells[5, 3] := q.FieldByName('Codinq').AsString;
      gDetalle.Cells[6, 3] := q.FieldByName('Fecha').AsString;
      gDetalle.Cells[7, 3] := q.FieldByName('CodPro').AsString;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(qRegistro);
  end;
end;

procedure TfCambioAlquiler.chCambiarClick(Sender: TObject);
begin
  if chCambiar.Checked then
  begin
    gDetalle.Cells[0, 2] := '08';
    gDetalle.Cells[1, 2] := 'A CTA DE IMP. Y/O EXP. COM.';
    gDetalle.Cells[2, 2] := 'SEGUN ART. 7MO DE CONTRATO DE LOCACION';
  end
  else
  begin
    gDetalle.Cells[0, 2] := '20';
    gDetalle.Cells[1, 2] := 'ALQUILER A CUENTA';
    gDetalle.Cells[2, 2] := gDetalle.Cells[2, 1];
  end;
end;

procedure TfCambioAlquiler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCambioAlquiler := nil;
  Action := caFree;
end;

procedure TfCambioAlquiler.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfCambioAlquiler.gDetalleAfterEdit(Sender: TObject; col,
  row: Integer);
begin
  gDetalle.Cells[Col,Row] := FormatFloat('0.00', ToFloat(gDetalle.Cells[Col,Row]));

  if Row = 2 then
    if FCodigo = 1 then
      gDetalle.Cells[Col,3] := FormatFloat('0.00', ToFloat(gDetalle.Cells[Col,1]) - ToFloat(gDetalle.Cells[Col,2]));

  if Row = 3 then
    if FCodigo = 30 then
      gDetalle.Cells[Col,2] := FormatFloat('0.00', ToFloat(gDetalle.Cells[Col,1]) - ToFloat(gDetalle.Cells[Col,rOW]));


end;

procedure TfCambioAlquiler.gDetalleKeyPress(Sender: TObject; var Key: Char);
begin
  if gDetalle.Cells[0, gDetalle.Row] = '01' then
    Key := #0;

  if not (CharInSet(Key, ['0'..'9', #8, #13, '.',','])) then
    Key := #0;

  if Key = ',' then
    Key := '.';

end;

end.
