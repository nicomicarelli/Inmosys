unit voDispositivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ppTypes, ppReport, StdCtrls, Buttons, Contnrs,
  DB, DBTables, ppComm, ppEndUsr, Variants,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Grids, DBGrids, ComCtrls,
  ppViewr, ppProd, ppClass, ppTmplat, ppBands, ppCache, myChkBox, ShellAPI,
  daDatMan, raIDE, 	ppCTDsgn, ppParameter, Declaraciones,
  ppUtils, FMTBcd, frmDatos, StrUtils, System.UITypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  fxQuery, AdvGlowButton;

type
  TMail = class
  public
    idPlantilla: Integer;
    DireccionMail: string;
    Asunto: string;
    Titulo: string;
    codinq: string;
    inquilino: string;
    propietario: string;
    Anio: Integer;
    Mes: string;
  end;

  TfmDispositivos = class(TForm)
    Panel1: TPanel;
    Ayuda: TSpeedButton;
    Panel2: TPanel;
    Memo1: TMemo;
    ppDesigner: TppDesigner;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    ImgChecked: TImage;
    ImgUnChecked: TImage;
    dsqPlantillas: TDataSource;
    pplPlantillas: TppBDEPipeline;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    btnArchivoWord: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    ChAbrirDoc: TCheckBox;
    GroupBox1: TGroupBox;
    btnImpresora: TBitBtn;
    btnPantalla: TBitBtn;
    BtnMail: TBitBtn;
    chGenerarCopiaViaMail: TCheckBox;
    pnlDownMail: TPanel;
    Panel4: TPanel;
    GroupBox6: TGroupBox;
    BitBtn15: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    GroupBox3: TGroupBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn14: TBitBtn;
    ChComprimir: TCheckBox;
    btnCuerpoEMail: TBitBtn;
    BitBtn1: TBitBtn;
    qPlantillas: TFXQuery;
    btnSalir: TAdvGlowButton;
    ppViewer1: TppViewer;
    procedure btnPantallaClick(Sender: TObject);
    procedure button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnMailClick(Sender: TObject);
    procedure ppDesignerCustomSaveDoc(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure ppDesignerCustomOpenDoc(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    FDeviceType: string;
    FFileName: string;
    FReport : TppReport;
    m_NombrePlantilla: String;
    function ValidarNombreArchivo(NombreArchivo: String): String;
    procedure prGenerarImpresion(p_niTipoGeneracion : Integer);
  public
    Stream : TMemoryStream;
    IdFormulario,sMail,sNombreDocumento: string;
    EsSucursalManual, vDialogoOk : Boolean;
    ListaReportes : TObjectList;
    objMail: TMail;

    constructor Create(AOwner :TComponent); override;
    destructor Destroy; Override;

    procedure SeleccionarPlantilla(Sender:TObject= nil);
    procedure ActualizarPlantillas();
    procedure PreviewFormCreate(Sender: TObject);
    procedure BeforePrintMio(Sender: TObject);
    procedure PrintDialogClose(Sender: TObject);
    procedure DrawCheckBox(ACanvas: TCanvas; bmpChecked, bmpUnchecked : TBitmap;
          const Rect : TRect; Value : Boolean);
    procedure ConfigurarPlantilla(TipoPlantilla : Integer);
    procedure prGenerarCopiaViaMail;

    property Reporte: TppReport read FReport Write FReport;
    Property nombrePlantilla: String read m_NombrePlantilla write m_NombrePlantilla;
  end;

var
  fmDispositivos: TfmDispositivos;

implementation

uses frmPrincipal, Funciones;

{$R *.DFM}

procedure TfmDispositivos.btnPantallaClick(Sender: TObject);
var i : integer;
begin
  if ListaReportes <> nil then
  begin
    for i:=0 to ListaReportes.Count-1 do
    begin
      TppReport(ListaReportes[i]).Template := FReport.Template;
      FReport := (ListaReportes[i]) as TppReport;
      prGenerarImpresion(TBitBtn(Sender).Tag);
    end;
  end
  else
    prGenerarImpresion(TBitBtn(Sender).Tag);

  Close;   
end;

procedure TfmDispositivos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

constructor TfmDispositivos.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   Stream := TMemoryStream.Create;
   objMail := TMail.Create;
end;

procedure TfmDispositivos.PrintDialogClose(Sender: TObject);
begin
  vDialogoOk := (FReport.PrintDialog.ModalResult = mrOk);
end;

procedure TfmDispositivos.PreviewFormCreate(Sender: TObject);
var
  I: Integer;
begin
  FReport.PreviewForm.WindowState:=wsMaximized;
  TppViewer(FReport.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TfmDispositivos.BeforePrintMio(Sender: TObject);
begin
  try
    if FileExists(FReport.ArchiveFileName) then
    begin
      if not FileIsReadOnly(FReport.ArchiveFileName) then
        DeleteFile(FReport.ArchiveFileName)
      else
        Abort;
    end;
  except
    MessageDlg('No se ha podido generar el archivo solicitado. '+#13+#10+''+#13+#10+'Es posible que el archivo a generar este siendo utilizado '+#13+#10+'por otra Aplicación. Ciérrelo y vuelva a intentarlo.', mtInformation, [mbOK], 0);
    Close;
  end
end;

procedure TfmDispositivos.button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmDispositivos.FormActivate(Sender: TObject);
begin
//  fPrincipal.Center(self);
  ///PARA PERMISO ESPECIAL PALETA CONFIGURACION////
  PageControl1.ActivePageIndex := 0;

  Panel2.Refresh;

  FReport.Template.FileName := '';
  FReport.Template.SaveTo := stDatabase;
  FReport.Template.DatabaseSettings.DataPipeline := pplPlantillas;
  FReport.Template.DatabaseSettings.NameField := 'NOMBREPLANTILLAUSUARIO';
  FReport.Template.DatabaseSettings.TemplateField := 'REPORTE';
  FReport.Template.SaveToStream(Stream);

  //Estas lineas son necesarias para corregir el error de los PDF en blanco.
  //El problema se daba porque se cruzaban en algunos casos la configuracion de estas dos propiedades.
  //Tal vez se puedan sacar cuando por fin se eliminen todas las llamadas al decimaul y thousand separator
  ppFormatSettings.DecimalSeparator := DecimalSeparator;
  ppFormatSettings.ThousandSeparator := ThousandSeparator;

  ppDesigner.DataSettings.DatabaseType := dtInterBase;

  ppDesigner.IniStorageName := 'C:\Inmosys 3.0\RBuiler.ini';
  ppDesigner.Report := FReport;

  ActualizarPlantillas();

//  if qPlantillas.FieldByName('PlantillaPorDefecto').AsInteger = 1 then
//    SeleccionarPlantilla()
//  else
//    Panel2.Caption := FReport.PrinterSetup.DocumentName;

  pnlDownMail.Visible := False;

  btnImpresora.SetFocus;
end;

procedure TfmDispositivos.BtnMailClick(Sender: TObject);
begin
  pnlDownMail.Visible := not pnlDownMail.Visible;

  GroupBox2.Visible := not pnlDownMail.Visible;
  GroupBox3.Visible := pnlDownMail.Visible;

  chGenerarCopiaViaMail.Checked := True;
  prGenerarImpresion(9);
  Close;
//  if pnlDownMail.Visible then
//    BitBtn9.SetFocus
//  else
//    btnArchivoWord.SetFocus;

// BitBtn12.Enabled := (FReport.AbsolutePageCount > 1);
end;

procedure TfmDispositivos.ppDesignerCustomSaveDoc(Sender: TObject);
var
 PorDefecto : String;
 q: TFXQuery;

begin
  q := CrearQuery;
  try
    if FReport.Template.FileName <> '' then
    begin
      FReport.Template.SaveTo := stFile;
      FReport.Template.SaveToFile;
      FReport.Template.FileName := '';
    end
    else
    begin
      if trim( FReport.Template.DatabaseSettings.Name ) = '' then
      begin
        MessageDlg('Debe ingresar un nombre válido para la plantilla.', mtInformation, [mbOK], 0);
        abort;
        exit;
      end;

      FReport.Template.SaveTo := stDatabase;

      PorDefecto := '0';

      FReport.Template.SaveToDatabase;

      if not EsSucursalManual then
      begin
        DM.IniciarTransaccion;
        try
          q.SQL.CLear;
          q.SQL.Add('Update Plantillas set IDENTIFICADORFORMULARIO = :IDFormulario');
          q.SQL.Add(' , IDENTIFICADORPLANTILLA = :IdPlantilla');
          q.SQL.Add(' , PLANTILLAPORDEFECTO = :PlantillaPorDefecto');
          q.SQL.Add(' Where IDENTIFICADORFORMULARIO = :IDentificadorFormulario');
          q.SQL.Add(' and IDENTIFICADORPLANTILLA = :IdentificadorPlantilla');
          q.ParamByName('IDFormulario').AsString := IdFormulario;
          q.ParamByName('IDPlantilla').AsString := FReport.Name;
          q.ParamByName('PlantillaPorDefecto').AsString := PorDefecto;
          q.ParamByName('IDentificadorFormulario').AsString := '-1';
          q.ParamByName('IDentificadorPlantilla').AsString := '-1';
          q.ExecSQL;

          DM.ConfirmarTransaccion;
        except
          DM.CancelarTransaccion;
        end;
      end;
      ActualizarPlantillas();
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfmDispositivos.BitBtn13Click(Sender: TObject);
begin
  ConfigurarPlantilla(1);
end;

procedure TfmDispositivos.SeleccionarPlantilla(Sender:TObject= nil);
begin
  if not qPlantillas.IsEmpty then
  begin
    if Sender=nil then
    begin
      if nombrePlantilla='' then //para cargar la plantilla seleccionada (en primera instancia solo en retenciones)
        FReport.Template.DatabaseSettings.Name := qPlantillas.FieldByName('NombrePlantillaUsuario').AsString
      else
        FReport.Template.DatabaseSettings.Name := nombrePlantilla;

      try     // para el caso de que la plantilla de retencion seleccionada no corresponda con el tipo de rentencion (IVA, IIBB, GAN)
        FReport.Template.LoadFromDatabase;
      except
        FReport.Template.DatabaseSettings.Name := qPlantillas.FieldByName('NombrePlantillaUsuario').AsString;
        FReport.Template.LoadFromDatabase;
      end;
    end
    else
    begin
      FReport.Template.DatabaseSettings.Name := qPlantillas.FieldByName('NombrePlantillaUsuario').AsString;
      FReport.Template.LoadFromDatabase;
    end;
  end;
  Panel2.Caption := FReport.PrinterSetup.DocumentName;
end;

procedure TfmDispositivos.ConfigurarPlantilla(TipoPlantilla : Integer);
begin
  FReport.Template.DatabaseSettings.Name := '';

  if TipoPlantilla = 1 then
    SeleccionarPlantilla()
  else if TipoPlantilla = 2 then
    FReport.Template.LoadFromStream(Stream)
  else if TipoPlantilla = 3 then
    FReport.Template.New;

  ppDesigner.ShowModal;
end;

procedure TfmDispositivos.BitBtn16Click(Sender: TObject);
begin
  SeleccionarPlantilla();
  FReport.DeviceType := dtScreen;
  FReport.OnPreviewFormCreate := PreviewFormCreate;
  FReport.Print;
end;

procedure TfmDispositivos.BitBtn15Click(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    if qPlantillas.FieldByName('PlantillaPorDefecto').AsInteger = 0 then
    begin
      if not EsSucursalManual then
      begin
        Dm.IniciarTransaccion;
        try
          q.SQL.CLear;
          q.SQL.Add('Update Plantillas');
          q.SQL.Add(' Set PLANTILLAPORDEFECTO = 0');
          q.SQL.Add(' Where IDENTIFICADORFORMULARIO = :IdFormulario');
          q.SQL.Add(' and IDENTIFICADORPLANTILLA = :IdPlantilla');
          q.ParamByName('IDFormulario').AsString := IdFormulario;
          q.ParamByName('IDPlantilla').AsString := FReport.Name;
          q.ExecSQL;

          q.SQL.CLear;
          q.SQL.Add('Update Plantillas');
          q.SQL.Add(' Set PLANTILLAPORDEFECTO = 1');
          q.SQL.Add(' Where IDENTIFICADORFORMULARIO = :IdFormulario');
          q.SQL.Add(' and IDENTIFICADORPLANTILLA = :IdPlantilla');
          q.SQL.Add(' and NOMBREPLANTILLAUSUARIO = :Nombre');
          q.ParamByName('IDFormulario').AsString := IdFormulario;
          q.ParamByName('IDPlantilla').AsString := FReport.Name;
          q.ParamByName('Nombre').AsString := qplantillas.FieldByName('NombrePlantillaUsuario').AsString;

          q.ExecSQL;

          DM.ConfirmarTransaccion;
        except
          DM.CancelarTransaccion;
        end;
      end;
      ActualizarPlantillas();
    end
    else
      MostrarDialogoAceptar(qPlantillas.FieldByName('NombrePlantillaUsuario').AsString  + ' ya es la Plantilla por defecto!');
  finally
    FreeAndNil(q);
  end;
end;

procedure TfmDispositivos.BitBtn17Click(Sender: TObject);
var
  q: TFXQuery;

begin
  q := CrearQuery;
  try
    if (qPlantillas.RecordCount = 1) or (qPlantillas.FieldByName('PlantillaPorDefecto').AsInteger = 0) then
    begin
     if (MostrarDialogoSiNo('¿Confirma que desea eliminar la Plantilla ' +  qplantillas.FieldByName('NombrePlantillaUsuario').AsString + '?')) then
     begin
       if not EsSucursalManual then
       begin
         Dm.IniciarTransaccion;
         try
           q.SQL.CLear;
           q.SQL.Add('Delete From Plantillas');
           q.SQL.Add(' Where IDENTIFICADORFORMULARIO = :IdFormulario');
           q.SQL.Add(' and IDENTIFICADORPLANTILLA = :IdPlantilla');
           q.SQL.Add(' and NOMBREPLANTILLAUSUARIO = :Nombre');
           q.ParamByName('IDFormulario').AsString := IdFormulario;
           q.ParamByName('IDPlantilla').AsString := FReport.Name;
           q.ParamByName('Nombre').AsString := qplantillas.FieldByName('NombrePlantillaUsuario').AsString;
           q.ExecSQL;

           DM.ConfirmarTransaccion;
         except
           DM.CancelarTransaccion;
         end;
       end;

       ActualizarPlantillas();
     end;
      if qPlantillas.IsEmpty then
        FReport.Template.LoadFromStream(Stream);
    end
    else if qPlantillas.FieldByName('PlantillaPorDefecto').AsInteger = 1 then
      MostrarDialogoAceptar('No se puedo eliminar la Plantilla ' + qPlantillas.FieldByName('NombrePlantillaUsuario').AsString + ' debido a que la misma está establecida como por Defecto.');
  finally
    FreeAndNil(q);
  end;
end;

procedure TfmDispositivos.ActualizarPlantillas();
begin
  qPlantillas.SQL.Clear ;
  qPlantillas.SQL.Add('Select * from Plantillas Where ');
  qPlantillas.SQL.Add(' IDENTIFICADORFORMULARIO = :IdFormulario');
  qPlantillas.SQL.Add(' and IDENTIFICADORPLANTILLA = :IdPlantilla');
  qPlantillas.ParamByName('IDFormulario').AsString := IdFormulario;
  qPlantillas.ParamByName('IDPlantilla').AsString := FReport.Name;
  qPlantillas.SQL.Add(' Order By PlantillaPorDefecto desc, NombrePlantillaUsuario asc');
  qPlantillas.Open;

  BitBtn15.Enabled := not qPlantillas.IsEmpty;
  BitBtn17.Enabled := not qPlantillas.IsEmpty;
end;

procedure TfmDispositivos.DBGrid1DblClick(Sender: TObject);
begin
  BitBtn16.Click;
end;

procedure TfmDispositivos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = '' then
    DrawCheckBox(DBGrid1.Canvas, imgChecked.Picture.Bitmap, Imgunchecked.Picture.Bitmap,
    Rect, (qPlantillas.FieldByName('PlantillaPorDefecto').AsInteger = 1));
end;

procedure TfmDispositivos.DrawCheckBox(ACanvas: TCanvas; bmpChecked, bmpUnchecked : TBitmap;
          const Rect : TRect; Value : Boolean);
var
 X, Y : Integer;
begin
  ASSERT(bmpChecked.Width = bmpUnchecked.Width);
  ASSERT(bmpChecked.Height = bmpUnchecked.Height);
  ACanvas.Pen.Color := clGray;
  ACanvas.MoveTo(Rect.Left, Rect.Bottom);
  ACanvas.LineTo(Rect.Right, Rect.Bottom);
  ACanvas.LineTo(Rect.Right, Rect.Top);
  ACanvas.Brush.Color := clCream;
  ACanvas.FillRect(Rect);
  X := (Rect.Left + Rect.Right - bmpChecked.Width) div 2;
  Y := (Rect.Top + Rect.Bottom - bmpChecked.Height) div 2;

  if Value then
   ACanvas.Draw(X, Y, bmpChecked)
  else
   ACanvas.Draw(X, Y, bmpUnchecked);
end;
procedure TfmDispositivos.BitBtn18Click(Sender: TObject);
begin
  ConfigurarPlantilla(2);
end;

procedure TfmDispositivos.BitBtn19Click(Sender: TObject);
begin
  ConfigurarPlantilla(3);
end;

procedure TfmDispositivos.ppDesignerCustomOpenDoc(Sender: TObject);
begin
  if FReport.Template.FileName <> '' then
  begin
    FReport.Template.LoadFromFile;
    FReport.Template.FileName := '';
  end
  else
    FReport.Template.LoadFromDatabase;

end;

procedure TfmDispositivos.DBGrid2DblClick(Sender: TObject);
begin
  btnPantalla.Click;
end;

procedure TfmDispositivos.DBGrid1CellClick(Column: TColumn);
begin
  SeleccionarPlantilla;
end;

procedure TfmDispositivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  fmDispositivos:=nil;
end;


procedure TfmDispositivos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);
  Top := 165;

  qPlantillas.Connection := DM.Conexion;
end;

procedure TfmDispositivos.FormShow(Sender: TObject);
begin
  Top := 165;
end;

procedure TfmDispositivos.prGenerarCopiaViaMail;
begin
//
end;

function TfmDispositivos.ValidarNombreArchivo(NombreArchivo: String): String;
var
  bandera : Boolean;
  i : Integer;
begin
  bandera := False;

  for I := 1 to Length(NombreArchivo) do
  begin
    if (NombreArchivo[I] = '\') or (NombreArchivo[I] = '/') or (NombreArchivo[I] = ':')
    or (NombreArchivo[I] = '*') or (NombreArchivo[I] = '?') or (NombreArchivo[I] = '"')
    or (NombreArchivo[I] = '<') or (NombreArchivo[I] = '>') or (NombreArchivo[I] = '|') then
    begin
      NombreArchivo[I] := '-';
      bandera := True;
    end;
  end;

  if bandera then
    MostrarDialogoAceptar('         Un nombre de archivo no puede contener '+#13+
                          ' ninguno de los siguientes caracteres: \ / : * ? " < > | '+#13+
                          '         Los caracteres invalidos se han reemplazado por -. ');

  Result := NombreArchivo;
end;



procedure TfmDispositivos.prGenerarImpresion(p_niTipoGeneracion : Integer);
var
  ZipFile, Archivo, sNombreFinal : String;
  bGeneraCopiaViaMail : Boolean;
  q: TFXQuery;
  stRemitente: string;
  stCuerpo: string;
  stAsunto: string;
  I: Integer;
begin
  bGeneraCopiaViaMail := False;

  SeleccionarPlantilla(btnPantalla);
  if sNombreDocumento <> '' then
  begin
    sNombreFinal := sNombreDocumento;
    Archivo := ValidarNombreArchivo(sNombreFinal);
  end
  else
  begin
    sNombreFinal := FReport.PrinterSetup.DocumentName;
    Archivo := ValidarNombreArchivo(sNombreFinal + ' ' + FormatDateTime('ddmmyyyyHHnnss', Now));
  end;

  FFileName := ExtractFilePath(Application.exename) + 'Archivos\' + Archivo;

  Memo1.Clear;
  FReport.AllowPrintToFile := True;
  FReport.AllowPrintToArchive := True;
  FReport.Language := lgSpanish;

  ZipFile := FFileName + '.zip';
  FReport.ShowPrintDialog := not pnlDownMail.Visible;
  case p_niTipoGeneracion of
      1://Pantalla
      begin
        FDeviceType:= dtScreen;
        FReport.AllowPrintToFile := False;
        FReport.AllowPrintToArchive := False;

        bGeneraCopiaViaMail := chGenerarCopiaViaMail.checked;

      end;
      2://Impresora
      begin
        FDeviceType:= dtPrinter;
        FReport.AllowPrintToFile := False;
        FReport.AllowPrintToArchive := False;

        bGeneraCopiaViaMail := chGenerarCopiaViaMail.checked;

      end;
      5://Excel
      begin
        FDeviceType:= dtXLSData;
        FFileName:=FFileName + '.xls';
        FReport.PDFSettings.Title := sNombreFinal;
        FReport.PDFSettings.Author := 'Salomón Inmobiliaria';
      end;
      6://Archivo
      begin
        FDeviceType:= dtTextFile;
        FFileName:=FFileName + '.txt';
      end;
      7://BMP
      begin
        FDeviceType:= dtBMP;
        FFileName:=FFileName + '.bmp';
      end;
      8://PDF
      begin
        FDeviceType:= dtPDF;
        FFileName:=FFileName + '.pdf';
        FReport.PDFSettings.Title := sNombreFinal;
        FReport.PDFSettings.Author := 'Salomón Inmobiliaria';
      end;
      9://PDF para mail
      begin
        FDeviceType:= dtPDF;
        FFileName:=FFileName + '.pdf';
        FReport.PDFSettings.Title := sNombreFinal;
        FReport.PDFSettings.Author := 'Salomón Inmobiliaria';

        q:= CrearQuery;
        try
          q.Sql.Text := 'Select * from Configuracionmail where id = :id';
          q.ParambyName('ID').AsInteger := objMail.idPlantilla;
          q.Open;

          stAsunto := q.FieldbyName('Asunto').AsString;
          stRemitente := q.FieldbyName('NombreRemitente').AsString;
          stCuerpo := AnsiReplaceStr(q.FieldbyName('Cuerpo').AsString, '[MES]',objMail.Mes);
          stCuerpo := AnsiReplaceStr(stCuerpo, '[AÑO]',Inttostr(objMail.Anio));
        finally
          q.Free;
        end;
      end;
      10://Cuerpo HTML
      begin
        FDeviceType:= dtReportTextFile;
        FFileName:=FFileName + '.txt';
      end;
  end;
  FReport.DeviceType := FDeviceType;
  FReport.TextFileName := FFileName;
  FReport.ArchiveFileName := FFileName;
  Self.Visible := False;

  if p_niTipoGeneracion = 1 then
    FReport.OnPreviewFormCreate := PreviewFormCreate
  else
  begin
     FReport.BeforePrint := BeforePrintMio;
  end;

  vDialogoOk := true;
  FReport.OnPrintDialogClose := PrintDialogClose;

  try
    FReport.Print;
  except
    if p_niTipoGeneracion < 3 then
      MessageDlg('No se ha podido generar la impresión solicitada.', mtInformation, [mbOK], 0);
  end;

  if vDialogoOk then
  begin
    if pnlDownMail.Visible then
    begin
       if Trim(objMail.Titulo) = '' then
         sNombreFinal := objMail.Titulo;

       if objMail.Asunto <> '' then
         stAsunto := objMail.Asunto;

       Memo1.Lines.Add('Adjunto ' + sNombreFinal);
       sNombreFinal := objMail.Titulo;

       sMail := objMail.DireccionMail;

       EnviarMail(stAsunto, stCuerpo, FFileName,
         'SALOMON INMOBILIARIA', stRemitente, 'Nicolas Micarelli', sMail);
        DeleteFile(FFileName);
    end
    else
     if (ChAbrirDoc.Checked) and (p_niTipoGeneracion > 2) then
      ShellExecute(Handle,'open',PChar(FFileName),nil, nil,SW_SHOWMAXIMIZED);
  end;
  FReport.OnPreviewFormCreate := nil;
  FReport.BeforePrint := nil;

  if bGeneraCopiaViaMail then
  begin
    chGenerarCopiaViaMail.checked := False;
    BtnMailClick(nil);
    BtnPantallaClick(BitBtn8);
  end;

end;

destructor TfmDispositivos.Destroy;
begin
  FreeAndNil(Stream);
  inherited;  
end;

end.
