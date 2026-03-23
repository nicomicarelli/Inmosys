unit frmPasarHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Funciones, sqlExpr, DBClient, Provider,
  fxQuery, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TfPasarHistorico = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label4: TLabel;
    lblSobreDestino: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edFechaHasta: TEdit;
    edtSobreDestino: TEdit;
    cboSobre: TComboBox;
    Todos: TCheckBox;
    edDesde: TEdit;
    edHasta: TEdit;
    TodosCodigos: TCheckBox;
    edtItemDesde: TEdit;
    edItemHasta: TEdit;
    TodosItems: TCheckBox;
    Edit1: TEdit;
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure edtSobreDestinoChange(Sender: TObject);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure cboSobreChange(Sender: TObject);
    procedure edDesdeChange(Sender: TObject);
    procedure edHastaChange(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure edtItemDesdeChange(Sender: TObject);
    procedure edItemHastaChange(Sender: TObject);
    procedure TodosItemsClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPasarHistorico: TfPasarHistorico;

implementation

uses frmprincipal, frmdatos;

{$R *.dfm}

procedure TfPasarHistorico.btnGrabarClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I: Integer;
  CDS: TClientDataset;
  dsp: TDataSetProvider;
  Cantidad: Integer;
begin
  q := CrearQuery;
  q1 := CrearQuery;
  CDS := TClientDataSet.Create(nil);
  DSP := TDataSetProvider.Create(Nil);
  Label2.Visible := True;
  DM.IniciarTransaccion;
  try
    try
      if Todos.Checked then
      begin
        q.SQL.Text := ' Insert into HistoricoCaja '+
                      ' Select C.* From Caja C '+
                      ' Inner Join Cajadetalles D on C.IDTransaccion = D.IDTransaccion '+
                      ' Where C.Fecha <= :Hasta';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add('and C.Codinq >= :InqDesde and C.Codinq <= :InqHasta');
          q.ParambyName('InqDesde').AsString := edDesde.Text;
          q.ParambyName('InqHasta').AsString := edHasta.Text;
        end;
        if not TodosItems.Checked then
        begin
          q.SQL.Add('and D.Coditem >= :ItemDesde and D.Coditem <= :ItemHasta');
          q.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q.SQL.Add('and D.Coditem <> :ItemNegativo');
          q.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.SQL.Add('and not exists (Select idtransaccion from historicocaja h1 where h1.idtransaccion = c.idtransaccion)');

        q.ExecSql;

        q1.SQL.Text := 'Insert into HistoricoCajaDetalles  '+
                      ' Select * From CajaDetalles C '+
                      ' Where Fecha <= :Hasta';
        if not TodosCodigos.Checked then
        begin
          q1.SQL.Add('and Codinq >= :InqDesde and Codinq <= :InqHasta');
          q1.ParambyName('InqDesde').AsString := edDesde.Text;
          q1.ParambyName('InqHasta').AsString := edHasta.Text;
        end;
        if not TodosItems.Checked then
        begin
          q1.SQL.Add('and Coditem >= :ItemDesde and Coditem <= :ItemHasta');
          q1.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q1.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q.SQL.Add('and Coditem <> :ItemNegativo');
          q.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;
        q1.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q1.SQL.Add('and not exists (Select idtransaccion from historicocaja h1 where h1.idtransaccion = c.idtransaccion)');
        q1.ExecSql;

        Label2.Visible := False;

        q1.SQL.Text := ' Select C.IDTransaccion From Caja C '+
                      ' Inner Join Cajadetalles D on C.IDTransaccion = D.IDTransaccion '+
                      ' Where C.Fecha <= :Hasta';
        if not TodosCodigos.Checked then
        begin
          q1.SQL.Add('and C.Codinq >= :InqDesde and C.Codinq <= :InqHasta');
          q1.ParambyName('InqDesde').AsString := edDesde.Text;
          q1.ParambyName('InqHasta').AsString := edHasta.Text;
        end;
        if not TodosItems.Checked then
        begin
          q1.SQL.Add('and D.Coditem >= :ItemDesde and D.Coditem <= :ItemHasta');
          q1.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q1.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q1.SQL.Add('and D.Coditem <> :ItemNegativo');
          q1.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;

        q1.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q1.Open;

        while not q1.eof do
        begin
          q.SQL.Text := ' delete From CajaDetalles Where idTransaccion = :ID';
          q.ParambyName('ID').AsFloat := q1.FieldByName('IDTransaccion').AsFloat;
          q.ExecSql;

          q.SQL.Text := ' delete From Caja Where idTransaccion = :ID';
          q.ParambyName('ID').AsFloat := q1.FieldByName('IDTransaccion').AsFloat;
          q.ExecSql;

          q1.Next;
        end;
      end
      else
      begin
        q.SQL.Text := ' Insert into HistoricoCaja '+
                      ' Select C.* From CajaDetalles D '+
                      '  Inner Join Caja C on C.IdTransaccion = D.IDTransaccion '+
                      '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                      '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                      '  Where C.Fecha <= :Hasta and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) ';
        q.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);

        if not TodosCodigos.Checked then
        begin
          q.SQL.Add('and d.Codinq >= :InqDesde and d.Codinq <= :InqHasta');
          q.ParambyName('InqDesde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
          q.ParambyName('InqHasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
        end;
        if not TodosItems.Checked then
        begin
          q.SQL.Add('and d.Coditem >= :ItemDesde and d.Coditem <= :ItemHasta');
          q.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q.SQL.Add('and d.Coditem <> :ItemNegativo');
          q.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;

        q.ExecSql;

        q1.SQL.Text := ' Insert into HistoricoCajaDetalles '+
                       ' Select D.* From CajaDetalles D '+
                       '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                       '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                       '  Where D.Fecha <= :Hasta and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) ';
        if not TodosCodigos.Checked then
        begin
          q1.SQL.Add('and d.Codinq >= :InqDesde and d.Codinq <= :InqHasta');
          q1.ParambyName('InqDesde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
          q1.ParambyName('InqHasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
        end;
        if not TodosItems.Checked then
        begin
          q1.SQL.Add('and d.Coditem >= :ItemDesde and d.Coditem <= :ItemHasta');
          q1.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q1.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q1.SQL.Add('and d.Coditem <> :ItemNegativo');
          q1.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;

        q1.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q1.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q1.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q1.ExecSql;

        q.SQL.Text := ' Select C.* From CajaDetalles D '+
                      '  Inner Join Caja C on C.IdTransaccion = D.IDTransaccion '+
                      '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                      '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                      '  Where C.Fecha <= :Hasta and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add('and d.Codinq >= :InqDesde and d.Codinq <= :InqHasta');
          q.ParambyName('InqDesde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
          q.ParambyName('InqHasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
        end;

        if not TodosItems.Checked then
        begin
          q.SQL.Add('and d.Coditem >= :ItemDesde and d.Coditem <= :ItemHasta');
          q.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q.SQL.Add('and d.Coditem <> :ItemNegativo');
          q.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;

        q.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.Open;

        dsp.DataSet := q;
        cds.Data := dsp.Data;
        cds.Open;
        Cantidad := cds.RecordCount;
        I := 0;
        q1.SQL.Text := ' delete From Caja '+
                       ' Where IDTransaccion = :id';

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

        q.SQL.Text :=  ' Select D.IDTransaccion From CajaDetalles D '+
                       '  Inner Join Conceptos CO on CO.Codigo = D.Coditem '+
                       '   Left Join Sobres S on S.Codigo = CO.Sobre '+
                       '  Where D.Fecha <= :Hasta and ((CO.Sobre = :Sobre) or (s.Depende= :Sobre1)) ';
        if not TodosCodigos.Checked then
        begin
          q.SQL.Add('and d.Codinq >= :InqDesde and d.Codinq <= :InqHasta');
          q.ParambyName('InqDesde').AsString := FormatFloat('0000', ToFloat(edDesde.Text));
          q.ParambyName('InqHasta').AsString := FormatFloat('0000', ToFloat(edHasta.Text));
        end;
        if not TodosItems.Checked then
        begin
          q.SQL.Add('and d.Coditem >= :ItemDesde and d.Coditem <= :ItemHasta');
          q.ParambyName('ItemDesde').AsString := edtItemDesde.Text;
          q.ParambyName('ItemHasta').AsString := edItemHasta.Text;
        end;
        if Edit1.Text <> '' then
        begin
          q.SQL.Add('and d.Coditem <> :ItemNegativo');
          q.ParambyName('ItemNegativo').AsString := Edit1.Text;
        end;

        q.ParambyName('Sobre').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Sobre1').AsInteger := StrToInt(edtSobreDestino.Text);
        q.ParambyName('Hasta').AsDateTime := StrToDate(edFechaHasta.Text);
        q.Open;

        dsp.DataSet := q;
        cds.Data := dsp.Data;
        cds.Open;
        Cantidad := cds.RecordCount;
        I := 0;
        q1.SQL.Text := ' delete From CajaDetalles '+
                       ' Where IDTransaccion = :id';
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

      MostrarDialogoAceptar('Datos pasados al historico satisfactoriamente.');
      Close;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

procedure TfPasarHistorico.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfPasarHistorico.cboSobreChange(Sender: TObject);
var
  q: TFXQuery;
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

procedure TfPasarHistorico.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edtSobreDestino.Text:='';
    cboSobre.ItemIndex := -1;
  end;

  if edtSobreDestino.Text = '' then
    Todos.Checked := True;
end;

procedure TfPasarHistorico.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edDesde.Text:='';
    edHasta.Text:='';
  end;

  if Trim(edDesde.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TfPasarHistorico.TodosItemsClick(Sender: TObject);
begin
  if todosItems.Checked then
  begin
    edtItemDesde.Text:='';
    edItemHasta.Text:='';
  end;

  if Trim(edtItemDesde.Text) = ''  then
    todosItems.Checked := True;
end;

procedure TfPasarHistorico.edDesdeChange(Sender: TObject);
begin
  edhasta.Text:=eddesde.Text;

  if eddesde.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfPasarHistorico.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    if Length(edFechaHasta.Text)=6 then
      edFechaHasta.Text := TransformaFecha(edFechaHasta.Text);

    if edFechaHasta.Text = '' then
      edFechaHasta.Text := FormatDateTime('dd/mm/yyyy', Date);
    btnGrabar.SetFocus;
  end;
end;

procedure TfPasarHistorico.edHastaChange(Sender: TObject);
begin
  if edHasta.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TfPasarHistorico.Edit1Change(Sender: TObject);
begin
  edtItemDesde.Text := '';
  edItemHasta.Text := '';
  TodosItems.Checked;

end;

procedure TfPasarHistorico.edItemHastaChange(Sender: TObject);
begin
  if edItemHasta.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfPasarHistorico.edtItemDesdeChange(Sender: TObject);
begin
  ediTEMhasta.Text:=edtItemdesde.Text;
  if edtItemDesde.Text <> '' then
    Edit1.Text := '';

  if edtItemdesde.Text <> '' then
    todosItems.Checked:=False
  else
    todosItems.Checked:=True;
end;

procedure TfPasarHistorico.edtSobreDestinoChange(Sender: TObject);
begin
  if edtSobreDestino.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfPasarHistorico.edtSobreDestinoKeyPress(Sender: TObject;
  var Key: Char);
var
  q: TFXQuery;
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

procedure TfPasarHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fPasarHistorico := nil;
  Action := caFree;
end;

procedure TfPasarHistorico.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    fPrincipal.Center(Self);
    q.SQL.Text := 'Select * from sobres where Principal = 1 order by descripcion';
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
