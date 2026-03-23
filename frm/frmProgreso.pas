unit frmProgreso;

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
  dxSkinXmas2008Blue, cxLabel, cxProgressBar, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfProgreso = class(TForm)
    pbProgreso: TcxProgressBar;
    lbTarea: TcxLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure setLeyenda(const Value: String);
    procedure setMaximo(const Value: Integer);
    procedure setPosicion(const Value: Integer);
    { Private declarations }
  public
    niMaximo: Integer;
    niPosicion: Integer;
    stLeyenda: string;
    property Maximo: Integer read niMaximo write setMaximo;
    property Posicion: Integer read niPosicion write setPosicion;
    property Leyenda: string read stLeyenda write setLeyenda;
  end;

var
  fProgreso: TfProgreso;

implementation

{$R *.dfm}

procedure TfProgreso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fProgreso := nil;
end;

procedure TfProgreso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if pbProgreso.Position = pbProgreso.Properties.Max then
    CanClose := True
  else
    CanClose := False;
end;

procedure TfProgreso.setLeyenda(const Value: String);
begin
  lbTarea.Caption := Value;
end;

procedure TfProgreso.setMaximo(const Value: Integer);
begin
  pbProgreso.Properties.Max := Value;
end;

procedure TfProgreso.setPosicion(const Value: Integer);
begin
  pbProgreso.Position := Value;
  if pbProgreso.Properties.Max = pbProgreso.Position then
    Close;
end;

end.
