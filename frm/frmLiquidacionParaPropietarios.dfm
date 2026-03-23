object FrmLiquidacionPropietarios: TFrmLiquidacionPropietarios
  Left = 251
  Top = 42
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Liquidaci'#243'n para Propietarios'
  ClientHeight = 470
  ClientWidth = 752
  Color = clSilver
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 287
    Top = 79
    Width = 52
    Height = 13
    Caption = 'Recibo N'#186':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 370
    Top = 79
    Width = 73
    Height = 13
    Caption = 'Total a Abonar:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 13
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
  object Label8: TLabel
    Left = 8
    Top = 34
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
  object Label9: TLabel
    Left = 8
    Top = 55
    Width = 51
    Height = 13
    Caption = 'Ubicaci'#243'n:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 67
    Top = 79
    Width = 33
    Height = 13
    Caption = 'Fecha:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 143
    Top = 79
    Width = 62
    Height = 13
    Caption = 'Desde el dia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 214
    Top = 79
    Width = 59
    Height = 13
    Caption = 'Hasta el dia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object gImpresion: TStringAlignGrid
    Left = 28
    Top = 178
    Width = 507
    Height = 63
    ColCount = 4
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
    ShowCellHints = False
    ColWidths = (
      100
      281
      100
      -1)
    Cells = (
      0
      0
      'Direccion'
      1
      0
      'Periodo'
      2
      0
      'Importe'
      3
      0
      'Codinq')
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
      0)
    PropCol = (
      0
      1
      1
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
      0
      3
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = (
      0
      1
      2
      0)
  end
  object gPendiente: TStringAlignGrid
    Left = 50
    Top = 216
    Width = 623
    Height = 91
    ColCount = 13
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    ShowCellHints = False
    ColWidths = (
      80
      80
      100
      65
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    Cells = (
      0
      0
      'Codinq'
      1
      0
      'Inquilino'
      2
      0
      'Fecha'
      3
      0
      'Direccion'
      4
      0
      'Iva'
      5
      0
      'Item'
      6
      0
      'Periodo'
      7
      0
      'Importe'
      8
      0
      'Total'
      9
      0
      'Letras'
      10
      0
      'Coditem'
      11
      0
      'DniPropietario'
      12
      0
      'Propietario')
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
      0)
    PropCol = (
      0
      1
      1
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
      0
      3
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = (
      0
      1
      2
      0)
  end
  object Button1: TButton
    Left = 800
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
  end
  object Button2: TButton
    Left = 424
    Top = 689
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    Visible = False
  end
  object Edit9: TEdit
    Left = 467
    Top = 31
    Width = 206
    Height = 21
    Cursor = crIBeam
    MaxLength = 10
    TabOrder = 2
    Visible = False
  end
  object chlista: TCheckListBox
    Left = 499
    Top = 216
    Width = 527
    Height = 121
    Columns = 1
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object Edit1: TcxTextEdit
    Left = 67
    Top = 10
    TabOrder = 6
    OnKeyPress = Edit1KeyPress
    Width = 62
  end
  object Edit4: TcxTextEdit
    Left = 67
    Top = 31
    Enabled = False
    Properties.ReadOnly = True
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 7
    OnKeyPress = Edit4KeyPress
    Width = 394
  end
  object Edit2: TcxComboBox
    Left = 131
    Top = 10
    StyleDisabled.Color = clWhite
    StyleDisabled.TextColor = clBlack
    TabOrder = 8
    OnKeyPress = Edit2KeyPress
    Width = 330
  end
  object Edit3: TcxTextEdit
    Left = 467
    Top = 10
    TabOrder = 9
    Visible = False
    Width = 62
  end
  object Edit7: TcxMaskEdit
    Left = 67
    Top = 93
    Properties.BeepOnError = True
    Properties.EditMask = '!99/99/0000;1;_'
    Properties.MaxLength = 0
    Properties.OnValidate = Edit7PropertiesValidate
    TabOrder = 10
    Text = '  /  /    '
    OnKeyPress = Edit7KeyPress
    Width = 67
  end
  object Edit6: TcxMaskEdit
    Left = 143
    Top = 93
    Properties.BeepOnError = True
    Properties.EditMask = '!99/99/0000;1;_'
    Properties.MaxLength = 0
    Properties.OnValidate = Edit6PropertiesValidate
    TabOrder = 11
    Text = '  /  /    '
    OnKeyPress = Edit6KeyPress
    Width = 67
  end
  object Edit8: TcxMaskEdit
    Left = 214
    Top = 93
    Properties.BeepOnError = True
    Properties.EditMask = '!99/99/0000;1;_'
    Properties.MaxLength = 0
    Properties.OnValidate = Edit8PropertiesValidate
    TabOrder = 12
    Text = '  /  /    '
    OnKeyPress = Edit8KeyPress
    Width = 67
  end
  object Edit12: TcxTextEdit
    Left = 368
    Top = 93
    Properties.Alignment.Horz = taRightJustify
    Properties.ReadOnly = True
    TabOrder = 13
    OnKeyPress = Edit7KeyPress
    Width = 75
  end
  object Edit10: TcxTextEdit
    Left = 287
    Top = 93
    TabOrder = 14
    OnKeyPress = Edit10KeyPress
    Width = 75
  end
  object Edit5: TcxComboBox
    Left = 67
    Top = 52
    Properties.ImmediateDropDownWhenKeyPressed = False
    Properties.IncrementalSearch = False
    StyleDisabled.Color = clWhite
    TabOrder = 15
    OnKeyPress = Edit5KeyPress
    Width = 394
  end
  object ProgressBar1: TProgressBar
    Left = 1
    Top = 415
    Width = 752
    Height = 17
    TabOrder = 16
  end
  object Panel3: TPanel
    Left = 0
    Top = 439
    Width = 752
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 17
    object btnGrabar: TAdvGlowButton
      Left = 0
      Top = 1
      Width = 90
      Height = 29
      BorderStyle = bsNone
      Caption = 'Imprimir'
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
      OnClick = actImprimirExecute
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
      Left = 663
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
    object CheckBox1: TCheckBox
      Left = 221
      Top = 0
      Width = 222
      Height = 17
      Caption = 'Incluir leyenda Documentaci'#243'n Entregada'
      TabOrder = 2
    end
    object chUbicacion: TCheckBox
      Left = 221
      Top = 15
      Width = 158
      Height = 17
      Caption = 'Incluir ubicaci'#243'n del inmueble'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object AdvGlowButton1: TAdvGlowButton
      Left = 96
      Top = 1
      Width = 110
      Height = 29
      BorderStyle = bsNone
      Caption = 'Vista Previa'
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
      TabOrder = 4
      TabStop = True
      OnClick = AdvGlowButton1Click
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
  end
  object PageControl1: TPageControl
    Left = 1
    Top = 114
    Width = 752
    Height = 290
    ActivePage = tbPropiedades
    TabOrder = 18
    object tbPropiedades: TTabSheet
      Caption = 'Propiedades'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gLista: TAdvStringGrid
        Left = 0
        Top = 0
        Width = 609
        Height = 262
        Cursor = crDefault
        Align = alLeft
        ColCount = 4
        Ctl3D = True
        DefaultRowHeight = 19
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 5
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentCtl3D = False
        ScrollBars = ssBoth
        TabOrder = 0
        GridLineColor = 15527152
        GridFixedLineColor = 13947601
        HoverRowCells = [hcNormal, hcSelected]
        OnGetAlignment = gListaGetAlignment
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 16644337
        ActiveCellColorTo = 16576469
        ColumnHeaders.Strings = (
          ''
          'C'#243'digo'
          'Nombre'
          'Estado')
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
        FixedColWidth = 20
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
          20
          77
          374
          105)
        RowHeights = (
          19
          19
          19
          19
          19)
      end
      object BitBtn5: TBitBtn
        Left = 615
        Top = 111
        Width = 114
        Height = 26
        Cursor = crHandPoint
        Hint = 'Volver...'
        Caption = '&Todas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn5Click
      end
      object BitBtn1: TBitBtn
        Left = 615
        Top = 140
        Width = 114
        Height = 26
        Cursor = crHandPoint
        Hint = 'Volver...'
        Caption = '&Seleccionadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
    object tbItems: TTabSheet
      Caption = 'Items'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 744
        Height = 262
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'SevenClassic'
        object gItems: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '$ ,0.00;$ -,0.00'
              Kind = skSum
              FieldName = 'Monto'
              Column = Columna_Importe
            end
            item
              Format = '$ ,0.00;$ -,0.00'
              Kind = skSum
              FieldName = 'Pendiente'
              Column = Columna_coditem
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
          OptionsView.GroupByBox = False
          object Columna_Seleccion: TcxGridDBColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 20
            IsCaptionAssigned = True
          end
          object Columna_Codinq: TcxGridDBColumn
            Caption = 'Cod. Inq.'
            MinWidth = 64
          end
          object Columna_coditem: TcxGridDBColumn
            Caption = 'Cod.'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 44
            Options.Editing = False
            Width = 44
          end
          object Columna_Item: TcxGridDBColumn
            Caption = 'Item'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 179
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 179
          end
          object Columna_Descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 267
            Width = 267
          end
          object Columna_Importe: TcxGridDBColumn
            Caption = 'Importe'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 80
            Options.Editing = False
            Width = 80
          end
          object Columna_Ingreso: TcxGridDBColumn
            Caption = 'Ingreso'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 71
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gItems
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gLiqPrOrig: TStringAlignGrid
        Left = 0
        Top = 0
        Width = 744
        Height = 262
        Align = alClient
        ColCount = 13
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ShowCellHints = False
        ColWidths = (
          80
          80
          100
          65
          64
          64
          64
          64
          64
          64
          64
          64
          64)
        Cells = (
          0
          0
          'Codinq'
          1
          0
          'Inquilino'
          2
          0
          'Fecha'
          3
          0
          'Direccion'
          4
          0
          'Iva'
          5
          0
          'Item'
          6
          0
          'Periodo'
          7
          0
          'Importe'
          8
          0
          'Total'
          9
          0
          'Letras'
          10
          0
          'Coditem'
          11
          0
          'DniPropietario'
          12
          0
          'Propietario')
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
          0)
        PropCol = (
          0
          1
          1
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
          0
          3
          1
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
  object chGastoBancario: TCheckBox
    Left = 453
    Top = 93
    Width = 275
    Height = 17
    Caption = 'Incluir gasto bancario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
  end
  object chRedondeo: TCheckBox
    Left = 449
    Top = 115
    Width = 275
    Height = 17
    Caption = 'Incluir ajuste por redondeo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    Visible = False
  end
  object DataSource1: TDataSource
    DataSet = qLiqPro
    Left = 207
    Top = 233
  end
  object DataSource2: TDataSource
    Left = 57
    Top = 635
  end
  object DataSource3: TDataSource
    Left = 86
    Top = 631
  end
  object DataSource4: TDataSource
    Left = 342
    Top = 312
  end
  object DataSource5: TDataSource
    Left = 351
    Top = 537
  end
  object aclAcciones: TActionList
    Images = ImageList1
    Left = 552
    Top = 8
    object actSalir: TAction
      Caption = 'Salir'
      ImageIndex = 4
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      ImageIndex = 0
      OnExecute = actImprimirExecute
    end
    object actPlanesDePago: TAction
      Caption = 'actPlanesDePago'
    end
    object actCargarInmuebles: TAction
      Caption = 'actCargarInmuebles'
    end
    object actCalculoExpensas: TAction
      Caption = 'actCalculoExpensas'
      OnExecute = actCalculoExpensasExecute
    end
    object actCalculoDeItemsALiquidar: TAction
      Caption = 'actCalculoDeItemsALiquidar'
      ImageIndex = 6
      OnExecute = actCalculoDeItemsALiquidarExecute
    end
    object actCaja: TAction
      Caption = 'actCaja'
    end
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 584
    Top = 8
    Bitmap = {
      494C010107000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      00000000000080008000FF00FF00FF00FF008000800000000000000000000000
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
      000080008000FF00FF00FFFFFF00FF00FF008000800000000000000000000000
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
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      8000FF00FF00FFFFFF00FF00FF00800080008000800000000000000000000000
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
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080008000FF00
      FF00FFFFFF00FF00FF0080008000800080000000000080808000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
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
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080008000FF00FF00FFFF
      FF00FF00FF0080008000800080000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
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
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080008000FF00FF00FFFFFF00FF00
      FF0080008000800080000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
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
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000080008000FF00FF00FFFFFF00FF00FF008000
      80008000800000000000808080000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
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
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080008000FF00FF00FFFFFF00FF00FF00800080008000
      80000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000B5B5BD009C9C9400A5AD
      AD00B5BDB500B5B5BD00BDB5B500B5B5B500B5BDBD00BDB5B500B5B5B500BDB5
      B500B5B5BD00BDB5B500BDB5B500B5B5BD00BDB5B500B5B5BD00BDB5B500B5B5
      BD00BDB5B500B5B5B500C6B5B500B5B5BD00BDBDB500B5B5B500BDB5B500B5B5
      BD00BDB5B500BDB5B500BDBDB500B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED003737A1000000B2000000
      B0000000B4000000B7000000B8004040CE00ECECFA0000000000000000000000
      0000BDBDEC004E4ED6001010D0000202D5000101D9000909DA003A3ADF00A0A1
      EB00FEFEFD000000000000000000F9F9FF00777EF3001925EB002634ED002B3A
      EE002F40EF00374AF7002730BE00D4D4D5000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000080808000FF00FF00FFFFFF00FF00FF0080008000800080000000
      00008080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000009C9CA500BDBDB500FFFFFF00FFFF
      F700FFF7FF00FFFFF700FFFFFF00FFF7F700FFF7FF00FFFFFF00FFFFF700FFF7
      FF00FFFFFF00FFFFF700FFF7FF00FFF7FF00FFFFFF00FFFFF700FFF7FF00FFFF
      FF00FFFFFF00FFFFF700FFEFFF00FFFFFF00FFFFFF00FFFFF700FFF7FF00FFFF
      FF00FFFFFF00FFFFFF00A5A5A500B5B5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037379D000303B1000505
      B1000606B4000202B6001414BF00D7D7F5000000000000000000FFFFFE008686
      DD000202C7000000D0000000D8000000DB000000DE000000E2000000E3000000
      DE005F61E300F5F5FB000000000000000000FAFAFE004D56EF001D2AEB002A38
      ED002E3EEE003648F600262FB900D4D4D5000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008080800000000000FFFFFF00FF00FF008000800080008000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000ADA59C00B5B5B500FFFFF700EFEF
      EF00EFF7EF00EFEFEF00F7EFEF00EFF7EF00F7F7EF00F7F7F700EFF7EF00EFF7
      EF00F7EFEF00EFEFF700F7F7EF00EFF7EF00F7F7EF00EFEFEF00EFF7EF00EFEF
      EF00FFEFEF00E7EFEF00EFF7EF00EFEFEF00F7F7EF00E7EFEF00EFF7EF00EFEF
      EF00F7EFEF00FFFFFF00A5A5A500D6D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373799000909B0001111
      B3001212B6000606B7007676D900000000000000000000000000A5A5E3000505
      C6000707D1000303D3000000D5000000D9000000DC000000E0000101E3000304
      E5000000E2006D6FE500FFFFFE000000000000000000B2B6F8001C28EB002735
      ED002D3CEE003345F500242EB500D4D4D5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000FFFFFF0000000000808080008000800000000000808080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000009C9CA500B5B5B500F7F7FF00EFEF
      EF00EFEFF700EFEFEF00EFEFF700F7EFEF00EFEFEF00E7E7EF00E7EFEF00F7EF
      EF00EFE7EF00E7E7E700EFE7EF00EFEFE700EFE7EF00E7EFE700EFEFF700EFEF
      EF00EFEFF700EFEFEF00EFEFEF00EFEFEF00EFEFF700EFEFEF00EFEFF700EFEF
      EF00EFEFF700FFFFFF009C9CA500CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373796000C0CAE001818
      B4001616B7001919BB00C8C8EF000000000000000000EBEBF7003535CB001C1C
      D0002424D4002222D7001B1BD8001010DA000606DB000000DE000000E1000303
      E4000507E600080CE100C1C2F2000000000000000000F2F2FE003842ED00202E
      EC002A38EE003041F300232CB300D4D4D5000000000000000000000000000000
      0000000000008080000080800000808000008080000080800000808000000000
      0000000000000000000080808000808080000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A5A59C00B5B5B500FFFFF700EFEF
      EF00F7F7EF00EFF7EF00EFF7EF00EFEFF700E7E7E700CECED600D6D6D600EFEF
      EF00D6DED600D6DED600DEDEDE00D6D6DE00DEDEDE00D6DEDE00EFEFE700EFEF
      EF00EFF7EF00EFEFEF00F7EFEF00EFEFEF00EFF7EF00EFEFEF00F7EFEF00EFEF
      EF00EFF7EF00FFFFFF00A59CA500CED6CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373792001010AC002020
      B5001C1CB7003434C200F2F2FB000000000000000000AEAEE7001E1EC9002929
      D0002B2BD4002D2DD7002F2FDA003030DD002E2EE0002222E1000F0FE2000000
      E3000203E4000000E4006E70EB000000000000000000000000006168F1001824
      EA002734ED002C3BF0002129B100D4D4D5000000000000000000808080000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF00008080
      0000808000000000000080808000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000009C9CA500B5B5B500F7F7FF00EFEF
      EF00EFEFF700F7EFEF00EFEFEF00F7F7EF00DEDEE700DEDEDE00CEC6CE00DEDE
      DE00EFEFEF00EFEFE700EFEFF700EFF7EF00EFEFEF00EFEFEF00F7EFF700EFEF
      EF00F7EFF700EFEFEF00F7EFF700EFEFEF00EFEFEF00EFEFEF00EFEFF700F7EF
      EF00EFEFEF00FFFFFF00A59CA500D6CECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037378E001616AB002828
      B6002020B6005252C900FBFBFE0000000000000000008D8DE0002121C8003131
      D0003333D3003434D7003535DA003636DD003939E0003B3BE2003B3BE6002D2D
      E6001213E6000000E4004345EA00FDFDFF000000000000000000797FF300111C
      E900232FEC002835EE001F26B000D4D4D500000000008080800000000000FFFF
      0000FFFFFF000000000000000000FFFF00000000000080808000808080008080
      800080800000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A5A5A500B5B5B500FFFFF700EFEF
      EF00F7F7EF00EFEFF700F7EFEF00EFF7F700E7E7DE00C6C6D600D6D6CE00CECE
      CE00DEDED600CED6DE00DEDEDE00E7EFE700EFE7E700DEE7EF00EFEFE700E7E7
      E700EFEFEF00DEE7E700EFEFE700EFEFEF00F7EFF700EFEFEF00F7F7EF00EFEF
      F700F7EFEF00FFFFFF00A5A59C00CECED6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037378B001A1AAA002F2F
      B7002727B8005959C900FBFBFE0000000000000000008D8DE1002929C9003838
      D0003939D3003B3BD6003A3AD9003535DA003737DD003E3EE1004242E4004646
      E8004545EA002425E8003E40EB00FBFBFF0000000000000000007A7FF1000D16
      E8001F2AEC002430EB001C23AE00D4D4D5000000000080808000FFFF0000FFFF
      FF00FFFF000000000000FFFF000000000000FFFF000000000000FFFF00000000
      0000FFFF00008080000000000000808080000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A59CA500B5B5B500F7F7FF00F7EF
      EF00F7EFF700EFF7EF00EFEFF700EFEFEF00EFE7EF00E7E7DE00E7E7E700EFEF
      E700DEDEE700E7E7DE00E7DEE700EFEFE700EFE7EF00EFEFE700EFE7EF00EFEF
      E700EFEFEF00E7E7E700EFE7EF00EFF7E700EFEFF700EFEFEF00EFEFEF00EFF7
      EF00EFEFF700FFFFFF009C9CA500CED6CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373789001D1DA9003535
      B7002F2FB8005050C400F9F9FD000000000000000000A0A0E6003030C9003D3D
      D0003F3FD3003F3FD6004444D9007575E5007676E7004848E1004646E3004949
      E6004B4BE9004545EB007979F100FDFDFF000000000000000000696DEE000B13
      E8001B24EB001F2AE9001A20AD00D4D4D50080808000FFFF0000FFFFFF00FFFF
      0000FFFFFF000000000000000000FFFF00000000000080808000808080008080
      80008080800080808000808000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A59CA500B5B5B500FFFFFF00EFEF
      F700F7F7F700EFEFEF00EFF7EF00EFEFF700F7F7EF00EFEFEF00FFFFEF00EFF7
      FF00F7F7EF00F7F7FF00F7F7F700F7EFF700F7F7F700EFF7F700F7F7F700EFEF
      F700F7F7EF00EFEFEF00F7EFF700EFEFEF00EFF7EF00EFEFEF00F7EFEF00EFEF
      EF00EFF7EF00FFFFFF00A5A5A500CECED6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373785002222A7003D3D
      B9003939BA004444BF00E6E6F4000000000000000000D4D4F3004242CC004343
      CF004646D2004242D400A6A6EC000000000000000000ABABF1004949E1005050
      E5005151E6004848E800B5B5F6000000000000000000FCFCFE003F42E7000910
      E700161DE9001922E800171CAC00D4D4D50080808000FFFFFF00FFFF0000FFFF
      FF00FFFF000000000000FFFF000000000000FFFF000000000000FFFF00000000
      0000FFFF00000000000080800000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A5A5A500B5B5B500FFF7F700EFF7
      EF00EFF7F700F7EFEF00EFEFEF00F7F7EF00EFEFF700F7F7EF00CECEDE00D6D6
      CE00E7E7EF00D6D6CE00D6CEDE00D6D6D600D6D6DE00D6DED600D6D6DE00D6D6
      D600CECECE00F7F7EF00F7F7F700EFEFEF00F7EFEF00EFF7EF00EFEFF700F7EF
      EF00EFEFEF00FFFFFF009C9CA500D6D6CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373782002626A6004545
      BA004242BB003C3CBB00B4B4E0000000000000000000FEFEFF008383DC004141
      CC004C4CD1004F4FD400D3D3F5000000000000000000DCDCF9005858E1005656
      E3005252E5006E6EEB00F1F1FD000000000000000000DEDEF6001315E200060A
      E6000F14E8001319E6001518AA00D4D4D50080808000FFFF0000FFFFFF00FFFF
      0000FFFFFF000000000000000000FFFF00000000000080808000808080008080
      80008080800080808000808000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A5A5A500B5B5B500F7F7FF00EFEF
      EF00F7EFF700EFEFF700EFEFEF00EFEFEF00EFEFEF00EFEFF700EFF7E700DEDE
      EF00E7DEDE00D6DEE700E7E7DE00DEE7DE00E7E7DE00DEDEDE00E7E7E700DEDE
      D600EFE7E700EFEFEF00EFF7EF00EFEFEF00F7EFF700EFEFF700EFF7EF00EFEF
      F700F7EFEF00F7FFFF00B5ADA500A5A5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED00373781002B2BA5004D4D
      BA004B4BBC004545BD007171C700FCFCFD000000000000000000EAEAF9006D6D
      D6004B4BCF005656D400D1D1F4000000000000000000DBDBF8005F5FE0005757
      E0006363E500D3D3F800000000000000000000000000AAAAEA004344EA00080A
      E5000508E7000B0EE4001012A900D4D4D50080808000FFFFFF00FFFF0000FFFF
      FF00FFFFFF0000000000FFFF000000000000FFFF000000000000FFFF00000000
      0000FFFF00000000000080800000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A59C9C00B5B5B500FFFFF700F7EF
      EF00F7EFF700EFF7EF00EFEFEF00F7EFEF00EFEFF700EFF7EF00EFEFF700EFEF
      DE00DED6E700E7E7DE00DEDEE700DEDEDE00E7DEE700DEE7DE00E7E7DE00D6DE
      D600EFEFE700EFEFEF00EFEFEF00EFF7EF00EFEFF700F7EFEF00F7EFEF00EFF7
      EF00EFEFF700FFFFFF00A5A5B500ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037377F002F2FA4005454
      BC005252BC005353BF004D4DBC00B7B7DD00000000000000000000000000EAEA
      F9007D7DDA005959D200D2D2F3000000000000000000DCDCF8006363DE007A7A
      E400D8D8F700000000000000000000000000DEDEF0007070E3007474EF004E4E
      EB000303E4000102E1000C0CA800D4D4D50080808000FFFF0000FFFFFF00FFFF
      0000FFFFFF000000000000000000FFFF000000000000FFFF000000000000FFFF
      000000000000FFFF0000808000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000009CA5A500B5B5B500FFF7FF00F7EF
      F700EFF7F700EFEFF700F7F7F700EFEFEF00EFF7EF00EFEFEF00F7F7EF00EFE7
      EF00F7F7EF00EFEFEF00F7F7EF00EFEFF700F7F7F700F7EFF700F7F7F700EFEF
      F700F7F7EF00EFEFEF00EFF7F700EFEFEF00EFF7EF00EFEFF700EFEFF700EFEF
      EF00EFEFEF00FFFFFF00A5ADA500ADA5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037377E003333A4005D5D
      BD005959BD005B5BC0005959C2005F5FBD00C2C2DD0000000000000000000000
      0000D1D1F2006161D200D4D4F3000000000000000000DCDCF7007272DF00E6E6
      FA00000000000000000000000000DBDBEE007B7BD9007171E9007777EA007F7F
      EC004545E7000000DC000A0AA400D4D4D5000000000080808000FFFF0000FFFF
      FF00FFFFFF0000000000FFFF000000000000FFFF000000000000FFFF00000000
      0000FFFF000000000000000000008080800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A5A59C00B5B5B500FFFFFF00E7E7
      DE00C6C6CE00DEDED600D6D6DE00CECECE00CECED600D6D6C600D6CED600DEDE
      D600D6D6D600D6D6D600D6CED600EFEFE700EFEFF700F7EFEF00F7F7EF00EFEF
      EF00F7F7F700EFEFEF00EFF7EF00EFEFEF00F7EFF700F7F7EF00F7EFEF00F7F7
      EF00EFEFEF00FFFFF700A5A5B500B5ADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037377E003A3AA6006565
      BE006161BE006262C0006464C3006161C4005F5FBD00B7B7D900FDFDFC00FFFF
      FE00B1B1DF006767D000D6D6F3000000000000000000DEDEF7007A7ADC00F1F1
      FA000000000000000000D5D5E9007E7ED8007676E5007D7DE8007E7EE8008181
      E9008585EB002E2EDD000A0A9F00D4D4D5000000000080808000FFFFFF00FFFF
      0000FFFFFF0000000000FFFFFF00FFFF000000000000FFFF000000000000FFFF
      000000000000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A59CA500B5B5B500FFFFFF00EFE7
      E700D6D6CE00CECED600D6D6CE00E7E7E700D6D6D600C6CED600D6DED600CECE
      D600DEDED600EFEFF700F7F7EF00E7EFEF00F7F7F700EFEFF700EFEFEF00EFEF
      EF00F7F7F700EFEFEF00F7EFEF00EFEFEF00F7F7F700EFEFEF00EFEFEF00EFEF
      F700EFEFEF00F7FFFF00ADADA500ADA5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037377C004343A9006B6B
      BF006868BE006969C1006A6AC3006C6CC6006B6BC8006767C2008888BF008C8C
      BF006D6DC8007272D200D8D8F3000000000000000000E1E1F7007777D9009595
      D000DCDCE800B4B4D7007878D2007D7DE3008282E4008383E5008585E5008686
      E7008D8DE9007575E7000F0F9C00D4D4D500000000000000000080808000FFFF
      FF00FFFF000000000000FFFF0000FFFFFF00FFFF000000000000FFFF00000000
      0000808000000000000080808000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A59CA500B5B5B500FFF7FF00E7E7
      E700D6D6DE00DEDED600D6D6DE00E7E7DE00DED6DE00D6D6D600DEDEDE00DEDE
      D600CECED600D6D6D600E7E7EF00F7F7EF00EFEFF700EFEFEF00F7EFF700F7EF
      EF00EFF7F700F7EFEF00F7EFF700EFF7EF00EFEFF700EFEFEF00EFEFF700EFF7
      EF00EFEFEF00FFFFFF00A5A5AD00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0037377D004E4EAD007171
      BF006D6DBF006F6FC1007070C3007171C6007272C8007474CB006D6DC7006D6D
      C8007676D0007878D100DADAF3000000000000000000E2E2F7008282DC007878
      D4007979C9007979D2008484E1008787E2008888E2008989E3008B8BE4008C8C
      E4009090E6008A8AE80018189A00D4D4D5000000000000000000000000008080
      80008080800000000000FFFFFF00FFFF0000FFFFFF00FFFF0000000000000000
      00000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000A5A5A500B5B5B500FFFFF700EFEF
      F700F7F7F700F7F7F700F7F7F700EFF7F700F7F7EF00EFEFF700F7F7EF00EFF7
      F700FFFFEF00F7EFF700F7F7EF00EFEFF700F7F7EF00EFEFEF00F7F7F700E7E7
      EF00EFEFEF00E7EFEF00EFEFEF00E7E7E700EFEFEF00EFEFF700EFF7EF00EFEF
      EF00F7EFEF00FFFFFF00A5ADA500ADA5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEDED0039397D006060B5007676
      BF007474BF007575C2007777C4007979C6007979C8007B7BCA007D7DCD007E7E
      CF007E7ECF008080D100DEDEF4000000000000000000E6E6F7008989DA008787
      DC008A8ADE008C8CDF008D8DDF008E8EE0009090E0009191E2009292E2009393
      E3009696E3009494E6002B2B9E00D4D4D5000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000000000008080
      800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800000000000000000000000
      000000000000000000000000000000000000A5A5A500B5B5B500F7F7FF00EFEF
      EF00EFEFF700F7EFEF00EFEFF700EFF7EF00EFEFEF00EFEFEF00E7EFEF00EFF7
      EF00EFEFF700F7EFEF00EFEFEF00EFEFE700E7E7EF00E7EFE700F7EFF700DEDE
      D600DEDEE700CED6CE00CECED600CECEC600D6D6DE00F7F7F700EFEFF700F7EF
      EF00EFEFF700FFFFFF00ADA5AD00B5ADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00434382007474BD007C7C
      BF007C7CC1007D7DC3007E7EC5008080C7008181C9008383CA008484CC008585
      CE008686CF008585D000D9D9EF000000000000000000DDDDF0008D8DD7008F8F
      DA009292DB009393DC009494DD009696DE009797DF009898DF009A9AE0009B9B
      E0009D9DE1009E9EE4004646A700D6D6D7000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF000000
      000080808000000000000000000000000000A59CA500B5B5B500FFFFF700EFEF
      EF00F7EFEF00EFEFF700EFF7EF00EFEFEF00F7EFEF00EFF7F700EFEFEF00F7EF
      F700F7F7EF00E7EFEF00CED6CE00CED6D600D6CECE00C6C6CE00EFEFE700E7E7
      E700EFE7EF00DEDEDE00E7E7DE00DEDEDE00E7E7E700EFEFF700F7EFEF00EFEF
      EF00F7F7EF00FFFFFF00ADADA500ADADB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900626295008484C5008282
      C0008383C2008585C4008686C6008787C8008989C9008A8ACB008B8BCD008D8D
      CE008E8ED0008D8DD1009C9CCF00CECEDF00CFCFDF00A0A0D1009393D8009797
      DA009999DB009B9BDB009C9CDC009D9DDD009E9EDE009F9FDE00A1A1DF00A2A2
      DF00A3A3DE00B0B0E7007979B900E4E4E4000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00000000008080
      800000000000000000000000000000000000A59CA500BDB5B500F7F7FF00F7EF
      EF00EFEFF700EFEFEF00EFEFEF00F7EFEF00EFE7F700EFEFEF00EFEFEF00F7EF
      EF00EFEFF700EFEFE700DEDEE700E7E7DE00DEDEE700E7DEDE00EFEFEF00F7EF
      EF00EFEFF700EFEFEF00F7EFF700EFEFEF00EFEFEF00EFEFE700EFEFEF00EFEF
      EF00EFEFEF00FFFFFF00A5A5AD00ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009494AC009090CE008D8D
      C2008888C2008B8BC5008D8DC7008E8EC8009090CA009191CC009292CD009393
      CF009494D1009696D2009494D2009090CA009191CC009797D5009D9DD8009E9E
      D9009F9FDA00A1A1DB00A3A3DB00A4A4DC00A5A5DC00A6A6DD00A7A7DD00A8A8
      DD00A9A9DC00CFCFF4008B8BAF00FBFBFB000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800000000000808080000000
      000000000000000000000000000000000000A5AD9C00B5B5B500FFFFFF00EFF7
      F700F7FFF700F7F7F700F7FFF700F7F7F700F7FFF700F7F7F700F7FFF700F7F7
      F700F7FFF700F7F7F700F7FFF700F7F7F700F7FFFF00F7F7FF00FFFFFF00EFF7
      FF00FFFFF700EFF7FF00FFFFF700EFF7F700F7F7F700F7F7F700F7FFF700F7F7
      F700F7FFF700FFFFFF00A5ADB500B5ADB5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECED007676AE00B6B6
      DF00A0A0CC009696C7009797C9009898CA009A9ACC009B9BCD009C9CCF009E9E
      D1009F9FD200A0A0D400A2A2D500A3A3D700A4A4D800A6A6D900A7A7D900A9A9
      DA00AAAADB00ABABDC00ADADDD00AFAFDD00AFAFDD00B0B0DD00B1B1DD00BCBC
      E100E4E4F800AFAFD800CCCCD100000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800080808000000000000000
      0000000000000000000000000000000000009C94A500BDB5AD00DED6DE00D6D6
      CE00D6CED600D6D6CE00D6CED600DED6D600DED6D600D6D6D600DECED600D6D6
      D600CECED600D6CED600CECED600CECECE00CECED600D6CECE00CECED600D6CE
      C600CECED600CED6C600CECED600CED6CE00CECED600D6CECE00CECED600D6CE
      CE00CECED600DED6DE00A59C94009C949C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBDBDF008282
      B200B5B5E100C8C8EB00C9C9EB00CBCBED00CDCDEE00CFCFF000D1D1F100D3D3
      F300D5D5F400D7D7F500D9D9F700DBDBF800DCDCF900DEDEFA00E0E0FB00E2E2
      FC00E4E4FC00E5E5FD00E7E7FE00E8E8FE00EFEFFF00F0F0FF00F3F3FF00EBEB
      FF00A6A6CD00BDBDC70000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800000000000000000000000
      000000000000000000000000000000000000ADC6B50084949C00A5B5AD00B5C6
      C600BDC6C600B5CECE00B5CEC6009CADA50094A59C00ADC6BD008C9C9C00B5C6
      C600A5B5B500A5B5B500BDD6CE00B5C6C600BDCEC600B5CECE00BDCECE00ADC6
      CE00BDCECE00ADBDCE00BDC6CE00ADBDCE00BDC6CE00ADBDD600B5C6D600ADBD
      D600B5C6CE00B5BDC600BDBDBD00BDC6BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00BABAC6009E9EB100A1A1B000A1A1B000A1A1B000A2A2B100A2A2B100A3A3
      B100A3A3B200A4A4B200A4A4B200A4A4B200A5A5B200A5A5B300A6A6B300A6A6
      B300A6A6B300A7A7B300A7A7B300A7A7B300B2B2B800B2B2B800B0B0B800A6A6
      B700E7E7E9000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800000000000000000000000
      000000000000000000000000000000000000733142008C424200843139008C31
      3100731021007B21180084211800842918008C2921008C3121008C3918009431
      210094392900943929009442290094422100944231009C4A29009C4A2100A55A
      21009C523100A55A2100A55A2900A5632100AD632900AD632100AD632900B573
      2100B5732100AD7B4200948C7B00947B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00E1E1E100C8C8C800C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C8C8C800C8C8C800C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C9C9C900C7C7C700D0D0D000F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900BBBBBB00B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B7B7B700BBBBBB00B7B7B700B1B1B100B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B3B3B300B1B1B100E3E3E3000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FA00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000BABABA00F1F1F100E4E4E400E5E5E500E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E7E7E700EDEDED00DDDDDD00E1E1E100E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E5E5E500F0F0F000C7C7C700FDFDFD000000
      0000000000000000000000000000000000000000000000000000F8F9FA00F6F7
      F800F5F7F800F6F7F800F6F8F900F5F7F800F5F6F800F6F7F900F6F8F900F6F8
      F900F8F9FA00F7F9FA00F7F9FA00FAFBFC00F8FAFB00F8F9FB00FAFBFC00FAFB
      FC00FAFBFC00FAFBFD00FAFBFD00FAFBFC00FAFBFC00FBFCFD00FAFBFD00FCFD
      FD000000000000000000000000000000000000000000B5B5B500F8F8F800F8F8
      F800F3F3F300F5F5F500E5E5E5007F7E7E002F2C26001D222E0042526E006072
      8F005062850027314B0034333100807F7E00DBDCDC00EEEEEE00ECECEC00ECEC
      EC00EEEEEE00CECECE006C6C69002B2C2C0027324E00566684006C7A9100505D
      7300232933002D2B26008B8B8B00FBFBFB000000000000000000FDFDFD00F7F7
      F700E9E9E900DBDBDB00C0C0C0006C6A6A00726B6B00B8B0B000E2DDDD00F4F0
      F000FFFEFE000000000000000000000000000000000000000000000000000000
      0000F8F7F700DCD8D800B1AAAA00797474009C9B9B00D9D9D900E6E6E600F4F4
      F400FCFCFC00000000000000000000000000FBFBFB00D1D1D100B8B8B800B9B9
      B900BEBEBE00A9A9A900D8D8D800EBEBEB00E5E5E500E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E5E5E500E7E7E700E7E7E700E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E8E8E800EEEEEE0098989800C1C1C100BABA
      BA00BABABA00B8B8B800CECECE00FAFAFA0000000000FAFBFB008298A3006B86
      9300708A9900728B9C007491A1007390A100708EA100708EA200708FA3006F91
      A5007293A7007294A9007A98AE007897AB007193A8007394AA007797AD007898
      AC007796AA007796A9007594A6007494A700809AAB00819BAC007693A500A8BA
      C6000000000000000000000000000000000000000000B7B7B700EEEEEE00E4E4
      E400E2E2E200E7E7E700A3A2A20022211E00172E62005C83E1007DA9FF007AAA
      FF0077A3FF00648DFB002239810034343200A6A6A500E4E4E400E4E4E400E4E4
      E400E6E6E6009493920026282C00334EA20082A5FF008EB5FF008FBAFF008EB6
      FF006D92EB0022335A0035332F00CFCFCF000000000000000000FDFDFD00F8F8
      F800ECECEC00E7E7E7008D8B8B00595252009D969600D5CFCF00E3E0E000E1DE
      DE00E7E5E500F2F2F200EDEDED00D3D3D300E4E4E400E9E9E900D5D4D400F0EE
      EE00F2EFEF00E6E2E200DCD4D400AA9F9F0055505000D5D5D500EAEAEA00F5F5
      F500FCFCFC00000000000000000000000000D1D1D100AEAEAE00B8B8B800B4B4
      B400B4B4B400ADADAD00B6B6B600E7E7E700E1E1E100E1E1E100E1E1E100E1E1
      E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1
      E100E1E1E100E1E1E100E1E1E100E5E5E500D0D0D000A3A3A300B5B5B500B5B5
      B500B5B5B500B8B8B800ADADAD00CBCBCB0000000000FDFDFE006D8797004E6E
      7F005676860058798B005A7B8F00587B9100547A9000547A9300547C9400537B
      9500587D98005C7E9600567589004D799700527C9700557C9800547B9600547B
      9600547C9500547B9300537A9100597C910064839700587D94004C758F0096AB
      B9000000000000000000000000000000000000000000B7B7B700EEEEEE00E7E7
      E700E6E6E600ECECEC007C7973000C1C4200366CF5003C71FF002B5FF5002F63
      F4003364F5002B5AFA00284FF4001C2651008B898200E5E5E500E6E6E600E6E6
      E600E6E6E60075736A00182A6E004873FF004876FF00376EFF004278FF004478
      FF00457EFF003570E60019223500A8A7A600000000000000000000000000FDFD
      FD00F8F8F800FEFEFE0095939300817C7C00B5B2B200CBC4C500CFC5C500C2BE
      BE00D0D1D100ECECEC00F9F9F900F1F1F100D9D9D900CFCECF00A9A8A800817E
      7E00ABA4A400B7B0B000BDB3B300A59A9A005E585800E8E8E800F9F9F900FCFC
      FC0000000000000000000000000000000000BCBCBC00DADADA00D3D3D300D0D0
      D000D1D1D100C9C9C90074747400CCCCCC00D9D9D900D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600DADADA007B7B7B009B9B9B00D7D7D700D0D0
      D000D0D0D000D1D1D100E1E1E100B1B1B10000000000000000007D95A3005476
      88006182940063819500618195005E8097005A7E97005A8099005E839C006688
      A100637884005E7483005A6F79005C798A0060859D006087A1005D839D005E84
      9E005C839C005F839C006888A1006F8EA2006D8CA2006587A1005C7E9600A7B9
      C3000000000000000000000000000000000000000000B7B7B700EFEFEF00EAEA
      EA00E9E9E900F1F1F1007C796F00071D5E00174BF700194AF4001D46F200264D
      F2002D52F3001A40F5000425E8001B245F008B898000E8E8E800E9E9E900EAEA
      EA00E8E8E80075736800182A7E00264FFF002351FF002C5CFF003665FF003C6A
      FF00245EFF001157FC0014264E00A8A7A5000000000000000000000000000000
      0000FEFEFE0000000000A5A3A300CBC9C900D6D4D100DBC7C200D9C3C000C6BB
      BA00D4D2D300F1F0F100000000000000000000000000E0DFE000DFE0DF00B4B4
      B50086858500A6A3A3009E99990090878700746E6E00F6F6F600000000000000
      000000000000000000000000000000000000B9B9B900D9D9D900D4D4D400D2D2
      D200D4D4D400C8C8C8001414140030303000404040003E3E3E003D3D3D003D3D
      3D003C3C3C003C3C3C003C3C3C003C3C3C003C3C3C003B3B3B003B3B3B003A3A
      3A003A3A3A003A3A3A003B3B3B0038383800000000007A7A7A00E0E0E000D4D4
      D400D1D1D100D5D5D500E0E0E000AFAFAF000000000000000000869EA9005274
      8500618194006181970064839900608297005E829B0062849D00698AA200688B
      A4005D829C005883A0005F7E9200637987005E717D005C86A4005C85A1006187
      A2006187A1006A8CA3007190A6006B8EA600688BA40069879D005C7D9200B1BF
      C9000000000000000000000000000000000000000000B7B7B700EFEFEF00EAEA
      EA00E8E8E800EFEFEF00AFAEAB00181C2D000B259D001C3BDF00213AEA002840
      ED003047ED001329DB0001108B002A2B310094939100E8E8E800E9E9E900E9E9
      E900E8E8E80081817D0024273A00283EB8002C4DF2003154FD00395DFF003F62
      FF001442F100002295002C2E3200D0D0CF000000000000000000000000000000
      00000000000000000000A7A5A500BFBDBD00DBDED700DED5CE00DCC9C200C3AC
      A900B9B3B200C4C8C500E3E7E400FAFAFA00FBF7FB009BCA9B00CED3CE00FDF9
      FD00D0D1D100BCBCBC00E8E8E800E5E5E50088868600F7F7F700000000000000
      000000000000000000000000000000000000B7B7B700E1E1E100DADADA00D8D8
      D800D9D9D900DDDDDD0042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D0D0D00AFAFAF00E1E1E100DDDD
      DD00E1E1E100DDDDDD00E5E5E500AFAFAF0000000000000000008FA4B0005979
      8B00658295006585980063859C005F82990064869D006A8BA200698AA4005F85
      A0005C83A000648CAA00637D8D005C6261005D7786005F87A5006087A3006589
      A3006C8EA8006F8FAA00678AA7006589A30068879F0068879C00587C9300B8C6
      CF000000000000000000000000000000000000000000B7B7B700F0F0F000EBEB
      EB00E9E9E900ECECEC00D8D8D8006A6A660022242C00141B590018218900222B
      9D001B248E000C125F002E2E37002C2B270095959500EDEDED00EAEAEA00EAEA
      EA00EDEDED00818181002C2B260034364400293474002E3D9F003647B0002030
      9A0002105E002F3138007B7A7700F3F3F3000000000000000000000000000000
      00000000000000000000A3A1A100CBC9CB00DAE2E800DDE3E500D3CECD008F8B
      7C003C8438002A8F2B0037A13700B6CBB600B8D2B8002B9D2B005FA160009CBF
      9C0000000000D9D9D900CBCBCB00F4F4F400908E8E00FBFBFB00000000000000
      000000000000000000000000000000000000B7B7B700E7E7E700E1E1E100DFDF
      DF00DFDFDF00E3E3E300D3D3D300979797009696960097979600979796009797
      9600979796009797960097979600979796009797960097979600979796009796
      960097969600979696009796960094949400B0B0B000E5E5E500E0E0E000DADA
      DA00D4D4D400DEDEDE00ECECEC00AFAFAF00000000000000000096AAB6005D7A
      8E0067839700638397006283990064869F006988A2006989A2006488A2005E85
      A200668BAA00647C8C005C605D0060727D00628CAC00668CA800658BA7006A8E
      AB006D91AE00668DAB00668AA6006F8FA400708EA40068889F005C7E9700C0CC
      D4000000000000000000000000000000000000000000B8B8B800F1F1F100ECEC
      EC00EAEAEA00EBEBEB00E8E8E800969697006F6F6C005C5C5500515152005858
      5B005252540042423B00262522000E0E0E00B0B0B000EFEFEF00EAEAEA00EAEA
      EA00F2F2F20097979700070708002C2B28003F3E3700525252005B5B5D005051
      53005C5A54007A7A76009B9B9B00000000000000000000000000000000000000
      00000000000000000000A09F9F00D2D2D400E3E5F000E8EAF300D2D2DE005188
      56000B7E0B000F8F0F001099100090A990005DA95E000B910B00047903001772
      1700CDDECD0000000000EBEBEB00D4D4D40086838300FCFCFC00000000000000
      000000000000000000000000000000000000B8B8B800EDEDED00E7E7E700E5E5
      E500E5E5E500E4E4E400E8E8E800F3F3F300F3F3F300F3F4F400F3F3F400F3F3
      F400F3F3F400F3F3F400F3F3F400F3F3F400F3F3F400F3F3F400F3F4F500F3F4
      F500F3F4F500F3F4F500F3F4F400F4F4F400EFEFEF00E5E5E500E5E5E500E0E0
      E000DCDCDC00E2E2E200F2F2F200AFAFAF0000000000000000009DB0BC005B7A
      8E00658397006384980066869B0068889F006A8AA4006688A3006488A300678C
      A8006C92B100616F7500617581006380950061849D006889A200698FAE006B92
      B100678FB000688CA7007090A8007191A8006C8DA4006788A0005F819900C3CF
      D60000000000FEFFFF00000000000000000000000000B8B8B800F2F2F200EEEE
      EE00ECECEC00ECECEC00F1F1F100BFBFBF006161610058585800636361008787
      850065666300121211000000000025252500C6C6C600F3F3F300EDEDED00ECEC
      EC00F5F5F500B1B1B10016161600000000000C0C0C005A595800898987006666
      65005A5A5A0066666600D9D9D900000000000000000000000000000000000000
      00000000000000000000A09F9F00D5D4D500F0F0F400F9F7FC00CCD6D3002479
      27003D923D0055A8550051AD510095A4960082A1910022942A005FA36800327C
      3600558E5400F8F7F800FAFAFB00E2E1E10085828200FCFCFC00000000000000
      000000000000000000000000000000000000B8B8B800F3F3F300EDEDED00EBEB
      EB00EBEBEB00EBEBEB00EAEAEA00EAEAEA00EAECEE00EDEDEE00EEEEEE00EEEE
      EE00EEEEEF00EEEEEF00EEEEEF00EEEFEF00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEF00EDEEEE00EAEDEE00EAECED00EAEAEA00EBEBEB00EBEBEB00EBEB
      EB00ECECEC00EDEDED00F6F6F600AFAFAF000000000000000000A8BAC4005D7B
      8F006785980069879C006A89A0006A8AA1006989A100658BA300688EA9006B8F
      AB006A90AE0065869F0062798B006076850061737E0067849B006893B3006590
      AF00698EAA007091AA007392AA007190A9006A8BA4006587A00060829B00CAD4
      DC000000000000000000000000000000000000000000B8B8B800F2F2F200EFEF
      EF00EEEEEE00EFEFEF00F6F6F6009C9C9C004B4B4B005B5B5B004E4E4E006D6D
      6D006363630018181800000000002F2F2F009B9B9B00DBDBDB00EFEFEF00F0F0
      F000E2E2E20093939300232323000000000013131300595959006F6F6F004F4F
      4F005B5B5B004A4A4A00BBBBBB00000000000000000000000000000000000000
      00000000000000000000A4A3A300D5D4D400F8F8F8000000000091B891000667
      06005B9D5B00C8CFC800B8B8B7009F9C9B00A2A6B40073A78B00C2D1D5004087
      450013611200A3BAA300FCF9FD00F1F0F0008B888800FCFCFC00000000000000
      000000000000000000000000000000000000B8B8B800FAFAFA00F6F6F600F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5E3CE00EAC69D00E6C69E00E7CA
      A600E7CCAA00E7CDAC00E7CDAC00E7CBA900E7CAA400E7C79E00E7C29700E7BB
      9100E7B38900E7A97F00ECB99A00F1E8E300F5F7F800F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500FCFCFC00AFAFAF000000000000000000B4C3CC005D7D
      8F0068869A0069889E006A89A0006C8BA2006E8EA6006E8FA8006F90AB006C92
      AE00688FAC006990AF006E95B4006C8AA0006B8FAE006791B4006A90B0006B90
      AE006F92AF006E92AD007292AC006D8FA900678BA4006487A00067869F00D2DA
      E1000000000000000000000000000000000000000000B8B8B800F3F3F300F4F4
      F400F2F2F200F3F3F300FBFBFB00AFAFAF002626260059595900515151006D6D
      6D007B7B7B002F2F2F0001010100212121001010100064646400E6E6E600EEEE
      EE0079797900151515001D1D1D00010101002A2A2A006D6D6D00666666005050
      50005C5C5C0030303000CBCBCB00000000000000000000000000000000000000
      00000000000000000000AAA9A900D7D5D500FCFCFD000000000079AB79000F6F
      0F00137E130053935200A79A9A00AF979100AB999100ABABAA0079B17F001775
      1700115D1100799B790000000000FCFBFB008F8C8C00FCFCFC00000000000000
      000000000000000000000000000000000000B9B9B9000000000000000000FEFE
      FE00FEFEFE00FEFEFE00FEFFFF00FFF7EE00DB965E00BA702D00BD793900BD7D
      3F00BD804400BD814700BD814700BD804500BD7D3F00BD793700BD723000BD69
      2800BD5E1F00BC521200C7551600F3B99C00FEFFFF00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE000000000000000000AFAFAF000000000000000000BBC9D1005E7D
      910069889C006A8AA0006E8DA4006D8EA5006A8DA7006B8DA900688CA8006D8F
      AA00658CAC006A97B5007299B5006B96B6006998BA006D97B8006D93B1006F93
      B0007093B0006E93AF007092AD006C8EAA00688CA7006889A3006D8CA200D8E0
      E4000000000000000000000000000000000000000000B8B8B800F4F4F400F5F5
      F500F3F3F300F3F3F300F6F6F600E7E7E70049494900353535004F4F4F007979
      7900969696004141410004040400070707000000000009090900B9B9B900CFCF
      CF00171717000000000006060600060606003B3B3B007A7A7A00676767005151
      51004141410058585800FAFAFA00000000000000000000000000000000000000
      00000000000000000000B5B3B300D5D4D400FBFBFB0000000000BAD2BA000B68
      0B000675060071937000A0939B0092888600948382009B928C004D9C4C000968
      090022682200C0CEC000FFFCFF00FBFBFB0093909000FCFCFC00000000000000
      000000000000000000000000000000000000B9B9B90000000000000000000000
      0000000000000000000000000000FEEDE300DA915B00D5915900D79B6300D7A0
      6800D7A46E00D7A56F00D7A46F00D6A26C00D7A16900D79B6300D7945D00D78C
      5600D7834E00D67A4500D6693200EEA787000000000000000000000000000000
      0000000000000000000000000000AFAFAF000000000000000000C4CFD800617F
      92006D8B9E006D8BA1006E8DA3006C8CA5006A8CA700688AA7006D90AC006587
      A80045689900669BBD0071A1C10076ABCE007AAECE006691AC006B91B1007096
      B4007094B1006D92AE006D91AE006D8FAB006B8DA800688BA5007291A700DDE4
      E8000000000000000000000000000000000000000000B8B8B800F5F5F500F7F7
      F700F5F5F500F5F5F500F6F6F600FAFAFA00929292003B3B3B00383838004F4F
      4F006464640037373700151515000E0E0E000808080000000000838383009F9F
      9F0001010100070707000F0F0F00171717003333330055555500474747003939
      3900454545009595950000000000000000000000000000000000000000000000
      00000000000000000000BBB9B900D1D0D000FBFBFC0000000000A9C8A90065A0
      65007CB37C00C3D7C300C7D9C700E6E4E700DCE1DE00E5E6E600E2EEE200619C
      61007CA57C00FBF8FB00F8F8F800F8F8F80096939300FCFCFC00000000000000
      000000000000000000000000000000000000BCBCBC0000000000000000000000
      0000000000000000000000000000FBE8DD00EA9E6D00E3A06C00DFA06A00DFA4
      6C00DFA46A00DFA66C00DFA66C00E5AE7700E1A36B00DF9B6200DF945C00DF8D
      5600DF854E00E1814C00E77C4900EFA78600FEFFFF0000000000000000000000
      0000000000000000000000000000B3B3B3000000000000000000CED8DF006582
      95006D8A9E006C8BA2006C8CA400698CA600688AA6007295B0006D93B4004467
      9D003C5E98006B96BE0077A8C5006A9BB40053798B00466B7B006594B200719D
      BE006C93B2007195B2007597B1007293AE00668BA700658AA5007C98AC00E5E9
      EC000000000000000000000000000000000000000000B8B8B800F6F6F600F8F8
      F800F6F6F600F6F6F600F6F6F600FBFBFB00D6D6D60062626200555555004343
      430034343400303030002C2C2C00242424001E1E1E000C0C0C00626262007474
      74000C0C0C001D1D1D00252525002C2C2C002F2F2F0034343400414141005555
      55005C5C5C00CECECE0000000000000000000000000000000000000000000000
      00000000000000000000BEBBBB00CDCCCC00F9FAFA0000000000FEFDFE00F3EE
      F30095C195002A9B2A004FB44F00F2EDF200B7DBB8004CAE4C004CA34C00B3CC
      B300E5E3E500FCFBFC00FDFDFD00F8F8F80097959500FCFCFC00000000000000
      000000000000000000000000000000000000C6C6C600F9F9F900000000000000
      0000000000000000000000000000FAE5DA00D5865600BF7E5000BD835400C185
      5300C9854C00C9874E00CA884F00CC8B5300CA844B00C97E4500C9784000C971
      3A00C86A3100C9642D00D2632E00E9A07F000000000000000000000000000000
      00000000000000000000F7F7F700C6C6C6000000000000000000D6DEE5006784
      98006C8A9D006C8BA0006A89A300698CA6007394AE005E7DA2004F76A8004D74
      AB0039579100678DBB00628EA80057869C006091A700588BA2006FABCA0073AE
      D4006D97B8007A9EB9007596B400668BAB006289A6006F90AA00849DB100E8EC
      F0000000000000000000000000000000000000000000B9B9B900F6F6F600F9F9
      F900F7F7F700F7F7F700F7F7F700F8F8F800F7F7F700909090005B5B5B006262
      62005A5A5A004E4E4E0042424200383838003131310025252500515151005B5B
      5B00222222003030300039393900434343004E4E4E0058585800606060006B6B
      6B007A7A7A00FAFAFA0000000000000000000000000000000000000000000000
      00000000000000000000C1BEBE00CAC9C900F9F9F90000000000FDFCFD00F8F3
      F8007EB97E000D8D0D0019A31900B0DCB0009BD39B00129712000C810C005798
      5700E7E4E70000000000FEFEFE00FCFCFC0098969600FDFDFD00000000000000
      000000000000000000000000000000000000DDDDDD00E2E2E200000000000000
      0000000000000000000000000000F9DFD200E0997400CDA08700CBA18700D2A5
      8800E1AC8500E0AB8400DFAA8200DFA87F00DFA67D00DFA37B00DFA07700E09C
      7400E49D7800EAA38400E9977400E89F7E000000000000000000000000000000
      00000000000000000000DBDBDB00EAEAEA000000000000000000DEE5EA006C89
      9C006C8A9F006B89A2006A8BA5006C8DAA005475A50038558F003F5E93003E5C
      95003B5896005D84B70071A4C3006094AC00669CB7006099B1004C7DA200699E
      CC00486CA3004F70A000638BAE00608BAC006D91AD007F9BB3008BA4B700EBEF
      F2000000000000000000000000000000000000000000B9B9B900F7F7F700FAFA
      FA00F8F8F800F8F8F800F8F8F800F8F8F800FEFEFE00CFCFCF00757575006F6F
      6F00686868005F5F5F0054545400525252004B4B4B0040404000383838003939
      39003C3C3C004B4B4B0051515100555555005D5D5D0065656500717171008181
      8100AFAFAF000000000000000000000000000000000000000000000000000000
      00000000000000000000C3C1C100C7C6C600F8F8F80000000000FCFCFC00F8F5
      F800E5ECE5003AA33A000B9D0B0025B5250023B023000C930C00429F420089B5
      8900C4CEC400EEEDEE00FEFEFE00FEFEFE0099979700FDFDFD00000000000000
      000000000000000000000000000000000000FDFDFD00C3C3C300FBFBFB000000
      0000000000000000000000000000F7DDD100EBAD9300EBB7A200E9B5A000EBBA
      A400EDBDA300EBBBA000EABA9D00EAB89C00EAB79A00EAB59800EAB39700ECB1
      9600EDB19600EDB09600EBA98B00E7A58600FEFEFE0000000000000000000000
      000000000000FBFBFB00B8B8B800000000000000000000000000E3E9ED006E8B
      9E0067879E006A8BA400688AA80044608C0039577C00304E6A00355771003557
      740037587B00436486006C9CBD005B92A900659DB8006AA6C50048709F004E7C
      B0005E8EC2004E72AE005B89BC00688FB2008CA6BC0088A2B800839FB400EBEE
      F2000000000000000000000000000000000000000000B9B9B900F7F7F700FCFC
      FC00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FCFCFC00BABABA008A8A
      8A008D8D8D00818181006D6D6D006161610064646400555555003D3D3D003B3B
      3B00515151006363630062626200696969007575750086868600949494008E8E
      8E00F1F1F1000000000000000000000000000000000000000000000000000000
      00000000000000000000C7C4C400C4C3C300F7F7F70000000000FDFDFD00F7F7
      F700FFFAFF00C7E3C7006CC36C0063C963006FCB6F006DBD6D00C0E1C000FCF8
      FC00CBCCCB00F6F6F60000000000FDFDFD0093929200FBFBFB00000000000000
      00000000000000000000000000000000000000000000FDFDFD00D3D3D300CCCC
      CC00D3D3D300EDEDED00FDFEFF00FADBCE00F3C1AA00FAD7C700F9D2C000F7D0
      BC00F5CDB800F5CCB800F5CCB700F5CAB600F5C9B400F5C7B200F5C5AF00F4C4
      AF00F4C5B100F5C9B400F4C2AC00E6A48600FEFDFC00EAEAEA00DBDBDB00C8C8
      C800CBCBCB00D4D4D40000000000000000000000000000000000E8ECF0007490
      A10067879B006D91AF006992B1002E4A5B0045748500436B7D0054819900436E
      83004E7B9100304F63006B98BC00649EBF00629AC000639BCF00456B9E00588E
      C10062A0D7005F88C3005C85C400587EB7007C9CBE007999B2007896AE00EEF2
      F4000000000000000000000000000000000000000000B9B9B900F8F8F800FDFD
      FD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FDFDFD00FDFDFD00BEBE
      BE00838383009C9C9C008E8E8E00818181007A7A7A0067676700646464005858
      580063636300787878007D7D7D00878787009393930085858500BCBCBC00B8B8
      B800FAFAFA000000000000000000000000000000000000000000000000000000
      00000000000000000000CAC7C700C0BFBF00F7F7F70000000000FEFEFE00FCFC
      FC00FCFCFC00FEFEFE00FFFEFF00FFFDFF00FFFEFF000000000000000000F7F7
      F700E0E0E000FBFBFB0000000000FCFCFC008D8B8B00FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDED00C1C1C100DFE4E600CCB3A700E39E8000F2C9B700F4CEBC00F7D3
      C400F8DBCD00F9DACD00F9DBCD00FADACC00FADACC00F9D9CB00F9D9CB00F8D4
      C500F4CCBB00F1C7B400E9A88A00D1917400E7EAEB00BDBDBD00DADADA00F2F2
      F200000000000000000000000000000000000000000000000000ECF0F400698A
      9C00537583006A95B3004C6F890022404C0089B9D700547F97006190AA0076A9
      C6006293AF0032576A006592B5004D79AB005F8CBD004D76AA00537DAE00628F
      BC0061A7DD005481BD00658AC3005C85C400507DC1003F67B5006A91C000F1F6
      F8000000000000000000000000000000000000000000B9B9B900F8F8F800FDFD
      FD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB0000000000E9E9
      E900404040005B5B5B006A6A6A007C7C7C00A0A0A00086868600707070006161
      61007F7F7F009D9D9D0071717100686868006161610037373700E1E1E100C0C0
      C000F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000CCCACA00BDBCBC00F6F6F60000000000FEFEFE000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800D8D8D800E9E9E900FDFDFD00F8F8F80094939300FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BABABA00F4F3F300B3B4B500F4E9E500F3E1D800F3DCD200F2DB
      D000F2DDD400F1DFD700EFE1DA00EDDDD700EBDCD400E9D9D200E5D2CA00E2CF
      C800DFCCC400DCCAC100DACDC500D3D2D100ECECEC00C2C2C200000000000000
      00000000000000000000000000000000000000000000000000000000000091AA
      BC0049708A006D98B700597F9B0024434E00678FA6005E8AA000517F9400365C
      6C002D4F600023404E00527C99006995BF006795BF006E9BC40075A2CD006D9A
      C5005E9CCE004E83CA004F77C8004A75C700517BC8003D60BB00436DC100C3DB
      EC000000000000000000000000000000000000000000BABABA00F9F9F900FDFD
      FD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FCFCFC000000
      000092929200393939003939390049494900AAAAAA00AEAEAE00757575006363
      6300A8A8A800A1A1A100404040003C3C3C00393939007B7B7B00FDFDFD00B9B9
      B900F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCCCC00B8B7B700F6F6F6000000000000000000FDFD
      FD00FAFAFA00FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FEFEFE00FCFC
      FC00E9E9E900EEEEEE0000000000F4F4F400A19F9F00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7B7B700FEFEFE00C6C5C600FCFCFD0000000000000000000000
      000000000000FDFFFF00F9FDFE00F6F9FB00F2F6F700F0F4F500EDF1F200EAEE
      F000E7EAEC00E4E8E900E3E5E700D7D7D800ECECEC00C2C2C200FAFAFA000000
      000000000000000000000000000000000000000000000000000000000000EDF0
      F3008DA5B500598AAB006696B90048728E0024445000213A440031556A004675
      93005280A2005180A4004F7E9F0070A3CC005884B20081B0D700628DBB005780
      AF0037548400588ECB005C85D1006F9DD6006D99D2005178C2004870C0007199
      D000ECF2F80000000000000000000000000000000000BABABA00FAFAFA00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FEFE
      FE00F9F9F900BDBDBD009F9F9F00C6C6C600F9F9F900FDFDFD00D2D2D200C6C6
      C600F8F8F800EEEEEE00B8B8B80098989800ADADAD00E5E5E500F5F5F500B4B4
      B400F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000D1CECE00C4C0C000E9E9E900DADADA00D8D8D800E2E2
      E200EAEAEA00F0F0F000F5F5F500F8F8F800FBFBFB00FEFEFE0000000000FDFD
      FD00F0F0F000FAFAFA0000000000F8F7F600AAA8A800FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7B7B70000000000CECECE00FBFBFB0000000000000000000000
      000000000000FEFEFE00FBFBFB00F7F7F700F3F3F300F1F1F100EDEDED00EBEB
      EB00E7E7E700E5E5E500E4E4E400D7D7D700ECECEC00C2C2C200FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE00A2BED0005A91B700639BC1006399BD00598DB1005F98C20064A0
      CC0066A1D100619DC80074ADD6006395BF003F689700456F9F003B6295003754
      81002F4370005483B100608FD200658FCE005B87C800476DBA004065B700446E
      BC00A4C0DD00FEFEFE00000000000000000000000000BABABA00FBFBFB000000
      0000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FEFEFE00000000000000000000000000FEFEFE00FDFDFD0000000000FEFE
      FE00F4F4F400F0F0F000F1F1F100EFEFEF00ECECEC00E5E5E500EDEDED00B4B4
      B400F8F8F8000000000000000000000000000000000000000000000000000000
      00000000000000000000DAD9D9009E9C9C00A8A9A900D9D9D900F2F2F200FBFB
      FB000000000000000000000000000000000000000000FDFDFD00FAFAFA00F2F2
      F200C0BFBE00DAD5D4009AD6E400AEDEE900E2D7D500FEFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7B7B70000000000D2D2D200FBFBFB0000000000000000000000
      00000000000000000000FDFDFD00F9F9F900F5F5F500F2F2F200EFEFEF00EDED
      ED00E9E9E900E7E7E700E6E6E600D9D9D900ECECEC00C2C2C200FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0F6F9006B9BBE005B8FB50067A0C8005E98C3005C95BF005B96
      C100609BC7006099C50073ACD3005F8CB5001E3966003E649500659AC800699F
      C9005C8FBB005C91BE00669CD2002E4DAC004365BC005379C1005B87C2005785
      BD007AA5CD00E6EEF300000000000000000000000000BABABA00FBFBFB000000
      0000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F4F4
      F400EEEEEE00E6E6E600E1E1E100DDDDDD00DADADA00DBDBDB00E4E4E400ACAC
      AC00FCFCFC000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E3E3005B585800F1F1F10000000000000000000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00F9F9F900EFEFEF00E9E9E900E2E1
      E100C1BFBE00A3CED7004BD5F30035CAEB00A9C9D10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B7B7B70000000000D6D6D600FCFCFC0000000000000000000000
      00000000000000000000FEFEFE00FBFBFB00F7F7F700F5F5F500F1F1F100EFEF
      EF00ECECEC00E8E8E800E7E7E700D9D9D900EBEBEB00C1C1C100FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDFD007CA4C0004D80A400679EC6006198C1005590BB005B98
      C00065A1CA005C90B8004C76A1006FA0C7006095C200669FCC006DA6D0006EA5
      D30069A0C9005885AA006395B7003E65B7005A83C2006E9FC9006A9AC5005887
      BC004368A3009CBBD100000000000000000000000000BABABA00FBFBFB000000
      0000FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F7F7F700ECEC
      EC00D1D1D100D4D4D400D4D4D400D5D5D500D6D6D600D4D4D400C4C4C400BCBC
      BC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B7B6B600F9F9F90000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00F4F4F400E9E9E900DBDCDC00D7D5D500D6D2
      D200C0D7DC009FECFC007DEAFF0055E3FF003FCBEA00D5EDF300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B50000000000DBDBDB00FCFCFC0000000000000000000000
      0000000000000000000000000000FDFDFD00F9F9F900F6F6F600F3F3F300F0F0
      F000EDEDED00EAEAEA00E9E9E900DBDBDB00EAEAEA00C0C0C000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000095B6CD004B7FA100679DC00070A8CC0075AAD00087B9
      DA0093C1DE0094C1DF0089B4D4008BBCDE00669CD200639BCE006DA5D0006DA5
      D1006BA2C9004A768F005A84960079A9D4006A9EC7006A9CC2006C9EC2005280
      B900203D820049729A00D8E8EF000000000000000000BBBBBB00FBFBFB00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F5F5F500E0E0
      E000DEDEDE00FBFBFB00FAFAFA00FBFBFB00F1F1F100D3D3D300BCBCBC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8D8D800FCFCFC0000000000FEFEFE00FEFE
      FE00FEFEFE0000000000F6F6F600E4E4E400E6E6E600F7F5F500DAE1E300BBD9
      E000E4FAFD00C9F7FF00A6F0FE0082E9FE005CE8FF0054CCE700F9FCFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B8B800F5F5F500DBDBDB00FDFDFD0000000000000000000000
      0000000000000000000000000000FEFEFE00FCFCFC00F8F8F800F5F5F500F2F2
      F200EEEEEE00EBEBEB00EAEAEA00DBDBDB00EAEAEA00C0C0C000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D2DFEB00B7D2E500C7DCEB00D6E6F200BDD2E1007194
      B300688CA7007BAAC50073AACA005F95BD00619AD0006DA6CF00649ECB006AA0
      CB0075A8CF007AA9CC007EADD10085B0D1006A9DC3005D94BA005E92B5005F93
      BA006588AE0096B0C800DBE6EE000000000000000000BBBBBB00FBFBFB00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F8F8F800F3F3F300E1E1
      E100E7E7E70000000000FEFEFE00EFEFEF00D4D4D400BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D4D4D400FCFCFC0000000000FEFEFE00FEFE
      FE0000000000FBFBFB00ECECEC00D5D5D500DFDEDE00F6F4F4008BC6D30076DC
      F100BEF6FF009FEEFE008AEAFE007AEAFF0058D8F400ABDEEA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBEBEB00C4C4C400ABABAB000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FAFAFA00F7F7F700F3F3
      F300F0F0F000EDEDED00ECECEC00DDDDDD00EAEAEA00C0C0C000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFE00CDD8
      E2006A8CA700608AAA0078B1D2006095B7006EA7D00083B2D300A9C9E000DAE8
      F300C5DBEB005D8EB4005D94BE005C93B9004E8CB500558FB5008AB0CC00C1D3
      E500F0F7FA0000000000000000000000000000000000BBBBBB00FCFCFC00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F8F8F800F3F3F300E3E3
      E300EAEAEA0000000000F0F0F000C8C8C800C5C5C50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D3D3D300FDFDFD0000000000000000000000
      000000000000FCFCFC00ECECEC00D6D5D500DBD7D500DFE6E80092DCEC007DDF
      F400D0F8FF00B2F2FF00A4F3FF0074D9EF00C4E6EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ACACAC000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F9F9F900F5F5
      F500F2F2F200EEEEEE00EEEEEE00DDDDDD00EAEAEA00C0C0C000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECEFF30086A0B7006497BD009BC0DB00D4E3EF00F6F9FB00000000000000
      0000FBFDFD006B97B400487CA300669CC0008BB3CF00C0D3E500EEF2F8000000
      00000000000000000000FEFFFF000000000000000000BCBCBC00FCFCFC00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00F9F9F900F3F3F300E7E7
      E700EDEDED00F1F1F100CACACA00D3D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCDCDC00DDDDDD00DDDDDD00DCDCDC00DCDC
      DC00DCDCDC00D8D8D800D1D0D000B6BABA00C3D3D60000000000C2F0F90096E8
      F900EEFDFF00D0F9FF008BD9EA00D6EEF3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3B3B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE00E8E8E800E9E9E900C0C0C000FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F9FB00C5D2DD00F5F6F9000000000000000000000000000000
      000000000000B9D2E1008EB0CA00CFDEEA00F4F6F800FFFFFE00000000000000
      00000000000000000000000000000000000000000000BBBBBB00FCFCFC00FEFE
      FE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FAFAFA00F5F5F500EDED
      ED00E9E9E900D1D1D100D2D2D200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F60000000000BDD6DD00E3F9FE00EAFCFF00B5F1
      FF00F3FCFD009FD8E500F5FBFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8B8B800CFCFCF00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CACACA00FCFCFC00C8C8C800FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFDFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FAFAFA00F6F6
      F600DCDCDC00CFCFCF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1DFEA00E4F7FA00C3F3
      FC00A9DAE6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00F6F6F600F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F8F8F800F0F0F000D2D2D200D6D6D600000000000000
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
      000000000000000000000000FFFFFF00E0000007FFFFFC7FFFFFFFFF00000000
      C0000003FFFFF83FFFFFFFFF0000000080000001FC000001FFFFFFFF00000000
      80000000FDFFE03DFFFFFFFF0000000000000000FC000005FFFFFFFF00000000
      00000000FC000005FFFFFFFF000000000003E000FC000005FFFFFFFF00000000
      001FF800FC3E0185FFFFFFFF0000000000381C00FC0000058000000000000000
      00700600FC380785000000000000000000C00300FC0400050000000000000000
      01C00180F80A1F85000000000000000001800180E00400050000000000000000
      018001C0D5407F850000000000000000018000C0A68000050000000000000000
      018000C08550FF850000000000000000018000C0068000050000000000000000
      0181818005547F85000000000000000001818180068000050000000000000000
      00C1838005547F85000000000000000000E1870006A800050000000000000000
      00718E0085548005000000000000000000018C0084A800050000000000000000
      00018000C451F005000000000000000000018000E42000050000000000000000
      00018000F8080001000000000000000000018000FC0000130000000000000000
      00000000FC000027000000000000000080000000FC00004F0000000000000000
      80000001FC00001F0000000000000000C0000003FC00003F0000000000000000
      E0000007FC00007F0000000000000000F000001FFFFFFFFF80000003E000001F
      F800001FFFFFFFFF80000001C0000007F800001FC000000F80000000C007F007
      000000008000000F80000000C0000007000000008000000F80000000E000000F
      00000000C000000F80000000F403803F00000000C000000F80000000FC00003F
      00000000C000000F80000000FC00083F00000000C000000F80000001FC00043F
      00000000C000000B80000001FC00003F00000000C000000F80000001FC40003F
      00000000C000000F80000001FC40023F60000006C000000F80000001FC40003F
      7E0000FEC000000F80000003FC40003F7E00007EC000000F80000003FC40003F
      3E0000FCC000000F80000003FC40043F3E0000FCC000000F80000007FC40003F
      1E000079C000000F80000007FC40023F80000003C000000F80000007FC40623F
      F000000FC000000F80200007FC5FE03FF800003FE000000F80100007FC60023F
      F878001FE000000780000007FC00223FFA78001FF000000390072007FC0F803F
      FA7C001FF800000390000007FC72007FFA7C001FF80000039000000FFE40003F
      FA7E001FFC0000018000001FFE44001FF87E001FFC0000018000043FFE48003F
      F8FF001FFFC000078000047FFE78007FFEFF801FFFF0301D800000FFFE0040FF
      FEFFF81FFFF8F83F800001FFFE0101FFFE00001FFFFFFDFFB00003FFFFFF87FF
      FE00003FFFFFFFFF800007FFFFFFCFFF00000000000000000000000000000000
      000000000000}
  end
  object Reporte: TppReport
    AutoStop = False
    DataPipeline = plReporte
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'LIQUIDACION '
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 50
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 536
    Top = 48
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'plReporte'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 50800
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'Fecha'
        DataPipeline = plLiqPro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plLiqPro'
        mmHeight = 3725
        mmLeft = 124206
        mmTop = 15342
        mmWidth = 67733
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Caption = 'ORIGINAL'
        Ellipsis = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 165100
        mmTop = 33020
        mmWidth = 20489
        BandType = 0
        LayerName = Foreground
      end
      object ppVariable1: TppVariable
        DesignLayer = ppDesignLayer1
        UserName = 'Variable1'
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 15342
        mmTop = 34392
        mmWidth = 13293
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppVariable8: TppVariable
        DesignLayer = ppDesignLayer1
        UserName = 'Variable8'
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 794
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground
      end
      object ppVariable6: TppVariable
        DesignLayer = ppDesignLayer1
        UserName = 'Variable6'
        BlankWhenZero = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 794
        mmWidth = 148432
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppVariable3: TppVariable
        DesignLayer = ppDesignLayer1
        UserName = 'Variable3'
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 3704
        mmWidth = 14023
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Total a liquidar de estos inquilinos:'
        Ellipsis = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 3704
        mmWidth = 65352
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'Documentacion'
        DataPipeline = plTitulo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9868950
        Font.Name = 'Arial'
        Font.Size = 24
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plTitulo'
        mmHeight = 9790
        mmLeft = 6615
        mmTop = 13758
        mmWidth = 182298
        BandType = 7
        LayerName = Foreground
      end
      object ppVariable9: TppVariable
        DesignLayer = ppDesignLayer1
        UserName = 'Variable9'
        BlankWhenZero = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 8996
        mmWidth = 176477
        BandType = 7
        LayerName = Foreground
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066570726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D2020706C4C697150726F5B27
        496E7175696C696E6F275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D6506095661726961626C6531094576656E744E616D6506064F6E43616C
        63074576656E7449440221084361726574506F730102030202000001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060F5661726961
        626C65384F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F7572636506B170726F636564757265205661726961626C65384F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A62656769
        6E0D0A20206966204C656E67746828706C5265706F7274655B27496D706F7274
        65275D29203E2033207468656E200D0A2020202056616C7565203A3D20272420
        27202B20706C5265706F7274655B27496D706F727465275D0D0A2020656C7365
        0D0A2020202056616C7565203A3D2027273B200D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506095661726961626C6538094576656E744E616D65
        06064F6E43616C63074576656E7449440221084361726574506F730102030203
        000001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F5661726961626C65334F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365066E70726F63656475726520566172
        6961626C65334F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D2027546F74616C3A2024
        2027202B20706C546974756C6F5B27546F74616C275D3B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D6506095661726961626C6533094576656E74
        4E616D6506064F6E43616C63074576656E7449440221084361726574506F7301
        02030202000001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060F5661726961626C65364F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F75726365068470726F636564757265
        205661726961626C65364F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2020706C5265
        706F7274655B27446972656363696F6E275D202B20272027202B2020706C5265
        706F7274655B27506572696F646F275D3B0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D6506095661726961626C6536094576656E744E616D650606
        4F6E43616C63074576656E7449440221084361726574506F7301020302020000
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65394F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365149500000070726F636564757265205661
        726961626C65394F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027456C20C3BA6C74
        696D6F2064C3AD612068C3A162696C2064652063616461206D65732C206E6F20
        68616272C3A1206174656E6369C3B36E20616C2070C3BA626C69636F2E273B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C
        6539094576656E744E616D6506064F6E43616C63074576656E74494402210843
        61726574506F730102000200000000}
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object plReporte: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte'
    Left = 744
    Top = 88
    object plReporteppField1: TppField
      FieldAlias = 'Direccion'
      FieldName = 'Direccion'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object plReporteppField2: TppField
      FieldAlias = 'Periodo'
      FieldName = 'Periodo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object plReporteppField3: TppField
      FieldAlias = 'Importe'
      FieldName = 'Importe'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporteppField4: TppField
      FieldAlias = 'Total'
      FieldName = 'Total'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
  object plTitulo: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plTitulo'
    OnGetFieldValue = plTituloGetFieldValue
    Left = 728
    Top = 184
    object plTituloppField1: TppField
      FieldAlias = 'Total'
      FieldName = 'Total'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object Documentacion: TppField
      FieldAlias = 'Documentacion'
      FieldName = 'Documentacion'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
  end
  object plLiqPro: TppDBPipeline
    DataSource = DataSource1
    UserName = 'plLiqPro'
    Left = 656
    Top = 8
  end
  object ReporteDuplicado: TppReport
    AutoStop = False
    DataPipeline = plReporte
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'LIQUIDACION'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 50
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 608
    Top = 96
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'plReporte'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 50800
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        DataField = 'Fecha'
        DataPipeline = plLiqPro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plLiqPro'
        mmHeight = 3725
        mmLeft = 124206
        mmTop = 15342
        mmWidth = 67733
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        AutoSize = False
        Caption = 'DUPLICADO'
        Ellipsis = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 165100
        mmTop = 33020
        mmWidth = 20489
        BandType = 0
        LayerName = Foreground1
      end
      object ppVariable2: TppVariable
        DesignLayer = ppDesignLayer2
        UserName = 'Variable1'
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 15342
        mmTop = 34392
        mmWidth = 13293
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppVariable4: TppVariable
        DesignLayer = ppDesignLayer2
        UserName = 'Variable8'
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 794
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground1
      end
      object ppVariable5: TppVariable
        DesignLayer = ppDesignLayer2
        UserName = 'Variable6'
        BlankWhenZero = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 11642
        mmTop = 794
        mmWidth = 148432
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppVariable7: TppVariable
        DesignLayer = ppDesignLayer2
        UserName = 'Variable3'
        BlankWhenZero = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 3704
        mmWidth = 14023
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Total a liquidar de estos inquilinos:'
        Ellipsis = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 3704
        mmWidth = 65352
        BandType = 7
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        DataField = 'Documentacion'
        DataPipeline = plTitulo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9868950
        Font.Name = 'Arial'
        Font.Size = 24
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plTitulo'
        mmHeight = 9790
        mmLeft = 6615
        mmTop = 13758
        mmWidth = 182298
        BandType = 7
        LayerName = Foreground1
      end
      object ppVariable10: TppVariable
        DesignLayer = ppDesignLayer2
        UserName = 'Variable9'
        BlankWhenZero = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 8996
        mmWidth = 176477
        BandType = 7
        LayerName = Foreground1
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066570726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D2020706C4C697150726F5B27
        496E7175696C696E6F275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D6506095661726961626C6531094576656E744E616D6506064F6E43616C
        63074576656E7449440221084361726574506F730102000200000001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060F5661726961
        626C65384F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F7572636506B170726F636564757265205661726961626C65384F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A62656769
        6E0D0A20206966204C656E67746828706C5265706F7274655B27496D706F7274
        65275D29203E2033207468656E200D0A2020202056616C7565203A3D20272420
        27202B20706C5265706F7274655B27496D706F727465275D0D0A2020656C7365
        0D0A2020202056616C7565203A3D2027273B200D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506095661726961626C6538094576656E744E616D65
        06064F6E43616C63074576656E7449440221084361726574506F730102000200
        000001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F5661726961626C65334F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365066E70726F63656475726520566172
        6961626C65334F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D2027546F74616C3A2024
        2027202B20706C546974756C6F5B27546F74616C275D3B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D6506095661726961626C6533094576656E74
        4E616D6506064F6E43616C63074576656E7449440221084361726574506F7301
        02000200000001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060F5661726961626C65364F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F75726365068470726F636564757265
        205661726961626C65364F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2020706C5265
        706F7274655B27446972656363696F6E275D202B20272027202B2020706C5265
        706F7274655B27506572696F646F275D3B0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D6506095661726961626C6536094576656E744E616D650606
        4F6E43616C63074576656E7449440221084361726574506F7301020002000000
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65394F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365149500000070726F636564757265205661
        726961626C65394F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027456C20C3BA6C74
        696D6F2064C3AD612068C3A162696C2064652063616461206D65732C206E6F20
        68616272C3A1206174656E6369C3B36E20616C2070C3BA626C69636F2E273B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C
        6539094576656E744E616D6506064F6E43616C63074576656E74494402210843
        61726574506F730102000200000000}
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qLiqPro: TFXQuery
    Connection = DM.Conexion
    Left = 669
    Top = 86
  end
end
