object fGestionEmail: TfGestionEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gesti'#243'n de E-Mails'
  ClientHeight = 365
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 599
    Height = 39
    Align = alBottom
    BevelEdges = [beTop]
    TabOrder = 1
    object Label5: TLabel
      Left = 40
      Top = 12
      Width = 107
      Height = 13
      Caption = 'Tarea Predeterminada'
    end
    object Shape1: TShape
      Left = 16
      Top = 12
      Width = 20
      Height = 13
      Brush.Color = clMoneyGreen
    end
    object btSalir: TBitBtn
      Left = 503
      Top = 6
      Width = 89
      Height = 29
      Cancel = True
      Caption = '&Salir'
      Glyph.Data = {
        D6060000424DD60600000000000036040000280000001E000000150000000100
        080000000000A002000000000000000000000001000000010000151412001C1B
        18008484000087847C00C9C77F00FFFFFF00280000007F11F400E2831C005F17
        F4007F110000030067000084AE008716F4007F11C70000000000671663006700
        E400010000000000D900F7BF87005600100056008F0056004700F7BF20005600
        E400000000000000C000560075009E016000484B030000000000000020005600
        000000003400560018005600670056003700770100000758370077019800763D
        870004000000000000006793020063006700000054006F6C4300696C64000000
        000000000000000000000000000000000000000000000000000000000000F486
        DA0000000300679302009D9E010000006300000067000000A8000000A7000000
        0800000007000000000056001700F7BF0300000000000000200056001C000758
        3E0087166300000067000000E40000000100000000000000980056006D00F7BF
        1F000000000000001E00F5BF1E00F5BF00000000030000000000000020000000
        F5000000000026856400FFFF07003A85F7008716FF0007580000000007000000
        0000608511000300FE009E012A005F17A0000758000003008800E48552005F17
        01000000140093001200140000000002E400288607004A200A00020000000002
        63006700000014B2930063006700000000000000000000000000073D03000000
        000000000000073D63006700E400010000000000000000000000000003001101
        000000005F00E310120014006300670012001400000000020100000000000000
        0700F486020000000700E40C08007C0B00000200000001000000000200000000
        2800075807000000640067160000073D54007E9E3F0000000100020000000002
        00000000000028860700988994006800E400000200001200140014B293006300
        670000008C0002006400941E4E008DA90100641E94005C865C003CAA00009889
        0000073D4A007E4957000100120000000C0068009400200000000C0068000000
        1000405F0000AC863900A0910200988902006716F00000000C006800CF00405F
        7400000020000000D00000000100E15D98000200C200DB035F00000000000002
        74002000980002000700DC87BF00CF055700000007002EFC8F008C0D8C002000
        740000000000000200000000020046C3000006008C008716D900F7BF8700405F
        000056008F00F5BF4700F7BF9400304F0000384F00001C87DF006701E200384F
        01007F015E00E94A670064137F00304F0000384F00005E875600468756000000
        00000100520001000000384F00003F037F008700EE00F7BF87000000E300F7BF
        8E0000009C0056000000000000005800D4000000A000F7BF0000960959002EA3
        0000000092003A64960026025A004D4F370001005E0000000700A88748009704
        960000005600CA8B3E002EA32E000706E4009913A700261DB200050505050505
        0503050305030503050305000003050305050505050505050000050505050505
        0305030503050305030503000400030503050505050505050000050505050503
        0503050305030503050305000402000305030505050505050000050505050505
        0305030503050305030503000402020001050305050505050000050505050500
        0000000000000003050305000402020200000005050505050000050505050505
        0505050505050000000000000402020200030505050505050000050505050505
        0505050500030003030303000402020200030505050505050000050505050505
        0505050500000003030303000402020200030505050505050000050505050505
        0505050500020003030303000400000200030505050505050000050505050505
        0505030300040200030303000403000200030505050505050000050505050500
        0000000000040402000303000400000200030505050505050000050505050500
        0202020202040404020003000402020200030505050505050000050505050500
        0404050505050505040003000402020200030505050505050000050505050500
        0000000000040404000303000402020200030505050505050000050505050505
        0505050500040400030303000402020200030505050505050000050505050505
        0505050500040003030303000402020200030505050505050000050505050505
        0505050500000003030303000402020200030505050505050000050505050505
        0505050500050003030303030004020200030505050505050000050505050505
        0505050505050003030303030300040200030505050505050000050505050505
        0505050505050000000000000000000000050505050505050000050505050505
        0505050505050505050505050505050505050505050505050000}
      Margin = 3
      TabOrder = 0
      OnClick = btSalirClick
    end
  end
  object pgGestorMail: TPageControl
    Left = 0
    Top = 0
    Width = 599
    Height = 307
    ActivePage = tbTareas
    Align = alClient
    TabOrder = 0
    object tbTareas: TTabSheet
      Caption = 'Tareas de E-Mails'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gTareas: TStringAlignGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 585
        Height = 273
        Align = alClient
        ColCount = 4
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentShowHint = False
        PopupMenu = pmTareas
        ShowHint = True
        TabOrder = 0
        ShowCellHints = False
        DrawSelection = False
        ColWidths = (
          565
          64
          64
          64)
        Cells = (
          0
          0
          'Nombre'
          1
          0
          'ID'
          2
          0
          'Defecto'
          3
          0
          'IDModuloWF')
        PropCell = (
          0
          1
          1
          1
          0
          1
          1
          1
          2
          0
          2
          1
          1
          0
          0
          3
          1
          1
          2
          0)
        PropCol = (
          0
          1
          1
          0
          1
          1
          2
          0
          2
          1
          0
          0
          3
          1
          2
          0)
        PropRow = (
          0
          1
          2
          0)
        PropFixedCol = ()
        PropFixedRow = (
          0
          1
          2
          0)
      end
    end
    object tbConfiguracion: TTabSheet
      Caption = 'Configuraci'#243'n de Cuenta de E-Mail Remitente'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lbContrasenia: TLabel
        Left = 389
        Top = 6
        Width = 60
        Height = 13
        Caption = 'Contrase'#241'a:'
        Color = clBtnFace
        ParentColor = False
      end
      object lbEmail: TLabel
        Left = 4
        Top = 6
        Width = 122
        Height = 13
        Caption = 'Cuenta E-Mail Remitente:'
        Color = clBtnFace
        ParentColor = False
      end
      object lbPuerto: TLabel
        Left = 389
        Top = 46
        Width = 36
        Height = 13
        Caption = 'Puerto:'
        Color = clBtnFace
        ParentColor = False
      end
      object lbServidor: TLabel
        Left = 4
        Top = 46
        Width = 73
        Height = 13
        Caption = 'Servidor SMTP:'
        Color = clBtnFace
        ParentColor = False
      end
      object chRequiereSSL: TCheckBox
        Left = 444
        Top = 65
        Width = 144
        Height = 14
        Caption = 'Requiere conexi'#243'n segura'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 4
      end
      object edContrasenia: TEdit
        Left = 389
        Top = 21
        Width = 199
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
      object edEmail: TEdit
        Left = 4
        Top = 21
        Width = 379
        Height = 21
        MaxLength = 50
        TabOrder = 0
      end
      object edPuerto: TEdit
        Left = 389
        Top = 61
        Width = 49
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object edServidor: TEdit
        Left = 4
        Top = 61
        Width = 379
        Height = 21
        MaxLength = 50
        TabOrder = 2
      end
      object btConectar: TButton
        Left = 3
        Top = 88
        Width = 100
        Height = 29
        Caption = 'Probar Conexi'#243'n'
        TabOrder = 5
        OnClick = btConectarClick
      end
      object StatusMail: TMemo
        Left = 3
        Top = 123
        Width = 581
        Height = 153
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 346
    Width = 599
    Height = 19
    Panels = <>
  end
  object pb: TProgressBar
    Left = 4
    Top = 350
    Width = 592
    Height = 13
    TabOrder = 3
  end
  object pmTareas: TPopupMenu
    Left = 256
    Top = 128
    object mnuEjecutarTarea: TMenuItem
      Caption = '&Ejecutar Tarea Seleccionada'
      OnClick = btEjecutarTareaClick
    end
    object mnuEstableceTareaPredeter: TMenuItem
      Caption = 'E&stablecer esta Tarea como Predeterminada'
      OnClick = mnuEstableceTareaPredeterClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuNuevaTarea: TMenuItem
      Caption = 'Nueva Tarea'
      OnClick = btAgregarTareaClick
    end
    object mnuModificarTarea: TMenuItem
      Caption = 'Modificar Tarea'
      OnClick = mnuModificarTareaClick
    end
    object mnuEliminartarea: TMenuItem
      Caption = 'Eliminar tarea'
      OnClick = mnuEliminartareaClick
    end
  end
  object DataSource1: TDataSource
    Left = 456
    Top = 112
  end
end
