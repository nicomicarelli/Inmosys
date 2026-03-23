object fAutomatizacion: TfAutomatizacion
  Left = 195
  Top = 8
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Par'#225'metros de Automatizaci'#243'n'
  ClientHeight = 363
  ClientWidth = 619
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 130
    Align = alTop
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label50: TLabel
      Left = 9
      Top = 109
      Width = 82
      Height = 13
      Caption = 'Cuenta Bancaria:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label60: TLabel
      Left = 324
      Top = 109
      Width = 87
      Height = 13
      Caption = '% Gasto Bancario:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 602
      Height = 104
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      object Label4: TLabel
        Left = 9
        Top = 11
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
      object Label5: TLabel
        Left = 9
        Top = 86
        Width = 37
        Height = 13
        Caption = 'Alquiler:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 9
        Top = 62
        Width = 104
        Height = 13
        Caption = 'Inmueble Ubicado en:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 9
        Top = 36
        Width = 53
        Height = 13
        Caption = 'Propietario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 125
        Top = 8
        Width = 52
        Height = 21
        Cursor = crIBeam
        Ctl3D = True
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
      object Edit6: TEdit
        Left = 125
        Top = 80
        Width = 68
        Height = 21
        Cursor = crIBeam
        Alignment = taRightJustify
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 4
        OnExit = Edit6Exit
        OnKeyPress = Edit6KeyPress
      end
      object Edit4: TEdit
        Left = 182
        Top = 32
        Width = 275
        Height = 21
        Cursor = crIBeam
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
      object edit5: TComboBox
        Left = 125
        Top = 56
        Width = 333
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = Edit5KeyPress
      end
      object CheckBox1: TCheckBox
        Left = 221
        Top = 82
        Width = 268
        Height = 17
        Caption = 'Tiene documentaci'#243'n en carpeta (Nota recordatoria)'
        TabOrder = 5
      end
      object chTransfiere: TCheckBox
        Left = 495
        Top = 82
        Width = 73
        Height = 17
        Caption = 'Transfiere'
        TabOrder = 6
        OnClick = chTransfiereClick
      end
      object edit2: TComboBox
        Left = 182
        Top = 8
        Width = 275
        Height = 21
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csSimple
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = edit2KeyPress
      end
      object chSolicitarClave: TCheckBox
        Left = 495
        Top = 58
        Width = 99
        Height = 17
        Caption = 'Solicitar clave '
        TabOrder = 7
      end
    end
    object cboCtaBancaria: TComboBox
      Left = 125
      Top = 104
      Width = 182
      Height = 21
      Enabled = False
      ItemIndex = 0
      TabOrder = 1
      Text = 'Eduardo D. Garay'
      Visible = False
      Items.Strings = (
        'Eduardo D. Garay'
        'Rodolfo F. Garay')
    end
    object Edit51: TEdit
      Left = 417
      Top = 105
      Width = 41
      Height = 21
      Cursor = crIBeam
      Alignment = taRightJustify
      Ctl3D = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      Visible = False
      OnExit = Edit6Exit
      OnKeyPress = Edit6KeyPress
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 329
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    Transparent = True
    Height = 34
    Width = 619
    object btnGrabar: TAdvGlowButton
      Left = 3
      Top = 3
      Width = 90
      Height = 29
      Action = actGrabar
      BorderStyle = bsNone
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
    object btnSalir: TAdvGlowButton
      Left = 526
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 134
    Width = 619
    Height = 192
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HotTrack = True
    ClientRectBottom = 188
    ClientRectLeft = 4
    ClientRectRight = 615
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Par'#225'metros'
      Color = clSilver
      ImageIndex = 0
      ParentColor = False
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        PanelStyle.Active = True
        Style.BorderStyle = ebsNone
        TabOrder = 0
        Transparent = True
        Height = 164
        Width = 611
        object Panel16: TPanel
          Left = 4
          Top = 3
          Width = 598
          Height = 50
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object Label44: TLabel
            Left = 7
            Top = 6
            Width = 61
            Height = 13
            Caption = 'Bonificaci'#243'n:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 185
            Top = 6
            Width = 67
            Height = 13
            Caption = 'Com. Mensual'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 329
            Top = 6
            Width = 64
            Height = 13
            Caption = '%      Importe:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 486
            Top = 6
            Width = 46
            Height = 13
            Caption = 'Expensas'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 7
            Top = 29
            Width = 101
            Height = 13
            Caption = 'Recupero de Gastos:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label51: TLabel
            Left = 186
            Top = 28
            Width = 69
            Height = 13
            Caption = 'Com. Extraord.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label52: TLabel
            Left = 330
            Top = 30
            Width = 64
            Height = 13
            Caption = '%      Importe:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit7: TEdit
            Left = 114
            Top = 4
            Width = 64
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = Edit9KeyPress
          end
          object Edit8: TEdit
            Left = 400
            Top = 4
            Width = 64
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = Edit9KeyPress
          end
          object Edit3: TEdit
            Left = 260
            Top = 4
            Width = 64
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnExit = Edit3Exit
            OnKeyPress = Edit3KeyPress
          end
          object edit23: TComboBox
            Left = 486
            Top = 25
            Width = 106
            Height = 21
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 6
            Items.Strings = (
              'NO TIENE'
              'MES EN CURSO'
              'MES VENCIDO'
              'OTROS')
          end
          object Edit42: TEdit
            Left = 114
            Top = 26
            Width = 64
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Color = clWhite
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 3
            OnKeyPress = Edit9KeyPress
          end
          object Edit43: TEdit
            Left = 260
            Top = 25
            Width = 64
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 4
            OnKeyPress = Edit43KeyPress
          end
          object Edit44: TEdit
            Left = 400
            Top = 25
            Width = 64
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 5
            OnKeyPress = Edit44KeyPress
          end
        end
        object Panel4: TPanel
          Left = 4
          Top = 59
          Width = 107
          Height = 96
          Color = clSilver
          ParentBackground = False
          TabOrder = 1
          object Label7: TLabel
            Left = 7
            Top = 3
            Width = 92
            Height = 13
            Caption = 'Aguas Cordobesas '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label30: TLabel
            Left = 15
            Top = 23
            Width = 10
            Height = 16
            Caption = '9:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 15
            Top = 47
            Width = 10
            Height = 16
            Caption = '2:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label32: TLabel
            Left = 8
            Top = 72
            Width = 17
            Height = 16
            Caption = '27:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit9: TEdit
            Left = 31
            Top = 21
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = Edit9KeyPress
          end
          object Edit10: TEdit
            Left = 31
            Top = 46
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = Edit9KeyPress
          end
          object Edit11: TEdit
            Left = 31
            Top = 71
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = Edit9KeyPress
          end
        end
        object Panel12: TPanel
          Left = 119
          Top = 59
          Width = 107
          Height = 96
          Color = clSilver
          ParentBackground = False
          TabOrder = 2
          object Label33: TLabel
            Left = 7
            Top = 3
            Width = 72
            Height = 13
            Caption = 'Tasa Municipal'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label34: TLabel
            Left = 15
            Top = 23
            Width = 10
            Height = 16
            Caption = '9:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 15
            Top = 47
            Width = 10
            Height = 16
            Caption = '5:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 8
            Top = 72
            Width = 17
            Height = 16
            Caption = '27:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit12: TEdit
            Left = 31
            Top = 21
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = Edit9KeyPress
          end
          object Edit13: TEdit
            Left = 31
            Top = 46
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = Edit9KeyPress
          end
          object Edit14: TEdit
            Left = 31
            Top = 71
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = Edit9KeyPress
          end
        end
        object Panel13: TPanel
          Left = 236
          Top = 59
          Width = 137
          Height = 96
          Color = clSilver
          ParentBackground = False
          TabOrder = 3
          object Label10: TLabel
            Left = 7
            Top = 4
            Width = 39
            Height = 13
            Caption = 'D. G. R.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label37: TLabel
            Left = 15
            Top = 23
            Width = 10
            Height = 16
            Caption = '9:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label38: TLabel
            Left = 15
            Top = 47
            Width = 10
            Height = 16
            Caption = '4:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label39: TLabel
            Left = 8
            Top = 72
            Width = 17
            Height = 16
            Caption = '27:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit15: TEdit
            Left = 31
            Top = 21
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = Edit9KeyPress
          end
          object Edit16: TEdit
            Left = 31
            Top = 46
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = Edit9KeyPress
          end
          object Edit17: TEdit
            Left = 31
            Top = 71
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = Edit9KeyPress
          end
          object chCuotas: TComboBox
            Left = 52
            Top = 1
            Width = 77
            Height = 21
            Style = csDropDownList
            Ctl3D = True
            ItemIndex = 2
            ParentCtl3D = False
            TabOrder = 3
            Text = '12 cuotas'
            Items.Strings = (
              '4 cuotas'
              '10 cuotas'
              '12 cuotas')
          end
        end
        object Panel14: TPanel
          Left = 381
          Top = 59
          Width = 107
          Height = 96
          Color = clSilver
          ParentBackground = False
          TabOrder = 4
          object Label11: TLabel
            Left = 7
            Top = 4
            Width = 93
            Height = 13
            Caption = 'Expensas Comunes'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label40: TLabel
            Left = 15
            Top = 23
            Width = 10
            Height = 16
            Caption = '9:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label41: TLabel
            Left = 8
            Top = 47
            Width = 17
            Height = 16
            Caption = '14:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label42: TLabel
            Left = 8
            Top = 72
            Width = 17
            Height = 16
            Caption = '27:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit18: TEdit
            Left = 31
            Top = 21
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = Edit9KeyPress
          end
          object Edit19: TEdit
            Left = 31
            Top = 46
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = Edit9KeyPress
          end
          object Edit20: TEdit
            Left = 31
            Top = 71
            Width = 67
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = Edit9KeyPress
          end
        end
        object Panel15: TPanel
          Left = 496
          Top = 59
          Width = 107
          Height = 96
          Color = clSilver
          ParentBackground = False
          TabOrder = 5
          object Label12: TLabel
            Left = 7
            Top = 4
            Width = 29
            Height = 13
            Caption = 'I.T.S.I'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label43: TLabel
            Left = 15
            Top = 23
            Width = 10
            Height = 16
            Caption = '9:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label45: TLabel
            Left = 6
            Top = 72
            Width = 17
            Height = 16
            Caption = '27:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Edit21: TEdit
            Left = 31
            Top = 21
            Width = 63
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = Edit9KeyPress
          end
          object Edit22: TEdit
            Left = 31
            Top = 71
            Width = 63
            Height = 21
            Cursor = crIBeam
            Alignment = taRightJustify
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = Edit9KeyPress
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Planes de pago'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 611
        Height = 164
        Align = alClient
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object Label15: TLabel
          Left = 7
          Top = 23
          Width = 33
          Height = 13
          Caption = 'D.G.R:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 7
          Top = 82
          Width = 28
          Height = 13
          Caption = 'Agua:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 7
          Top = 3
          Width = 62
          Height = 13
          Caption = 'Propietario'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 305
          Top = 3
          Width = 49
          Height = 13
          Caption = 'Inquilino'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 305
          Top = 23
          Width = 33
          Height = 13
          Caption = 'D.G.R:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 305
          Top = 52
          Width = 75
          Height = 13
          Caption = 'Tasa Municipal:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 483
          Top = 23
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 548
          Top = 23
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 483
          Top = 52
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 548
          Top = 52
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 305
          Top = 82
          Width = 28
          Height = 13
          Caption = 'Agua:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 483
          Top = 82
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 548
          Top = 82
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 7
          Top = 52
          Width = 75
          Height = 13
          Caption = 'Tasa Municipal:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 163
          Top = 23
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 163
          Top = 52
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 163
          Top = 82
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 231
          Top = 23
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 231
          Top = 52
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 231
          Top = 82
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 6
          Top = 111
          Width = 62
          Height = 13
          Caption = 'Obras varias:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 163
          Top = 110
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 231
          Top = 110
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 305
          Top = 110
          Width = 62
          Height = 13
          Caption = 'Obras varias:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 483
          Top = 110
          Width = 31
          Height = 13
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 548
          Top = 110
          Width = 12
          Height = 13
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 7
          Top = 137
          Width = 83
          Height = 13
          Caption = 'Primera cuota en:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 305
          Top = 137
          Width = 83
          Height = 13
          Caption = 'Primera cuota en:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit24: TEdit
          Left = 86
          Top = 21
          Width = 72
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = Edit24KeyPress
        end
        object Edit27: TEdit
          Left = 86
          Top = 50
          Width = 72
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = Edit27KeyPress
        end
        object Edit30: TEdit
          Left = 386
          Top = 21
          Width = 91
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = Edit30KeyPress
        end
        object Edit31: TEdit
          Left = 519
          Top = 20
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = Edit31KeyPress
        end
        object Edit32: TEdit
          Left = 566
          Top = 21
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = Edit32KeyPress
        end
        object Edit33: TEdit
          Left = 386
          Top = 50
          Width = 91
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 5
          OnKeyPress = Edit33KeyPress
        end
        object Edit34: TEdit
          Left = 519
          Top = 50
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 6
          OnKeyPress = Edit34KeyPress
        end
        object Edit35: TEdit
          Left = 565
          Top = 50
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 7
          OnKeyPress = Edit35KeyPress
        end
        object Edit36: TEdit
          Left = 86
          Top = 80
          Width = 72
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 8
          OnKeyPress = Edit36KeyPress
        end
        object Edit39: TEdit
          Left = 386
          Top = 80
          Width = 91
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 9
          OnKeyPress = Edit39KeyPress
        end
        object Edit40: TEdit
          Left = 519
          Top = 80
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 10
          OnKeyPress = Edit40KeyPress
        end
        object Edit41: TEdit
          Left = 566
          Top = 79
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 11
          OnKeyPress = Edit41KeyPress
        end
        object Edit37: TEdit
          Left = 204
          Top = 80
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 12
          OnKeyPress = Edit37KeyPress
        end
        object Edit28: TEdit
          Left = 204
          Top = 50
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 13
          OnKeyPress = Edit28KeyPress
        end
        object Edit25: TEdit
          Left = 204
          Top = 21
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 14
          OnKeyPress = Edit25KeyPress
        end
        object Edit26: TEdit
          Left = 248
          Top = 21
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 15
          OnKeyPress = Edit26KeyPress
        end
        object Edit29: TEdit
          Left = 248
          Top = 50
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 16
          OnKeyPress = Edit29KeyPress
        end
        object Edit38: TEdit
          Left = 248
          Top = 80
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 17
          OnKeyPress = Edit38KeyPress
        end
        object Edit45: TEdit
          Left = 86
          Top = 108
          Width = 72
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 18
          OnKeyPress = Edit45KeyPress
        end
        object Edit46: TEdit
          Left = 204
          Top = 108
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 19
          OnKeyPress = Edit46KeyPress
        end
        object Edit47: TEdit
          Left = 249
          Top = 107
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 20
          OnKeyPress = Edit47KeyPress
        end
        object Edit48: TEdit
          Left = 387
          Top = 108
          Width = 90
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 21
          OnKeyPress = Edit48KeyPress
        end
        object Edit49: TEdit
          Left = 521
          Top = 108
          Width = 21
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 22
          OnKeyPress = Edit49KeyPress
        end
        object Edit50: TEdit
          Left = 566
          Top = 108
          Width = 23
          Height = 21
          Cursor = crIBeam
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 23
          OnKeyPress = Edit50KeyPress
        end
        object ComboBox1: TComboBox
          Left = 95
          Top = 134
          Width = 116
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 24
          Text = 'ENERO'
          Items.Strings = (
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
        end
        object SpinEdit1: TSpinEdit
          Left = 216
          Top = 134
          Width = 54
          Height = 22
          MaxValue = 2100
          MinValue = 2013
          TabOrder = 25
          Value = 2014
        end
        object ComboBox2: TComboBox
          Left = 393
          Top = 134
          Width = 134
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 26
          Text = 'ENERO'
          Items.Strings = (
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
        end
        object SpinEdit2: TSpinEdit
          Left = 534
          Top = 133
          Width = 54
          Height = 22
          MaxValue = 2100
          MinValue = 2013
          TabOrder = 27
          Value = 2014
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Cuotas generadas'
      ImageIndex = 2
      object gDetalle: TStringAlignGrid
        Left = 0
        Top = 0
        Width = 611
        Height = 164
        Align = alClient
        ColCount = 7
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ShowCellHints = False
        ColWidths = (
          64
          366
          90
          64
          64
          64
          64)
        Cells = (
          0
          0
          'C'#243'digo'
          1
          0
          'Descripcion'
          2
          0
          'Fecha'
          3
          0
          'Importe'
          4
          0
          'Codinq'
          5
          0
          'Clave'
          6
          0
          'Registro')
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
          3
          1
          0
          2
          0
          1
          2
          3
          1
          0
          3
          0
          1
          2
          3
          1
          0
          4
          0
          1
          2
          3
          1
          0
          5
          0
          1
          2
          0)
        PropCol = (
          0
          3
          1
          0
          1
          1
          1
          3
          1
          0
          2
          1
          2
          3
          1
          0
          3
          1
          0
          0
          4
          3
          1
          0
          5
          3
          1
          0)
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
  end
  object DataSource1: TDataSource
    Left = 632
    Top = 320
  end
  object aclLista: TActionList
    Left = 640
    Top = 24
    object aclModificar: TAction
    end
    object actGrabar: TAction
      Caption = 'Grabar'
      ImageIndex = 1
      OnExecute = actGrabarExecute
    end
    object actNuevo: TAction
      Caption = 'actNuevo'
      ImageIndex = 0
      OnExecute = actNuevoExecute
    end
    object actBorrar: TAction
      ImageIndex = 3
    end
    object actBuscar: TAction
      Caption = 'actBuscar'
      ImageIndex = 2
    end
  end
  object ActionList1: TActionList
    Left = 640
    Top = 24
    object Action1: TAction
      Caption = 'Action1'
    end
    object Action2: TAction
      Caption = 'Grabar'
      ImageIndex = 1
      OnExecute = actGrabarExecute
    end
    object Action3: TAction
      Caption = 'actNuevo'
      ImageIndex = 0
      OnExecute = actNuevoExecute
    end
    object Action4: TAction
      Caption = 'Action4'
      ImageIndex = 3
    end
    object Action5: TAction
      Caption = 'actBuscar'
      ImageIndex = 2
    end
  end
end
