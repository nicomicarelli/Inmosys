object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object btnProcesarCedulon: TButton
    Left = 541
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Rentas'
    TabOrder = 0
    OnClick = btnProcesarCedulonClick
  end
  object mResultado: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 618
    Height = 394
    Align = alTop
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 400
  end
end
