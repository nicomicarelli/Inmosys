unit admconsorcios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, ABMConsorcios,
  abmGastosConsorcios, AsignacionGastosConsorcios;

type
  TfrmConsorcios = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    ListView1: TListView;
    Button1: TButton;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Class Procedure Ejecutar;
  end;

var
  frmConsorcios: TfrmConsorcios;

implementation

{$R *.dfm}

procedure TfrmConsorcios.Button1Click(Sender: TObject);
begin
  Close;
end;

class procedure TfrmConsorcios.Ejecutar;
begin
  with TfrmConsorcios.Create(Application) do
    ShowModal;
end;

procedure TfrmConsorcios.FormCreate(Sender: TObject);
var
  Items: TStringList;
  I:     Integer;

begin
  Items := TStringList.Create;
  with Items do
  begin
    Add('ABM de Consorcios');
    Add('Carga de Departamentos/P.H.');
    Add('ABM Conceptos de Gastos');
    Add('Carga de Gastos a Consorcios');
    Add('Asignacion de Gastos');
    Add('Impresion de Listados');
    Add('Impresion de Recibos');
    Add('Impresion de Liquidaciones');
  end;

  For I:= 0 to 6 do
    with ListView1.Items.Add do
    begin
      Caption := Items.Strings[I];
      ImageIndex := 0;
    end;
  Items.Free;

end;

procedure TfrmConsorcios.ListView1DblClick(Sender: TObject);
begin
//  ModalResult := mrOk;
//  case listview1.ItemIndex of
//    0:  TFrmABMConsorcios.Ejecutar;
//    1:  TFrmABMDepartamentos.Ejecutar;
//    2:  TFrmABMGastosConsorcios.Ejecutar;
//    3:  TfrmAsignacionGastos.Ejecutar;
//  end;
end;

end.
