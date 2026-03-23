unit frmRecuperarHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Funciones, sqlExpr, fxQuery, DBClient, Provider,
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
  TFRecuperarHistorico = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    lblSobreDestino: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edFechaHasta: TEdit;
    edtSobreDestino: TEdit;
    cboSobre: TComboBox;
    Todos: TCheckBox;
    edFechaDesde: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    edDesde: TEdit;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure edtSobreDestinoChange(Sender: TObject);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure cboSobreChange(Sender: TObject);
    procedure edFechaDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edDesdeChange(Sender: TObject);
    procedure edHastaChange(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecuperarHistorico: TFRecuperarHistorico;

implementation

uses frmprincipal, frmdatos;

{$R *.dfm}

procedure TFRecuperarHistorico.btnGrabarClick(Sender: TObject);
var
  q, q1: tFXQuery;
  cds:TClientDataSet;
  dsp:TDatasetProvider;
  I, Cantidad: Integer;
  CodinqDesde, CodinqHasta: string;

begin
  q := CrearQuery;
  q1 := CrearQuery;
  cds := TClientDataSet.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  Label2.Visible := True;

  if TodosCodigos.Checked then
  begin
    CodinqDesde := '0001';
    CodinqHasta := '9999';
  end
  else
  begin
    CodinqDesde := FormatFloat('0000', ToFloat(edDesde.text));
    CodinqHasta := FormatFloat('0000', ToFloat(edHasta.text));
  end;

  if ToFloat(CodinqDesde) = 0 then
  begin
    MostrarDialogoAceptar('Debe introducir el código desde.');
    Exit;
  end;

  if ToFloat(CodinqHasta) = 0 then
  begin
    MostrarDialogoAceptar('Debe introducir el código hasta.');
    Exit;
  end;

  DM.IniciarTransaccion;
  try
    try
      if Todos.Checked then
      begin
        q.SQL.Text := ' Insert into Caja '+
                      ' Select * From HistoricoCaja '+
                      ' Where (Fecha >= :Desde) and (Fecha <= :Hasta)'+
                      '   and ((Codinq >= :CodinqDesde) and (Codinq <= :CodinqHasta))';
        q.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q.ExecSql;

        q1.SQL.Text := ' Insert into CajaDetalles '+
                      ' Select * From HistoricoCajaDetalles '+
                      ' Where (Fecha >= :Desde) and (Fecha <= :Hasta)'+
                      '   and ((Codinq >= :CodinqDesde) and (Codinq <= :CodinqHasta))';
        q1.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q1.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q1.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q1.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q1.ExecSql;
        Label2.Visible := False;

        q.SQL.Text := ' delete From HistoricoCaja '+
                      ' Where (Fecha >= :Desde) and (Fecha <= :Hasta)'+
                      '   and ((Codinq >= :CodinqDesde) and (Codinq <= :CodinqHasta))';
        q.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q.ExecSql;

        q.SQL.Text := ' delete From HistoricoCajaDetalles '+
                      ' Where (Fecha >= :Desde) and (Fecha <= :Hasta)'+
                      '   and ((Codinq >= :CodinqDesde) and (Codinq <= :CodinqHasta))';
        q.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q.ExecSql;
      end
      else
      begin
        q.SQL.Text := ' Insert into Caja '+
                      ' Select C.* From HistoricoCaja C '+
                      '  Inner Join HistoricoCajaDetalles D on C.IdTransaccion = D.IDTransaccion '+
                      '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                      '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                      '  Where ((C.Fecha >= :Desde) and (C.Fecha <= :Hasta)) and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1))'+
                      '    and ((d.Codinq >= :CodinqDesde) and (d.Codinq <= :CodinqHasta))';
        q.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q.ExecSql;

        q1.SQL.Text := ' Insert into CajaDetalles '+
                       ' Select D.* From HistoricoCajaDetalles D '+
                       '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                       '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                       '  Where ((D.Fecha >= :Desde) and (D.Fecha <= :Hasta)) and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) '+
                      '    and  ((D.Codinq >= :CodinqDesde) and (D.Codinq <= :CodinqHasta))';
        q1.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q1.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q1.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q1.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q1.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q1.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q1.ExecSql;

        q.SQL.Text := ' Select C.* From HistoricoCaja C '+
                      '  Inner Join HistoricoCajaDetalles D on C.IdTransaccion = D.IDTransaccion '+
                      '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                      '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                      '  Where ((C.Fecha >= :Desde) and (C.Fecha <= :Hasta)) and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) '+
                      '    and ((D.Codinq >= :CodinqDesde) and (D.Codinq <= :CodinqHasta))';
        q.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q.Open;

        dsp.DataSet := q;
        cds.Data := dsp.Data;
        cds.Open;
        Cantidad := cds.RecordCount;
        I := 0;
        q1.SQL.Text := ' delete From HistoricoCaja H'+
                       ' Where H.IDTransaccion = :id';
        q1.Prepared := True;

        while not cds.Eof do
        begin
          q1.Close;
          q1.ParambyName('ID').AsFloat := cds.FieldByName('IDTransaccion').AsFloat;
          q1.ExecSql;
          Inc(I);
          Label2.Caption := 'Migrando datos... Por favor Espere... ' + Inttostr(I) +' de ' + IntToStr(Cantidad);
          Application.ProcessMessages;
          cds.Next;
        end;

        q.SQL.Text :=  ' Select D.IDTransaccion From HistoricoCajaDetalles D '+
                       '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                       '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                       '  Where ((D.Fecha >= :Desde) and (D.Fecha <= :Hasta)) and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) '+
                       '    and ((D.Codinq >= :CodinqDesde) and (D.Codinq <= :CodinqHasta))';
        q.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Desde').AsDateTime := StrToDate(edFechaDesde.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.ParambyName('CodinqDesde').AsString := CodinqDesde;
        q.ParambyName('CodinqHasta').AsString := CodinqHasta;
        q.Open;

        dsp.DataSet := q;
        cds.Data := dsp.Data;
        cds.Open;

        Cantidad := cds.RecordCount;
        I := 0;
        q1.SQL.Text := ' delete From HistoricoCajaDetalles H '+
                       ' Where H.IDTransaccion = :id';
        q1.Prepared := True;

        while not cds.Eof do
        begin
          q1.Close;
          q1.ParambyName('ID').AsFloat := cds.FieldByName('IDTransaccion').AsFloat;
          q1.ExecSql;
          Inc(I);
          Label2.Caption := 'Migrando datos... Por favor Espere... ' + Inttostr(I) +' de ' + IntToStr(Cantidad);
          Application.ProcessMessages;
          cds.Next;
        end;
      end;
      DM.ConfirmarTransaccion;

      MostrarDialogoAceptar('Datos recuperados del histórico satisfactoriamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(cds);
    FreeAndNil(dsp);
    FreeAndNil(q1);
  end;
end;

procedure TFRecuperarHistorico.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFRecuperarHistorico.cboSobreChange(Sender: TObject);
var
  q: tFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from sobres where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboSobre.Text;
    q.Open;

    edtSobreDestino.Text := q.FieldByName('Codigo').AsString;

  finally
    FreeAndNil(q);
  end;
end;

procedure TFRecuperarHistorico.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edtSobreDestino.Text:='';
    cboSobre.ItemIndex := -1;
  end;

  if edtSobreDestino.Text = '' then
    Todos.Checked := True;
end;

procedure TFRecuperarHistorico.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TFRecuperarHistorico.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TFRecuperarHistorico.edFechaDesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    if Length(edFechaDesde.Text)=6 then
      edFechaDesde.Text := TransformaFecha(edFechaDesde.Text)
    ELSE
      edFechaDesde.Text := FormatDateTime('dd/mm/yyyy', Date);
    edFechaHasta.SetFocus;
  end;
end;

procedure TFRecuperarHistorico.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    if Length(edFechaHasta.Text)=6 then
      edFechaHasta.Text := TransformaFecha(edFechaHasta.Text)
    ELSE
      edFechaHasta.Text := FormatDateTime('dd/mm/yyyy', Date);
    btnGrabar.SetFocus;
  end;
end;

procedure TFRecuperarHistorico.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TFRecuperarHistorico.edtSobreDestinoChange(Sender: TObject);
begin
  if edtSobreDestino.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TFRecuperarHistorico.edtSobreDestinoKeyPress(Sender: TObject;
  var Key: Char);
var
  q: tFXQuery;
begin
  q := CrearQuery;
  try

    if (TWinControl(Sender).Name = 'edtSobreDestino') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtSobreDestino.Text = '' then
          edtSobreDestino.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo Order by Descripcion';
          q.ParamByName('Codigo').AsString := edtSobreDestino.Text;
          q.Open;

          cboSobre.ItemIndex := cboSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);
        end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFRecuperarHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fRecuperarHistorico := nil;
  Action := caFree;
end;

procedure TFRecuperarHistorico.FormCreate(Sender: TObject);
var
  q: tFXQuery;
begin
  q := CrearQuery;
  try
    fPrincipal.Center(Self);
    q.SQL.Text := 'Select * from sobres Where Principal = 1 order by descripcion';
    q.Open;

    while not q.Eof do
    begin
      cboSobre.items.Add(q.FieldByName('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

end.
