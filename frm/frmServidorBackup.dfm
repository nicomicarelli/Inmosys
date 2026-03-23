object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Servidor Backup'
  ClientHeight = 151
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 6
    Width = 259
    Height = 91
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 113
      Height = 13
      Caption = 'I.P. Servidor de Backup'
    end
    object Label2: TLabel
      Left = 8
      Top = 9
      Width = 104
      Height = 13
      Caption = 'I.P. Servidor Original:'
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 108
      Height = 13
      Caption = 'Introducir contrase'#241'a:'
    end
    object Edit1: TEdit
      Left = 130
      Top = 61
      Width = 119
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 130
      Top = 6
      Width = 119
      Height = 21
      TabOrder = 1
      Text = '192.168.1.10'
    end
    object Edit3: TEdit
      Left = 130
      Top = 33
      Width = 119
      Height = 21
      TabOrder = 2
      Text = '192.168.1.11'
    end
  end
  object Button1: TButton
    Left = 138
    Top = 103
    Width = 129
    Height = 43
    Caption = 'Preparar Servidor'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 103
    Width = 113
    Height = 17
    Caption = 'Servidor de Backup'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 128
    Width = 113
    Height = 17
    Caption = 'Servidor original'
    TabOrder = 3
  end
end
