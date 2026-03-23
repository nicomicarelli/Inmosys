object FGestionPropiedad: TFGestionPropiedad
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Archivos - Gesti'#243'n de la Propiedad'
  ClientHeight = 515
  ClientWidth = 758
  Color = clBtnFace
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcInmueble: TPageControl
    Left = 0
    Top = 78
    Width = 758
    Height = 407
    ActivePage = General
    Align = alClient
    TabOrder = 0
    object General: TTabSheet
      AlignWithMargins = True
      Caption = 'Datos del Inmueble'
      Highlighted = True
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblFechaInicio: TLabel
        Left = 24
        Top = 103
        Width = 72
        Height = 16
        Caption = 'Fecha inicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblFechaVencimiento: TLabel
        Left = 24
        Top = 129
        Width = 113
        Height = 16
        Caption = 'Fecha vencimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblFechadePago: TLabel
        Left = 24
        Top = 155
        Width = 93
        Height = 16
        Caption = 'Fecha de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTelefono: TLabel
        Left = 24
        Top = 54
        Width = 54
        Height = 16
        Caption = 'Tel'#233'fono'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblDireccion: TLabel
        Left = 24
        Top = 79
        Width = 89
        Height = 16
        Caption = 'Dir. Propietario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblLiquidacion: TLabel
        Left = 24
        Top = 180
        Width = 102
        Height = 16
        Caption = 'Liq. Automaticam'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblLiquida: TLabel
        Left = 220
        Top = 183
        Width = 109
        Height = 13
        Caption = 'C'#243'digo Propietario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 24
        Top = 30
        Width = 88
        Height = 16
        Caption = 'DNI Referente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 5
        Width = 62
        Height = 16
        Caption = 'Referente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 23
        Top = 206
        Width = 86
        Height = 16
        Caption = 'Raz'#243'n Social: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 0
        Top = 231
        Width = 744
        Height = 142
        Align = alBottom
        TabOrder = 0
      end
      object chkEntregarImpuestos: TCheckBox
        Left = 495
        Top = 6
        Width = 217
        Height = 17
        Caption = 'Entregar Comprobantes de Impuestos'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chTributa: TCheckBox
        Left = 495
        Top = 31
        Width = 170
        Height = 17
        Caption = 'Posee Dependencias'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object edReferente: TcxTextEdit
        Left = 163
        Top = 4
        Properties.ReadOnly = False
        TabOrder = 3
        OnKeyPress = edReferenteKeyPress
        Width = 310
      end
      object edtDNI: TcxTextEdit
        Left = 163
        Top = 29
        Properties.MaxLength = 8
        Properties.ReadOnly = False
        TabOrder = 4
        OnKeyPress = edtdniKeyPress
        Width = 310
      end
      object Edit5: TcxTextEdit
        Left = 163
        Top = 53
        Properties.ReadOnly = False
        TabOrder = 5
        OnKeyPress = Edit5KeyPress
        Width = 310
      end
      object Edit8: TcxTextEdit
        Left = 163
        Top = 78
        Properties.ReadOnly = False
        TabOrder = 6
        OnKeyPress = Edit8KeyPress
        Width = 310
      end
      object Edit7: TcxMaskEdit
        Left = 163
        Top = 102
        Properties.EditMask = '!99/99/0000;1;_'
        Properties.MaxLength = 0
        TabOrder = 7
        Text = '  /  /    '
        OnKeyPress = Edit7KeyPress
        Width = 79
      end
      object Edit6: TcxMaskEdit
        Left = 163
        Top = 128
        Properties.EditMask = '!99/99/0000;1;_'
        Properties.MaxLength = 0
        TabOrder = 8
        Text = '  /  /    '
        OnKeyPress = Edit6KeyPress
        Width = 79
      end
      object Combobox2: TcxTextEdit
        Left = 163
        Top = 154
        Hint = 'Ingrese 10, 15, 20, 25 o 30'
        ParentShowHint = False
        Properties.ReadOnly = False
        Properties.OnChange = Combobox2PropertiesChange
        ShowHint = True
        TabOrder = 9
        OnKeyPress = Combobox2KeyPress
        Width = 103
      end
      object Edit11: TcxTextEdit
        Left = 163
        Top = 179
        Hint = 
          #39'S/N/I   - S:Liq. Autom  - N: No Liq. Autom  -  I: Liq. solo Imp' +
          '.'#39
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 1
        Properties.ReadOnly = False
        Properties.OnChange = Edit11PropertiesChange
        ShowHint = True
        TabOrder = 10
        Width = 51
      end
      object cboRazonSocial: TcxComboBox
        Left = 163
        Top = 204
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Eduardo D. Garay'
          'Rodolfo F. Garay')
        StyleDisabled.BorderColor = clBtnFace
        StyleDisabled.TextColor = clBlack
        TabOrder = 11
        Text = 'Eduardo D. Garay'
        Width = 309
      end
    end
    object tbAutomatizacion: TTabSheet
      Caption = 'Automatizaci'#243'n'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label44: TLabel
        Left = 10
        Top = 4
        Width = 76
        Height = 16
        Caption = 'Bonificaci'#243'n:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 28
        Width = 128
        Height = 16
        Caption = 'Recupero de Gastos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 10
        Top = 52
        Width = 85
        Height = 16
        Caption = 'Com. Mensual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 236
        Top = 52
        Width = 78
        Height = 16
        Caption = '%      Importe:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 10
        Top = 76
        Width = 87
        Height = 16
        Caption = 'Com. Extraord.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label52: TLabel
        Left = 236
        Top = 76
        Width = 78
        Height = 16
        Caption = '%      Importe:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 267
        Top = 4
        Width = 60
        Height = 16
        Caption = 'Expensas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 208
        Width = 724
        Height = 166
        Caption = 'Planes de Pago '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label15: TLabel
          Left = 7
          Top = 34
          Width = 39
          Height = 16
          Caption = 'D.G.R:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 7
          Top = 81
          Width = 35
          Height = 16
          Caption = 'Agua:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 16
          Width = 78
          Height = 16
          Caption = 'Propietario'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 415
          Top = 17
          Width = 59
          Height = 16
          Caption = 'Inquilino'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 7
          Top = 57
          Width = 95
          Height = 16
          Caption = 'Tasa Municipal:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 215
          Top = 34
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 215
          Top = 57
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 215
          Top = 81
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 283
          Top = 34
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 283
          Top = 57
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 283
          Top = 81
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 6
          Top = 105
          Width = 80
          Height = 16
          Caption = 'Obras varias:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 215
          Top = 105
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 283
          Top = 105
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label58: TLabel
          Left = 7
          Top = 139
          Width = 86
          Height = 16
          Caption = 'Primera cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 379
          Top = 34
          Width = 39
          Height = 16
          Caption = 'D.G.R:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 379
          Top = 81
          Width = 35
          Height = 16
          Caption = 'Agua:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 379
          Top = 57
          Width = 95
          Height = 16
          Caption = 'Tasa Municipal:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 587
          Top = 34
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 587
          Top = 57
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 587
          Top = 81
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 655
          Top = 34
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 655
          Top = 57
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 655
          Top = 81
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 378
          Top = 105
          Width = 80
          Height = 16
          Caption = 'Obras varias:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label56: TLabel
          Left = 587
          Top = 105
          Width = 38
          Height = 16
          Caption = 'Cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 655
          Top = 105
          Width = 16
          Height = 16
          Caption = 'de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 379
          Top = 139
          Width = 86
          Height = 16
          Caption = 'Primera cuota:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit28: TcxTextEdit
          Left = 108
          Top = 29
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object Edit45: TcxTextEdit
          Left = 256
          Top = 29
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object Edit46: TcxTextEdit
          Left = 303
          Top = 29
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object Edit29: TcxTextEdit
          Left = 108
          Top = 54
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 3
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object Edit38: TcxTextEdit
          Left = 256
          Top = 54
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 4
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object Edit47: TcxTextEdit
          Left = 303
          Top = 54
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 5
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object Edit36: TcxTextEdit
          Left = 108
          Top = 79
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 6
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object Edit37: TcxTextEdit
          Left = 256
          Top = 79
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 7
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object Edit48: TcxTextEdit
          Left = 303
          Top = 79
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 8
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit1: TcxTextEdit
          Left = 108
          Top = 104
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 9
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object cxTextEdit2: TcxTextEdit
          Left = 256
          Top = 104
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 10
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit3: TcxTextEdit
          Left = 303
          Top = 104
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 11
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit4: TcxTextEdit
          Left = 480
          Top = 29
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 12
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object cxTextEdit5: TcxTextEdit
          Left = 628
          Top = 29
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 13
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit6: TcxTextEdit
          Left = 675
          Top = 29
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 14
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit7: TcxTextEdit
          Left = 480
          Top = 54
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 15
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object cxTextEdit8: TcxTextEdit
          Left = 628
          Top = 54
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 16
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit9: TcxTextEdit
          Left = 675
          Top = 54
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 17
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit10: TcxTextEdit
          Left = 480
          Top = 79
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 18
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object cxTextEdit11: TcxTextEdit
          Left = 628
          Top = 79
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 19
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit12: TcxTextEdit
          Left = 675
          Top = 79
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 20
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit13: TcxTextEdit
          Left = 480
          Top = 104
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 21
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 90
        end
        object cxTextEdit14: TcxTextEdit
          Left = 628
          Top = 104
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 22
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxTextEdit15: TcxTextEdit
          Left = 675
          Top = 104
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 23
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 23
        end
        object cxComboBox2: TcxComboBox
          Left = 109
          Top = 135
          Properties.DropDownListStyle = lsFixedList
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
          StyleDisabled.TextColor = clBlack
          TabOrder = 24
          Text = 'ENERO'
          Width = 155
        end
        object cxSpinEdit1: TcxSpinEdit
          Left = 273
          Top = 135
          Properties.MinValue = 2014.000000000000000000
          TabOrder = 25
          Value = 2014
          Width = 53
        end
        object cxComboBox3: TcxComboBox
          Left = 480
          Top = 135
          Properties.DropDownListStyle = lsFixedList
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
          StyleDisabled.TextColor = clBlack
          TabOrder = 26
          Text = 'ENERO'
          Width = 155
        end
        object cxSpinEdit2: TcxSpinEdit
          Left = 645
          Top = 135
          Properties.MinValue = 2014.000000000000000000
          TabOrder = 27
          Value = 2014
          Width = 53
        end
      end
      object CheckBox1: TCheckBox
        Left = 3
        Top = 423
        Width = 316
        Height = 17
        Caption = 'Tiene documentaci'#243'n en carpeta (Incluir nota recordatoria)'
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 10
        Top = 111
        Width = 140
        Height = 96
        ParentBackground = False
        TabOrder = 2
        object Label7: TLabel
          Left = 4
          Top = 3
          Width = 120
          Height = 16
          Caption = 'Aguas Cordobesas '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 15
          Top = 24
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
          Top = 46
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
          Top = 70
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
        object Edit13: TcxTextEdit
          Left = 36
          Top = 21
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit14: TcxTextEdit
          Left = 36
          Top = 45
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit15: TcxTextEdit
          Left = 36
          Top = 69
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
      end
      object Panel12: TPanel
        Left = 156
        Top = 111
        Width = 140
        Height = 96
        ParentBackground = False
        TabOrder = 3
        object Label33: TLabel
          Left = 7
          Top = 3
          Width = 92
          Height = 16
          Caption = 'Tasa Municipal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 15
          Top = 22
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
          Top = 46
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
          Top = 70
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
        object Edit16: TcxTextEdit
          Left = 36
          Top = 21
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit17: TcxTextEdit
          Left = 36
          Top = 45
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit18: TcxTextEdit
          Left = 36
          Top = 69
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
      end
      object Panel13: TPanel
        Left = 302
        Top = 111
        Width = 140
        Height = 96
        ParentBackground = False
        TabOrder = 4
        object Label10: TLabel
          Left = 7
          Top = 4
          Width = 45
          Height = 16
          Caption = 'D. G. R.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
        object Edit19: TcxTextEdit
          Left = 36
          Top = 21
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit20: TcxTextEdit
          Left = 36
          Top = 45
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit21: TcxTextEdit
          Left = 36
          Top = 69
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
      end
      object Panel14: TPanel
        Left = 448
        Top = 111
        Width = 140
        Height = 96
        ParentBackground = False
        TabOrder = 5
        object Label11: TLabel
          Left = 6
          Top = 3
          Width = 120
          Height = 16
          Caption = 'Expensas Comunes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
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
        object Edit22: TcxTextEdit
          Left = 36
          Top = 21
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit24: TcxTextEdit
          Left = 36
          Top = 45
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit25: TcxTextEdit
          Left = 36
          Top = 69
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
      end
      object Panel15: TPanel
        Left = 594
        Top = 111
        Width = 140
        Height = 96
        ParentBackground = False
        TabOrder = 6
        object Label12: TLabel
          Left = 7
          Top = 3
          Width = 33
          Height = 16
          Caption = 'I.T.S.I'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 15
          Top = 22
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
        object Edit26: TcxTextEdit
          Left = 36
          Top = 21
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 0
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
        object Edit27: TcxTextEdit
          Left = 36
          Top = 69
          Properties.ReadOnly = False
          Style.BorderColor = clHighlight
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 1
          OnExit = edCodigoExit
          OnKeyPress = edCodigoKeyPress
          Width = 83
        end
      end
      object Edit1: TcxTextEdit
        Left = 146
        Top = 3
        Properties.ReadOnly = False
        Style.BorderColor = clHighlight
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 7
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
        Width = 84
      end
      object Edit42: TcxTextEdit
        Left = 146
        Top = 27
        Properties.ReadOnly = False
        Style.BorderColor = clHighlight
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 8
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
        Width = 84
      end
      object Edit12: TcxTextEdit
        Left = 146
        Top = 51
        Properties.ReadOnly = False
        Style.BorderColor = clHighlight
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 9
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
        Width = 84
      end
      object Edit43: TcxTextEdit
        Left = 146
        Top = 75
        Properties.ReadOnly = False
        Style.BorderColor = clHighlight
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 10
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
        Width = 84
      end
      object Edit3: TcxTextEdit
        Left = 338
        Top = 51
        Properties.ReadOnly = False
        Style.BorderColor = clHighlight
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 11
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
        Width = 84
      end
      object Edit44: TcxTextEdit
        Left = 338
        Top = 75
        Properties.ReadOnly = False
        Style.BorderColor = clHighlight
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 12
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
        Width = 84
      end
      object Edit23: TcxComboBox
        Left = 338
        Top = 3
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'NO TIENE'
          'MES EN CURSO'
          'MES VENCIDO'
          'OTROS')
        StyleDisabled.BorderColor = clBtnFace
        StyleDisabled.TextColor = clBlack
        TabOrder = 13
        Width = 155
      end
      object cxComboBox1: TcxComboBox
        Left = 355
        Top = 112
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '4 Cuotas'
          '10 Cuotas'
          '12 Cuotas')
        StyleDisabled.BorderColor = clBtnFace
        StyleDisabled.TextColor = clBlack
        TabOrder = 14
        Text = '12 Cuotas'
        Width = 85
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Par'#225'metros de Escalonamiento'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label22: TLabel
        Left = 9
        Top = 3
        Width = 146
        Height = 16
        Caption = 'Contrato Escalonado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label50: TLabel
        Left = 369
        Top = 3
        Width = 152
        Height = 16
        Caption = 'Comisi'#243'n Escalonada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gDetalle: TStringAlignGrid
        Left = 3
        Top = 25
        Width = 306
        Height = 144
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 7
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ShowCellHints = False
        ColWidths = (
          100
          100
          100)
        Cells = (
          0
          0
          'Desde'
          1
          0
          'Hasta'
          2
          0
          'A Pagar')
        PropCell = (
          0
          0
          1
          2
          3
          1
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
          0)
        PropCol = (
          0
          1
          2
          3
          2
          0
          1
          1
          2
          3
          2
          0
          2
          1
          0
          3
          2
          0)
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
      object StringAlignGrid1: TStringAlignGrid
        Left = 369
        Top = 25
        Width = 306
        Height = 144
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 7
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ShowCellHints = False
        ColWidths = (
          100
          100
          100)
        Cells = (
          0
          0
          'Desde'
          1
          0
          'Hasta'
          2
          0
          'A Pagar')
        PropCell = (
          0
          0
          1
          2
          3
          1
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
          0)
        PropCol = (
          0
          1
          2
          3
          2
          0
          1
          1
          2
          3
          2
          0
          2
          1
          0
          3
          2
          0)
        PropRow = ()
        PropFixedCol = ()
        PropFixedRow = ()
      end
    end
    object tbNovedades: TTabSheet
      Caption = 'Novedades'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gNovedades: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 750
        Height = 379
        Cursor = crDefault
        Align = alClient
        ColCount = 3
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        GridLineColor = 15855083
        GridFixedLineColor = 13745060
        HoverRowCells = [hcNormal, hcSelected]
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        ControlLook.FixedGradientFrom = 16513526
        ControlLook.FixedGradientTo = 15260626
        ControlLook.FixedGradientHoverFrom = 15000287
        ControlLook.FixedGradientHoverTo = 14406605
        ControlLook.FixedGradientHoverMirrorFrom = 14406605
        ControlLook.FixedGradientHoverMirrorTo = 13813180
        ControlLook.FixedGradientHoverBorder = 12033927
        ControlLook.FixedGradientDownFrom = 14991773
        ControlLook.FixedGradientDownTo = 14991773
        ControlLook.FixedGradientDownMirrorFrom = 14991773
        ControlLook.FixedGradientDownMirrorTo = 14991773
        ControlLook.FixedGradientDownBorder = 14991773
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
        Filter = <>
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
        FixedColWidth = 140
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        Look = glOffice2007
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
        ScrollWidth = 21
        SearchFooter.Color = 16513526
        SearchFooter.ColorTo = clNone
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
        SelectionColor = 6210033
        SortSettings.DefaultFormat = ssAutomatic
        Version = '7.4.6.3'
        ColWidths = (
          140
          449
          80)
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 485
    Width = 758
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object btnGrabar: TBitBtn
      Left = 1
      Top = 1
      Width = 89
      Height = 29
      Action = actGrabar
      Caption = '&Grabar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnSalir: TBitBtn
      Left = 658
      Top = 0
      Width = 89
      Height = 29
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        42090000424D4209000000000000420000002800000018000000180000000100
        20000300000000090000120B0000120B000000000000000000000000FF0000FF
        0000FF000000CCCCCC00CCCCCC00A2B9D300438AE100126CE400025EE200025E
        E200126CE400438AE100A1B8D300CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00C8C8C8007CA5D500156FE400117AEE0030A3FB0042B5FE0044B7
        FE0033A8FC001682F100136EE40076A0D200BFBFBF00BEBEBE00BEBEBE00BFBF
        BF00BFBFBF00BFBFBF00C1C1C100C2C2C200C4C4C400C9C9C900CACACA00CACA
        CA00CACACA00A1B6CD001873E6001883F100349FF5003EADFA0044B5FD0045B8
        FD0045B7FD0041B1FB002493F6000E68DE00677E9A0082828200848484008686
        860086868600878787008C8C8C009A9A9A00B1B1B100C2C2C200CACACA00CCCC
        CC00CCCCCC00589AE2000972ED00187AEA00278FF10036A3F70031A6FD00BBD1
        E40053AEF5003DA7F7002E98F300127BEE001D63B9005A5A5A005B5B5B006060
        600060606000626262006C6C6C0089898900AAAAAA00C1C1C100CACACA00CCCC
        CC00CCCCCC002D8AED000879F1000B7CF3001B90F800289EFC001C98FE00DEDE
        DE00DEDEDE00B1CDE5004AA0F000197EED002274DC00FEC27C00FEC37D00FEC4
        8000FEC47E00FDC58100FDC48000FCC07B00BCBCBC00C7C7C700CCCCCC00CCCC
        CC00CCCCCC000E83F7000284FE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
        DE00DEDEDE00DEDEDE00DEDEDE0097BFE600087CF600FFFEF600FFFDF600FFFD
        F500FFFCF400FFFBF200FFF7EC00FCBD7500CACACA00CCCCCC00CCCCCC00CACA
        CA00CACACA001087F9000486FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00BFE0FF000584FC00FFF6D000FFF6D000FFF4
        CC00FEF0C600FEE9BC00FFF7EC00FCB56600CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC003897F0001290FD001A98FE0025A1FE0030A9FF0038AFFF00FFFF
        FF00FFFFFF00D8EEFF0064BAFF00299BFC003A9BF000FFF1C800FEF0C700FEEE
        C300FEEABD00FEE4B300FFF6E900FCAA5600CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC0072ACE2000C8EFE005DCDFD0062D1FE006AD7FE005CCCFE00E9F7
        FF007BCDFF0052BBFF0051C2FE001A94FC008EBBD800FEEABC00FEE9BC00FEE7
        B800FEE3B000FEDCA700FFF4E600FB9F4400CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00B6C4D2003E9AEF0029A4FE007FE9FF0088EEFD007EE3FC0057C5
        FE006FD6FC007EE9FF0034ADFE004E9FE300E2D5B400FEE2AE00FEE1AD00FEDE
        A800FDD8A100FDD49900FFF1E100FA943500CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC009FBCD7003E9AEF001494FF006CD4FC00A0F2F700A8F4
        F50080DBF8001A99FF004D9ADB00C6C0AB00FED59A00FED69C00EECEA000CDBE
        A700B4B1AD00CBB9A100EDE0D100FA8B2700CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00B6C4D20072ACE2003A98F100108AFB001283
        EE0048A1F4008DA4B200E1BB8900FDC68200FDC98700FDCB8900D4C1A800D1D1
        D100E9E9E900CFCFCF00D1C9C000FB851D00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD81
        1300FEE8D100FDB56800FDB66800FDBA6F00FDBD7400FDBE7700C7C4BF00EBEB
        EB00F0F0F000EAEAEA00C5C3C100FB821800CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD80
        1200FEE1C400FDAC5A00FDAA5600FDAF5C00FDB15F00FDB26100DABEA000D8D8
        D800EBEBEB00D8D8D800DACDC000FC801400CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD7F
        1100FED9B500FDA34D00FDA04500FDA34A00FDA64F00FDA64F00F1AD6800DAB9
        9800C9C4BE00DABA9A00F2CFAF00FC7F1200CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD7F
        1000FECEA300FD9C4100FD973700FD9A3A00FD9C3E00FD9B3E00FD9B3C00FD9A
        3B00FD993700FD9E4500FECA9C00FC7E1100CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD80
        1000FEC49000FD963600FD902B00187DE5002397F90040B4FE0047BBFE0037AA
        FB002689E800FD993C00FEC59200FC7E1100CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD80
        1000FEBC8000FD922F00FD8B22001667D700B9ECFF007BE5FE007DE7FE00BCEF
        FF001B6ED800FD943300FEC28B00FC7E1100CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD80
        1000FEB77600FD8E2900FD871B00125DD200B2E7FF00B7ECFF00B8ECFF00B3E8
        FF001460D200FD913000FEBE8400FC7E1100CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD80
        1000FEB47000FD8A2200FD8C24002662C300075ADA000F5ED6000F5FD600085B
        DA002361C500FD8C2600FEBB7F00FC7E1100CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FD80
        1000FEAF6800FEBB7E00FEC59100FECDA100FED3AC00FED6B100FED3AC00FECE
        A200FEC79500FEC08700FEB37100FC7E1100CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00FC7F
        1200FD801000FD801000FD801000FD801000FD801000FD801000FD801000FD7F
        1000FD7F1000FD7F1000FD7F1100FB7C1300CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
        CC00CCCCCC00}
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblInquilino: TLabel
      Left = 7
      Top = 8
      Width = 63
      Height = 16
      Caption = 'Inquilino:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPropietario: TLabel
      Left = 7
      Top = 31
      Width = 69
      Height = 16
      Caption = 'Propietario:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblAlquilerInicial: TLabel
      Left = 480
      Top = 8
      Width = 66
      Height = 16
      Caption = 'Alquiler $'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUbicacion: TLabel
      Left = 7
      Top = 54
      Width = 58
      Height = 16
      Caption = 'Inmueble:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblContratoVencido1: TLabel
      Left = 460
      Top = 41
      Width = 295
      Height = 37
      Caption = 'C'#243'digo Propietario:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object edCodigo: TcxTextEdit
      Left = 91
      Top = 7
      Properties.ReadOnly = False
      Style.BorderColor = clHighlight
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 0
      OnExit = edCodigoExit
      OnKeyPress = edCodigoKeyPress
      Width = 51
    end
    object Edit2: TcxTextEdit
      Left = 146
      Top = 7
      Properties.ReadOnly = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
      Width = 310
    end
    object chActivo: TCheckBox
      Left = 632
      Top = 9
      Width = 57
      Height = 17
      Caption = 'Activo'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object Edit4: TcxTextEdit
      Left = 146
      Top = 30
      Properties.ReadOnly = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 2
      OnKeyPress = Edit4KeyPress
      Width = 310
    end
    object Edit10: TcxTextEdit
      Left = 548
      Top = 7
      Properties.ReadOnly = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 4
      OnKeyPress = Edit10KeyPress
      Width = 60
    end
    object Edit9: TcxTextEdit
      Left = 146
      Top = 53
      Properties.ReadOnly = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 3
      OnKeyPress = Edit9KeyPress
      Width = 310
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.ibqGrillaAzul
    Left = 680
    Top = 112
  end
  object DataSource2: TDataSource
    DataSet = DM.ibqConsulta
    Left = 544
    Top = 120
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 592
    Top = 112
    Bitmap = {
      494C010105000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F2F2F200E7E7E700E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E6E6E600EEEE
      EE00FBFBFB000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F5F5F500CECE
      CE0092929F00727494006F7191006F7191007072910070729100707291007072
      9100707291006F7191006F7191006E7091006E7091006E6F91006D6E91006C6D
      91006B6C91006A6B91006A6A91006969910069698F0069698E0069698E008585
      9600BFBFBF00EFEFEF0000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000F8F8F800B9B9BB005456
      A7004B4FDE005254E1005154E0005254E3005255E4005255E6005255E7005255
      EA005255EB005254ED005154EF005053F0005052F2005052F4005153F4005255
      F4005357F5005458F5005559F600575BF600585DF4005A60F3005C62F3005055
      E7004647A8009C9CA500F0F0F000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000D4D4D5004A4BB5004546
      E6002121C1000908BC000706C0000706C4000706C7000706CA000706CE000706
      D2000706D5000706D9000706DD000707E0000707E3000909E6000D0FE7001216
      E800161BE9001B21EA002028EB00242DEC002732ED002B37EF002F3CEF004250
      F400606CFF004143BA00B3B3B800FDFDFD000000000000000000000000000000
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
      000000000000000000000000000000000000FDFDFD008484AE002F30E0000807
      B2000000B5000000BA000000BE000000C2000000C5000000C8000000CC000000
      D0000000D2000000D5000000D9000000DC000000DF000000E2000000E4000509
      E5000E13E700131AE8001720E9001B25EA001E29EA00232FEC002734ED002939
      ED003043F100515FFC005D5E9E00F0F0F0000000000000000000000000000000
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
      000000000000000000000000000000000000F3F3F3005050B7000E0EC2000000
      B1000000B7000000BA000000BE000000C1000000C4000000C8000000CB000000
      CD000A0AD5003A3AE0006565E9007C7CEE008080F0006E6EF0004C4DEC001D21
      E800060CE6000C13E7001921E9001D27EA00202BEA002430EC002937ED002D3C
      EE003040EF003D50F9003C42C100D9D9DA000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED003B3BAD000101B7000000
      B2000000B6000000BA000000BE000000C1000000C4000000C6001515CF007E7E
      E700D8D8F900FCFCFF000000000000000000000000000000000000000000E6E7
      FD009C9FF6003A3FEC000F17E8001C26EA00202BEA002431EC002937ED002D3C
      EE003142EF00394DF8002B36CB00D3D3D4000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED003737A7000000B6000000
      B2000000B6000000B9000000BD000000C1000000C0003333D200D9D9F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F1F2FE006C71F1000E18E9001E29EA002431EC002836ED002D3C
      EE003142EF00394DF8002832C500D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED003737A4000000B5000000
      B1000000B4000000B9000000BC000000BD003131CE00DDDDF800000000000000
      000000000000FFFFFE00E4E4F600C2C2EF00BFBFF000DADAF600FCFCFD000000
      00000000000000000000F8F8FE00686EF100111DE900232FEC002836ED002C3B
      EE003141EF00394BF7002831C200D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED003737A1000000B2000000
      B0000000B4000000B7000000B8004040CE00ECECFA0000000000000000000000
      0000BDBDEC004E4ED6001010D0000202D5000101D9000909DA003A3ADF00A0A1
      EB00FEFEFD000000000000000000F9F9FF00777EF3001925EB002634ED002B3A
      EE002F40EF00374AF7002730BE00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037379D000303B1000505
      B1000606B4000202B6001414BF00D7D7F5000000000000000000FFFFFE008686
      DD000202C7000000D0000000D8000000DB000000DE000000E2000000E3000000
      DE005F61E300F5F5FB000000000000000000FAFAFE004D56EF001D2AEB002A38
      ED002E3EEE003648F600262FB900D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373799000909B0001111
      B3001212B6000606B7007676D900000000000000000000000000A5A5E3000505
      C6000707D1000303D3000000D5000000D9000000DC000000E0000101E3000304
      E5000000E2006D6FE500FFFFFE000000000000000000B2B6F8001C28EB002735
      ED002D3CEE003345F500242EB500D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373796000C0CAE001818
      B4001616B7001919BB00C8C8EF000000000000000000EBEBF7003535CB001C1C
      D0002424D4002222D7001B1BD8001010DA000606DB000000DE000000E1000303
      E4000507E600080CE100C1C2F2000000000000000000F2F2FE003842ED00202E
      EC002A38EE003041F300232CB300D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373792001010AC002020
      B5001C1CB7003434C200F2F2FB000000000000000000AEAEE7001E1EC9002929
      D0002B2BD4002D2DD7002F2FDA003030DD002E2EE0002222E1000F0FE2000000
      E3000203E4000000E4006E70EB000000000000000000000000006168F1001824
      EA002734ED002C3BF0002129B100D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037378E001616AB002828
      B6002020B6005252C900FBFBFE0000000000000000008D8DE0002121C8003131
      D0003333D3003434D7003535DA003636DD003939E0003B3BE2003B3BE6002D2D
      E6001213E6000000E4004345EA00FDFDFF000000000000000000797FF300111C
      E900232FEC002835EE001F26B000D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037378B001A1AAA002F2F
      B7002727B8005959C900FBFBFE0000000000000000008D8DE1002929C9003838
      D0003939D3003B3BD6003A3AD9003535DA003737DD003E3EE1004242E4004646
      E8004545EA002425E8003E40EB00FBFBFF0000000000000000007A7FF1000D16
      E8001F2AEC002430EB001C23AE00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373789001D1DA9003535
      B7002F2FB8005050C400F9F9FD000000000000000000A0A0E6003030C9003D3D
      D0003F3FD3003F3FD6004444D9007575E5007676E7004848E1004646E3004949
      E6004B4BE9004545EB007979F100FDFDFF000000000000000000696DEE000B13
      E8001B24EB001F2AE9001A20AD00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373785002222A7003D3D
      B9003939BA004444BF00E6E6F4000000000000000000D4D4F3004242CC004343
      CF004646D2004242D400A6A6EC000000000000000000ABABF1004949E1005050
      E5005151E6004848E800B5B5F6000000000000000000FCFCFE003F42E7000910
      E700161DE9001922E800171CAC00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373782002626A6004545
      BA004242BB003C3CBB00B4B4E0000000000000000000FEFEFF008383DC004141
      CC004C4CD1004F4FD400D3D3F5000000000000000000DCDCF9005858E1005656
      E3005252E5006E6EEB00F1F1FD000000000000000000DEDEF6001315E200060A
      E6000F14E8001319E6001518AA00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED00373781002B2BA5004D4D
      BA004B4BBC004545BD007171C700FCFCFD000000000000000000EAEAF9006D6D
      D6004B4BCF005656D400D1D1F4000000000000000000DBDBF8005F5FE0005757
      E0006363E500D3D3F800000000000000000000000000AAAAEA004344EA00080A
      E5000508E7000B0EE4001012A900D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037377F002F2FA4005454
      BC005252BC005353BF004D4DBC00B7B7DD00000000000000000000000000EAEA
      F9007D7DDA005959D200D2D2F3000000000000000000DCDCF8006363DE007A7A
      E400D8D8F700000000000000000000000000DEDEF0007070E3007474EF004E4E
      EB000303E4000102E1000C0CA800D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037377E003333A4005D5D
      BD005959BD005B5BC0005959C2005F5FBD00C2C2DD0000000000000000000000
      0000D1D1F2006161D200D4D4F3000000000000000000DCDCF7007272DF00E6E6
      FA00000000000000000000000000DBDBEE007B7BD9007171E9007777EA007F7F
      EC004545E7000000DC000A0AA400D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037377E003A3AA6006565
      BE006161BE006262C0006464C3006161C4005F5FBD00B7B7D900FDFDFC00FFFF
      FE00B1B1DF006767D000D6D6F3000000000000000000DEDEF7007A7ADC00F1F1
      FA000000000000000000D5D5E9007E7ED8007676E5007D7DE8007E7EE8008181
      E9008585EB002E2EDD000A0A9F00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037377C004343A9006B6B
      BF006868BE006969C1006A6AC3006C6CC6006B6BC8006767C2008888BF008C8C
      BF006D6DC8007272D200D8D8F3000000000000000000E1E1F7007777D9009595
      D000DCDCE800B4B4D7007878D2007D7DE3008282E4008383E5008585E5008686
      E7008D8DE9007575E7000F0F9C00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0037377D004E4EAD007171
      BF006D6DBF006F6FC1007070C3007171C6007272C8007474CB006D6DC7006D6D
      C8007676D0007878D100DADAF3000000000000000000E2E2F7008282DC007878
      D4007979C9007979D2008484E1008787E2008888E2008989E3008B8BE4008C8C
      E4009090E6008A8AE80018189A00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EDEDED0039397D006060B5007676
      BF007474BF007575C2007777C4007979C6007979C8007B7BCA007D7DCD007E7E
      CF007E7ECF008080D100DEDEF4000000000000000000E6E6F7008989DA008787
      DC008A8ADE008C8CDF008D8DDF008E8EE0009090E0009191E2009292E2009393
      E3009696E3009494E6002B2B9E00D4D4D5000000000000000000000000000000
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
      000000000000000000000000000000000000EFEFEF00434382007474BD007C7C
      BF007C7CC1007D7DC3007E7EC5008080C7008181C9008383CA008484CC008585
      CE008686CF008585D000D9D9EF000000000000000000DDDDF0008D8DD7008F8F
      DA009292DB009393DC009494DD009696DE009797DF009898DF009A9AE0009B9B
      E0009D9DE1009E9EE4004646A700D6D6D7000000000000000000000000000000
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
      000000000000000000000000000000000000F9F9F900626295008484C5008282
      C0008383C2008585C4008686C6008787C8008989C9008A8ACB008B8BCD008D8D
      CE008E8ED0008D8DD1009C9CCF00CECEDF00CFCFDF00A0A0D1009393D8009797
      DA009999DB009B9BDB009C9CDC009D9DDD009E9EDE009F9FDE00A1A1DF00A2A2
      DF00A3A3DE00B0B0E7007979B900E4E4E4000000000000000000000000000000
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
      000000000000000000000000000000000000000000009494AC009090CE008D8D
      C2008888C2008B8BC5008D8DC7008E8EC8009090CA009191CC009292CD009393
      CF009494D1009696D2009494D2009090CA009191CC009797D5009D9DD8009E9E
      D9009F9FDA00A1A1DB00A3A3DB00A4A4DC00A5A5DC00A6A6DD00A7A7DD00A8A8
      DD00A9A9DC00CFCFF4008B8BAF00FBFBFB000000000000000000000000000000
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
      00000000000000000000000000000000000000000000ECECED007676AE00B6B6
      DF00A0A0CC009696C7009797C9009898CA009A9ACC009B9BCD009C9CCF009E9E
      D1009F9FD200A0A0D400A2A2D500A3A3D700A4A4D800A6A6D900A7A7D900A9A9
      DA00AAAADB00ABABDC00ADADDD00AFAFDD00AFAFDD00B0B0DD00B1B1DD00BCBC
      E100E4E4F800AFAFD800CCCCD100000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000DBDBDF008282
      B200B5B5E100C8C8EB00C9C9EB00CBCBED00CDCDEE00CFCFF000D1D1F100D3D3
      F300D5D5F400D7D7F500D9D9F700DBDBF800DCDCF900DEDEFA00E0E0FB00E2E2
      FC00E4E4FC00E5E5FD00E7E7FE00E8E8FE00EFEFFF00F0F0FF00F3F3FF00EBEB
      FF00A6A6CD00BDBDC70000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00BABAC6009E9EB100A1A1B000A1A1B000A1A1B000A2A2B100A2A2B100A3A3
      B100A3A3B200A4A4B200A4A4B200A4A4B200A5A5B200A5A5B300A6A6B300A6A6
      B300A6A6B300A7A7B300A7A7B300A7A7B300B2B2B800B2B2B800B0B0B800A6A6
      B700E7E7E9000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F5F5F500BEBE
      BE00B0B0B000B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B1B1
      B100B1B1B100B1B1B100B1B1B100B1B1B100B1B1B100B1B1B100B1B1B100B1B1
      B100B1B1B100B1B1B100B1B1B100B1B1B100B1B1B100B1B1B100B0B0B000B6B6
      B600ECECEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00E0E0E000D5D5
      D500D6D6D600D6D6D600D6D6D600D5D5D500CDCDCD00B9B9B900A0A0A0009797
      97009B9B9A00ADADAD00C8C8C800D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D4D4D400C4C4C400ADADAD009C9C9C0097979700ACAC
      AC00D9D9D900FBFBFB000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FBFBFB00F7F7F700F2F2F200EFEFEF00ECECEC00E8E8E800DCDC
      DC00D0D0D000C7C7C700C3C3C300C2C2C200C2C2C200C5C5C500CDCDCD00D7D7
      D700E5E5E500ECECEC00EFEFEF00F2F2F200F6F6F600FAFAFA00FDFDFD000000
      0000000000000000000000000000000000000000000000000000C0C0C000B2B2
      B200C7C7C700C2C2C200C0C0C000C0C0C000BEBEBE00BCBCBC00BBBBBB00BABA
      BA00B8B8B800B7B7B700B5B5B500B4B4B400B3B3B300B1B1B100B0B0B000AEAE
      AE00ADADAD00ACACAC00ABABAB00AAAAAA00A9A9A900A7A7A700A8A8A8009C9C
      9C00A2A2A2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCCCCC0092929200A1A1
      A1009E9E9E009D9D9D009E9E9E0087878700545353003A3936002C2A25002725
      23002C2A25003A3934004F4F4E007B7B7B0092929200909090008F8F8F008E8E
      8E008D8D8D008C8C8C006E6E6E00494948003A3834002B292500262523002E2C
      280052504F0097979700F0F0F000000000000000000000000000FEFEFE00FBFB
      FB00F5F5F500EAEAEA00E1E1E100D7D7D700B7B7B70096959500878686008C8A
      8A0098969600A5A4A400AAA9A900AAAAAA00AAAAAA00ABABAB00A1A1A1009796
      96008C8B8B008E8D8D00A7A7A700CDCDCD00E2E2E200E7E7E700F3F3F300FAFA
      FA00FEFEFE000000000000000000000000000000000000000000B6B6B600F4F4
      F400EEEEEE00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800EAEAEA00EAEA
      EA00A0A0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500F8F8F800F8F8
      F800F3F3F300F5F5F500E5E5E5007F7E7E002F2C26001D222E0042526E006072
      8F005062850027314B0034333100807F7E00DBDCDC00EEEEEE00ECECEC00ECEC
      EC00EEEEEE00CECECE006C6C69002B2C2C0027324E00566684006C7A9100505D
      7300232933002D2B26008B8B8B00FBFBFB000000000000000000FDFDFD00F7F7
      F700E9E9E900DBDBDB00C0C0C0006C6A6A00726B6B00B8B0B000E2DDDD00F4F0
      F000FFFEFE000000000000000000000000000000000000000000000000000000
      0000F8F7F700DCD8D800B1AAAA00797474009C9B9B00D9D9D900E6E6E600F4F4
      F400FCFCFC000000000000000000000000000000000000000000B7B7B700EDED
      ED00E5E5E500E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E4E4E400E8E8
      E8009F9F9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B7B700EEEEEE00E4E4
      E400E2E2E200E7E7E700A3A2A20022211E00172E62005C83E1007DA9FF007AAA
      FF0077A3FF00648DFB002239810034343200A6A6A500E4E4E400E4E4E400E4E4
      E400E6E6E6009493920026282C00334EA20082A5FF008EB5FF008FBAFF008EB6
      FF006D92EB0022335A0035332F00CFCFCF000000000000000000FDFDFD00F8F8
      F800ECECEC00E7E7E7008D8B8B00595252009D969600D5CFCF00E3E0E000E1DE
      DE00E7E5E500F2F2F200EDEDED00D3D3D300E4E4E400E9E9E900D5D4D400F0EE
      EE00F2EFEF00E6E2E200DCD4D400AA9F9F0055505000D5D5D500EAEAEA00F5F5
      F500FCFCFC000000000000000000000000000000000000000000B7B7B700EEEE
      EE00E8E8E800E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E8E8E800EBEB
      EB00A0A0A0000000000000000000000000000000000000000000000000000000
      0000F3F3F300EBEBEB00ECECEC00ECECEC00EAEAEA00E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E7E7E700EBEBEB00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00EDEDED00F7F7F7000000000000000000B7B7B700EEEEEE00E7E7
      E700E6E6E600ECECEC007C7973000C1C4200366CF5003C71FF002B5FF5002F63
      F4003364F5002B5AFA00284FF4001C2651008B898200E5E5E500E6E6E600E6E6
      E600E6E6E60075736A00182A6E004873FF004876FF00376EFF004278FF004478
      FF00457EFF003570E60019223500A8A7A600000000000000000000000000FDFD
      FD00F8F8F800FEFEFE0095939300817C7C00B5B2B200CBC4C500CFC5C500C2BE
      BE00D0D1D100ECECEC00F9F9F900F1F1F100D9D9D900CFCECF00A9A8A800817E
      7E00ABA4A400B7B0B000BDB3B300A59A9A005E585800E8E8E800F9F9F900FCFC
      FC00000000000000000000000000000000000000000000000000B7B7B700EFEF
      EF00EAEAEA00E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E9E9E900EDED
      ED00A1A1A1000000000000000000000000000000000000000000FCFCFC00BEBE
      BE006A6A6A0062626200686868006D6D6D008686860091919100929292008F8F
      8F008D8D8D008A8A8A00888888008585850083838300818181007F7F7F007C7C
      7C00797979007777770075757500686868005C5C5C0059595900555555005151
      51004D4D4D00474747007D7D7D00EDEDED0000000000B7B7B700EFEFEF00EAEA
      EA00E9E9E900F1F1F1007C796F00071D5E00174BF700194AF4001D46F200264D
      F2002D52F3001A40F5000425E8001B245F008B898000E8E8E800E9E9E900EAEA
      EA00E8E8E80075736800182A7E00264FFF002351FF002C5CFF003665FF003C6A
      FF00245EFF001157FC0014264E00A8A7A5000000000000000000000000000000
      0000FEFEFE0000000000A5A3A300CBC9C900D6D4D100DBC7C200D9C3C000C6BB
      BA00D4D2D300F1F0F100000000000000000000000000E0DFE000DFE0DF00B4B4
      B50086858500A6A3A3009E99990090878700746E6E00F6F6F600000000000000
      0000000000000000000000000000000000000000000000000000B7B7B700EFEF
      EF00EAEAEA00E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E9E9E900EEEE
      EE00A2A2A20000000000000000000000000000000000F4F4F4009B9B9B004545
      45006A6A6A007B7B7B008080800096969600F3F3F30000000000FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00F7F7F700F5F5F500F3F3F300F2F2F200EFEFEF00EDED
      ED00EBEBEB00E8E8E800E8E8E800BEBEBE008C8C8C008A8A8A00858585008181
      81007D7D7D007A7A7A0042424200C6C6C60000000000B7B7B700EFEFEF00EAEA
      EA00E8E8E800EFEFEF00AFAEAB00181C2D000B259D001C3BDF00213AEA002840
      ED003047ED001329DB0001108B002A2B310094939100E8E8E800E9E9E900E9E9
      E900E8E8E80081817D0024273A00283EB8002C4DF2003154FD00395DFF003F62
      FF001442F100002295002C2E3200D0D0CF000000000000000000000000000000
      00000000000000000000A7A5A500BFBDBD00DBDED700DED5CE00DCC9C200C3AC
      A900B9B3B200C4C8C500E3E7E400FAFAFA00FBF7FB009BCA9B00CED3CE00FDF9
      FD00D0D1D100BCBCBC00E8E8E800E5E5E50088868600F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000B7B7B700F0F0
      F000EBEBEB00E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900EAEAEA00F1F1
      F100A4A4A400000000000000000000000000F6F6F60080808000383838006565
      65006666660062626200606060006D6D6D00D3D3D300C9C9C9007E7E7E007676
      760073737300B7B7B700D8D8D800D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D7D7D700D9D9D900E0E0E000AFAFAF00676767006C6C6C006E6E6E006F6F
      6F006F6F6F007474740068686800C6C6C60000000000B7B7B700F0F0F000EBEB
      EB00E9E9E900ECECEC00D8D8D8006A6A660022242C00141B590018218900222B
      9D001B248E000C125F002E2E37002C2B270095959500EDEDED00EAEAEA00EAEA
      EA00EDEDED00818181002C2B260034364400293474002E3D9F003647B0002030
      9A0002105E002F3138007B7A7700F3F3F3000000000000000000000000000000
      00000000000000000000A3A1A100CBC9CB00DAE2E800DDE3E500D3CECD008F8B
      7C003C8438002A8F2B0037A13700B6CBB600B8D2B8002B9D2B005FA160009CBF
      9C0000000000D9D9D900CBCBCB00F4F4F400908E8E00FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F1F1
      F100ECECEC00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EBEBEB00F3F3
      F300A5A5A500000000000000000000000000DEDEDE00404040005C5C5C005757
      57005353530053535300515151005B5B5B00CACACA00B8B8B800454545003A3A
      3A003535350091919100D4D4D400CFCFCF00D1D1D100D3D3D300D3D3D300D1D1
      D100CBCBCB00CACACA00D5D5D500969696004D4D4D0054545400535353005353
      530052525200545454004C4C4C00DBDBDB0000000000B8B8B800F1F1F100ECEC
      EC00EAEAEA00EBEBEB00E8E8E800969697006F6F6C005C5C5500515152005858
      5B005252540042423B00262522000E0E0E00B0B0B000EFEFEF00EAEAEA00EAEA
      EA00F2F2F20097979700070708002C2B28003F3E3700525252005B5B5D005051
      53005C5A54007A7A76009B9B9B00000000000000000000000000000000000000
      00000000000000000000A09F9F00D2D2D400E3E5F000E8EAF300D2D2DE005188
      56000B7E0B000F8F0F001099100090A990005DA95E000B910B00047903001772
      1700CDDECD0000000000EBEBEB00D4D4D40086838300FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F2F2
      F200EEEEEE00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00EDEDED00F6F6
      F600A6A6A600000000000000000000000000DFDFDF004B4B4B004E4E4E004A4A
      4A004A4A4A004B4B4B00484848004A4A4A00B9B9B900B9B9B900454545003F3F
      3F003B3B3B0096969600D8D8D800D3D3D300D6D6D600D9D9D900DDDDDD00E0E0
      E000DFDFDF00D4D4D400D3D3D300868686003D3D3D0050505000555555005151
      51004A4A4A004D4D4D0050505000EAEAEA0000000000B8B8B800F2F2F200EEEE
      EE00ECECEC00ECECEC00F1F1F100BFBFBF006161610058585800636361008787
      850065666300121211000000000025252500C6C6C600F3F3F300EDEDED00ECEC
      EC00F5F5F500B1B1B10016161600000000000C0C0C005A595800898987006666
      65005A5A5A0066666600D9D9D900000000000000000000000000000000000000
      00000000000000000000A09F9F00D5D4D500F0F0F400F9F7FC00CCD6D3002479
      27003D923D0055A8550051AD510095A4960082A1910022942A005FA36800327C
      3600558E5400F8F7F800FAFAFB00E2E1E10085828200FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F2F2
      F200F0F0F000EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000EFEFEF00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EFEFEF00F8F8
      F800A7A7A700000000000000000000000000EAEAEA004B4B4B00444444004141
      410041414100414141003333330037373700ACACAC00BFBFBF00494949004141
      41003F3F3F0098989800DCDCDC00D7D7D700DADADA00DDDDDD00E0E0E000E3E3
      E300E7E7E700EAEAEA00E3E3E3007F7F7F003B3B3B0046464600505050004D4D
      4D00404040004545450059595900F6F6F60000000000B8B8B800F2F2F200EFEF
      EF00EEEEEE00EFEFEF00F6F6F6009C9C9C004B4B4B005B5B5B004E4E4E006D6D
      6D006363630018181800000000002F2F2F009B9B9B00DBDBDB00EFEFEF00F0F0
      F000E2E2E20093939300232323000000000013131300595959006F6F6F004F4F
      4F005B5B5B004A4A4A00BBBBBB00000000000000000000000000000000000000
      00000000000000000000A4A3A300D5D4D400F8F8F8000000000091B891000667
      06005B9D5B00C8CFC800B8B8B7009F9C9B00A2A6B40073A78B00C2D1D5004087
      450013611200A3BAA300FCF9FD00F1F0F0008B888800FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F3F3
      F300F4F4F400F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000FAFA
      FA00A8A8A800000000000000000000000000F5F5F500535353003B3B3B003838
      3800383838002F2F2F002525250030303000A4A4A400C8C8C8004F4F4F004343
      4300414141009D9D9D00E1E1E100DCDCDC00DFDFDF00E2E2E200E5E5E500E7E7
      E700EAEAEA00EFEFEF00F5F5F5007F7F7F00424242004A4A4A004B4B4B004242
      4200373737003B3B3B00686868000000000000000000B8B8B800F3F3F300F4F4
      F400F2F2F200F3F3F300FBFBFB00AFAFAF002626260059595900515151006D6D
      6D007B7B7B002F2F2F0001010100212121001010100064646400E6E6E600EEEE
      EE0079797900151515001D1D1D00010101002A2A2A006D6D6D00666666005050
      50005C5C5C0030303000CBCBCB00000000000000000000000000000000000000
      00000000000000000000AAA9A900D7D5D500FCFCFD000000000079AB79000F6F
      0F00137E130053935200A79A9A00AF979100AB999100ABABAA0079B17F001775
      1700115D1100799B790000000000FCFBFB008F8C8C00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F4F4
      F400F6F6F600F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F3F3
      F300F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F2F2F200FDFD
      FD00A9A9A900000000000000000000000000FCFCFC005C5C5C00343434003232
      32002C2C2C0025252500202020002B2B2B0098989800DADADA00B6B6B600AAAA
      AA00AEAEAE00D1D1D100DFDFDF00E0E0E000E3E3E300E4E4E400E8E8E800EBEB
      EB00EDEDED00F3F3F300EEEEEE0075757500494949004F4F4F00515151003838
      38002E2E2E0033333300777777000000000000000000B8B8B800F4F4F400F5F5
      F500F3F3F300F3F3F300F6F6F600E7E7E70049494900353535004F4F4F007979
      7900969696004141410004040400070707000000000009090900B9B9B900CFCF
      CF00171717000000000006060600060606003B3B3B007A7A7A00676767005151
      51004141410058585800FAFAFA00000000000000000000000000000000000000
      00000000000000000000B5B3B300D5D4D400FBFBFB0000000000BAD2BA000B68
      0B000675060071937000A0939B0092888600948382009B928C004D9C4C000968
      090022682200C0CEC000FFFCFF00FBFBFB0093909000FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F5F5
      F500F7F7F700F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F4F4F400F2F2F200F2F2F200F2F2F200F2F2F200F3F3F3000000
      0000AAAAAA00000000000000000000000000000000006A6A6A002C2C2C002929
      2900202020001F1F1F001B1B1B00272727005F5F5F007F7F7F00838383008484
      840085858500818181007F7F7F007E7E7E007E7E7E007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0077777700555555005252520054545400525252002D2D
      2D00232323002B2B2B008A8A8A000000000000000000B8B8B800F5F5F500F7F7
      F700F5F5F500F5F5F500F6F6F600FAFAFA00929292003B3B3B00383838004F4F
      4F006464640037373700151515000E0E0E000808080000000000838383009F9F
      9F0001010100070707000F0F0F00171717003333330055555500474747003939
      3900454545009595950000000000000000000000000000000000000000000000
      00000000000000000000BBB9B900D1D0D000FBFBFC0000000000A9C8A90065A0
      65007CB37C00C3D7C300C7D9C700E6E4E700DCE1DE00E5E6E600E2EEE200619C
      61007CA57C00FBF8FB00F8F8F800F8F8F80096939300FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B8B8B800F6F6
      F600F8F8F800F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F7F7F700F7F7F700F6F6F600F3F3F300F3F3F300F3F3F300F4F4F4000000
      0000ABABAB00000000000000000000000000000000007A7A7A00262626002424
      24001A1A1A001919190019191900161616002323230026262600252525002525
      2500252525002525250023232300252525002626260024242400242424002424
      2400212121001E1E1E0020202000252525002727270028282800222222001717
      17001B1B1B0021212100A1A1A1000000000000000000B8B8B800F6F6F600F8F8
      F800F6F6F600F6F6F600F6F6F600FBFBFB00D6D6D60062626200555555004343
      430034343400303030002C2C2C00242424001E1E1E000C0C0C00626262007474
      74000C0C0C001D1D1D00252525002C2C2C002F2F2F0034343400414141005555
      55005C5C5C00CECECE0000000000000000000000000000000000000000000000
      00000000000000000000BEBBBB00CDCCCC00F9FAFA0000000000FEFDFE00F3EE
      F30095C195002A9B2A004FB44F00F2EDF200B7DBB8004CAE4C004CA34C00B3CC
      B300E5E3E500FCFBFC00FDFDFD00F8F8F80097959500FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000B9B9B900F6F6
      F600F9F9F900F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F6F6F600F4F4F400F3F3F300F3F3F3000000
      0000ADADAD00000000000000000000000000000000008D8D8D00202020001F1F
      1F0054545400A7A7A700A7A7A700AAAAAA00A9A9A900AAAAAA00ACACAC00ADAD
      AD00AFAFAF00AFAFAF00AEAEAE00B7B7B700BDBDBD00BABABA00B8B8B800B7B7
      B700B6B6B600B4B4B400B1B1B100ADADAD00A9A9A900A8A8A800949494002525
      25001111110019191900BCBCBC000000000000000000B9B9B900F6F6F600F9F9
      F900F7F7F700F7F7F700F7F7F700F8F8F800F7F7F700909090005B5B5B006262
      62005A5A5A004E4E4E0042424200383838003131310025252500515151005B5B
      5B00222222003030300039393900434343004E4E4E0058585800606060006B6B
      6B007A7A7A00FAFAFA0000000000000000000000000000000000000000000000
      00000000000000000000C1BEBE00CAC9C900F9F9F90000000000FDFCFD00F8F3
      F8007EB97E000D8D0D0019A31900B0DCB0009BD39B00129712000C810C005798
      5700E7E4E70000000000FEFEFE00FCFCFC0098969600FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000B9B9B900F7F7
      F700FBFBFB00F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F5F5F500F5F5F5000000
      0000ADADAD0000000000000000000000000000000000A2A2A2001A1A1A001D1D
      1D007B7B7B00F6F6F600F1F1F100F6F6F600F9F9F900FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F8F8F800F3F3F300EFEFEF00EAEAEA00E8E8E800D0D0D0002626
      26000B0B0B0018181800D6D6D6000000000000000000B9B9B900F7F7F700FAFA
      FA00F8F8F800F8F8F800F8F8F800F8F8F800FEFEFE00CFCFCF00757575006F6F
      6F00686868005F5F5F0054545400525252004B4B4B0040404000383838003939
      39003C3C3C004B4B4B0051515100555555005D5D5D0065656500717171008181
      8100AFAFAF000000000000000000000000000000000000000000000000000000
      00000000000000000000C3C1C100C7C6C600F8F8F80000000000FCFCFC00F8F5
      F800E5ECE5003AA33A000B9D0B0025B5250023B023000C930C00429F420089B5
      8900C4CEC400EEEDEE00FEFEFE00FEFEFE0099979700FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000B9B9B900F7F7
      F700FCFCFC00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900F6F6F6000000
      0000ADADAD0000000000000000000000000000000000B8B8B800141414002424
      24006D6D6D00E6E6E600E4E4E400E7E7E700E9E9E900ECECEC00EDEDED00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEF
      EF00EDEDED00E9E9E900E3E3E300DEDEDE00DBDBDB00DCDCDC00BCBCBC001313
      13000707070023232300E7E7E7000000000000000000B9B9B900F7F7F700FCFC
      FC00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FCFCFC00BABABA008A8A
      8A008D8D8D00818181006D6D6D006161610064646400555555003D3D3D003B3B
      3B00515151006363630062626200696969007575750086868600949494008E8E
      8E00F1F1F1000000000000000000000000000000000000000000000000000000
      00000000000000000000C7C4C400C4C3C300F7F7F70000000000FDFDFD00F7F7
      F700FFFAFF00C7E3C7006CC36C0063C963006FCB6F006DBD6D00C0E1C000FCF8
      FC00CBCCCB00F6F6F60000000000FDFDFD0093929200FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000B9B9B900F8F8
      F800FDFDFD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00F9F9F9000000
      0000AEAEAE0000000000000000000000000000000000CFCFCF00121212002B2B
      2B0065656500E7E7E700ECECEC00EFEFEF00F2F2F200F5F5F500F7F7F700F9F9
      F900FBFBFB00FBFBFB00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FBFBFB00F9F9
      F900F7F7F700F5F5F500F1F1F100EAEAEA00E2E2E200E4E4E400A9A9A9000707
      07000303030037373700F3F3F3000000000000000000B9B9B900F8F8F800FDFD
      FD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FDFDFD00FDFDFD00BEBE
      BE00838383009C9C9C008E8E8E00818181007A7A7A0067676700646464005858
      580063636300787878007D7D7D00878787009393930085858500BCBCBC00B8B8
      B800FAFAFA000000000000000000000000000000000000000000000000000000
      00000000000000000000CAC7C700C0BFBF00F7F7F70000000000FEFEFE00FCFC
      FC00FCFCFC00FEFEFE00FFFEFF00FFFDFF00FFFEFF000000000000000000F7F7
      F700E0E0E000FBFBFB0000000000FCFCFC008D8B8B00FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000B9B9B900F9F9
      F900FDFDFD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FAFAFA000000
      0000AEAEAE0000000000000000000000000000000000E1E1E100171717003030
      300061616100E0E0E000E5E5E500E6E6E600E9E9E900EAEAEA00ECECEC00EDED
      ED00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EDED
      ED00EBEBEB00E9E9E900E7E7E700E5E5E500DFDFDF00DEDEDE00929292000000
      0000000000004E4E4E00FEFEFE000000000000000000B9B9B900F8F8F800FDFD
      FD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB0000000000E9E9
      E900404040005B5B5B006A6A6A007C7C7C00A0A0A00086868600707070006161
      61007F7F7F009D9D9D0071717100686868006161610037373700E1E1E100C0C0
      C000F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000CCCACA00BDBCBC00F6F6F60000000000FEFEFE000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800D8D8D800E9E9E900FDFDFD00F8F8F80094939300FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000BABABA00F9F9
      F900FDFDFD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FAFAFA00F7F7F700F4F4F400F3F3F300F2F2F200FBFB
      FB00AEAEAE0000000000000000000000000000000000EBEBEB00262626003333
      330060606000DEDEDE00EEEEEE00EFEFEF00F2F2F200F5F5F500F8F8F800F9F9
      F900FAFAFA00FBFBFB00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FAFAFA00F8F8
      F800F7F7F700F4F4F400F1F1F100EDEDED00EAEAEA00EBEBEB007F7F7F000000
      00000000000065656500000000000000000000000000BABABA00F9F9F900FDFD
      FD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FCFCFC000000
      000092929200393939003939390049494900AAAAAA00AEAEAE00757575006363
      6300A8A8A800A1A1A100404040003C3C3C00393939007B7B7B00FDFDFD00B9B9
      B900F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCCCC00B8B7B700F6F6F6000000000000000000FDFD
      FD00FAFAFA00FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FEFEFE00FCFC
      FC00E9E9E900EEEEEE0000000000F4F4F400A19F9F00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000BABABA00FAFA
      FA00FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00F8F8F800F3F3F300EFEFEF00ECECEC00EAEAEA00EAEAEA00F1F1
      F100ADADAD0000000000000000000000000000000000F3F3F300353535003838
      380063636300D9D9D900E9E9E900E9E9E900EBEBEB00EDEDED00EFEFEF00F0F0
      F000F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0F000F0F0
      F000EDEDED00ECECEC00EAEAEA00E7E7E700E5E5E500EEEEEE00787878000000
      0000000000007B7B7B00000000000000000000000000BABABA00FAFAFA00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FEFE
      FE00F9F9F900BDBDBD009F9F9F00C6C6C600F9F9F900FDFDFD00D2D2D200C6C6
      C600F8F8F800EEEEEE00B8B8B80098989800ADADAD00E5E5E500F5F5F500B4B4
      B400F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000D1CECE00C4C0C000E9E9E900DADADA00D8D8D800E2E2
      E200EAEAEA00F0F0F000F5F5F500F8F8F800FBFBFB00FEFEFE0000000000FDFD
      FD00F0F0F000FAFAFA0000000000F8F7F600AAA8A800FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000BABABA00FBFB
      FB0000000000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00F7F7F700F2F2F200ECECEC00E8E8E800E4E4E400E1E1E100E1E1E100EEEE
      EE00ADADAD0000000000000000000000000000000000FCFCFC00494949003C3C
      3C006A6A6A00D5D5D500E9E9E900E8E8E800EAEAEA00EBEBEB00EDEDED00EEEE
      EE00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EEEE
      EE00EDEDED00EAEAEA00E9E9E900E6E6E600E4E4E400EBEBEB008E8E8E000202
      02000000000097979700000000000000000000000000BABABA00FBFBFB000000
      0000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FEFEFE00000000000000000000000000FEFEFE00FDFDFD0000000000FEFE
      FE00F4F4F400F0F0F000F1F1F100EFEFEF00ECECEC00E5E5E500EDEDED00B4B4
      B400F8F8F8000000000000000000000000000000000000000000000000000000
      00000000000000000000DAD9D9009E9C9C00A8A9A900D9D9D900F2F2F200FBFB
      FB000000000000000000000000000000000000000000FDFDFD00FAFAFA00F2F2
      F200C0BFBE00DAD5D4009AD6E400AEDEE900E2D7D500FEFDFD00000000000000
      0000000000000000000000000000000000000000000000000000BABABA00FBFB
      FB0000000000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F7F7
      F700F2F2F200E6E6E600DDDDDD00D9D9D900D5D5D500D4D4D400D8D8D800DDDD
      DD00ADADAD0000000000000000000000000000000000000000005F5F5F003B3B
      3B0075757500CFCFCF00ECECEC00EAEAEA00EDEDED00EFEFEF00F0F0F000F2F2
      F200F3F3F300F4F4F400F4F4F400F4F4F400F4F4F400F3F3F300F2F2F200F1F1
      F100F0F0F000EEEEEE00ECECEC00E9E9E900E7E7E700E7E7E700999999002E2E
      2E0000000000B2B2B200000000000000000000000000BABABA00FBFBFB000000
      0000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F4F4
      F400EEEEEE00E6E6E600E1E1E100DDDDDD00DADADA00DBDBDB00E4E4E400ACAC
      AC00FCFCFC000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E3E3005B585800F1F1F10000000000000000000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00F9F9F900EFEFEF00E9E9E900E2E1
      E100C1BFBE00A3CED7004BD5F30035CAEB00A9C9D10000000000000000000000
      0000000000000000000000000000000000000000000000000000BABABA00FBFB
      FB0000000000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FBFBFB00F5F5
      F500E9E9E900CFCFCF00DADADA00DBDBDB00DDDDDD00DCDCDC00D5D5D500AFAF
      AF00ECECEC000000000000000000000000000000000000000000747474003838
      380080808000C8C8C800EAEAEA00E8E8E800EAEAEA00EBEBEB00ECECEC00EEEE
      EE00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEEEE00EDED
      ED00ECECEC00EBEBEB00E8E8E800E6E6E600E6E6E600E2E2E200969696005D5D
      5D000A0A0A00CFCFCF00000000000000000000000000BABABA00FBFBFB000000
      0000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F7F7F700ECEC
      EC00D1D1D100D4D4D400D4D4D400D5D5D500D6D6D600D4D4D400C4C4C400BCBC
      BC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B7B6B600F9F9F90000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00F4F4F400E9E9E900DBDCDC00D7D5D500D6D2
      D200C0D7DC009FECFC007DEAFF0055E3FF003FCBEA00D5EDF300000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00FBFB
      FB00FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F8F8F800F2F2
      F200DFDFDF00E4E4E4000000000000000000FEFEFE00EFEFEF00B9B9B900EBEB
      EB000000000000000000000000000000000000000000000000008B8B8B003232
      32008B8B8B00C7C7C700EDEDED00EBEBEB00EDEDED00EEEEEE00EFEFEF00F0F0
      F000F1F1F100F1F1F100F2F2F200F2F2F200F2F2F200F1F1F100F1F1F100F0F0
      F000EFEFEF00EEEEEE00EDEDED00EAEAEA00EAEAEA00E2E2E2009B9B9B007575
      75001B1B1B00E3E3E300000000000000000000000000BBBBBB00FBFBFB00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F5F5F500E0E0
      E000DEDEDE00FBFBFB00FAFAFA00FBFBFB00F1F1F100D3D3D300BCBCBC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8D8D800FCFCFC0000000000FEFEFE00FEFE
      FE00FEFEFE0000000000F6F6F600E4E4E400E6E6E600F7F5F500DAE1E300BBD9
      E000E4FAFD00C9F7FF00A6F0FE0082E9FE005CE8FF0054CCE700F9FCFD000000
      0000000000000000000000000000000000000000000000000000BBBBBB00FBFB
      FB00FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F7F7F700F2F2
      F200E1E1E100E7E7E70000000000FBFBFB00EAEAEA00B8B8B800EBEBEB000000
      0000000000000000000000000000000000000000000000000000A2A2A2002C2C
      2C009C9C9C00C8C8C800ECECEC00EBEBEB00ECECEC00EDEDED00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EDEDED00EDEDED00ECECEC00EAEA
      EA00E7E7E700E6E6E600E4E4E400E0E0E000DFDFDF00D3D3D3009F9F9F006D6D
      6D0030303000F1F1F100000000000000000000000000BBBBBB00FBFBFB00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F8F8F800F3F3F300E1E1
      E100E7E7E70000000000FEFEFE00EFEFEF00D4D4D400BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D4D4D400FCFCFC0000000000FEFEFE00FEFE
      FE0000000000FBFBFB00ECECEC00D5D5D500DFDEDE00F6F4F4008BC6D30076DC
      F100BEF6FF009FEEFE008AEAFE007AEAFF0058D8F400ABDEEA00000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00FCFC
      FC00FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F7F7F700F2F2
      F200E3E3E300ECECEC00FDFDFD00EBEBEB00BABABA00EBEBEB00000000000000
      0000000000000000000000000000000000000000000000000000D2D2D2001B1B
      1B003B3B3B004242420049494900494949004A4A4A004A4A4A004B4B4B004747
      470042424200414141003F3F3F003F3F3F003F3F3F003F3F3F003E3E3E003838
      380037373700343434003333330033333300323232002F2F2F00262626001515
      15007A7A7A0000000000000000000000000000000000BBBBBB00FCFCFC00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F8F8F800F3F3F300E3E3
      E300EAEAEA0000000000F0F0F000C8C8C800C5C5C50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D3D3D300FDFDFD0000000000000000000000
      000000000000FCFCFC00ECECEC00D6D5D500DBD7D500DFE6E80092DCEC007DDF
      F400D0F8FF00B2F2FF00A4F3FF0074D9EF00C4E6EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC00FCFC
      FC00FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F8F8F800F3F3
      F300E7E7E700ECECEC00EDEDED00BDBDBD00EBEBEB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60093939300979797009C9C9C009E9E9E009E9E9E009E9E9E009E9E9E00A0A0
      A000A5A5A500A9A9A900AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00B3B3
      B300B5B5B500BBBBBB00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BDBDBD00CDCD
      CD00FAFAFA0000000000000000000000000000000000BCBCBC00FCFCFC00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F9F9F900F3F3F300E7E7
      E700EDEDED00F1F1F100CACACA00D3D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCDCDC00DDDDDD00DDDDDD00DCDCDC00DCDC
      DC00DCDCDC00D8D8D800D1D0D000B6BABA00C3D3D60000000000C2F0F90096E8
      F900EEFDFF00D0F9FF008BD9EA00D6EEF3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BBBBBB00FCFC
      FC00FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F9F9F900F4F4
      F400EEEEEE00EAEAEA00C3C3C300E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBBBBB00FCFCFC00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F5F5F500EDED
      ED00E9E9E900D1D1D100D2D2D200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F60000000000BDD6DD00E3F9FE00EAFCFF00B5F1
      FF00F3FCFD009FD8E500F5FBFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00F8F8F800CDCDCD00E5E5E500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FAFAFA00F6F6
      F600DCDCDC00CFCFCF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1DFEA00E4F7FA00C3F3
      FC00A9DAE6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E5E5E500E2E2
      E200EBEBEB00E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800EAEA
      EA00E0E0E000E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8D8D800EDEDED00F5F5
      F500F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F4F4F400E8E8
      E800D1D1D1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A8DAE600ADDC
      E800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00E0000007000000000000000000000000
      C000000300000000000000000000000080000001000000000000000000000000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000003E000000000000000000000000000
      001FF80000000000000000000000000000381C00000000000000000000000000
      0070060000000000000000000000000000C00300000000000000000000000000
      01C0018000000000000000000000000001800180000000000000000000000000
      018001C0000000000000000000000000018000C0000000000000000000000000
      018000C0000000000000000000000000018000C0000000000000000000000000
      0181818000000000000000000000000001818180000000000000000000000000
      00C1838000000000000000000000000000E18700000000000000000000000000
      00718E0000000000000000000000000000018C00000000000000000000000000
      0001800000000000000000000000000000018000000000000000000000000000
      0001800000000000000000000000000000018000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      80000001000000000000000000000000C0000003000000000000000000000000
      E0000007000000000000000000000000C0000007FFFFFFFF80000003E000001F
      C0000007FFFFFFFF80000001C0000007C0000007FFFFFFFF80000000C007F007
      C0000007FFFFFFFF80000000C0000007C0000007F000000180000000E000000F
      C0000007C000000080000000F403803FC00000078040000080000000FC00003F
      C00000070000000080000000FC00083FC00000070000000080000001FC00043F
      C00000070000000080000001FC00003FC00000070000000080000001FC40003F
      C00000070000000180000001FC40023FC00000070000000180000001FC40003F
      C00000178000000180000003FC40003FC00000178000000180000003FC40003F
      C00000178000000180000003FC40043FC0000017803FF00180000007FC40003F
      C00000178000000180000007FC40023FC00000178000000180000007FC40623F
      C00000178000000180200007FC5FE03FC00000078000000380100007FC60023F
      C00000078000000380000007FC00223FC80000078000000390072007FC0F803F
      C8000007C000000390000007FC72007FC8000007C00000039000000FFE40003F
      C000030FC00000038000001FFE44001FC000021FC00000038000043FFE48003F
      C000003FC00000078000047FFE78007FC000007FE0000007800000FFFE0040FF
      C00000FFFFFFFFFF800001FFFE0101FFDFFFC1FFFFFFFFFFB00003FFFFFF87FF
      C00003FFFFFFFFFF800007FFFFFFCFFF00000000000000000000000000000000
      000000000000}
  end
  object aclLista: TActionList
    Images = ImageList1
    Left = 720
    Top = 112
    object actNuevo: TAction
      Caption = '&Nuevo'
      ImageIndex = 0
    end
    object actModificar: TAction
      Caption = 'actModificar'
    end
    object actGrabar: TAction
      Caption = '&Grabar'
      ImageIndex = 1
      OnExecute = actGrabarExecute
    end
    object actBorrar: TAction
      Caption = 'actBorrar'
      ImageIndex = 3
    end
    object actExpensas: TAction
      Caption = 'actExpensas'
    end
  end
end
