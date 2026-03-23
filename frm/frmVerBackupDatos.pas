unit frmVerBackupDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Funciones, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, AdvGlowButton, cxGroupBox, AdvPanel, Vcl.FileCtrl,
  FlCtrlEx, shellAPI, iouTILS, System.Types, frmProgreso;


type
  TfVerBackupDatos = class(TForm)
    Carpeta: TCheckDirectoryListBoxEx;
    btnSalir: TAdvGlowButton;
    btnEliminar: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure CarpetaClickCheck(Sender: TObject; Index: Integer);
    procedure btnEliminarClick(Sender: TObject);
    procedure DiscoClick(Sender: TObject);
  private
    { Private declarations }
    FRuta: string;
  public
     procedure DelFilesFromDir(Directory, FileMask: string; DelSubDirs: Boolean);
     procedure CopyFilesToPath(aFiles: array of string; DestPath: string);
     { Public declarations }
  end;

var
  fVerBackupDatos: TfVerBackupDatos;

implementation

uses frmprincipal;


{$R *.dfm}

procedure TfVerBackupDatos.DelFilesFromDir(Directory, FileMask: string; DelSubDirs: Boolean);
var
  SourceLst: string;
  FOS: TSHFileOpStruct;
begin
  FillChar(FOS, SizeOf(FOS), 0);
  FOS.Wnd := Application.MainForm.Handle;
  FOS.wFunc := FO_DELETE;
  SourceLst := Directory + '\' + FileMask + #0;
  FOS.pFrom := PChar(SourceLst);
  if not DelSubDirs then
    FOS.fFlags := FOS.fFlags OR FOF_FILESONLY;
  // Remove the next line if you want a confirmation dialog box
  FOS.fFlags := FOS.fFlags OR FOF_NOCONFIRMATION;
  // Uncomment the next line for a "silent operation" (no progress box)
   FOS.fFlags := FOS.fFlags OR FOF_SILENT;
  SHFileOperation(Fos);
end;

procedure TfVerBackupDatos.DiscoClick(Sender: TObject);
begin
//  DiscoExterno.Refresh
end;

procedure TfVerBackupDatos.CopyFilesToPath(aFiles: array of string; DestPath: string);
var
  InFile, OutFile: string;
begin
  for InFile in aFiles do
  begin
    OutFile := TPath.Combine( DestPath, TPath.GetFileName( InFile ) );
    TFile.Copy( InFile, OutFile, True);
  end;
end;


procedure TfVerBackupDatos.AdvGlowButton2Click(Sender: TObject);
var
  aLargeFiles: TStringDynArray;
  aSmallFiles: TStringDynArray;
  I: Integer;
  Ruta: string;
  Unidad: Char;
const
  LargeSize = 10 * 1024;
var
  SourcePath: string;

begin
//  SourcePath := FRuta + 'backups\';
//  if UpperCase(Disco.Drive) = 'C' then
//  begin
//    MostrarDialogoAceptar('Debe seleccionar el disco extraible u otro disco.');
//    Exit;
//  end;
//
//
//  Application.CreateForm(TFProgreso, fProgreso);
//  fProgreso.Maximo := Carpeta.Items.Count;
//  fProgreso.Leyenda := 'Copiando Archivos...';
//  fProgreso.Posicion := 0;
//  Unidad := Disco.Drive;
//  for I := Carpeta.Items.Count - 1 downto 0 do
//  begin
//    fProgreso.Posicion := Carpeta.Items.Count - I;
//    Application.ProcessMessages;
//    if Carpeta.Checked[I] then
//    begin
//      CreateDir(Disco.Drive + ':\' + Carpeta.Items[I].ToLower);
//      Ruta := Carpeta.Directory + '\' + Carpeta.Items[I].ToLower;
//
//      aLargeFiles := TDirectory.GetFiles(Ruta, '*.gdb',
//                       TSearchOption.soAllDirectories,
//                       function (const Path: string; const SR: TSearchRec): Boolean
//                       begin
//                         Result := (SR.Size >= LargeSize);
//                       end);
//      aSmallFiles := TDirectory.GetFiles(Ruta, '*.gdb',
//                       TSearchOption.soAllDirectories,
//                       function(const Path: string; const SR: TSearchRec):Boolean
//                       begin
//                         Result := (SR.Size < LargeSize);
//                       end);
//      CopyFilesToPath(aLargeFiles, Disco.Drive + ':\' + Carpeta.Items[I].ToLower);
//      CopyFilesToPath(aSmallFiles, Disco.Drive + ':\' + Carpeta.Items[I].ToLower);
//    end;
//  end;
//  Disco.Drive := 'C';
//  DiscoExterno.Directory := 'C:\';
//  DiscoExterno.Refresh;
//
//  Disco.Drive := Unidad;
//  DiscoExterno.Directory := Unidad + ':\';
//  DiscoExterno.Refresh;
//
//  if Assigned(fProgreso) then
//    FreeAndNil(fProgreso);

end;

procedure TfVerBackupDatos.btnEliminarClick(Sender: TObject);
var
  I: Integer;
  Ruta: string;
begin
  for I := Carpeta.Items.Count - 1 downto 0 do
    if Carpeta.Checked[I] then
    begin
      Ruta := Carpeta.Directory + '\' + Carpeta.Items[I].ToLower;
      DelFilesFromDir(Ruta, '*.*', FALSE);
      RemoveDir(Ruta);
    end;
  Carpeta.Directory := FRuta;
  Carpeta.Refresh;
  Carpeta.Directory := FRuta + 'Backups';
  Carpeta.Refresh;
end;


procedure TfVerBackupDatos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfVerBackupDatos.CarpetaClickCheck(Sender: TObject; Index: Integer);
var
  Ruta: string;
begin
  Carpeta.Refresh;
  Ruta := ExtractFilePath(Application.ExeName);
  Ruta := Copy(Ruta,1,Length(Ruta)-4);
  if Carpeta.Selected[Index] then
    if LowerCase(ExtractFileDir(Carpeta.GetItemPath(Index))) <> LowerCase(Ruta) + 'backups' then
    begin
      Carpeta.Checked[Index]:= False;
      Carpeta.Refresh;
      MostrarDialogoAceptar('No es posible seleccionar esta carpeta por cuestiones de permisos y seguridad.');
      Exit;
    end;
end;

procedure TfVerBackupDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fVerBackUpDatos := nil;
end;

procedure TfVerBackupDatos.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(self);
//  edRuta.Text := ExtractFilePath(Application.ExeName);
//  edRuta.Text := Copy(edRuta.Text,1,Length(edRuta.Text)-4)+ 'Backups\'+FormatDatetime('dd_mm_yyyy', Date)+'\Inmosys.gdb';

  FRuta := ExtractFilePath(Application.ExeName);
  FRuta := Copy(FRuta,1,Length(FRuta)-4);
  Carpeta.Directory := FRuta + 'Backups';
end;

end.
