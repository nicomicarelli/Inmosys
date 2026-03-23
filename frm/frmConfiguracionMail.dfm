object fConfiguracionMail: TfConfiguracionMail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configuraci'#243'n de EMails'
  ClientHeight = 413
  ClientWidth = 488
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 379
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Transparent = True
    ExplicitTop = 428
    Height = 34
    Width = 488
    object btGrabar: TAdvGlowButton
      Left = 5
      Top = 2
      Width = 90
      Height = 29
      BorderStyle = bsNone
      Caption = 'Grabar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 1
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = btGrabarClick
      Appearance.BorderColor = 13026816
      Appearance.BorderColorHot = 13026816
      Appearance.BorderColorDown = 13026816
      Appearance.BorderColorChecked = 13026816
      Appearance.BorderColorDisabled = 13026816
      Appearance.Color = clGray
      Appearance.ColorTo = clGray
      Appearance.ColorChecked = clGray
      Appearance.ColorCheckedTo = clGray
      Appearance.ColorDisabled = clGray
      Appearance.ColorDisabledTo = clGray
      Appearance.ColorDown = clGray
      Appearance.ColorDownTo = clGray
      Appearance.ColorHot = clMedGray
      Appearance.ColorHotTo = clMedGray
      Appearance.ColorMirror = clGray
      Appearance.ColorMirrorTo = clGray
      Appearance.ColorMirrorHot = clMedGray
      Appearance.ColorMirrorHotTo = clMedGray
      Appearance.ColorMirrorDown = clGray
      Appearance.ColorMirrorDownTo = clGray
      Appearance.ColorMirrorChecked = clGray
      Appearance.ColorMirrorCheckedTo = clGray
      Appearance.ColorMirrorDisabled = clGray
      Appearance.ColorMirrorDisabledTo = clGray
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.GradientDisabled = ggVertical
      Appearance.GradientMirrorDisabled = ggVertical
      Appearance.TextColorChecked = clWhite
      Appearance.TextColorDown = clWhite
      Appearance.TextColorHot = clWhite
    end
    object btSalir: TAdvGlowButton
      Left = 392
      Top = 2
      Width = 90
      Height = 29
      AntiAlias = aaNone
      BorderStyle = bsNone
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = btSalirClick
      Appearance.BorderColor = clBlue
      Appearance.BorderColorDown = clBlue
      Appearance.BorderColorDisabled = clBlue
      Appearance.Color = 213
      Appearance.ColorTo = 213
      Appearance.ColorChecked = 213
      Appearance.ColorCheckedTo = 213
      Appearance.ColorDisabled = 213
      Appearance.ColorDisabledTo = 213
      Appearance.ColorDown = 213
      Appearance.ColorDownTo = 213
      Appearance.ColorHot = 8421631
      Appearance.ColorHotTo = 8421631
      Appearance.ColorMirror = 213
      Appearance.ColorMirrorTo = 213
      Appearance.ColorMirrorHot = 8421631
      Appearance.ColorMirrorHotTo = 8421631
      Appearance.ColorMirrorDown = 213
      Appearance.ColorMirrorDownTo = 213
      Appearance.ColorMirrorChecked = 213
      Appearance.ColorMirrorCheckedTo = 213
      Appearance.ColorMirrorDisabled = 213
      Appearance.ColorMirrorDisabledTo = 213
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.GradientDisabled = ggVertical
      Appearance.GradientMirrorDisabled = ggVertical
      Appearance.TextColorChecked = clWhite
      Appearance.TextColorDown = clWhite
      Appearance.TextColorHot = clWhite
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Transparent = True
    Height = 377
    Width = 488
    object Label2: TLabel
      Left = 5
      Top = 44
      Width = 58
      Height = 13
      Caption = 'Descripci'#243'n:'
    end
    object lbNombre: TLabel
      Left = 66
      Top = 6
      Width = 108
      Height = 13
      Caption = 'Nombre configuraci'#243'n:'
    end
    object Label5: TLabel
      Left = 5
      Top = 99
      Width = 38
      Height = 13
      Caption = 'Asunto:'
    end
    object Label7: TLabel
      Left = 5
      Top = 136
      Width = 74
      Height = 13
      Caption = 'Mail Remitente:'
    end
    object Label1: TLabel
      Left = 5
      Top = 222
      Width = 39
      Height = 13
      Caption = 'Cuerpo:'
    end
    object Label6: TLabel
      Left = 5
      Top = 172
      Width = 47
      Height = 13
      Caption = 'Variables:'
    end
    object lbVariablePreview: TLabel
      Left = 277
      Top = 190
      Width = 101
      Height = 13
      Caption = 'lbVariablePreview'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 5
      Top = 6
      Width = 15
      Height = 13
      Caption = 'ID:'
    end
    object edNombre: TEdit
      Left = 66
      Top = 20
      Width = 420
      Height = 21
      MaxLength = 150
      TabOrder = 1
    end
    object edDescripcion: TMemo
      Left = 5
      Top = 58
      Width = 481
      Height = 40
      MaxLength = 250
      TabOrder = 2
    end
    object edAsunto: TEdit
      Left = 5
      Top = 113
      Width = 481
      Height = 21
      MaxLength = 150
      TabOrder = 3
    end
    object edNombreRemitente: TEdit
      Left = 4
      Top = 151
      Width = 482
      Height = 21
      MaxLength = 150
      TabOrder = 4
    end
    object btAgregarVariable: TBitBtn
      Left = 443
      Top = 184
      Width = 39
      Height = 28
      Hint = '&Agregar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000CCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCC9CACAC7C9C8C7C9C8C7C9C8C7C9C8C9CACACCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCC2C7C56D9E8C468A72498B73498B73468A726D9E8CC2
        C7C5CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB3BFBB2B7F610C724D0C724D0C72
        4D0C724D2B7F61B3BFBBCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB4C0BB338466
        107651107651107651107651338466B4C0BBCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCB3BFBB368668147A54147A54147A54147A54368668B3BFBBCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCB4C0BC38886B1A7F591A7F591A7F591A7F5938886BB4
        C0BCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCC2C7C5B5BFBCB5C0BCB5C0BCB6C0BC9FB4AD36886A21845E20845E2084
        5E21845E36886A9FB4ADB6C0BCB5C0BCB5C0BCB4BFBBC2C7C5CCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCC9CACA76A3933E8E704290724290724290723C8D6E278762
        268A63268A63268A63268A632787623C8D6E4290724290724290723E8F7071A1
        8FC8CAC9CCCCCCCCCCCCCCCCCCCCCCCCC6C9C854957D2D916A2D90692D90692D
        90692D90692D90692E90692D90692D90692E90692D90692D90692D90692D9069
        2D90692E926A4F937AC6C9C8CCCCCCCCCCCCCCCCCCCCCCCCC6C9C85898803397
        6F33976F33976F33976F33976F33976F33976F33976F33976F33976F33976F33
        976F33976F33976F33976F34987053957DC6C9C8CCCCCCCCCCCCCCCCCCCCCCCC
        C6C9C85A9A813A9D753A9D753A9D753A9D753A9D753A9D753A9D753A9D753A9D
        753A9D753A9D753A9D753A9D753A9D753A9D753C9F7655977EC6C9C8CCCCCCCC
        CCCCCCCCCCCCCCCCC6C9C85A9B8244AA7F44A97F43A97F43A97F44A97F42A67D
        41A37A40A37A40A37A41A37A42A67D44A97F43A97F43A97F43A97F45AB805599
        7FC6C9C8CCCCCCCCCCCCCCCCCCCCCCCCC9CACA7BA99751A58455A78755A78755
        A7874FA48242A37B48AA8147A98047A98048AA8142A37C4EA48255A78755A787
        55A78750A68477A794C9CACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC2C7C5B5BE
        BAB5BEBAB5BEBAB6BFBBA1B2AB4F9E7F4EB1874DAF854DAF854EB0874D9E7E9F
        B2ABB6BFBBB5BEBAB5BEBAB4BEBAC2C6C5CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB6BFBB57A48553B58B52B48A52B4
        8A53B58B55A384B4BFBACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCB5BEBA5AA787
        59BA9058B98F58B98F59BA9059A787B3BEBACCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCB5BEBA5CA98A5EBE945CBD935CBD935EBE945AA889B3BEBACCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCB4BDB95DAF8E6AD1A369D0A269D0A26AD1A35CAF8DB2
        BDB9CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC2C6C47AAB9860A68B62A78C62A7
        8C60A78B7AAB98C2C6C5CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC9CACA
        C6C9C8C6C9C8C6C9C8C6C9C8C9CACACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC}
      TabOrder = 6
      OnClick = btAgregarVariableClick
    end
    object edCuerpo: TMemo
      Left = 5
      Top = 239
      Width = 477
      Height = 138
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object cbVariables: TComboBox
      Left = 5
      Top = 187
      Width = 265
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = SetPreview
      OnCloseUp = SetPreview
      OnKeyDown = cbVariablesKeyDown
      Items.Strings = (
        'A'#209'O'
        'MES')
    end
    object edID: TEdit
      Left = 5
      Top = 20
      Width = 55
      Height = 21
      MaxLength = 150
      TabOrder = 0
    end
  end
  object pmReglas: TPopupMenu
    Left = 232
    Top = 280
    object Eliminartarea1: TMenuItem
      Caption = 'Eliminar Regla'
    end
  end
end
