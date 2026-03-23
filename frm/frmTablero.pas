unit frmTablero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Grids, ALIGRID, cxCheckBox, StdCtrls, AdvGlowButton,
  ExtCtrls, AdvPanel, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Declaraciones, sqlExpr, Funciones, dbClient, ImgList, cxGroupBox,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator, fxQuery, uImpresion, ppParameter,
  ppDesignLayer, ppVar, ppBands, ppCtrls, ppStrtch, ppRegion, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBJIT, AdvSmoothListBox,
  AdvMetroTile, AdvSmoothTileList, AdvSmoothTileListEx, Vcl.ComCtrls, Vcl.Menus;

type
  TFTablero = class(TForm)
    cxGroupBox2: TcxGroupBox;
    btnSalir: TAdvGlowButton;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Lista: TAdvSmoothTileList;
    btnGrabar: TAdvGlowButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxGrid1: TcxGrid;
    gCajas: TcxGridDBTableView;
    Tablero_Codigo: TcxGridDBColumn;
    Tablero_Descripcion: TcxGridDBColumn;
    Tablero_Importe: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    gSobres: TcxGridDBTableView;
    Sobres_Codigo: TcxGridDBColumn;
    Sobres_Descripcion: TcxGridDBColumn;
    Sobres_Importe: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Actualizar: TAdvGlowButton;
    Tablero_Sobre: TcxGridDBColumn;
    chAgrupado: TCheckBox;
    TabSheet3: TTabSheet;
    cxGrid3: TcxGrid;
    gPropietarios: TcxGridDBTableView;
    Propietario_Codigo: TcxGridDBColumn;
    Propietario_Descripcion: TcxGridDBColumn;
    Propietario_Importe: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    popOpciones: TPopupMenu;
    VerContratoEscalonado1: TMenuItem;
    PasaralHistorico1: TMenuItem;
    PopupMenu1: TPopupMenu;
    MarcarRetirado: TMenuItem;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    TodosCodigos: TcxCheckBox;
    TabSheet4: TTabSheet;
    cxGrid4: TcxGrid;
    gHonorarios: TcxGridDBTableView;
    Honorarios_Codigo: TcxGridDBColumn;
    Honorarios_Descripcion: TcxGridDBColumn;
    Honorarios_Importe: TcxGridDBColumn;
    Honorarios_Sobre: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel1: TPanel;
    cxGrid5: TcxGrid;
    gPorcentajes: TcxGridDBTableView;
    gPorcentajes_Codigo: TcxGridDBColumn;
    gPorcentajes_Descripcion: TcxGridDBColumn;
    gPorcentajes_Importe: TcxGridDBColumn;
    gPorcentajes_Sobre: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure ActualizarClick(Sender: TObject);
    procedure chAgrupadoClick(Sender: TObject);
    procedure VerContratoEscalonado1Click(Sender: TObject);
    procedure PasaralHistorico1Click(Sender: TObject);
    procedure MarcarRetiradoClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure TodosCodigosClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    cdsDatos: TClientDataset;
    dsDatos: TDatasource;
    cdsSobres: TClientDataset;
    dsSobres: TDatasource;
    cdsPropietarios: TClientDataset;
    dsPropietarios: TDatasource;
    cdsHonorarios: TClientDataset;
    dsHonorarios: TDatasource;
    cdsPorcentajes: TClientDataset;
    dsPorcentajes: TDatasource;
    procedure prPrepararDataset;
    { Private declarations }
  public
    procedure prCargarIndicadores;
    { Public declarations }
  end;

var
  FTablero: TFTablero;

implementation

uses frmprincipal, frmNuevaCaja, frmCompensarConcepto, frmPasarHistorico,
  frmdatos;

{$R *.dfm}
procedure TFTablero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fTablero := nil;
end;

procedure TFTablero.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(self);
  prPrepararDataset;
//  if ((fPrincipal.FUsuario <> 'ADMIN') AND (fPrincipal.FUsuario <> 'EDUARDO')) then
//  begin
//    Label1.Visible := False;
//    Lista.Visible := False;
//    Tabsheet1.TabVisible := False;
//    Tabsheet2.TabVisible := False;
//    Label2.Left := 191;
//    Width := 470;
//    Actualizar.Left := 375;
//    btnSalir.Left := 375;
//  end;

//  prCargarIndicadores;
end;

procedure TFTablero.MarcarRetiradoClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I: Integer;
  CDS: TClientDataset;
  Cantidad: Integer;
begin
  DM.IniciarTransaccion;
  q := CrearQuery;
  q1 := CrearQuery;
  try
    try
      q1.Sql.text := 'Select Distinct CU.Codinq from CuerpoRecibos CU Where CU.Tipo = ''LI'' and CU.Propietario = :Propietario ';
      q1.ParamByName('Propietario').AsString := cdsPropietarios.FIeldbyName('Descripcion').AsString;
      q1.Open;

      while not q1.eof do
      begin
        q.SQL.Text := 'Update CabezaRecibos CA Set CA.PendienteRetirar = 0 where CA.Tipo = ''LI'' and ca.pendienteretirar = 1 and CA.Codinq =:Codinq' ;
        q.ParamByName('Codinq').AsString := q1.FIeldbyName('Codinq').AsString;
        q.ExecSQL;
        q1.Next;
      end;

      DM.ConfirmarTransaccion;

      MostrarDialogoAceptar('Datos eliminados satisfactoriamente.');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

procedure TFTablero.PasaralHistorico1Click(Sender: TObject);
begin
  if cdsDatos.FieldByName('Importe').AsFloat > 0.005 then
  begin
    MostrarDialogoAceptar('El dato fijo debe tener saldo cero para pasar al histórico.');
    Exit;
  end;
  if not MostrarDialogoSiNo('¿Esta seguro de pasar al histórico el item?') then
    Exit;

  if Assigned(fPasarHistorico) then
    FreeAndNil(fPasarHistorico);

  if fPasarHistorico = nil then
    Application.CreateForm(TfPasarHistorico, fPasarHistorico)
  else
    fPasarHistorico.Show;
  fPasarHistorico.edFechaHasta.Text := FormatDatetime('dd/mm/yyyy', Date);
  fPasarHistorico.edtItemDesde.Text := cdsDatos.FieldByName('Codigo').AsString;
  fPasarHistorico.edItemHasta.Text := cdsDatos.FieldByName('Codigo').AsString;
  fPasarHistorico.btnGrabarCLick(nil);
end;

procedure TFTablero.prCargarIndicadores;
var
  q,q1,qSobres: TFXQuery;
  qSQL: TFXQuery;
  I, J: Integer;

begin
  q := CrearQuery;
  qSobres := CrearQuery;
  q1 := CrearQuery;
  qSQL := CrearQuery;
  try
  //if ((fPrincipal.FUsuario = 'ADMIN') or (fPrincipal.FUsuario = 'EDUARDO')) then
    begin
      q.SQL.Text :=' select * '+
                   ' from RubrosIndicadores Order by Codigo';
      q.Open;
      I := 0;
      Lista.Tiles.Clear;
      while not q.eof do
      begin
        Lista.Tiles.Add;
        Lista.Tiles.Items[I].Content.Text := q.FieldByName('Descripcion').AsString;
        Lista.Tiles.Items[I].Content.TextPosition := tpCenterLeft;
        Lista.Tiles.Items[I].Enabled := True;

        q1.SQL.Text :=' select * '+
                      '   from Indicadores where Rubro = :Rubro Order by Codigo';
        q1.ParamByName('Rubro').AsInteger := q.FieldByName('Codigo').AsInteger;
        q1.Open;

        Lista.Tiles.Items[I].SubTiles.Clear;
        J := 0;
        while not q1.eof do
        begin
          qSQL.sql.text := q1.FieldByName('Consulta').AsString;
          qSQL.Open;
          Lista.Tiles.Items[I].SubTiles.Add;
          if q1.FieldByName('FormatoMoneda').AsInteger = 1 then
            Lista.Tiles.Items[I].Subtiles[J].Content.Text := q1.FieldByName('Titulo').AsString + #13#10 +
              FOrmatFloat('$ ,0.00', qSQL.Fields[0].AsFloat)
          else
            Lista.Tiles.Items[I].Subtiles[J].Content.Text := q1.FieldByName('Titulo').AsString + #13#10 +
              qSQL.Fields[0].AsString;
          Lista.Tiles.Items[I].SubTiles[J].Content.TextPosition := tpCenterLeft;
          Lista.Tiles.Items[I].SubTiles[J].Enabled := False;
          q1.Next;
          Inc(J);
        end;

        Inc(I);
        q.Next;
      end;

      q.SQL.Text :=' Select co.codigo, co.descripcion, sum(c.entra - c.sale) as Importe, S.Descripcion as Sobre '+
                   ' from cajadetalles c '+
                   ' Inner join conceptos co on c.coditem = co.codigo and co.activo = 1 '+
                   ' Inner join Sobres S on S.codigo = co.Sobre and S.activo = 1 ';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' Where C.Fecha >=:desde and C.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit1.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit2.Text);
      end;
      q.sql.Add(' group by 1,2,4');
      q.Open;


      cdsDatos.EmptyDataset;
      while not q.Eof do
      begin
        cdsDatos.Append;
        cdsDatos.FieldbyName('Codigo').AsString := q.FieldByName('Codigo').AsString;
        cdsDatos.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
        cdsDatos.FieldbyName('Importe').AsFloat := q.FieldByName('Importe').AsFloat;
        cdsDatos.FieldbyName('Sobre').AsString := q.FieldByName('Sobre').AsString;
        cdsDatos.Post;
        q.Next;
      end;
      cdsDatos.First;

      q.SQL.Text :=' Select co.codigo, co.descripcion, sum(c.entra - c.sale) as Importe, S.Descripcion as Sobre, co.Honorarios '+
                   ' from cajadetalles c '+
                   ' Inner join conceptos co on c.coditem = co.codigo and co.activo = 1 and co.honorarios > 0'+
                   ' Inner join Sobres S on S.codigo = co.Sobre and S.activo = 1 ';
      if not TodosCodigos.Checked then
      begin
        q.SQL.Add(' Where C.Fecha >=:desde and C.Fecha <=:Hasta ');
        q.ParamByName('Desde').AsDatetime := Strtodatetime(edit1.Text);
        q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit2.Text);
      end;
      q.sql.Add(' group by 1,2,4,5');
      q.Open;

      cdsHonorarios.EmptyDataset;
      while not q.Eof do
      begin
        cdsHonorarios.Append;
        cdsHonorarios.FieldbyName('Codigo').AsString := q.FieldByName('Codigo').AsString;
        cdsHonorarios.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
//        if q.FieldByName('Honorarios').AsFloat = 1 then
          cdsHonorarios.FieldbyName('Importe').AsFloat := q.FieldByName('Importe').AsFloat;
//        else
//          cdsHonorarios.FieldbyName('Importe').AsFloat := q.FieldByName('Importe').AsFloat * -1;
        cdsHonorarios.FieldbyName('Sobre').AsString := q.FieldByName('Sobre').AsString;
        cdsHonorarios.Post;
        q.Next;
      end;
      cdsHonorarios.First;

      q.SQL.Text :=' Select * '+
                   ' from RazonesSociales c ';
      q.Open;

      cdsPorcentajes.EmptyDataset;
      while not q.Eof do
      begin
        cdsPorcentajes.Append;
        cdsPorcentajes.FieldbyName('Codigo').AsString := q.FieldByName('Codigo').AsString;
        cdsPorcentajes.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
        cdsPorcentajes.FieldbyName('Sobre').AsString := FormatFloat('0.00', q.FieldByName('POrcentaje').AsFloat);
        cdsPorcentajes.FieldbyName('Importe').AsFloat := ToFLoat(gHonorarios.DataController.Summary.FooterSummaryValues[0])*q.FieldByName('Porcentaje').AsFloat/100;
        cdsPorcentajes.Post;
        q.Next;
      end;
      cdsPorcentajes.First;



      qSobres.SQL.Text :=' select S.Codigo, s.descripcion, sum(c.entra-c.sale) as Importe '+
                         ' from CajaDetalles C '+
                         ' left Join conceptos co on c.coditem = co.codigo '+
                         ' left join sobres s on s.codigo = co.sobre '+
                         ' Where S.Activo = 1 ';
      if not TodosCodigos.Checked then
      begin
        qSobres.SQL.Add(' And C.Fecha >=:desde and C.Fecha <=:Hasta ');
        qSobres.ParamByName('Desde').AsDatetime := Strtodatetime(edit1.Text);
        qSobres.ParamByName('Hasta').AsDatetime := Strtodatetime(edit2.Text);
      end;
      qSobres.SQL.Add(' group by 1, 2');
      qSobres.Open;

      cdsSobres.EmptyDataset;
      while not qSobres.Eof do
      begin
        cdsSobres.Append;
        cdsSobres.FieldbyName('Codigo').AsString := qSobres.FieldByName('Codigo').AsString;
        cdsSobres.FieldbyName('Descripcion').AsString := qSobres.FieldByName('Descripcion').AsString;
        cdsSobres.FieldbyName('Importe').AsFloat := qSobres.FieldByName('Importe').AsFloat;
        cdsSobres.Post;
        qSobres.Next;
      end;
      cdsSobres.First;
    end;
    q.SQL.Text := ' Select I.Propietario as Descripcion, sum(cast(cu.importe as doble)) as Importe '+
                  '  from cuerporecibos cu '+
                  ' inner join cabezarecibos ca on ca.tipo = cu.tipo '+
                  '                            and ca.letra = cu.letra '+
                  '                            and ca.numero = cu.numero '+
                  ' inner join inmuebles I on I.Codinq = Ca.Codinq '+
                  ' and ca.codinq in (select codinq from inmuebles I1 where I.propietario in ( '+
                  '                Select propietario from inmuebles I2 where i2.codinq=ca.codinq)) '+
                  ' where ca.pendienteretirar = 1 ';

    if not TodosCodigos.Checked then
    begin
      q.SQL.Add(' And CA.Fecha >=:desde and CA.Fecha <=:Hasta ');
      q.ParamByName('Desde').AsDatetime := Strtodatetime(edit1.Text);
      q.ParamByName('Hasta').AsDatetime := Strtodatetime(edit2.Text);
    end;

    q.SQL.Add(' group by I.Propietario ');
    q.Open;
    cdsPropietarios.EmptyDataset;
    while not q.Eof do
    begin
      cdsPropietarios.Append;
      cdsPropietarios.FieldbyName('Descripcion').AsString := q.FieldByName('Descripcion').AsString;
      cdsPropietarios.FieldbyName('Importe').AsFloat := q.FieldByName('Importe').AsFloat;
      cdsPropietarios.Post;
      q.Next;
    end;
    cdsPropietarios.First;
  finally
    FreeAndNil(q);
    FreeAndNil(qSobres);
    FreeAndNil(qSQL);
  end;
end;

procedure TFTablero.prPrepararDataset;
begin
  cdsDatos := TClientDataset.Create(nil);
  dsDatos := TDatasource.Create(nil);

  cdsDatos.FieldDefs.Clear;
  cdsDatos.FieldDefs.Add('Codigo', ftInteger);
  cdsDatos.FieldDefs.Add('Descripcion', ftString, 100);
  cdsDatos.FieldDefs.Add('Importe', ftFloat);
  cdsDatos.FieldDefs.Add('Sobre', ftString, 100);
  cdsDatos.CreateDataset;
  TFloatField(cdsDatos.FieldByname('Importe')).DisplayFormat := '$ ,0.00;$-,0.00';

  Tablero_Codigo.DataBinding.FieldName      := 'Codigo';
  Tablero_Descripcion.DataBinding.FieldName := 'Descripcion';
  Tablero_Importe.DataBinding.FieldName := 'Importe';
  Tablero_Sobre.DataBinding.FieldName := 'Sobre';

  dsDatos.DataSet := cdsDatos;
  gCajas.DataController.DataSource := dsDatos;

  cdsSobres := TClientDataset.Create(nil);
  dsSobres := TDatasource.Create(nil);

  cdsSobres.FieldDefs.Clear;
  cdsSobres.FieldDefs.Add('Codigo', ftInteger);
  cdsSobres.FieldDefs.Add('Descripcion', ftString, 100);
  cdsSobres.FieldDefs.Add('Importe', ftFloat);
  cdsSobres.CreateDataset;
  TFloatField(cdsSobres.FieldByname('Importe')).DisplayFormat := '$ ,0.00;$-,0.00';;

  Sobres_Codigo.DataBinding.FieldName      := 'Codigo';
  Sobres_Descripcion.DataBinding.FieldName := 'Descripcion';
  Sobres_Importe.DataBinding.FieldName := 'Importe';

  dsSobres.DataSet := cdsSobres;
  gSobres.DataController.DataSource := dsSobres;

  gCajas.DataController.Groups.FullExpand;
  if gCajas.DataController.Groups.GroupingItemCount > 0 then
    gCajas.DataController.Summary.GroupSummaryItems[0].Add(gCajas.Columns[gCajas.GetColumnByFieldName('Importe').Index], spFooter, skSum, '$ ,0.00;$-,0.00');

  cdsPropietarios := TClientDataset.Create(nil);
  dsPropietarios := TDatasource.Create(nil);

  cdsPropietarios.FieldDefs.Clear;
  cdsPropietarios.FieldDefs.Add('Codigo', ftString, 5);
  cdsPropietarios.FieldDefs.Add('Descripcion', ftString, 100);
  cdsPropietarios.FieldDefs.Add('Importe', ftFloat);
  cdsPropietarios.CreateDataset;
  TFloatField(cdsPropietarios.FieldByname('Importe')).DisplayFormat := '$ ,0.00;$-,0.00';

  Propietario_Codigo.DataBinding.FieldName      := 'Codigo';
  Propietario_Descripcion.DataBinding.FieldName := 'Descripcion';
  Propietario_Importe.DataBinding.FieldName := 'Importe';

  dsPropietarios.DataSet := cdsPropietarios;
  gPropietarios.DataController.DataSource := dsPropietarios;

  cdsHonorarios := TClientDataset.Create(nil);
  dsHonorarios := TDatasource.Create(nil);

  cdsHonorarios.FieldDefs.Clear;
  cdsHonorarios.FieldDefs.Add('Codigo', ftInteger);
  cdsHonorarios.FieldDefs.Add('Descripcion', ftString, 100);
  cdsHonorarios.FieldDefs.Add('Importe', ftFloat);
  cdsHonorarios.FieldDefs.Add('Sobre', ftString, 100);
  cdsHonorarios.CreateDataset;
  TFloatField(cdsHonorarios.FieldByname('Importe')).DisplayFormat := '$ ,0.00;$-,0.00';

  Honorarios_Codigo.DataBinding.FieldName      := 'Codigo';
  Honorarios_Descripcion.DataBinding.FieldName := 'Descripcion';
  Honorarios_Importe.DataBinding.FieldName := 'Importe';
  Honorarios_Sobre.DataBinding.FieldName := 'Sobre';

  dsHonorarios.DataSet := cdsHonorarios;
  gHonorarios.DataController.DataSource := dsHonorarios;

  cdsPorcentajes := TClientDataset.Create(nil);
  dsPorcentajes := TDatasource.Create(nil);

  cdsPorcentajes.FieldDefs.Clear;
  cdsPorcentajes.FieldDefs.Add('Codigo', ftInteger);
  cdsPorcentajes.FieldDefs.Add('Descripcion', ftString, 100);
  cdsPorcentajes.FieldDefs.Add('Importe', ftFloat);
  cdsPorcentajes.FieldDefs.Add('Sobre', ftString, 100);
  cdsPorcentajes.CreateDataset;
  TFloatField(cdsPorcentajes.FieldByname('Importe')).DisplayFormat := '$ ,0.00;$-,0.00';

  gPorcentajes_Codigo.DataBinding.FieldName      := 'Codigo';
  gPorcentajes_Descripcion.DataBinding.FieldName := 'Descripcion';
  gPorcentajes_Importe.DataBinding.FieldName := 'Importe';
  gPorcentajes_Sobre.DataBinding.FieldName := 'Sobre';

  dsPorcentajes.DataSet := cdsPorcentajes;
  gPorcentajes.DataController.DataSource := dsPorcentajes;

end;

procedure TFTablero.TodosCodigosClick(Sender: TObject);
begin
  if todosCodigos.Checked then
  begin
    edit1.Text:='';
    edit2.Text:='';
  end;

  if Trim(edit1.Text) = ''  then
    todosCodigos.Checked := True;
end;

procedure TFTablero.VerContratoEscalonado1Click(Sender: TObject);
begin
  if fCompensarConcepto = nil then
    Application.CreateForm(TfCompensarConcepto, fCompensarConcepto)
  else
    fCompensarConcepto.Show;
  fCompensarConcepto.prInicializar(cdsDatos.FieldByName('Codigo').AsInteger, cdsDatos.FieldByName('Importe').AsFloat);
end;

procedure TFTablero.ActualizarClick(Sender: TObject);
begin
  gPorcentajes.DataController.Groups.ClearGrouping;
  prCargarIndicadores;
  gHonorarios.DataController.Groups.ClearGrouping;
  gPorcentajes.DataController.Groups.ClearGrouping;
  gCajas.DataController.Groups.FullExpand;

end;

procedure TFTablero.btnGrabarClick(Sender: TObject);
begin
  LISTA.GoBack;
//  prCargarIndicadores;
end;

procedure TFTablero.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFTablero.chAgrupadoClick(Sender: TObject);
begin
  if chAgrupado.Checked then
  begin
    gCajas.Columns[3].Visible := False;
    gCajas.Columns[3].GroupIndex := 0;
    gHonorarios.Columns[3].Visible := False;
    gHonorarios.Columns[3].GroupIndex := 0;
  end
  else
  begin
    gCajas.DataController.Groups.ClearGrouping;
    gHonorarios.DataController.Groups.ClearGrouping;
  end;
end;

procedure TFTablero.Edit1Change(Sender: TObject);
begin
  if edit1.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;
end;

procedure TFTablero.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;

begin
  Fecha := Edit1.Text;
  if Key = #13 then
  begin
    if Length(Edit1.Text)=0 then
      Fecha := datetostr(date());
    if Length(Edit1.Text)=6 then
      Fecha := TransformaFecha(Fecha);
    Edit1.Text := Fecha;
    Edit2.setfocus;
  end;
end;

procedure TFTablero.Edit2Change(Sender: TObject);
begin
  if edit2.Text <> '' then
    todoscodigos.Checked:=False
  else
    todoscodigos.Checked:=True;

end;

procedure TFTablero.Edit2KeyPress(Sender: TObject; var Key: Char);
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

end.
