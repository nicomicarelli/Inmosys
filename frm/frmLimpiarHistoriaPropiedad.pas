unit frmLimpiarHistoriaPropiedad;

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
  TfLimpiarHistoriaPropiedad = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    lblSobreDestino: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    edtSobreDestino: TEdit;
    cboSobre: TComboBox;
    Todos: TCheckBox;
    edDesde: TEdit;
    Edit1: TEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TodosClick(Sender: TObject);
    procedure edtSobreDestinoChange(Sender: TObject);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure cboSobreChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLimpiarHistoriaPropiedad: TfLimpiarHistoriaPropiedad;

implementation

uses frmprincipal, frmdatos;

{$R *.dfm}

procedure TfLimpiarHistoriaPropiedad.btnGrabarClick(Sender: TObject);
var
  q, q1: TFXQuery;
  I: Integer;
  CDS: TClientDataset;
  dsp: TDataSetProvider;
  Cantidad: Integer;
begin
  DM.IniciarTransaccion;
  q := CrearQuery;
  try
    try
      q.SQL.Text := 'Delete from ItemAutom where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(edDesde.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from CtaCteInquilino where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(edDesde.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from CtaCtePropietario where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(edDesde.Text);
      q.ExecSQL;

      q.SQL.Text := 'Delete from Impuestos where Cast(codinq as Integer) = :Codinq ';
      q.ParamByName('Codinq').AsInteger := ToInt(edDesde.Text);
      q.ExecSQL;

      DM.ConfirmarTransaccion;

      MostrarDialogoAceptar('Datos eliminados satisfactoriamente.');
      Close;
    except
      DM.CancelarTransaccion;
    end;
  finally
    FreeAndNil(q);
    FreeAndNil(q1);
  end;
end;

procedure TfLimpiarHistoriaPropiedad.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfLimpiarHistoriaPropiedad.cboSobreChange(Sender: TObject);
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

procedure TfLimpiarHistoriaPropiedad.TodosClick(Sender: TObject);
begin
  if todos.Checked then
  begin
    edtSobreDestino.Text:='';
    cboSobre.ItemIndex := -1;
  end;

  if edtSobreDestino.Text = '' then
    Todos.Checked := True;
end;

procedure TfLimpiarHistoriaPropiedad.edtSobreDestinoChange(Sender: TObject);
begin
  if edtSobreDestino.Text <> '' then
    todos.Checked:=False
  else
    todos.Checked:=True;
end;

procedure TfLimpiarHistoriaPropiedad.edtSobreDestinoKeyPress(Sender: TObject;
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

procedure TfLimpiarHistoriaPropiedad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fLimpiarHistoriaPropiedad := nil;
  Action := caFree;
end;

procedure TfLimpiarHistoriaPropiedad.FormCreate(Sender: TObject);
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
