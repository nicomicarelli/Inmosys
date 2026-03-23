object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 595
  Height = 166
  TabOrder = 0
  object Label3: TLabel
    Left = 4
    Top = 5
    Width = 42
    Height = 13
    Caption = 'Inquilino:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object cbInquilino: TDBLookupComboBox
    Left = 90
    Top = 2
    Width = 221
    Height = 21
    KeyField = 'Codinq'
    ListField = 'Descripcion'
    ListSource = dsInquilino
    TabOrder = 0
    OnClick = cbInquilinoClick
    OnKeyPress = cbInquilinoKeyPress
  end
  object edCodinq: TEdit
    Left = 56
    Top = 2
    Width = 31
    Height = 21
    TabOrder = 1
    Text = '0000'
  end
  object dsInquilino: TDataSource
    DataSet = qInquilino
    Left = 400
    Top = 8
  end
  object qInquilino: TFXQuery
    Left = 352
    Top = 8
  end
end
