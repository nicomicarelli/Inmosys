unit frmConfiguracionMail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Grids, ALIGRID,
  StdCtrls, DB, DBtables, DBCtrls, ExtCtrls, Buttons, Menus, ComCtrls, StrUtils,
  Dialogs, Funciones, frmDatos, frmGestionEmail, SQLExpr, Declaraciones, FXQuery,
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
  TfConfiguracionMail = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btGrabar: TAdvGlowButton;
    btSalir: TAdvGlowButton;
    cxGroupBox2: TcxGroupBox;
    pmReglas: TPopupMenu;
    Eliminartarea1: TMenuItem;
    Label2: TLabel;
    lbNombre: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    lbVariablePreview: TLabel;
    Label3: TLabel;
    edNombre: TEdit;
    edDescripcion: TMemo;
    edAsunto: TEdit;
    edNombreRemitente: TEdit;
    btAgregarVariable: TBitBtn;
    edCuerpo: TMemo;
    cbVariables: TComboBox;
    edID: TEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btGrabarClick(Sender: TObject);
    procedure btAgregarVariableClick(Sender: TObject);
    procedure SetPreview(Sender: TObject);
    procedure cbVariablesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btSalirClick(Sender: TObject);

  private
    procedure prGrabarNuevaTarea;
    function  fxValidarRequeridos: Boolean;
  public
    FOperacion: TTipoOperacion;
    FIDPlantilla, FIDTarea: integer;
    Modo: TModo;
    Proceso: TProcesosMail;
    Transaccion: TTransactionDesc;

    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);

  end;

var
  fConfiguracionMail: TfConfiguracionMail;

implementation

{$R *.dfm}

  uses frmPrincipal, frmABMConfiguracionMails;

const
  niColCampo           = 0;
  niColCondicion       = 1;
  niColValor           = 2;
  niColNexo            = 3;
  niColCodigoCampo     = 4;

procedure TfConfiguracionMail.btAgregarVariableClick(Sender: TObject);
var
  niLargoTexto, niNumeroLinea: Integer;
begin
  if (cbVariables.ItemIndex = -1) or (Trim(cbVariables.Text) = '') then
    Exit;

  //obtengo la linea en la que esta el cursor para despues sumarsela al copy dado que pierde una posición por linea nueva
  niNumeroLinea := SendMessage(edCuerpo.Handle, EM_LINEFROMCHAR, edCuerpo.SelStart, 0);
  niLargoTexto := Length(Copy(edCuerpo.Text, 1, edCuerpo.SelStart));

  edCuerpo.Text :=
  // Copio el texto antes de la ubicación del cursor
    Copy(edCuerpo.Text, 1, edCuerpo.SelStart + niNumeroLinea) +
  // agrego el texto de la variable
    lbVariablePreview.Caption +
  // agrego lo que estaba despues del cursor
    Copy(edCuerpo.Text, edCuerpo.SelStart + edCuerpo.SelLength  + niNumeroLinea + 1, length(edCuerpo.Text));

  // borro la selección
  edCuerpo.SelLength := 0;
  // seteo el cursor despues del texto insertado
  edCuerpo.SelStart := niLargoTexto + Length(lbVariablePreview.Caption) + 1;
  edCuerpo.SelLength := Length(lbVariablePreview.Caption) + 1;

  edCuerpo.SetFocus;
end;

procedure TfConfiguracionMail.btGrabarClick(Sender: TObject);
begin
  if not fxValidarRequeridos then
    Exit;

  prGrabarNuevaTarea;

  Close;
end;



procedure TfConfiguracionMail.btSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfConfiguracionMail.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q, qNuevaTarea: TFXQuery;

begin
  FOperacion := Operacion;

  if Operacion = toNuevo then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select Coalesce(Max(ID), 0) + 1 as ID from configuracionMail ';
      q.Open;
      edID.Text := q.FieldbyName('ID').AsString;
    finally
      Q.fREE;
    end;
    edNombre.Text := '';
    edDescripcion.Text := '';
    edAsunto.Text := '';
    edNombreRemitente.Text := '';
    edCuerpo.Text := '';
  end;

  if Operacion in [toModificar, toEliminar] then
  begin
    edAsunto.SetFocus;

    q := CrearQuery;
    try
      q.SQL.Text := 'Select * from configuracionMail where ID=:ID';
      q.ParamByName('ID').AsString := pCodigo;
      q.Open;

      edID.Text := q.FieldByName('ID').AsString;
      edNombre.Text := q.FieldByName('Nombre').AsString;
      edDescripcion.Text := q.FieldByName('Descripcion').AsString;
      edAsunto.Text := q.FieldByName('Asunto').AsString;
      edNombreRemitente.Text := q.FieldByName('NombreRemitente').AsString;
      edCuerpo.Text := q.FieldByName('Cuerpo').AsString;
    finally
      FreeAndNil(q);
    end;
  end;

  btGrabar.Visible := (Operacion in [toNuevo, toModificar]);
  edID.Enabled := False;
  edNombre.Enabled := (Operacion in [toNuevo, toModificar]);
  edDescripcion.Enabled := (Operacion in [toNuevo, toModificar]);
  edAsunto.Enabled := (Operacion in [toNuevo, toModificar]);
  edNombreRemitente.Enabled := (Operacion in [toNuevo, toModificar]);
  edCuerpo.Enabled := (Operacion in [toNuevo, toModificar]);

  if Operacion = toEliminar then
  begin
    if MostrarDialogoSino('Inmosys', '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
    begin
      qNuevaTarea := CrearQuery;
      DM.IniciarTransaccion;
      try
        try
          qNuevaTarea.SQL.Text :=
             ' DELETE FROM CONFIGURACIONMAIL WHERE ID = :ID ';
          qNuevaTarea.ParamByName('ID').AsString  := EDiD.TEXT;
          qNuevaTarea.ExecSQL;

          DM.ConfirmarTransaccion;
          MostrarDialogoAceptar( 'Datos eliminados correctamente.');
        except
          On E: Exception do
          begin
            DM.CancelarTransaccion;
            MostrarDialogoAceptar('Ocurrio un error al eliminar la configuracion de mails. Datos Técnicos: ' + e.Message);
          end;
        end;
      finally
        FreeAndNil(qNuevaTarea);
      end;
    end;
    Close;
    if Assigned(FABMConfiguracionMails) then
      FABMConfiguracionMails.ActualizarClick(nil);
  end;
end;

procedure TfConfiguracionMail.SetPreview(Sender: TObject);
var s:string;
begin
  s := Trim(cbVariables.Text);
  if (cbVariables.ItemIndex = -1) or (s = '') then
  begin
    lbVariablePreview.Visible := False;
    Exit;
  end;

  lbVariablePreview.Visible := True;
  lbVariablePreview.Caption := '[' + s + ']';
end;

procedure TfConfiguracionMail.cbVariablesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SetPreview( Sender );
end;

procedure TfConfiguracionMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  fConfiguracionMail:=nil;
end;

procedure TfConfiguracionMail.FormShow(Sender: TObject);
begin
  fPrincipal.Center(fConfiguracionMail);
  edNombre.SetFocus;
end;

procedure TfConfiguracionMail.prGrabarNuevaTarea;
var
  qNuevaTarea, qNuevaPlantilla: TFXQuery;

begin
  qNuevaTarea      := CrearQuery;
  qNuevaPlantilla  := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      qNuevaTarea.SQL.Text :=
         ' DELETE FROM CONFIGURACIONMAIL WHERE ID = :ID ';
      qNuevaTarea.ParamByName('ID').AsString  := EDiD.TEXT;
      qNuevaTarea.ExecSQL;

      qNuevaTarea.SQL.Text :=
         ' INSERT INTO CONFIGURACIONMAIL (ID, NOMBRE, DESCRIPCION, NOMBREREMITENTE, ASUNTO, CUERPO) '+
         ' VALUES (:ID, :NOMBRE, :DESCRIPCION, :NOMBREREMITENTE, :ASUNTO, :CUERPO)';
      qNuevaTarea.ParamByName('ID').AsString  := EDiD.TEXT;
      qNuevaTarea.ParamByName('Nombre').AsString       := edNombre.Text;
      qNuevaTarea.ParamByName('Descripcion').AsString  := edDescripcion.Text;
      qNuevaTarea.ParamByName('NombreRemitente').AsString  := edNombreRemitente.Text;
      qNuevaTarea.ParamByName('Asunto').AsString  := edAsunto.Text;
      qNuevaTarea.ParamByName('Cuerpo').AsString  := edCuerpo.Lines.Text;
      qNuevaTarea.ExecSQL;

      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      On E: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar la configuracion de mails. Datos Técnicos: ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(qNuevaTarea);
    FreeAndNil(qNuevaPlantilla);
  end;
end;

function TfConfiguracionMail.fxValidarRequeridos: Boolean;
begin
  Result := False;
  if Trim(edNombre.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un nombre para la configuración. Verifique por favor.');
    edNombre.SetFocus;
    Exit;
  end;

  if Trim(edDescripcion.Lines.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una descripción. Verifique por favor.');    edDescripcion.SetFocus;
    Exit;
  end;


  if Trim(edAsunto.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un asunto para el email. Verifique por favor.');
    edAsunto.SetFocus;
    Exit;
  end;

  if Trim(edNombreRemitente.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un remitente para el email. Verifique por favor.');
    edNombreRemitente.SetFocus;
    Exit;
  end;

  if Trim(edCuerpo.Lines.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un texto para el cuerpo del email. Verifique por favor.');
    edCuerpo.SetFocus;
    Exit;
  end;
  Result := True;
end;


end.
