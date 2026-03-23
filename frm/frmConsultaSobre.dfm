object fConsultarSobre: TfConsultarSobre
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Consulta de Sobre'
  ClientHeight = 425
  ClientWidth = 799
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 394
    Width = 799
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitTop = 384
    ExplicitWidth = 789
    object btnSalir: TAdvGlowButton
      Left = 699
      Top = 0
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
      TabOrder = 0
      TabStop = True
      OnClick = btnSalirClick
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 789
    object Label4: TLabel
      Left = 10
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Fecha Desde:'
    end
    object lblSobreDestino: TLabel
      Left = 322
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Sobre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 165
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Fecha Hasta:'
    end
    object edFechaDesde: TEdit
      Left = 80
      Top = 13
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      OnKeyPress = edFechaDesdeKeyPress
    end
    object edtSobreDestino: TEdit
      Left = 369
      Top = 13
      Width = 79
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvRaised
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnKeyPress = edtSobreDestinoKeyPress
    end
    object cboSobre: TComboBox
      Left = 452
      Top = 13
      Width = 141
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cboSobreChange
    end
    object edFechaHasta: TEdit
      Left = 234
      Top = 13
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 3
      OnKeyPress = edFechaHastaKeyPress
    end
    object chSaldoAnterior: TCheckBox
      Left = 82
      Top = 38
      Width = 135
      Height = 16
      Caption = 'Ver Saldo Anterior'
      Checked = True
      State = cbChecked
      TabOrder = 4
      WordWrap = True
    end
    object chSoloSaldos: TCheckBox
      Left = 234
      Top = 38
      Width = 135
      Height = 16
      Caption = 'Mostrar Solo Saldos'
      TabOrder = 5
      WordWrap = True
      OnClick = chSoloSaldosClick
    end
    object Actualizar: TAdvGlowButton
      Left = 695
      Top = 20
      Width = 90
      Height = 29
      BorderStyle = bsNone
      Caption = 'Actualizar'
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
      TabOrder = 6
      TabStop = True
      OnClick = ActualizarClick
      Appearance.BorderColor = 27865
      Appearance.BorderColorHot = 27865
      Appearance.BorderColorDown = 27865
      Appearance.BorderColorChecked = 27865
      Appearance.BorderColorDisabled = 27865
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 58
    Width = 799
    Height = 305
    ActivePage = General
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 789
    ExplicitHeight = 295
    object General: TTabSheet
      Caption = 'General'
      ExplicitWidth = 781
      ExplicitHeight = 267
      object gDetalle: TStringAlignGrid
        Left = 0
        Top = 0
        Width = 791
        Height = 277
        Align = alClient
        ColCount = 13
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ShowCellHints = False
        ExplicitWidth = 781
        ExplicitHeight = 267
        ColWidths = (
          73
          47
          310
          84
          84
          -1
          -1
          60
          30
          88
          44
          54
          74)
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
          'ID'
          7
          0
          'Comp.'
          8
          0
          'Letra'
          9
          0
          'N'#250'mero'
          10
          0
          'Item'
          11
          0
          'ID'
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
          8
          1
          2
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 363
    Width = 799
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 353
    ExplicitWidth = 789
    object Label2: TLabel
      Left = 484
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Total:'
    end
    object edtTotal: TEdit
      Left = 520
      Top = 6
      Width = 84
      Height = 21
      Alignment = taRightJustify
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
  end
end
