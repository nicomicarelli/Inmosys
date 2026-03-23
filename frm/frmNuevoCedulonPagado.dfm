object fNuevoCedulonPagado: TfNuevoCedulonPagado
  Left = 621
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nuevo Impuesto Pagado'
  ClientHeight = 464
  ClientWidth = 881
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape4: TShape
    Left = 236
    Top = 11
    Width = 38
    Height = 9
  end
  object Label11: TLabel
    Left = 280
    Top = 9
    Width = 135
    Height = 13
    Caption = 'Cedul'#243'n incluido en vale'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlFondo: TAdvPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 464
    Align = alClient
    BevelOuter = bvNone
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.3.0.7'
    BorderColor = clNone
    Caption.Color = 12105910
    Caption.ColorTo = 10526878
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clNone
    CollapsDelay = 0
    ColorTo = clSilver
    ColorMirror = clSilver
    ColorMirrorTo = clSilver
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BevelInner = True
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWhite
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = [fsBold]
    StatusBar.Color = 10592158
    StatusBar.ColorTo = 5459275
    StatusBar.GradientDirection = gdVertical
    StatusBar.Height = 16
    Text = ''
    FullHeight = 200
    object gbxBotones: TcxGroupBox
      Left = 0
      Top = 380
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Transparent = True
      Height = 84
      Width = 881
      object Label6: TLabel
        Left = 512
        Top = 33
        Width = 64
        Height = 19
        Caption = 'Total $:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 512
        Top = 60
        Width = 130
        Height = 19
        Caption = 'Total Pagado $:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbTotalInq: TLabel
        Left = 732
        Top = 0
        Width = 25
        Height = 16
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lbTotalProp: TLabel
        Left = 836
        Top = 0
        Width = 25
        Height = 16
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Shape1: TShape
        Left = 1
        Top = 4
        Width = 38
        Height = 9
        Brush.Color = clMoneyGreen
      end
      object Label8: TLabel
        Left = 49
        Top = 1
        Width = 78
        Height = 13
        Caption = 'Cedul'#243'n Pagado'
      end
      object Shape2: TShape
        Left = 1
        Top = 18
        Width = 38
        Height = 9
        Brush.Color = 12171775
      end
      object Label9: TLabel
        Left = 49
        Top = 15
        Width = 153
        Height = 13
        Caption = 'Cedul'#243'n con porcentaje inv'#225'lido'
      end
      object Shape3: TShape
        Left = 228
        Top = 3
        Width = 38
        Height = 9
      end
      object Label10: TLabel
        Left = 272
        Top = 1
        Width = 135
        Height = 13
        Caption = 'Cedul'#243'n incluido en vale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape5: TShape
        Left = 228
        Top = 18
        Width = 38
        Height = 9
        Brush.Color = 10801663
        Visible = False
      end
      object Label12: TLabel
        Left = 272
        Top = 15
        Width = 147
        Height = 13
        Caption = 'Cedul'#243'n NO INCLUIDO en vale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object edTotal: TcxTextEdit
        Left = 668
        Top = 33
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        OnKeyPress = cxTextEdit1KeyPress
        Width = 89
      end
      object edTotalPagado: TcxTextEdit
        Left = 668
        Top = 59
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        OnKeyPress = cxTextEdit1KeyPress
        Width = 89
      end
      object btnSalir: TAdvGlowButton
        Left = 785
        Top = 52
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
        TabOrder = 2
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
      object btnGenerarVale: TAdvGlowButton
        Left = 373
        Top = 52
        Width = 119
        Height = 29
        BorderStyle = bsNone
        Caption = 'Generar Vale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = True
        OnClick = btnGenerarValeClick
        Appearance.BorderColor = 12369016
        Appearance.BorderColorHot = 12369016
        Appearance.BorderColorDown = 12369016
        Appearance.BorderColorChecked = 12369016
        Appearance.BorderColorDisabled = 12369016
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
      object AdvGlowButton2: TAdvGlowButton
        Left = 205
        Top = 52
        Width = 162
        Height = 29
        BorderStyle = bsNone
        Caption = 'Extraer Dinero de Caja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 4
        TabStop = True
        OnClick = AdvGlowButton2Click
        Appearance.BorderColor = 12369016
        Appearance.BorderColorHot = 12369016
        Appearance.BorderColorDown = 12369016
        Appearance.BorderColorChecked = 12369016
        Appearance.BorderColorDisabled = 12369016
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
      object btnBuscar: TAdvGlowButton
        Left = 102
        Top = 52
        Width = 90
        Height = 29
        BorderStyle = bsNone
        Caption = 'Buscar'
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
        TabOrder = 5
        TabStop = True
        OnClick = btnBuscarClick
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
      object btnGrabar: TAdvGlowButton
        Left = 6
        Top = 52
        Width = 90
        Height = 29
        BorderStyle = bsNone
        Caption = 'Grabar'
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
        OnClick = actGrabarExecute
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
    object cxGroupBox2: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Transparent = True
      Height = 105
      Width = 881
      object Label2: TLabel
        Left = 10
        Top = 9
        Width = 50
        Height = 14
        Caption = 'Empresa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 33
        Width = 56
        Height = 14
        Caption = 'Mes Pago:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 300
        Top = 32
        Width = 67
        Height = 14
        Caption = 'Fecha Pago:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 476
        Top = 9
        Width = 67
        Height = 14
        Caption = 'Fecha Pago:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label5: TLabel
        Left = 10
        Top = 66
        Width = 75
        Height = 23
        Caption = 'Cedul'#243'n:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edFecha: TcxMaskEdit
        Left = 380
        Top = 31
        Properties.EditMask = '!99/99/0000;1;_'
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 0
        Text = '  /  /    '
        Width = 79
      end
      object edMes: TcxComboBox
        Left = 100
        Top = 31
        Properties.CharCase = ecUpperCase
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 12
        Properties.Items.Strings = (
          'ENERO'
          'FEBRERO'
          'MARZO'
          'ABRIL'
          'MAYO'
          'JUNIO'
          'JULIO'
          'AGOSTO'
          'SETIEMBRE'
          'OCTUBRE'
          'NOVIEMBRE'
          'DICIEMBRE')
        StyleDisabled.BorderColor = clBtnFace
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 1
        Text = 'ENERO'
        Width = 121
      end
      object spAnio: TcxSpinEdit
        Left = 227
        Top = 31
        Properties.MaxValue = 2999.000000000000000000
        Properties.MinValue = 2014.000000000000000000
        StyleDisabled.BorderColor = clBtnFace
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 2
        Value = 2015
        Width = 57
      end
      object edCodigo: TcxTextEdit
        Left = 100
        Top = 7
        Properties.ReadOnly = True
        TabOrder = 3
        Width = 51
      end
      object edEmpresa: TcxComboBox
        Left = 154
        Top = 7
        Properties.DropDownListStyle = lsFixedList
        Properties.ReadOnly = True
        StyleDisabled.BorderColor = clBtnFace
        StyleDisabled.Color = clWhite
        StyleDisabled.TextColor = clBlack
        TabOrder = 4
        OnClick = edEmpresaClick
        Width = 305
      end
      object cxTextEdit1: TcxTextEdit
        Left = 101
        Top = 63
        ParentFont = False
        Properties.ReadOnly = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 5
        OnKeyPress = cxTextEdit1KeyPress
        Width = 588
      end
      object Actualizar: TAdvGlowButton
        Left = 788
        Top = 66
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
      object btnValidar: TAdvGlowButton
        Left = 788
        Top = 33
        Width = 90
        Height = 29
        BorderStyle = bsNone
        Caption = 'Validar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        TabOrder = 7
        TabStop = True
        Visible = False
        OnClick = btnValidarClick
        Appearance.BorderColor = 12369016
        Appearance.BorderColorHot = 12369016
        Appearance.BorderColorDown = 12369016
        Appearance.BorderColorChecked = 12369016
        Appearance.BorderColorDisabled = 12369016
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
      object chCuota50: TCheckBox
        Left = 476
        Top = 32
        Width = 213
        Height = 17
        Caption = 'Cuota Extraordinaria (ej: Cuota 50)'
        TabOrder = 8
      end
    end
    object gDetalle: TAdvStringGrid
      Left = 0
      Top = 105
      Width = 881
      Height = 275
      Cursor = crDefault
      Align = alClient
      ColCount = 10
      Ctl3D = True
      DefaultRowHeight = 19
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 20
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentCtl3D = False
      PopupMenu = popOpciones
      ScrollBars = ssBoth
      TabOrder = 2
      OnKeyPress = gDetalleKeyPress
      GridLineColor = 15527152
      GridFixedLineColor = 13947601
      HoverRowCells = [hcNormal, hcSelected]
      OnGetAlignment = gDetalleGetAlignment
      OnSearchFooterAction = gDetalleSearchFooterAction
      OnCheckBoxClick = gDetalleCheckBoxClick
      OnEditCellDone = gDetalleEditCellDone
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = 16644337
      ActiveCellColorTo = 16576469
      ColumnHeaders.Strings = (
        ''
        'Codigo'
        'Nombre'
        'Cuenta - Factura'
        'Vencimiento'
        'Importe'
        '% Inq.'
        '% Prop.'
        'Imp. Inquilino'
        'Imp. Propietario')
      ControlLook.FixedGradientMirrorFrom = 16447735
      ControlLook.FixedGradientMirrorTo = 16052977
      ControlLook.FixedGradientHoverFrom = 16775139
      ControlLook.FixedGradientHoverTo = 16775139
      ControlLook.FixedGradientHoverMirrorFrom = 16772541
      ControlLook.FixedGradientHoverMirrorTo = 16508855
      ControlLook.FixedGradientDownFrom = 16377020
      ControlLook.FixedGradientDownTo = 16377020
      ControlLook.FixedGradientDownMirrorFrom = 16242317
      ControlLook.FixedGradientDownMirrorTo = 16109962
      ControlLook.FixedGradientDownBorder = 11440207
      ControlLook.RadioAlwaysActive = True
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      DefaultAlignment = taCenter
      Filter = <>
      FilterActive = True
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.TextChecked = 'Checked'
      FilterDropDown.TextUnChecked = 'Unchecked'
      FilterDropDownClear = '(All)'
      FilterEdit.TypeNames.Strings = (
        'Starts with'
        'Ends with'
        'Contains'
        'Not contains'
        'Equal'
        'Not equal'
        'Clear')
      FixedColWidth = 25
      FixedRowHeight = 19
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = []
      FloatFormat = '%.2f'
      HoverButtons.Buttons = <>
      HoverButtons.Position = hbLeftFromColumnLeft
      Look = glVista
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.AutoSearch = False
      SearchFooter.ColorTo = 16052977
      SearchFooter.FindNextCaption = '&Siguiente'
      SearchFooter.FindPrevCaption = '&Anterior'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Resaltar'
      SearchFooter.HintClose = 'Cerrar'
      SearchFooter.HintFindNext = 'Encontrar Pr'#243'ximo'
      SearchFooter.HintFindPrev = 'Encontrar anterior'
      SearchFooter.HintHighlight = 'Resaltar ocurrencias'
      SearchFooter.MatchCaseCaption = 'Coincidir May'#250'sculas y min'#250'sculas'
      SearchFooter.SearchColumn = 1
      ShowDesignHelper = False
      SortSettings.DefaultFormat = ssAutomatic
      SortSettings.HeaderColor = 16579058
      SortSettings.HeaderColorTo = 16579058
      SortSettings.HeaderMirrorColor = 16380385
      SortSettings.HeaderMirrorColorTo = 16182488
      Version = '7.4.6.3'
      ColWidths = (
        25
        49
        230
        108
        68
        66
        60
        56
        100
        98)
      RowHeights = (
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19
        19)
      object cxGrid1: TcxGrid
        Left = 3
        Top = 116
        Width = 1134
        Height = 62
        TabOrder = 4
        Visible = False
        object gDatos: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '$, 0.00'
              Kind = skSum
              FieldName = 'Monto'
              Column = Columna_Cuenta
              DisplayText = '$ 0.00'
            end
            item
              Format = '$, 0.00'
              FieldName = 'Pendiente'
              Column = Columna_Vencimiento
              DisplayText = '$ 0.00'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object Columna_Seleccionado: TcxGridDBColumn
            Caption = 'Pagado'
            PropertiesClassName = 'TcxCheckBoxProperties'
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object Columna_Vale: TcxGridDBColumn
            Caption = 'Vale'
            PropertiesClassName = 'TcxCheckBoxProperties'
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object Columna_Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
          end
          object Columna_Nombre: TcxGridDBColumn
            Caption = 'Nombre'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 254
          end
          object Columna_Cuenta: TcxGridDBColumn
            Caption = 'Cuenta-Factura'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 131
          end
          object Columna_Vencimiento: TcxGridDBColumn
            Caption = 'Fecha Vto.'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 70
          end
          object Columna_Importe: TcxGridDBColumn
            Caption = 'Importe'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 80
            Options.Editing = False
            Options.Filtering = False
            Options.Grouping = False
            Options.HorzSizing = False
            Width = 80
          end
          object Columna_PorcentajeInquilino: TcxGridDBColumn
            Caption = '% Inq,'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 64
            Options.Editing = False
            Options.Filtering = False
            Options.Grouping = False
            Options.HorzSizing = False
          end
          object Columna_PorcentajePropietario: TcxGridDBColumn
            Caption = '% Prop.'
          end
          object Columna_ImporteInquilino: TcxGridDBColumn
            Caption = 'Imp. Inquilino'
            Width = 98
          end
          object Columna_ImportePropietario: TcxGridDBColumn
            Caption = 'Imp. Propietario'
            Width = 135
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gDatos
        end
      end
    end
  end
  object aclActionList: TActionList
    Left = 528
    Top = 224
    object actNuevo: TAction
      Caption = 'actNuevo'
      ImageIndex = 0
    end
    object actGrabar: TAction
      Caption = '&Grabar'
      ImageIndex = 1
      OnExecute = actGrabarExecute
    end
    object actBorrar: TAction
      Caption = '&Borrar'
      ImageIndex = 3
    end
    object actCerrar: TAction
      Caption = 'Cerrar'
      ImageIndex = 4
    end
  end
  object ImageList1: TImageList
    Height = 24
    Width = 24
    Left = 608
    Top = 152
    Bitmap = {
      494C010105000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBCBCB00CAC9
      C900C6C6C600B9B8B800AEADAD00AAAAAA00A8A8A800A9A9A900AAAAAA00B1B1
      B100BFBFBF00C9C9C900CACACA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CACACA00C6C5C500B5B4
      B300A2A0A00089888800797A7A00757677007474760075767700767878007C7D
      7D0092929300AEAEAE00C3C3C300CACACA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5C5C50097999D007BAD
      DA005BB1F4003FAFF80030ABF9002BA8FA0026A9FB002BA9FA0034ADF90040B1
      F70052ACF10073A2D100878C9200C4C4C4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00A5A5A500A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A6007B96B20057C5FD0031BB
      FF0056D1FF004FC6FF0074E7FF0060D4FF006DE2FF0075E3FF0059CDFF006AE1
      FF0049C7FF0045CDFF0054CAFC00889DB2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000064646400454545004A4A
      4A004A4A4A004A4A4A00494949004A4A4A00494949001C9CFC0056D0FF004FC0
      FF0071DEFF0062D0FF008DF6FF0072DEFF0084EAFF008AF1FF0066D4FF007FE6
      FF0053BFFF0051C2FF0052CAFF0039AAF9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2903500F48E3100F68B
      2C00F68A2A00F6882500F6872300F6872300F5872400148CFA006ED6F6006BCD
      E40075CDD80077CED4007ACED2007AD0D3007ED2D50082D9DD0085E6EF008EF3
      FB007DE7FD0074DEFF005ECFFF0027A1FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4A87100FEB06600FED8
      B100FEC88D00FDC07A00FEBE7500FBBC7300F5B872001A88DB0063B3C300488F
      A6003E7D960039789200387791003777920035789400377C9B003F8FB6004BAC
      D9005AC2F4005ECFFC006CD9FF003BAFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC4BB00CC7F3500CFC3
      AE00CEAE8500CEC0A900CFC4B100C7B9A7009B938A00A4B4BF00B9BBBB00B2B2
      B200ADADAD00A6A5A500AAAAAA00ACACAC00A6A5A500B1B2B300A6A5A5009BB1
      BC004A86A4005BC7F50079E3FF0047B9FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B3E14005C49
      34005C4F3F005C5650005B4A37008F898200B7B7B600A6A5A500D2D2D200A6A5
      A500E4E4E400A6A5A500E1E1E100E8E7E700A6A5A500DDDDDD00A6A5A500BEBD
      BD00B8B8B80099BBBD007AD9F90083C3E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5943800F88B2800FA88
      2100FA8C2A00FA881F00FA881F00ADA9A700D5D5D500A6A5A500EBEBEB00A6A5
      A500EFEEEE00B8B7B700F2F1F100FFFFFF00BCBCBC00F7F7F700B1B1B100C7C7
      C700D5D5D500A6A5A5009BADB100C7CBCD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4A87100FEB06600FED8
      B100FEC88D00FDC07A00FEBE7500A6A5A500EDEDED00A6A5A500FEFEFE00FCFC
      FC00F7F7F700E6E6E500D9D8D800D4D4D400D2D2D200D3D3D300C7C7C700CDCD
      CD00CFCFCF00A3A2A200CBC9C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC4BB00CC7F3500CFC3
      AE00CEAE8500CEC0A900CFC4B100A9A9A900F7F7F700E8E8E800DEDEDD00C7C6
      C500B2B0B00095949400828283007D7E7F007B7C7D007C7D7E00808282008888
      8900A5A5A600A4A4A300C3C3C300CACACA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B3E14005C49
      34005C4F3F005C5650005B4A3700AFAFAF00E5E5E500E2E2E200A6A9AD0080B2
      DF005BB2F5003FB0F90030ACFA002BA9FB0026A9FB002BA9FA0034ADFA0040B1
      F80053AEF30072A2D100878C9200C4C4C4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5943800F88B2800FA88
      2100FA8C2A00FA881F00FA881F00BFA69000B8B7B7009BB6D20058C7FE0031BB
      FF0056D1FF004FC6FF0074E7FF0060D4FF006DE2FF0075E3FF0059CDFF006AE1
      FF0049C7FF0045CDFF0054CBFC0097ACC1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4A87100FEB06600FED8
      B100FEC88D00FDC07A00FEBE7500FCBE7500D4B490001E9EFD0056D0FF004FC0
      FF0071DEFF0062D0FF008DF6FF0072DEFF0084EAFF008AF1FF0066D4FF007FE6
      FF0053BFFF0051C2FF0052CAFF003CADFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0C6BD00FD9D4200FFF0
      D600FED6A400FEECD000FFF1DA00FFEED600FFEFD900148FFF0072DEFF0078E5
      FF008AF2FF008FF8FF0094FAFF0094FBFF0097FBFF0096FAFF008EF5FF0090F7
      FF007EE9FF0074DEFF005ECFFF0027A1FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F68E2E00FECB
      9000FEDAAF00FFEFDD00FED09900FEC78B00FECA90001C9DFE0081EAFF006FDB
      FF0069D5FF0064D2FF0063D1FF0060CFFF005CCFFF005ACCFF0058C8FF0058CA
      FF005ECBFF005FD1FF006CD9FF003BAFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2AC7900FEA4
      4800FFE7CE00FECA9300FED29F00FFE4C800FEDCB70025AAFE0087F1FF006FDA
      FF0067D2FF0062D0FF005DCFFF005BCBFF0059CBFF0056CAFF0051C5FF0054C5
      FF0055C6FF005FCFFF0079E3FF0047B9FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0C7BE00FD8E
      2600FFD0A000FDB66F00FFE8D200FD932D00FFFFFF0071B3D30078DEFF0092F7
      FF00A2FCFF00A5FCFF00A3FBFF00A3FCFF00A3FCFF00A3FCFF00A0FCFF00A3FC
      FF0099F9FF0094F8FF0077DDFF0083C3E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F88E
      2D00FDA65100FED6B000FEBC8000FEBB7C00FFF2E600F8A85D00B4C5CB0065B0
      CE0043C5FD003FC4FE0040C8FE0043CAFE0042CAFF0042C7FF0043C8FF003FC2
      FE003DC0FC0062ABC9008FC0DE00C7CBCD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3AC
      7900FD9D4200FEB47100FFCDA100FEB47200FEA24D00FEAD6500FEAB5D00FDA3
      4F00FDBA7800FDC38A00FDC18700FDBD8000FCB36E00FCB06800F8B36F00FE94
      3300FEAD6300D8B99D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CDCB
      C900FD9D4500FDA55400FDAA5E00FEB57300FEB47100FEB77700FEA35300FFC9
      9B00FFD8B600FFD8B500FED8B500FEDAB700FEDAB900FEDCBC00FED0A500FEB1
      6900FC8922000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9902F00F99A4400F98E2E00F98C2B00F98B2B00F98A2700F9903100F996
      3F00F9984200F9984200F9984200F9984200F9984200F9984300FA973F00F796
      4000F09949000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2B9D300438A
      E100126CE400025EE200025EE200126CE400438AE100A1B8D300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8C8C8007CA5D500156FE400117A
      EE0030A3FB0042B5FE0044B7FE0033A8FC001682F100136EE40076A0D200BFBF
      BF00BEBEBE00BEBEBE00BFBFBF00BFBFBF00BFBFBF00C1C1C100C2C2C200C4C4
      C400C9C9C900CACACA00CACACA00CACACA00000000000000000000000000CBCB
      CB00C8C8C800C9C9C800CBCAC800CACAC800CACAC800CACAC800CACAC800CACA
      C800CACAC800CACAC800CACAC800CACAC800CACAC800CBCAC800CAC9C900C8C8
      C800CACACA000000000000000000000000000000000000000000000000000000
      0000CBCBCB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1B6CD001873E6001883F100349F
      F5003EADFA0044B5FD0045B8FD0045B7FD0041B1FB002493F6000E68DE00677E
      9A0082828200848484008686860086868600878787008C8C8C009A9A9A00B1B1
      B100C2C2C200CACACA0000000000000000000000000000000000CACACA009595
      950028292A00444030008D772F008A6C0E008A6D11008A6D11008A6D11008A6D
      11008A6D11008A6D11008A6D11008A6D11008A6D11008E6F0D00685D3A002829
      2D005B5B5B00C1C1C10000000000000000000000000000000000CBCBCB00A3A3
      A30076767600BEBEBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000589AE2000972ED00187AEA00278F
      F10036A3F70031A6FD00BBD1E40053AEF5003DA7F7002E98F300127BEE001D63
      B9005A5A5A005B5B5B006060600060606000626262006C6C6C0089898900AAAA
      AA00C1C1C100CACACA0000000000000000000000000000000000BFBFBF002B2B
      2B0023232400534F4300A18E5400977F3200967E3300967E3300967E3300967E
      3300967E3300967E3300967E3300967E3300967E34009C8333007A7154003536
      38002121210086868600CBCBCB000000000000000000CBCBCB00959595001E1E
      1E002626260048484800BBBBBB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CBCAC900C9C2BD00BD936D00B0611A00AB510200BE64
      0000B0550800B8671C00C3996F00CAC1B900CCCAC80000000000000000000000
      0000CCC1B3000000000000000000000000002D8AED000879F1000B7CF3001B90
      F800289EFC001C98FE00DEDEDE00DEDEDE00B1CDE5004AA0F000197EED002274
      DC00FEC27C00FEC37D00FEC48000FEC47E00FDC58100FDC48000FCC07B00BCBC
      BC00C7C7C7000000000000000000000000000000000000000000BBBBBB001F1F
      1F002424240060606100DADCE100DDDFE600D6D8DF00D6D9DF00D6D9DF00D6D9
      DF00D6D9DF00D6D9DF00D6D9DF00D6D8DF00D8DBE100E8EBF20097989B003232
      32002626260063636300CACACA000000000000000000C8C8C8001C1C1C003333
      330041414100313131004F4F4F00B8B8B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C9C4C000BD936E00B55F0600C9730000E0930000E99F0100E59C
      0300E9A40B00E7A11500D98E1D00CA791F00C9986500CBC0B600CBC5BF00CFB3
      8F00D28426000000000000000000000000000E83F7000284FE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0097BFE600087C
      F600FFFEF600FFFDF600FFFDF500FFFCF400FFFBF200FFF7EC00FCBD7500CACA
      CA000000000000000000CACACA00CACACA000000000000000000BCBCBC002020
      20002626260060606000D8D8D800DFDFDF00DADADA00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DADADA00DBDBDB00E7E7E700969696003434
      34002929290064646400CACACA000000000000000000CACACA00565656003D3D
      3D0058585800595959003636360053535300B8B8B80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C4C000BA835200C36E0000DE900000E3990100DF940000DF940400E29D
      1000E3A01700E6A62300EBB23100EDB53D00DF9D3500D0954C00D19D5A00E9B4
      5000E09C37000000000000000000000000001087F9000486FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFE0FF000584
      FC00FFF6D000FFF6D000FFF4CC00FEF0C600FEE9BC00FFF7EC00FCB566000000
      0000000000000000000000000000000000000000000000000000BCBCBC002121
      21002626260062626200DBDBDB00E0E0E000DADADA00DADADA00DADADA00DADA
      DA00DADADA00DADADA00DADADA00DADADA00DCDCDC00EAEAEA00989898003535
      35002A2A2A0064646400CACACA00000000000000000000000000C5C5C5006666
      6600464646005F5F5F005E5E5E003B3B3B0053535500BBBBBE00BFBCB200ADA4
      8800A3977000A1946C00A5997500B1AA9200C6C5C00000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBCA
      C900BD936E00C36E0000E1960100E0940100DF930200E3990900E29B1600DE9A
      2100E7AD3C00EDBC5000EFBD4E00EDB94500F2C45500ECB84F00ECBA5700FADA
      7800E3A43F000000000000000000000000003897F0001290FD001A98FE0025A1
      FE0030A9FF0038AFFF00FFFFFF00FFFFFF00D8EEFF0064BAFF00299BFC003A9B
      F000FFF1C800FEF0C700FEEEC300FEEABD00FEE4B300FFF6E900FCAA56000000
      0000000000000000000000000000000000000000000000000000BCBCBC002222
      22002929290064646400DDDDDD00EBEBEB00E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900F0F0F000999999003737
      37002C2C2C0065656500CACACA0000000000000000000000000000000000BEBE
      BE006D6D6D004D4D4D00646464005E6063003F3E3800796D47008C783B007E66
      1B00785E0D00785E0E00785E0D00816A2200907E4400ACA28400CAC9C8000000
      000000000000000000000000000000000000000000000000000000000000C9C2
      BD00B55F0600DD900000E0940100DF950400E0970C00D0801200CD873700CA9D
      6D00D5A87100DCAB6800EABE6D00F3CD7100F1C65B00F5CC6700F6D06F00FBDC
      8100E5AA420000000000000000000000000072ACE2000C8EFE005DCDFD0062D1
      FE006AD7FE005CCCFE00E9F7FF007BCDFF0052BBFF0051C2FE001A94FC008EBB
      D800FEEABC00FEE9BC00FEE7B800FEE3B000FEDCA700FFF4E600FB9F44000000
      0000000000000000000000000000000000000000000000000000BCBCBC002323
      23002B2B2B0066666600E0E0E000E3E3E300DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DFDFDF00F0F0F0009D9D9D003939
      39002F2F2F0065656500CACACA00000000000000000000000000000000000000
      0000BDBDBD006F6F6F00505155005C5A50006E5B21007B610F00886A11009171
      12008D6E10008B6D10008E6F11008F70120085681000816717009F916600C7C6
      C30000000000000000000000000000000000000000000000000000000000BD93
      6E00CA760000E49A0100DF940600E1970F00CB7E1D00C1946F00C6B3A400CBCA
      CA00C8BFBB00C8A17900D7984600F2CE7B00F4CB6300F6D06F00F7D47700FDE2
      8C00E8B04900000000000000000000000000B6C4D2003E9AEF0029A4FE007FE9
      FF0088EEFD007EE3FC0057C5FE006FD6FC007EE9FF0034ADFE004E9FE300E2D5
      B400FEE2AE00FEE1AD00FEDEA800FDD8A100FDD49900FFF1E100FA9435000000
      0000000000000000000000000000000000000000000000000000BDBDBD002525
      25002E2E2E0064646400E0E0E000F0F0F000E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900EAEAEA00F7F7F7009C9C9C003A3A
      3A003232320065656500CACACA00000000000000000000000000000000000000
      000000000000BDBDBE00787670006D5B210086690F00967614008A6C0F009A87
      5000AFA27C00B5AA8A00AA9D7400947F3D008F7011009171140083671000A59A
      7300C9C8C600000000000000000000000000000000000000000000000000B058
      0900D7860400E49C0A00EAA81800D68A1A00C3956D00CBC9C80000000000CCCB
      CA00CDA67800DBA65B00F4DA9F00FADF9900F8D78200F8D47200F8D77600FEE5
      8F00EBB64E00000000000000000000000000000000009FBCD7003E9AEF001494
      FF006CD4FC00A0F2F700A8F4F50080DBF8001A99FF004D9ADB00C6C0AB00FED5
      9A00FED69C00EECEA000CDBEA700B4B1AD00CBB9A100EDE0D100FA8B27000000
      0000000000000000000000000000000000000000000000000000BDBDBD002626
      26003333330045454500ADADAD00FBFBFB00FEFEFE00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FEFEFE00FFFFFF00DFDFDF006A6A6A003333
      33003535350066666600CACACA00000000000000000000000000000000000000
      00000000000000000000A79B7800876B12009D7C170084691200B4A98A00B9B1
      9900BBB49D00BCB59F00BAB39D00BAB39C00A29466008E701100987816008367
      1100C1BDB200000000000000000000000000000000000000000000000000C6AF
      9900CAA06D00C9842D00D0821B00C97A2100C7AF9A000000000000000000CCCB
      CB00CDAE8B00D6A96B00E5B26600EEC47900F9DFA600FEF1CC00FFEDBE00FFED
      B000EFBC4F000000000000000000000000000000000000000000B6C4D20072AC
      E2003A98F100108AFB001283EE0048A1F4008DA4B200E1BB8900FDC68200FDC9
      8700FDCB8900D4C1A800D1D1D100E9E9E900CFCFCF00D1C9C000FB851D000000
      0000000000000000000000000000000000000000000000000000BDBDBD002727
      2700383838003636360043434300616161006C6C6C006C6C6C006C6C6C006C6C
      6C006C6C6C006C6C6C006C6C6C006D6D6D006A6A6A0050505000383838003636
      36003838380066666600CACACA00000000000000000000000000000000000000
      000000000000BFBDB5009D8847009F7E18008D6F1100B5AA8700BFB79E00BEB6
      9D00BEB69D00BEB69D00BEB69D00BEB69D00C1BAA400A3925C00977714009B7B
      1700A3956900C9C9C7000000000000000000000000000000000000000000AC62
      2B00C7C5C50000000000CCC8C600CCC8C400CCCBCA0000000000000000000000
      0000CCCBCB00CCC9C600CDC8C200D0C6B600D8B47C00E5AD4E00F0C87300FCEC
      C700F2C96D000000000000000000000000000000000000000000000000000000
      00000000000000000000FD811300FEE8D100FDB56800FDB66800FDBA6F00FDBD
      7400FDBE7700C7C4BF00EBEBEB00F0F0F000EAEAEA00C5C3C100FB8218000000
      0000000000000000000000000000000000000000000000000000BDBDBD002929
      29003A3A3A003939390038383800383838003737370037373700373737003737
      3700373737003737370037373700373737003838380038383800393939003939
      39003A3A3A0066666600CACACA00000000000000000000000000000000000000
      000000000000B4AD940096791F00A4821800A08C4D00BCB39600C2B99E00C2B9
      9F00C4BCA200C5BDA300C4BCA100C2B99E00C3BBA100B3A88800A0863400A582
      190091772800C6C5BE000000000000000000000000000000000000000000C77B
      2600E6B76300D89C4800CC8A3D00C5966900CCBFB200CCC7C200CCC9C500CCCB
      CB00000000000000000000000000CCCBCA00CDCBC600CDCBC70000000000CEC4
      B500E7B959000000000000000000000000000000000000000000000000000000
      00000000000000000000FD801200FEE1C400FDAC5A00FDAA5600FDAF5C00FDB1
      5F00FDB26100DABEA000D8D8D800EBEBEB00D8D8D800DACDC000FC8014000000
      0000000000000000000000000000000000000000000000000000BDBDBD002B2B
      2B003C3C3C003B3B3B003B3B3B003F3F3F004545450047474700474747004848
      480048484800484848004747470046464600424242003C3C3C003B3B3B003B3B
      3B003C3C3C0066666600CACACA00000000000000000000000000000000000000
      000000000000B2A784009D7C16009E7D1700B4A47200C5BCA000CBC2A800CFC7
      AE00CEC6AD00CEC6AD00CFC6AD00CEC6AD00C9C0A500C6BDA300A48D4700A784
      190092731300C6C3BB000000000000000000000000000000000000000000B960
      0000EFB82800F2CC6D00FADE9700F0CC8100E2AD6200DA9F5800D2A26700CEB0
      8B00CCCBCB000000000000000000D0BC9F00E5AE4A00EEBE5A00E8C47500DBD0
      B300D5C8AA000000000000000000000000000000000000000000000000000000
      00000000000000000000FD7F1100FED9B500FDA34D00FDA04500FDA34A00FDA6
      4F00FDA64F00F1AD6800DAB99800C9C4BE00DABA9A00F2CFAF00FC7F12000000
      0000000000000000000000000000000000000000000000000000BDBDBD002C2C
      2C00404040003D3D3D004545450080808000BCBCBC00CECECE00D6D6D600DCDC
      DC00DADADA00D6D6D600D2D2D200CECECE00A3A3A3005A5A5A003C3C3C003E3E
      3E003F3F3F0066666600CACACA00000000000000000000000000000000000000
      000000000000B4A88400A5831800A1801700BAAB7A00D2CBB100D5CDB400D5CD
      B400D5CDB400D5CDB400D5CDB400D5CDB400D5CDB400D3CBB300A6904A00AE8B
      1B0099791400C7C4BB000000000000000000000000000000000000000000BF65
      0500E4990100E0930200E49F1500ECB64500F5CE7400F3D59100DBA35800CFA7
      7900CCCBCA0000000000CCCAC800D6B27800F1C76600FFED9D00FEE79800FAE3
      A400EEBB4B000000000000000000000000000000000000000000000000000000
      00000000000000000000FD7F1000FECEA300FD9C4100FD973700FD9A3A00FD9C
      3E00FD9B3E00FD9B3C00FD9A3B00FD993700FD9E4500FECA9C00FC7E11000000
      0000000000000000000000000000000000000000000000000000BDBDBD002E2E
      2E00424242003C3C3C006A6A6A00C4C4C400DDDDDD00E8E8E800F4F4F400FFFF
      FF00DEDEDE00A3A3A300BEBEBE00F2F2F200DDDDDD0095959500464646003F3F
      3F004242420067676700CACACA00000000000000000000000000000000000000
      000000000000B4AA8900AB881900B38E1B00B5A36800D7CFB600DBD4BB00DBD4
      BB00DBD4BB00DBD4BB00DBD4BB00DBD4BB00DDD6BE00D0C7AC00AD934200BE97
      1F009A7A1400C6C4BC000000000000000000000000000000000000000000C069
      0800E6A20C00E39F1B00E7A72800E8AB2D00EDBF6000D6954300CBA57B00CCC3
      BB00CCCACA00CEBDA700D5B17B00EAB95800FADD8600FCE08C00FFECB500F8DB
      9600DCC58F000000000000000000000000000000000000000000000000000000
      00000000000000000000FD801000FEC49000FD963600FD902B00187DE5002397
      F90040B4FE0047BBFE0037AAFB002689E800FD993C00FEC59200FC7E11000000
      0000000000000000000000000000000000000000000000000000BDBDBD002E2E
      2E00444444003C3C3C007A7A7A0000000000D9D9D900E5E5E500F1F1F100FBFB
      FB00C5C5C5003434340080808000EEEEEE00DDDDDD00A3A3A3004E4E4E004040
      40004343430067676700CACACA00000000000000000000000000000000000000
      000000000000B7B1A000B5953400CEA42300A58A3700D9D1B700E1DAC300E0D9
      C100E0D9C100E1D9C100E0D9C100E1D9C000E6E0CB00C1B68F00B1902C00D3A8
      2400A38B4300C7C6C1000000000000000000000000000000000000000000C46C
      0A00E7A20E00E5A21E00E8AA2D00E9AF3600F0C46300ECC07100E3B57100DEB8
      7C00D9B47C00E3B35C00ECBC5900F9DB8200FCE08B00FDE39800FDECBF00F1C4
      6300CFCAC1000000000000000000000000000000000000000000000000000000
      00000000000000000000FD801000FEBC8000FD922F00FD8B22001667D700B9EC
      FF007BE5FE007DE7FE00BCEFFF001B6ED800FD943300FEC28B00FC7E11000000
      0000000000000000000000000000000000000000000000000000BDBDBD002F2F
      2F00464646003E3E3E007A7A7A00CBCBCB00D9D9D900E5E5E500F1F1F100FBFB
      FB00C7C7C7003D3D3D0086868600EEEEEE00DDDDDD00A2A2A2004F4F4F004242
      42004545450066666600CACACA00000000000000000000000000000000000000
      000000000000C7C7C700B8A36000D1A72400BD961900B4A26900E7E2D000E8E1
      CB00E5DEC700E5DDC600E6DFC800E8E5D200D9D3BB00B0984900CCA21F00C69E
      2000B8AE8D00CBCACA000000000000000000000000000000000000000000C56F
      0F00EAA61100E0991F00E4A43100EDB53E00EDB53F00F1C65D00F4CD7100F2CB
      6F00F1C56600F7D37500FADB8100FADD8200FCE29500FEEDC000F6D48800DCC4
      8F00CDCCCA000000000000000000000000000000000000000000000000000000
      00000000000000000000FD801000FEB77600FD8E2900FD871B00125DD200B2E7
      FF00B7ECFF00B8ECFF00B3E8FF001460D200FD913000FEBE8400FC7E11000000
      0000000000000000000000000000000000000000000000000000BDBDBD003030
      3000484848003D3D3D0079797900CACACA00D8D8D800E4E4E400F1F1F100FBFB
      FB00C4C4C400505050008A8A8A00ECECEC00DCDCDC00A1A1A1004E4E4E004242
      4200484848006D6D6D00CBCBCB00000000000000000000000000000000000000
      00000000000000000000B4AE9900C3A03000E2B42700BE982000B7A46100CDC4
      A900E9E7D700E9E9E100E5E0CF00C6BB9900B49C4B00CAA12300E2B42700AF95
      4000C5C3BD00000000000000000000000000000000000000000000000000C772
      1100DA8E1500CA905000CF934D00E1A33B00F1C25600F1C35200F2C35300F3C8
      5E00F6D06B00F7D36F00F9D98000FDE8AA00FDEBBC00F6D58900E1C38000CECA
      C200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FD801000FEB47000FD8A2200FD8C24002662C300075A
      DA000F5ED6000F5FD600085BDA002361C500FD8C2600FEBB7F00FC7E11000000
      0000000000000000000000000000000000000000000000000000C3C3C3005959
      590056565600606060008D8D8D00D9D9D900EBEBEB00F1F1F100F9F9F900FFFF
      FF00F4F4F400DADADA00E1E1E100F3F3F300EDEDED00B2B2B2006A6A6A006161
      61003E3E3E00A2A2A20000000000000000000000000000000000000000000000
      0000000000000000000000000000B0A47E00CDA92900EFC02B00D1A52300C7A6
      3C00BDA04700B59C4900BFA24500C8A43400DCAE2500EABE2A00BC9E3600B9B3
      9F0000000000000000000000000000000000000000000000000000000000C16B
      1500CAAA8800CBC5C000CBC0B700D0A56D00DD9B3B00ECC06600F7DA8700FAE3
      9E00FBE3A000FEEDBB00FCEABA00F6D68C00F0C46300DCC58F00CECAC2000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FD801000FEAF6800FEBB7E00FEC59100FECDA100FED3
      AC00FED6B100FED3AC00FECEA200FEC79500FEC08700FEB37100FC7E11000000
      0000000000000000000000000000000000000000000000000000CBCBCB00B7B7
      B700848484006666660086868600B6B6B600BCBCBC00BCBCBC00BDBDBD00BEBE
      BE00BFBFBF00C1C1C100BFBFBF00BCBCBC00BEBEBE009D9D9D006D6D6D007272
      72009F9F9F00C9C9C90000000000000000000000000000000000000000000000
      0000000000000000000000000000CACACA00B3A98B00B1972700F1CF2E00F6CC
      2C00E8B62500DFAD2300ECBB2700F9D12E00DFBF2900AE983F00BAB4A2000000
      000000000000000000000000000000000000000000000000000000000000CABE
      B200000000000000000000000000CCCAC800CDC5BB00D4B28100DD9E4300E29C
      3400EEBD6200E8AD4000E8B55600DBC38E00CFCAC100CDCCCA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FC7F1200FD801000FD801000FD801000FD801000FD80
      1000FD801000FD801000FD7F1000FD7F1000FD7F1000FD7F1100FB7C13000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C8C800C4C4C400C6C6C600C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900CACACA00C8C8C800C4C4C400C5C5
      C500CBCBCB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CACACA00CBCAC300AB9F7C00A998
      3F00B4A11E00BBA92100B19E2300A7964B00B4AC9200CACAC600CBCBCB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBCBCA00CBCB
      C900CBCBC800CBCBC800CBCBC900CBCAC900CBCBCB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FFC00100
      0000000000000000FF8000000000000000000000FF8000000000000000000000
      8000000000000000000000008000000000000000000000008000000000000000
      00000000800000000000000000000000800000000000000000000000C0000000
      0000000000000000800000000000000000000000800001000000000000000000
      800000000000000000000000C000000000000000000000008000000000000000
      00000000800000000000000000000000800000000000000000000000C0000000
      0000000000000000C00000000000000000000000C00000000000000000000000
      E00000000000000000000000E00003000000000000000000E000070000000000
      00000000F00007000000000000000000C03FFFFFFFFFFFFFFFFFFFFF000000E0
      0007F7FFFFFFFFFF000003C00003C3FFFFFFFFFF000003C0000181FFFFFC0077
      000007C0000180FFFFF8000700000CC00001807FFFF0000700001FC00001C000
      7FE0000700001FC00001E0001FE0000700001FC00001F0000FE0000700001FC0
      0001F80007E0200780001FC00001FC0007E06007C0001FC00001F80003E47007
      FC001FC00001F80003E00E27FC001FC00001F80003E00607FC001FC00001F800
      03E00407FC001FC00001F80003E00007FC001FC10001F80003E00007FC001FC0
      0001F80003E00007FC001FC00001FC0007E0000FFC001FC00003FE000FE0001F
      FC001FC00003FE001FEE003FFC001FF00007FF001FFFFFFFFFFFFFFFFFFFFFC0
      7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object dsEmpresas: TDataSource
    Left = 400
    Top = 288
  end
  object dsInquilinos: TDataSource
    Left = 584
    Top = 304
  end
  object popOpciones: TPopupMenu
    Left = 208
    Top = 264
    object BorrarCeduln1: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = BorrarCeduln1Click
    end
    object DeseleccionarTodos1: TMenuItem
      Caption = 'Deseleccionar Todos'
      OnClick = DeseleccionarTodos1Click
    end
    object Desmarcarcomopagado1: TMenuItem
      Caption = 'Desmarcar como pagado'
      OnClick = Desmarcarcomopagado1Click
    end
  end
  object qEmpresas: TFXQuery
    Connection = DM.Conexion
    SQL.Strings = (
      'Select Codigo, Descripcion'
      'From EmpresasImpuestos'
      'Order by Descripcion')
    Left = 475
    Top = 158
  end
  object qInquilinos: TFXQuery
    Connection = DM.Conexion
    SQL.Strings = (
      'Select Codinq, Inquilino'
      'From Automatizacion'
      'Order by Codinq')
    Left = 378
    Top = 190
  end
end
