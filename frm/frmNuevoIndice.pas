unit frmNuevoIndice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  System.Actions, FXQuery, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TFNuevoIndice = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    cxGroupBox2: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    edtCodigo: TEdit;
    edtDescripcion: TEdit;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edMensual: TEdit;
    edBimestral: TEdit;
    Label2: TLabel;
    edTrimestral: TEdit;
    Label3: TLabel;
    edCuatrimestral: TEdit;
    Label4: TLabel;
    edSemestral: TEdit;
    Label5: TLabel;
    edAnual: TEdit;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure actNuevoExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure edMensualKeyPress(Sender: TObject; var Key: Char);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  FNuevoIndice: TFNuevoIndice;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, frmABMRazonesSociales,
  frmABMIndicesActualizacion;

{$R *.DFM}

procedure TFNuevoIndice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FNuevoIndice := nil;
end;

procedure TFNuevoIndice.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

function TFNuevoIndice.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripción. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edMensual.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un porcentaje. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edBimestral.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un porcentaje. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edTrimestral.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un porcentaje. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edCuatrimestral.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un porcentaje. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edSemestral.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un porcentaje. ', mtInformation);
    Result := False;
    Exit;
  end;
  if Trim(edAnual.text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un porcentaje. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

procedure TFNuevoIndice.edtDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   if Trim(edtDescripcion.Text) = '' then
     EdtDescripcion.SetFocus;
end;

procedure TFNuevoIndice.actNuevoExecute(Sender: TObject);
var
  I: Integer;

begin
  for I := 1 to Self.ControlCount - 1 do
  begin
    if TWinControl.ClassNameIs('TEdit') then
    begin
      Self.Controls[I].Enabled := True;
      TEdit(Self.Controls[I]).Text    := '';
    end;
  end;
end;

procedure TFNuevoIndice.actGrabarExecute(Sender: TObject);
var
  Codigo:      string;
  Descripcion: string;
  Mensual:  Double;
  Bimestral:  Double;
  Trimestral:  Double;
  Cuatrimestral:  Double;
  Semestral:  Double;
  Anual:  Double;
  Porcentajes: TPorcentajes;
begin
  Codigo      := edtCodigo.text;
  Descripcion := edtDescripcion.text;
  Mensual     := ToFloat(edMensual.Text);
  Bimestral   := ToFloat(edBimestral.Text);
  Trimestral  := ToFloat(edTrimestral.Text);
  Cuatrimestral := ToFloat(edCuatrimestral.Text);
  Semestral     := ToFloat(edSemestral.Text);
  Anual         := ToFloat(edAnual.Text);

  if ValidarDatos then
  begin
    Porcentajes[0] := Mensual;
    Porcentajes[1] := Bimestral;
    Porcentajes[2] := Trimestral;
    Porcentajes[3] := Cuatrimestral;
    Porcentajes[4] := Semestral;
    Porcentajes[5] := Anual;

    if DM.GrabarIndice(Codigo, Descripcion, Porcentajes, Operacion) then
    begin
      MostrarDialogoAceptar('Información','El Indice se grabo satisfactoriamente', mtInformation);
      Close;
    end;
  end;
end;


procedure TFNuevoIndice.DatosKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        if Length(edtCodigo.Text) = 1 then
          edtCodigo.Text := '0' + edtCodigo.Text;
        edtDescripcion.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from Indice where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          Mostrardialogoaceptar('Ya existe un Indice con ese Código. Verifique por favor.', mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          EdtCodigo.SetFocus;
      end;
      if not (Key in ['0'..'9', #8]) then
        Key := #0;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoIndice.edMensualKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#13, #8, '.',',','-']) then
    Key := #0;
end;

procedure TFNuevoIndice.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    With q do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from Indices where codigo = :Codigo');
      ParamByName('Codigo').AsString := edtCodigo.Text;
      ExecSql;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TFNuevoIndice.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(EdtCodigo.Text) <> '');
end;

procedure TFNuevoIndice.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFNuevoIndice.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  Codigo: Integer;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.sql.text := ' Select Coalesce(Max(Codigo) + 1, 1) as Codigo ' +
                    '   From Indices ';
      q.Open;

      Codigo := q.FIeldbyName('Codigo').AsInteger;
    finally
      q.free;
    end;
    edtCodigo.Text := Inttostr(Codigo);
    edtDescripcion.Text := '';
  end;

  if Operacion = toModificar then
  begin
    edtDescripcion.SetFocus;
  end;

  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from Indices where codigo=:Codigo';
    q.ParamByName('Codigo').AsInteger := ToInt(pCodigo);
    q.Open;

    if pCodigo <> '' then
    begin
      edtCodigo.Text               := q.FieldbyName('Codigo').asstring;
      edtDescripcion.Text          := q.Fieldbyname('Descripcion').asstring;
      edMensual.Text               := FormatFloat('0.000', q.Fieldbyname('Mensual').asFloat);
      edBimestral.Text             := FormatFloat('0.000', q.Fieldbyname('Bimestral').asFloat);
      edTrimestral.Text            := FormatFloat('0.000', q.Fieldbyname('Trimestral').asFloat);
      edCuatrimestral.Text         := FormatFloat('0.000', q.Fieldbyname('Cuatrimestral').asFloat);
      edSemestral.Text             := FormatFloat('0.000', q.Fieldbyname('Semestral').asFloat);
      edAnual.Text                 := FormatFloat('0.000', q.Fieldbyname('Anual').asFloat);
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edtCodigo.Enabled  := (Operacion in  [toNuevo]);
    edtDescripcion.Enabled  := (Operacion in  [toNuevo, toModificar]);

  finally
    FreeAndNil(q);
  end;

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMIndicesActualizacion) then
      FABMIndicesActualizacion.ActualizarClick(nil);
  end;
end;

end.
