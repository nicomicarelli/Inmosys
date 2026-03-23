unit frmServidorBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellApi;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if UpperCase(Edit1.Text) = 'SALOMON' then
  begin
    if RadioButton1.Checked then
    begin
      CopyFile(PChar('c:\Inmosys 3.0\DATA\Inmosys.GDB'), PChar('c:\inmosys 3.0\DATA\Inmosys_Servidor.GDB'), False);
      CopyFile(PChar(EDIT2.TEXT + ':c:\Inmosys 3.0\DATA\Inmosys.GDB'), PChar(EDIT3.TEXT +':c:\inmosys 3.0\DATA\inmosys.GDB'), False);

      CopyFile(PChar('c:\Inmosys 3.0\out\Inmosys.ini'), PChar('c:\inmosys 3.0\out\inmosys_principal.ini'), True);
      IF CopyFile(PChar('c:\Inmosys 3.0\out\Inmosys servidor backup.ini'), PChar('c:\inmosys 3.0\out\inmosys.ini'), False) THEN
        showmessage('Preparacion terminada')
      ELSE
        showmessage('Error al copiar archivos');
    end
    else
    begin
      CopyFile(PChar('c:\Inmosys 3.0\DATA\Inmosys.GDB'), PChar('c:\inmosys 3.0\DATA\Inmosys_Servidor.GDB'), False);
      CopyFile(PChar(EDIT3.TEXT + ':c:\Inmosys 3.0\DATA\Inmosys.GDB'), PChar(EDIT2.TEXT +':c:\inmosys 3.0\DATA\inmosys.GDB'), False);

      IF CopyFile(PChar('c:\Inmosys 3.0\out\inmosys.ini'), PChar('c:\inmosys 3.0\out\inmosys servidor backup.ini'), False) THEN
        IF CopyFile(PChar('c:\Inmosys 3.0\out\Inmosys_Principal.ini'), PChar('c:\inmosys 3.0\out\inmosys.ini'), False) THEN
          showmessage('Preparacion terminada')
        ELSE
          showmessage('Error al copiar archivos');
    end;
  end
  else
    Showmessage('Contraseña incorrecta. Verifique por favor');
end;

end.
