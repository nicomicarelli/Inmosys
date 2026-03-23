unit frmNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls,Funciones, ImgList, ToolWin, sqlExpr, dbClient, Provider, FXQuery,
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
  TfNotas = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbEdit1: TEdit;
    dbEdit2: TEdit;
    dbedit3: TEdit;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Dbedit1KeyPress(Sender: TObject; var Key: Char);
    procedure Dbedit2KeyPress(Sender: TObject; var Key: Char);
    procedure Dbedit3KeyPress(Sender: TObject; var Key: Char);
    procedure btnCerrarClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  fNotas: TfNotas;

implementation

uses frmPrincipal, frmDatos;

{$R *.DFM}


procedure TfNotas.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnGrabar.Click;
end;

procedure TfNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fNotas := Nil;

end;

procedure TfNotas.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(self);
end;

procedure TfNotas.btnGrabarClick(Sender: TObject);
var
  Fecha:  string;
  Codigo: string;
  CodigoDesde: string;
  CodigoHasta: string;
  Clave:  string;
  q: tFXQuery;
  cdsDatos: TClientdataset;
  dspDatos: TDatasetProvider;
begin
  if dbEdit1.Text = '' then
  begin
    MostrarDialogoAceptar('Debe introducir la fecha. Verifique por favor.');
    Exit;
  end;
  if dbEdit2.Text = '' then
  begin
    MostrarDialogoAceptar('Debe introducir el inquilino desde. Verifique por favor.');
    Exit;
  end;
  if dbEdit3.Text = '' then
  begin
    MostrarDialogoAceptar('Debe introducir el inquilino hasta. Verifique por favor.');
    Exit;
  end;
  if Edit1.Text = '' then
  begin
    MostrarDialogoAceptar('Debe introducir el texto de la nota. Verifique por favor.');
    Exit;
  end;
  q := CrearQuery;
  cdsDatos := TClientDataset.create(nil);
  dspDatos := TDatasetProvider.create(nil);
  if not MostrarDialogoSiNo('¿Esta seguro de agregar esta nota a TODOS los inquilinos?', mbNo) then
    Exit;

  Dm.IniciarTransaccion;
  try
    try
        Fecha := Dbedit1.Text;
        Fecha := FechaAlReves(Fecha);
        CodigoDesde := DBEdit2.Text;
        CodigoHasta := DBEdit3.Text;

        with q do
        begin
          SQL.Text := 'Select Codinq, Propietario from inmuebles where (Codinq >= :CodigoDesde) and (Codinq <= :CodigoHasta)';
          ParambyName('CodigoDesde').AsString := CodigoDesde;
          ParambyName('CodigoHasta').AsString := CodigoHasta;
          Open;
        end;
        dspDatos.DataSet := q;
        cdsDatos.Data := dspDatos.Data;

        pROGRESSBAR1.Min := 0;
        progressbar1.Max := cdsDatos.RecordCount;

        while not q.eof do
        begin
          ProgressBar1.Position := Progressbar1.Position + 1;
          Codigo := q.FieldByName('Codinq').AsString;
          Clave  := Fecha + Codigo + '74';
          InsertarItemautom(Codigo, Fecha,'NOTA PARA INQUILINO', EDIT1.Text, '0.00', Q.FieldByName('pROPIETARIO').AsString, '74', 3);
          q.Next;
          Application.Processmessages;
        end;
      DM.ConfirmarTransaccion;
      MostrarDIalogoAceptar('Proceso terminado exitosamente');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(cdsDatos);
    FreeAndNil(dspDatos);
  end;
end;

procedure TfNotas.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNotas.Dbedit1KeyPress(Sender: TObject; var Key: Char);
var
  Fecha: string;
  F    : string;
begin
  if Key = #13 then
  begin
    Fecha := Dbedit1.Text;
    if Length(Fecha) = 0 then
      Fecha := '5';
    if Length(Fecha) = 10 then
      f := Fecha;
    if Length(Fecha) <> 10 then
    begin
      f:=FormatDatetime('dd/mm/yyyy', date());
      delete(f,1,2);
      if Fecha = '5' then
        f := '05'+ f;
      if Fecha = '10' then
        f := '10' + f;
      if (Fecha <> '5') and (Fecha <> '10') then
        f := TransformaFecha(Fecha);
    end;
    Dbedit1.Text := f;
    Dbedit2.SetFocus;
  end;
end;

procedure TfNotas.Dbedit2KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;

begin
  if Key = #13 then
  begin
    if Dbedit2.Text = '' then
      Dbedit2.Text := '0001'
    else
    begin
      Codigo       := DBEdit2.Text;
      Codigo       := LargoCodigo(Codigo);
      DBEdit2.Text := Codigo;
    end;
    Dbedit3.SetFocus;
  end;
end;

procedure TfNotas.Dbedit3KeyPress(Sender: TObject; var Key: Char);
var
  Codigo: string;

begin
  if Key = #13 then
  begin
    if Dbedit3.Text='' then
      Dbedit3.Text:='9999'
    else
    begin
      Codigo       := DBEdit3.Text;
      Codigo       := LargoCodigo(Codigo);
      DBEdit3.Text := Codigo;
    end;
    edit1.SetFocus;
  end;
end;

procedure TfNotas.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfNotas.ToolButton1Click(Sender: TObject);
begin
  dbEdit1.Text := '';
  dbEdit2.Text := '';
  dbEdit3.Text := '';
  Edit1.Text   := '';
  dbEdit1.SetFocus;
end;

end.
