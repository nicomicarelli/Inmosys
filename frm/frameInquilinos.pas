unit frameInquilinos;

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
  dxSkinXmas2008Blue, FMTBcd, DB, SqlExpr, StdCtrls, AdvDBLookupComboBox,
  cxTextEdit, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, fxQuery;

type
  TFrame1 = class(TFrame)
    Label3: TLabel;
    dsInquilino: TDataSource;
    cbInquilino: TDBLookupComboBox;
    edCodinq: TEdit;
    qInquilino: TFXQuery;
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cbInquilinoKeyPress(Sender: TObject; var Key: Char);
    procedure cbInquilinoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses frmdatos;

{$R *.dfm}

procedure TFrame1.cbInquilinoClick(Sender: TObject);
begin
  qInquilino.Connection := DM.Conexion;
  qInquilino.Close;
  qInquilino.ParamByName('Descripcion').AsString := cbInquilino.Text + '%';
  qInquilino.Open;

  cbInquilino.DropDown;
end;

procedure TFrame1.cbInquilinoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13  then
  begin
    qInquilino.Connection := DM.Conexion;
    qInquilino.Close;
    qInquilino.ParamByName('Descripcion').AsString := cbInquilino.Text + '%';
    qInquilino.Open;

    cbInquilino.DropDown;
  end;
end;

procedure TFrame1.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
   Key := #0;
end;

end.
