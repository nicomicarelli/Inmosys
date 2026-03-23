object fraCaja: TfraCaja
  Left = 0
  Top = 0
  Width = 905
  Height = 235
  TabOrder = 0
  object gDetalle: TStringAlignGrid
    Left = 0
    Top = 0
    Width = 905
    Height = 204
    Align = alClient
    ColCount = 13
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Editable = False
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      83
      59
      320
      104
      104
      100
      100
      100
      100
      100
      60
      100
      164)
    Cells = (
      0
      0
      'Fecha'
      1
      0
      'C'#243'digo'
      2
      0
      'Item'
      3
      0
      'Entra'
      4
      0
      'Sale'
      5
      0
      'NumRecibo'
      6
      0
      'id'
      10
      0
      'Cod. Item'
      12
      0
      'Usuario')
    PropCell = (
      0
      0
      1
      2
      0
      1
      0
      1
      2
      0
      3
      1
      1
      0
      0)
    PropCol = (
      0
      1
      1
      0
      1
      1
      1
      0
      3
      1
      0
      0
      4
      1
      0
      0
      10
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
  object pnlTotal: TPanel
    Left = 0
    Top = 204
    Width = 905
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    object Label4: TLabel
      Left = 533
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Total:'
    end
    object Label1: TLabel
      Left = 317
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Total:'
      Visible = False
    end
    object edtTotal: TEdit
      Left = 571
      Top = 5
      Width = 105
      Height = 21
      Alignment = taRightJustify
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
  end
end
