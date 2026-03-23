unit frmGestionEmail;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, DB, StrUtils, DBClient, Menus,
  Grids, DBGrids, ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  objEnviarEmails, Types, DBTables, Windows, SQLExpr, ALIGRID, Provider, FXQuery,
  System.UITypes;

type
  TProcesosMail = (modNone=0, modLiquidacionPropietarios, modLiquidacionInquilinos);
  TEstado = (evNone=0, evEnviando, evCancelado);
  TModo = (mMODIFICACION, mNUEVO);
  TTipoCondicion = (tcString, tcInteger, tcFloat, tcDate);
  TBuscaMailsDesde = (bmdNone=0, bmdInquilinos, bmdPropietarios);

  // si manda los mails via gestor o via automatica
  TProcesoMails = ( gcInterface, gcProcesoEnvioMails );

  TfGestionEmail = class(TForm)
    Panel2: TPanel;
    pmTareas: TPopupMenu;
    mnuEliminartarea: TMenuItem;
    mnuNuevaTarea: TMenuItem;
    btConectar: TButton;
    lbServidor: TLabel;
    lbPuerto: TLabel;
    pgGestorMail: TPageControl;
    tbTareas: TTabSheet;
    tbConfiguracion: TTabSheet;
    lbEmail: TLabel;
    edEmail: TEdit;
    lbContrasenia: TLabel;
    edContrasenia: TEdit;
    edServidor: TEdit;
    edPuerto: TEdit;
    chRequiereSSL: TCheckBox;
    mnuEjecutarTarea: TMenuItem;
    mnuModificarTarea: TMenuItem;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    pb: TProgressBar;
    mnuEstableceTareaPredeter: TMenuItem;
    Label5: TLabel;
    Shape1: TShape;
    N3: TMenuItem;
    StatusMail: TMemo;
    btSalir: TBitBtn;
    gTareas: TStringAlignGrid;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAgregarTareaClick(Sender: TObject);
    procedure btRefrescarClick(Sender: TObject);
    procedure btEjecutarTareaClick(Sender: TObject);
    procedure mnuEliminartareaClick(Sender: TObject);
    procedure mnuModificarTareaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuEstableceTareaPredeterClick(Sender: TObject);
    procedure btConectarClick(Sender: TObject);
    procedure gTareasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSalirClick(Sender: TObject);

  private
    FobjClienteMail: TEnviarEmail;
    FSMTPConectado: Boolean;
    FIDEmail: SmallInt;
    qTareasWF : TFXQuery;

    function fxVerificarRequeridos: Boolean;
    procedure prCargarTareas;
    procedure prInicializar;
    procedure prEliminarTarea;
    procedure prErrorConectarSMTP;
    procedure prGrabarConfiguracionMail;
    procedure prLeerConfiguracionMail;
    function fxEjecutarTarea(pniCodigoTarea: Integer): Integer;
    procedure SetPredeterminada;
    function fxConectar: boolean;
    procedure Desconectar;
  public
    Proceso: TProcesosMail;
    OnAdjuntarArchivo: TNotifyEvent;
    OnStatus: TNotifyEvent;
    BuscaMailsDesde: TBuscaMailsDesde;
    CDS: TClientDataSet;
    slArchivosAdjuntos: TStringList;
    Estado: TEstado;
    Transaccion: TTransactionDesc;

    function fxEjecutarTareaDefectiva: integer;
  end;

var
  fGestionEmail: TfGestionEmail;

const
  SALTO = #13#10;

implementation

{$R *.dfm}

uses Funciones, frmPrincipal,  frmDatos;//, EncripcionDecripcion;

const
  Seed = 52845;

procedure TfGestionEmail.Desconectar;
begin
  FObjClienteMail.Desconectar;
  FSMTPConectado := False;
end;

function TfGestionEmail.fxConectar: boolean;
begin
  Result := false;
  if not fxVerificarRequeridos then
    Exit;

  FObjClienteMail.OnErrorConectarSMTP := prErrorConectarSMTP;
  FobjClienteMail.Login.Servidor      := edServidor.Text;
  FobjClienteMail.Login.Puerto        := StrToInt(edPuerto.Text);
  FobjClienteMail.Login.RequiereSSL   := chRequiereSSL.Checked;
  FobjClienteMail.Login.usuario       := edEmail.text;
  FobjClienteMail.Login.password      := edContrasenia.text;
  FobjClienteMail.PrepararConexion;
  if FobjClienteMail.fxProbarConexionSMTP then
  begin
     prGrabarConfiguracionMail;
     Result := true;
  end
  else
     StatusMail.Lines.Add('Error de conexión con servidor de e-mail.' + SALTO + SALTO + FobjClienteMail.status );
end;

procedure TfGestionEmail.btRefrescarClick(Sender: TObject);
begin
  prCargarTareas;
end;

procedure TfGestionEmail.btSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfGestionEmail.btConectarClick(Sender: TObject);
begin
  StatusMail.Lines.Clear;
  if fxConectar then
     StatusMail.Lines.Add('Conexión con servidor de e-mail OK')
end;

procedure TfGestionEmail.btEjecutarTareaClick(Sender: TObject);
var
  niMailsEnviados: integer;
begin
  if not fxVerificarRequeridos then
    Exit;

  if ToInt(gTareas.Cells[1, gTareas.Row]) = 0 then
    Exit;

  niMailsEnviados := fxEjecutarTarea(ToInt(gTareas.Cells[1, gTareas.Row]));
  MostrarDialogoAceptar(Format( 'Se enviaron %d correo(s) electrónico(s).', [niMailsEnviados] ));
end;

function TfGestionEmail.fxVerificarRequeridos: Boolean;
var
  stEmail, stEmailOriginal: string;
begin
  Result := False;
  stEmailOriginal := Trim(edEmail.Text);
  stEmail := ValidarEmail(stEmailOriginal);

  if (Length(stEmail) > 0) or (stEmailOriginal = '') then
  begin
    MessageDlg('Debe ingresar una dirección de e-mail válida. Verifique por favor.', mtWarning, [mbOK], 0);
    edEmail.SetFocus;
    Exit;
  end;

  if Trim(edContrasenia.Text)= '' then
  begin
    MessageDlg('Debe ingresar la contraseña de la casilla de e-mail. Verifique por favor.', mtWarning, [mbOK], 0);
    edContrasenia.SetFocus;
    Exit;
  end;

  if Trim(edServidor.Text)= '' then
  begin
    MessageDlg('Debe ingresar el servidor SMTP. Verifique por favor.', mtWarning, [mbOK], 0);
    edServidor.SetFocus;
    Exit;
  end;

  if Trim(edPuerto.Text)= '' then
  begin
    MessageDlg('Debe ingresar el puerto. Verifique por favor.', mtWarning, [mbOK], 0);
    edPuerto.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfGestionEmail.gTareasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if qTareasWF.IsEmpty then
    Exit;

  if qTareasWF.FieldByName('PORDEFECTO').AsInteger = 1 then
  begin
      if not (gdSelected in State) then
      begin
          gTareas.Canvas.Font.Color  := clBlack;
          gTareas.Canvas.Brush.Color := clMoneyGreen;
      end
      else
      begin
          gTareas.Canvas.Brush.Color  := clMoneyGreen;
          gTareas.Canvas.Font.Color   := clBlack;
      end;
  end;
//  gTareas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfGestionEmail.mnuModificarTareaClick(Sender: TObject);
begin
  if qTareasWF.IsEmpty then
    Exit;
(*
  fNuevaTareaGestion := TfNuevaTareaGestion.Create(Application);
  with fNuevaTareaGestion do
  begin
    Proceso  := fGestionEmail.Proceso;
    prCargarTarea(ToInt(gTareas.Cells[1,gTareas.Row]));
    Modo := mModificacion;
    Caption := 'Modificar Tarea';
    ShowModal;
  end;
*)
end;

procedure TfGestionEmail.mnuEliminartareaClick(Sender: TObject);
begin
  if MessageDlg('¿Esta seguro que desea eliminar la tarea?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    prEliminarTarea;
    prCargarTareas;
  end;
end;

procedure TfGestionEmail.btAgregarTareaClick(Sender: TObject);
begin
(*  fNuevaTareaGestion := TfNuevaTareaGestion.Create(Application);
  with fNuevaTareaGestion do
  begin
     Proceso  := fGestionEmail.Proceso;
     Modo     := mNUEVO;
     Caption  := 'Nueva Tarea';
     ShowModal;
  end;
  prCargarTareas; *)
end;

procedure TfGestionEmail.prEliminarTarea;
var
  qEliminarTarea: TFXQuery;
begin
  qEliminarTarea := CrearQuery;
  DM.IniciarTransaccion;
  try
    qEliminarTarea.SQL.Text := 'Delete From WorkFlow WF Where WF.IDWorkFlow =  :pIDWF';
    qEliminarTarea.ParamByName('pIDWF').AsInteger := ToInt(gTareas.Cells[1, gTareas.Row]);
    qEliminarTarea.ExecSQL;
    DM.ConfirmarTransaccion;
    MostrarDialogoAceptar( 'Datos eliminados correctamente.');
  except
    on E: Exception do
    begin
      DM.CancelarTransaccion;
      MostrarDialogoAceptar('Ocurrio un error al grabar la actividad. Datos Técnicos: ' + e.Message, mtError);
    end;
  end;
end;

procedure TfGestionEmail.prErrorConectarSMTP;
begin
  FSMTPConectado := False;
end;

procedure TfGestionEmail.prGrabarConfiguracionMail;
var
  qEmail: TFXQuery;
begin
  qEmail := CrearQuery;
  if FIDEmail = 0 then
  begin
    qEmail.SQL.Text :=
      ' Insert Into Configuracion_Email (IDEmail, Email, Password, SMTP, PuertoSMTP, FechaModificacion, RequiereSSL)' +
      '               Values (:IDEmail, :Email, :Password, :SMTP, :PuertoSMTP, current_timestamp, :RequiereSSL) ';

    FIDEmail := 1;
  end
  else
    qEmail.SQL.Text :=
      ' Update Configuracion_Email ' +
      '    Set Email             = :Email, ' +
      '        Password          = :Password, ' +
      '        SMTP              = :SMTP, ' +
      '        PuertoSMTP        = :PuertoSMTP, ' +
      '        RequiereSSL       = :RequiereSSL, ' +
      '        FechaModificacion = current_timestamp ' +
      '  Where IDEmail           = :IDEmail ';

  Dm.IniciarTransaccion;
  try
    try
      qEmail.ParamByName('IDEmail').AsInteger     := FIDEmail;
      qEmail.ParamByName('Email').AsString        := edEmail.Text;
      qEmail.ParamByName('Password').AsString     := AnsiString(edContrasenia.Text);
      qEmail.ParamByName('SMTP').AsString         := edServidor.Text;
      qEmail.ParamByName('PuertoSMTP').AsString   := edPuerto.Text;
      qEmail.ParamByName('RequiereSSL').AsInteger := BoolToInt(chRequiereSSL.Checked);
      qEmail.ExecSQL;

      DM.ConfirmarTransaccion;
     MostrarDialogoAceptar( 'Datos grabados correctamente.');
    except
      On E: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar la configuración de email. Datos Técnicos: ' + e.Message, mtError);
      end;
    end;
  finally
    FreeAndNil(qEmail);
  end;
end;

procedure TfGestionEmail.prLeerConfiguracionMail;
var
  qEmail: TFXQuery;
begin
  qEmail := CrearQuery;
  try
    try
      qEmail.SQL.Text :=
        ' Select E.IDEmail, E.Email, E.Password, E.SMTP, E.PuertoSMTP, E.RequiereSSL ' +
        '   From Configuracion_Email E ';
      qEmail.Open;
    except
      on E: Exception do
        MostrarDialogoError('Ocurrio un error al leer la configuracion del email. Datos Técnicos: ' + e.Message);
    end;

    if not qEmail.IsEmpty then
    begin
      FIDEmail               := qEmail.FieldByName('IDEmail').AsInteger;
      edEmail.Text           := qEmail.FieldByName('Email').AsString;
      edContrasenia.Text     := AnsiString(qEmail.FieldByName('Password').AsString);
      edServidor.Text        := qEmail.FieldByName('SMTP').AsString;
      edPuerto.Text          := qEmail.FieldByName('PuertoSMTP').AsString;
      chRequiereSSL.Checked  := (qEmail.FieldByName('RequiereSSL').AsInteger = 1);
    end;
  finally
    FreeAndNil(qEmail);
  end;
end;

function TfGestionEmail.fxEjecutarTarea(pniCodigoTarea: Integer): Integer;
var
  qCondiciones, qVariables, qTareas: TFXQuery;
  lst, stCondiciones, stCuerpoMail: string;
  reg, i, niContador: Integer;
  eResultadoEnvio: TResultadoEnvio;
  CDScONDICIONES: TClientDataSet;
  dspCondiciones: TDatasetProvider;
    function FxValor(v:string): string;
    begin
      if (v = '') or (v = #39#39) then
         Result := #39#39
      else
         Result := v;
    end;

begin
  cdsCondiciones := TClientDataSet.Create(nil);
  dspCondiciones := TDatasetProvider.Create(nil);

  Result := 0;

  if not Assigned(CDS) then
     exit;

  if BuscaMailsDesde = bmdNone then
     exit;

  if Proceso = modNone then
     exit;

  if not fxConectar then
  begin
    MostrarDialogoAceptar('Error de conexión con server de e-mail.');
    exit;
  end;

  qCondiciones := CrearQuery;
  qVariables := CrearQuery;
  try
    try
        qCondiciones.SQL.Text :=
          ' Select C.IDCampo, C.Operador, C.Valor, C.Nexo, WF.Nombre, WF.Descripcion, P.IDPlantilla, ' +
          '        P.AsuntoEmail, P.RemitenteEmail, P.CuerpoMail ' +
          '   From CondicionesWF C ' +
          '  Inner Join WorkFlow WF On C.IDWorkFlow = WF.IDWorkFlow ' +
          '  Inner Join PlantillasMailWF P On P.IDWorkFlow = WF.IDWorkFlow ' +
          '  Where C.IDWorkFlow = :pniIDWF ';

        qCondiciones.ParamByName('pniIDWF').AsInteger := pniCodigoTarea;
        qCondiciones.Open;

        dspCondiciones.DataSet := qCondiciones;

        cdsCOndiciones.Data := dspCondiciones.Data;
        cdsCOndiciones.Open;
        niContador := 0;
        while not cdsCOndiciones.Eof do
        begin
          Inc(niContador);

          if CDS.Fields.Fields[cdsCOndiciones.FieldByName('IDCAMPO').AsInteger].Name = 'CDIGO' then
            stCondiciones := ' ' + stCondiciones + ' ' +
                           'CODINQ' + ' ' +
                           cdsCOndiciones.FieldByName('Operador').AsString + ' ' +
                           FxValor(cdsCOndiciones.FieldByName('Valor').AsString) + ' '
          ELSE
            stCondiciones := ' ' + stCondiciones + ' ' +
                         CDS.Fields.Fields[cdsCOndiciones.FieldByName('IDCAMPO').AsInteger].Name + ' ' +
                         cdsCOndiciones.FieldByName('Operador').AsString + ' ' +
                         FxValor(cdsCOndiciones.FieldByName('Valor').AsString) + ' ';

          //Si es la última condición no pongo el nexo.
          if niContador <> cdsCOndiciones.RecordCount then
            stCondiciones := ' ' + stCondiciones + ' ' + cdsCOndiciones.FieldByName('Nexo').AsString + ' ';

          cdsCOndiciones.Next;
        end;

        CDS.DisableControls;
        CDS.Filtered := False;
        CDS.Filter := stCondiciones;
        CDS.Filtered := True;
        CDS.FilterOptions := [foCaseInsensitive];

        reg := 1;
        if fGestionEmail.Visible then
        begin
            pb.position := 0;
            pb.Max := cds.recordcount;
        end;

        Estado := evEnviando;
        while not CDS.Eof do
        begin
            if Estado = evCancelado then
              break;

            stCuerpoMail := cdsCOndiciones.FieldByName('CuerpoMail').AsString;

            if Assigned(OnAdjuntarArchivo) then
               OnAdjuntarArchivo(Self);

            FobjClienteMail.strAsunto     := cdsCOndiciones.FieldByName('AsuntoEmail').AsString;
            FobjClienteMail.strDe         := cdsCOndiciones.FieldByName('RemitenteEmail').AsString;
            FobjClienteMail.strMailOrigen := edEmail.Text;
            FobjClienteMail.strPassword   := edContrasenia.Text;

            if slArchivosAdjuntos.Count > 0 then
               FobjClienteMail.ArchivosAdjuntos.Text := slArchivosAdjuntos.Text;

            if BuscaMailsDesde = bmdPropietarios then
            begin
               try
                  lst := fxObtenerMail(cds.FieldByName('Codinq').AsString, True)
               except
               end;
            end
            else if BuscaMailsDesde = bmdInquilinos then
                  lst := fxObtenerMail(cds.FieldByName('Codinq').AsString, False);

            if lst <> '' then
            begin
                FobjClienteMail.slMailDestino.Clear;
                FobjClienteMail.slMailDestino.CommaText := AnsiReplaceStr(lst,';',',');

                if (FobjClienteMail.slMailDestino.Count > 0) then
                begin
                  FobjClienteMail.slCuerpoMensaje.Clear;
                  //recorremos los campos de clientdataset y lo reemplazamos por el registro
                  for i := 0 to CDS.Fields.Count -1 do
                        stCuerpoMail := AnsiReplaceStr(stCuerpoMail,
                                                      '[' + trim(CDS.Fields.Fields[I].Name) + ']' ,
                                                      CDS.Fields.Fields[I].AsString );

                  FobjClienteMail.slCuerpoMensaje.Text := stCuerpoMail;
                  eResultadoEnvio := FobjClienteMail.fxEnviar;

                  if eResultadoEnvio = envErrorConexionServidor then
                     raise Exception.Create( 'Problemas de conexión:' + SALTO + FobjClienteMail.status )
                  else if eResultadoEnvio = envErrorEnvio then
                     raise Exception.Create( 'Problemas de envío:' + SALTO + FobjClienteMail.status );

                  Inc(Result);
                end;

                if fGestionEmail.Visible = false then
                begin
                  if Assigned(OnStatus) then
                     OnStatus(Self);
                end;
                Application.ProcessMessages;
                Sleep(1000);  // una pausa para no atorar
            end;

            for i := 0 to slArchivosAdjuntos.Count -1 do
              DeleteFile(PWideChar(slArchivosAdjuntos[i]));

            CDS.Next;
            if fGestionEmail.Visible then
            begin
               inc(reg);
               pb.position := reg;
            end;
            Application.ProcessMessages;
        end;

        Estado := evNone;
        if fGestionEmail.Visible then
           pb.position := cds.recordcount;

    except
        on e:exception do
        begin
           pb.position := 0;
           MostrarDialogoAceptar('Se produjeron problemas al enviar los e-mails:' + SALTO + e.message );
           Result := 0;
        end;
    end;
  finally
    Desconectar;

    FreeAndNil(qCondiciones);
    FreeAndNil(qVariables);
    FreeAndNil(qTareas);
    CDS.Filtered := False;
    CDS.EnableControls;
  end;
end;

procedure TfGestionEmail.mnuEstableceTareaPredeterClick(Sender: TObject);
begin
   SetPredeterminada;
end;

procedure TfGestionEmail.SetPredeterminada;
var q: TFXQuery;
    n:integer;
    id:integer;
    bPorDefecto: boolean;
begin
  q := CrearQuery;
  try
      bPorDefecto := (gTareas.Cells[2, gTareas.Row] = '1');
      DM.IniciarTransaccion;
      try
        n := ToInt(gTareas.Cells[1, gTareas.Row]);
        id := ToInt(gTareas.Cells[3, gTareas.Row]);

        q.SQL.Text := 'Update WorkFlow Set PorDefecto = 0 where idmodulowf = :id';
        q.ParambyName('ID').asInteger := id;
        q.ExecSQL;

        q.SQL.Text := Format( 'Update WorkFlow Set PorDefecto = %d Where IDWORKFLOW = %d and idmodulowf = %d', [ BoolToInt(not bPorDefecto), n, ID ] );
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        prCargarTareas;
        MostrarDialogoAceptar( 'Datos grabados correctamente.');
      except
        on e:exception do
        begin
          DM.CancelarTransaccion;
          MostrarDialogoAceptar('Ocurrio un error al actualizar tarea. Datos Técnicos: ' + e.Message);
        end;
      end;
  finally
      q.free;
  end;
end;

function TfGestionEmail.fxEjecutarTareaDefectiva: integer;
var q: TFXQuery;
begin
  Result := 0;
  prInicializar;

  if not fxVerificarRequeridos then
    Exit;

  q := CrearQuery;
  try
   q.SQL.Text := 'Select * from WORKFLOW Where PorDefecto = 1 and IDMODULOWF = :IDmODULO';
   q.ParambyName('idModulo').AsInteger := Ord(Proceso);
   q.open;
   if not q.IsEmpty then
     Result := fxEjecutarTarea( q.FieldByName('IDWorkFlow').AsInteger);

   q.close;
  finally
   q.free;
  end;
end;

procedure TfGestionEmail.prInicializar;
begin
  FObjClienteMail := TEnviarEmail.Create;
  qTareasWF :=  CrearQuery;
  slArchivosAdjuntos := TStringList.Create;
//  CDS := TClientDataSet.Create(nil);
  prCargarTareas;
  prLeerConfiguracionMail;
end;

procedure TfGestionEmail.prCargarTareas;
var
  I: Integer;
begin
  qTareasWF.SQL.Text := 'Select * From WorkFlow WF Where WF.IdModuloWF = :pniModulo';
  qTareasWF.ParamByName('pniModulo').AsInteger := Ord(Proceso);
  qTareasWF.Open;
  gTareas.Vaciar;
  I := 1;
  while not qTareasWF.eof do
  begin
    gTareas.cells[0, I] := qTareasWF.FieldByName('Nombre').AsString;
    gTareas.cells[1, I] := qTareasWF.FieldByName('IDWorkFlow').AsString;
    gTareas.cells[2, I] := qTareasWF.FieldByName('PorDefecto').AsString;
    gTareas.cells[3, I] := qTareasWF.FieldByName('IDModuloWF').AsString;
    qTareasWF.Next;
    Inc(I);
  end;
  if I<2 then
    gTareas.RowCount := 2
  else
    gTareas.RowCount := I;

end;

procedure TfGestionEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FObjClienteMail.Free;
  slArchivosAdjuntos.free;
  qTareasWF.Free;

  fGestionEmail := nil;
  Action := caFree;
end;

procedure TfGestionEmail.FormShow(Sender: TObject);
begin
  fPrincipal.Center(Self);
  prInicializar;
end;

end.
