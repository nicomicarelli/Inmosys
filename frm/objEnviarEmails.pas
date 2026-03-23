unit objEnviarEmails;

interface
  uses Classes, SysUtils,
       IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
       IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
       IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, IdAttachment, IdAttachmentFile,
       IdText, IdGlobal, IdException;

type
  TOnErrorConectarSMTP = procedure of object;
  TResultadoEnvio = (envNone, envOk, envErrorConexionServidor, envErrorEnvio );

  TEnviarEmail = class
  type
    TLogin = record
      Servidor: string;
      Puerto: integer;
      RequiereSSL: boolean;
      usuario, password: string;
    end;
  private
    FSMTP :TIdSmtp;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    ObjetoMensaje: TIdMessage;
    FOnErrorConectarSMTP: TOnErrorConectarSMTP;

  public
    ArchivosAdjuntos  : TStringList;
    slMailDestino : TStringList;
    slConCopia      : TStringList;
    slConCopiaOculta: TStringList;
    slCuerpoMensaje : TStringList;

    strAsunto     : string;  // el texto del asunto
    strDe         : string;  // indica aqui quien envia de modo coloquial
    strPassword   : string;
    strMailOrigen : string;  // e-mail que envia

    status: string;
    Login: TLogin;

    property SMTP: TIdSmtp read FSMTP write FSMTP;
    property OnErrorConectarSMTP: TOnErrorConectarSMTP read FOnErrorConectarSMTP write FOnErrorConectarSMTP;

    function fxEnviar: TResultadoEnvio;
    function fxProbarConexionSMTP: boolean;
    procedure PrepararConexion;
    procedure Desconectar;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TEnviarEmail.Create;
begin
    ArchivosAdjuntos := TStringList.Create;
    slMailDestino    := TStringList.Create;
    slConCopia       := TStringList.Create;
    slConCopiaOculta := TStringList.Create;
    slCuerpoMensaje  := TStringList.Create;

    FSMTP := TIdSmtp.Create(nil);
    FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    ObjetoMensaje := TIdMessage.Create(nil);
    ObjetoMensaje.ContentType := 'multipart/mixed';
end;

destructor TEnviarEmail.Destroy;
begin
    ObjetoMensaje.Free;
    FSSLHandler.Free;
    FSMTP.Free;
    ArchivosAdjuntos.Free;
    slMailDestino.Free;
    slConCopia.Free;
    slConCopiaOculta.Free;
    slCuerpoMensaje.Free;
end;

procedure TEnviarEmail.PrepararConexion;
begin
  FSMTP.Username := Login.usuario;
  FSMTP.Password := Login.password;
  FSMTP.Host     := Login.Servidor;
  FSMTP.Port     := Login.Puerto;
  FSMTP.AuthType := satDefault;
  FSMTP.ConnectTimeout := 10000;

  if Login.RequiereSSL then
  begin
    FSMTP.IOHandler  := FSSLHandler;
    FSMTP.UseTLS := utUseExplicitTLS;

    FSSLHandler.SSLOptions.Method := sslvTLSv1;
    FSSLHandler.SSLOptions.Mode   := sslmClient;
    FSSLHandler.SSLOptions.VerifyMode  := [];
    FSSLHandler.SSLOptions.VerifyDepth := 0;
    FSSLHandler.MaxLineAction := maException;

    FSSLHandler.UseNagle := true;
    FSSLHandler.ReadTimeout := 10000;
  end;
end;

function TEnviarEmail.fxProbarConexionSMTP;
begin
  try
    if not FSMTP.Connected then
       FSMTP.Connect;

    Result := FSMTP.Connected;
  except
    on E: exception do
    begin
      Result := false;
      Status := e.Message;
      if Assigned(FOnErrorConectarSMTP) then
        FOnErrorConectarSMTP;
    end;
  end;
  Desconectar;
end;

function TEnviarEmail.fxEnviar: TResultadoEnvio;
var
  I : Integer;
begin
  with ObjetoMensaje do
  begin
    From.Name := strDe;
    From.Address := strMailOrigen;
    Subject := strAsunto;
    CCList.EMailAddresses   := slConCopia.DelimitedText;
    BccList.EmailAddresses  := slConCopiaOculta.DelimitedText;

    // direcciones de slMailDestino
    Recipients.Clear;
    for I := 0 to slMailDestino.Count - 1 do
    begin
      Recipients.Add;
      Recipients[I].Address := slMailDestino.Strings[I];
    end;

    ClearBody;
    MessageParts.Clear;

    with TIdText.Create(MessageParts, nil) do
    begin
      ContentType := 'text/plain';
      Body.Text := slCuerpoMensaje.Text;
    end;

    // recorremos los attachments
    if Assigned( ArchivosAdjuntos ) then
    begin
       for i := 0 to ArchivosAdjuntos.Count - 1 do
       begin
          if FileExists(ArchivosAdjuntos[i]) then  //agregamos los attachments
             TIdAttachmentFile.Create( MessageParts, ArchivosAdjuntos[i] );
       end;
    end;
  end; //with

  try
    if not FSMTP.Connected then
       FSMTP.Connect;
  except
    on e : exception do
    begin
      status := e.Message;
      result := envErrorConexionServidor;
      exit;
    end;
  end;

  try
  //  FSMTP.AuthType := satNone;
    FSMTP.Send( ObjetoMensaje );
    Result := envOk;
  except
    on e : exception do
    begin
       // si es el server el que nos cierra bien, no es error
       if e is EIdConnClosedGracefully then
       begin
           Result := envOk;
           exit;
       end
       else
       begin
          status := e.Message;
          Result := envErrorEnvio;
          exit;
       end;
    end;
  end;
end;

procedure TEnviarEmail.Desconectar;
begin
  if FSMTP.Connected then
     FSMTP.Disconnect;
end;

end.
