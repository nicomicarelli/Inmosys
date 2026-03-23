unit FRMnotaswindows;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db, Mask, DBCtrls, Grids, DBGrids,
  IBCustomDataSet, IBTable, ComCtrls, FXQuery,
  funciones, ImgList, ToolWin, CheckLst, sqlexpr, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TfNotaWindows = class(TForm)
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    Label2: TLabel;
    dbEdit1: TEdit;
    ImageList1: TImageList;
    chlista: TCheckListBox;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Dbedit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  fNotaWindows: TfNotaWindows;

implementation

uses frmPrincipal, frmDatos;

{$R *.DFM}

procedure TfNotaWindows.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnGrabar.Click;
end;

procedure TfNotaWindows.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fNotaWIndows := nil;
end;

procedure TfNotaWindows.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.sql.Text := 'Select codinq, inquilino, propietario from inmuebles order by codinq';
    q.Open;

    while not q.Eof do
    begin
      chLista.Items.Add(q.Fieldbyname('Codinq').AsString + ' - ' + q.Fieldbyname('Inquilino').AsString +' || ' + q.FieldByName('Propietario').AsString);
      q.Next;
    end;
    fPrincipal.Center(Self);
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNotaWindows.btnGrabarClick(Sender: TObject);
var
  Fecha:  string;
  Codigo: string;
  CodigoDesde: string;
  CodigoHasta: string;
  Clave:  string;
  I, J:      Integer;
  q: TFXQuery;
begin
  q := CrearQuery;
  if not MostrarDialogoSiNo('¿Esta seguro de agregar esta nota a TODOS los inquilinos?', mbYes) then
    Exit;
  DM.IniciarTransaccion;
  try
    try
      Fecha := Dbedit1.Text;
      Fecha := FechaAlReves(Fecha);

      with q do
      begin
        SQL.Text := 'Select Codinq, Propietario from inmuebles order by Codinq';
        Open;
      end;

      while not q.eof do
      begin
        FOR J := 0 to chLista.items.count - 1 do
        begin
          if q.Fieldbyname('Codinq').AsString = Copy(chLista.Items[J],1,4) then
            if not chLista.Checked[J] then
              Continue
            else
            begin
              Codigo := q.FieldByName('Codinq').AsString;
              Clave  := Fecha + Codigo + '74';
              InsertarItemautom(Codigo, Fecha,'NOTA PARA INQUILINO', 'VER NOTA EN WINDOWS!!!!!!','0.00', Q.FieldByName('pROPIETARIO').AsString, '15', 0);
            end;
        end;
        q.Next;
      end;
      Dm.ConfirmarTransaccion;
      MostrarDIalogoAceptar('Proceso terminado exitosamente');
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNotaWindows.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNotaWindows.Dbedit1KeyPress(Sender: TObject; var Key: Char);
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
      f:=Formatdatetime('dd/mm/yyyy', date());
      delete(f,1,2);
      if Fecha = '5' then
        f := '05'+ f;
      if Fecha = '10' then
        f := '10' + f;
      if (Fecha <> '5') and (Fecha <> '10') then
        f := TransformaFecha(Fecha);
    end;
    Dbedit1.Text := f;
//    Dbedit2.SetFocus;
  end;
end;

procedure TfNotaWindows.btnCerrarClick(Sender: TObject);
begin
  Close;
end;
end.


