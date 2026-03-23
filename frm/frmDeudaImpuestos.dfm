object fDeudaImpuestos: TfDeudaImpuestos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 208
  ClientWidth = 654
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gDetalle: TStringAlignGrid
    Left = 0
    Top = 41
    Width = 654
    Height = 145
    Align = alClient
    ColCount = 3
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ShowCellHints = False
    DrawSelection = False
    ExplicitTop = 0
    ExplicitHeight = 149
    ColWidths = (
      100
      410
      117)
    Cells = (
      0
      0
      'C'#243'digo '
      1
      0
      'Vale'
      2
      0
      'Deuda')
    PropCell = (
      0
      0
      1
      2
      0)
    PropCol = (
      0
      1
      1
      3
      1
      0
      2
      1
      0
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = (
      0
      1
      2
      0)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 15132390
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 264
    ExplicitTop = 8
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 597
      Height = 38
      Caption = 
        'Tild'#243' "Se desocupa" y el inquilino presenta deuda de impuestos e' +
        'n vales. Verifique!!'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 186
    Width = 654
    Height = 22
    Align = alBottom
    BevelOuter = bvNone
    Color = 15132390
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 187
    object Label2: TLabel
      Left = 473
      Top = 4
      Width = 28
      Height = 13
      Caption = 'Total:'
    end
    object edTotal: TEdit
      Left = 514
      Top = 1
      Width = 121
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      Text = '$ 0,00'
    end
  end
end
