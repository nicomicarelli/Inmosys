object fListadoCobrados: TfListadoCobrados
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Recibos y Cobros - Deuda por inquilino'
  ClientHeight = 453
  ClientWidth = 818
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gDetalle: TStringAlignGrid
    Left = 0
    Top = 91
    Width = 818
    Height = 126
    Align = alTop
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      64
      263
      -1
      267
      199)
    Cells = (
      0
      0
      'C'#243'digo'
      1
      0
      'Inquilino'
      2
      0
      'Adeuda'
      3
      0
      'Pagado'
      4
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
      0
      4
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
      0
      3
      1
      0
      4
      1
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Transparent = True
    Height = 91
    Width = 818
    object Label1: TLabel
      Left = 10
      Top = 19
      Width = 66
      Height = 13
      Caption = 'C'#243'digo Desde'
    end
    object Label2: TLabel
      Left = 10
      Top = 43
      Width = 44
      Height = 13
      Caption = 'Inquilino:'
    end
    object Label3: TLabel
      Left = 176
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label6: TLabel
      Left = 170
      Top = 69
      Width = 75
      Height = 13
      Caption = 'Fecha de Pago:'
    end
    object edDesde: TEdit
      Left = 91
      Top = 14
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 0
      OnChange = edDesdeChange
      OnKeyDown = edDesdeKeyDown
      OnKeyPress = edDesdeKeyPress
    end
    object edDescripcion: TEdit
      Left = 91
      Top = 40
      Width = 203
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnChange = edDescripcionChange
    end
    object edHasta: TEdit
      Left = 214
      Top = 14
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 1
      OnChange = edHastaChange
    end
    object TodosCodigos: TCheckBox
      Left = 300
      Top = 16
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = TodosCodigosClick
    end
    object TodosDescripcion: TCheckBox
      Left = 300
      Top = 42
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = TodosDescripcionClick
    end
    object cbFechaPago: TComboBox
      Left = 249
      Top = 67
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'TODOS'
      Items.Strings = (
        'TODOS'
        '1'#186' al 10'
        '1'#186' al 15'
        '1'#186' al 20'
        '1'#186' al 25')
    end
    object chDesocupados: TCheckBox
      Left = 10
      Top = 67
      Width = 134
      Height = 17
      Caption = 'Mostrar desocupados'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object GroupBox2: TGroupBox
      Left = 380
      Top = 7
      Width = 332
      Height = 37
      Caption = 'Pagado'
      TabOrder = 7
      Visible = False
      object Label4: TLabel
        Left = 7
        Top = 18
        Width = 66
        Height = 13
        Caption = 'Fecha Desde:'
      end
      object Label5: TLabel
        Left = 161
        Top = 16
        Width = 32
        Height = 13
        Caption = 'Hasta:'
      end
      object Edit6: TEdit
        Left = 79
        Top = 12
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 0
        OnChange = Edit6Change
      end
      object Edit8: TEdit
        Left = 198
        Top = 13
        Width = 80
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 1
        OnChange = Edit8Change
      end
      object chFechas: TCheckBox
        Left = 281
        Top = 14
        Width = 52
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
        Visible = False
        OnClick = chFechasClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 380
      Top = 3
      Width = 332
      Height = 40
      Caption = 'Deuda'
      TabOrder = 8
      object Label7: TLabel
        Left = 7
        Top = 15
        Width = 66
        Height = 13
        Caption = 'Fecha Desde:'
      end
      object Label8: TLabel
        Left = 161
        Top = 15
        Width = 32
        Height = 13
        Caption = 'Hasta:'
      end
      object edFechaDesde: TEdit
        Left = 79
        Top = 12
        Width = 75
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 0
        OnChange = edFechaDesdeChange
      end
      object edFechaHasta: TEdit
        Left = 198
        Top = 12
        Width = 80
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 1
        OnChange = edFechaHastaChange
      end
      object CheckBox1: TCheckBox
        Left = 281
        Top = 13
        Width = 52
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
        Visible = False
        OnClick = CheckBox1Click
      end
    end
    object Actualizar: TAdvGlowButton
      Left = 725
      Top = 56
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
      TabOrder = 9
      TabStop = True
      OnClick = ActualizarClick
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
    object chPrelegales: TCheckBox
      Left = 380
      Top = 68
      Width = 181
      Height = 17
      Caption = 'Ver SOLO En Prelegales/Legales'
      TabOrder = 10
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 217
    Width = 818
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object gDetalle1: TStringAlignGrid
      Left = 0
      Top = 0
      Width = 818
      Height = 155
      Align = alClient
      ColCount = 10
      DefaultRowHeight = 17
      FixedCols = 0
      RowCount = 20
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnDblClick = gDetalle1DblClick
      ShowCellHints = False
      ColWidths = (
        64
        312
        103
        103
        103
        103
        100
        -1
        300
        64)
      Cells = (
        0
        0
        'C'#243'digo'
        1
        0
        'Inquilino'
        2
        0
        'Alquileres'
        3
        0
        'Impuestos'
        4
        0
        'Otros'
        5
        0
        'Total Neto'
        6
        0
        'Punitorios'
        7
        0
        'Total Deuda'
        8
        0
        'Mail'
        9
        0
        'DNI')
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
        0
        4
        0
        1
        2
        0
        4
        1
        1
        0
        0
        5
        0
        1
        2
        0
        6
        0
        1
        2
        0
        7
        0
        1
        0
        0
        8
        0
        1
        2
        0
        9
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
        0
        3
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
        5
        1
        0
        4
        9625305
        0
        6
        -16777208
        -11
        'Tahoma'
        0
        609103873
        0
        6
        1
        0
        0
        7
        1
        0
        0)
      PropRow = ()
      PropFixedCol = ()
      PropFixedRow = ()
    end
    object gDeuda: TAdvStringGrid
      Left = 0
      Top = 0
      Width = 818
      Height = 155
      Cursor = crDefault
      Align = alClient
      ColCount = 11
      Ctl3D = True
      DefaultRowHeight = 21
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 20
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      ParentCtl3D = False
      PopupMenu = popOpciones
      ScrollBars = ssBoth
      TabOrder = 2
      OnDblClick = gDeudaDblClick
      GridLineColor = 15527152
      GridFixedLineColor = 13947601
      HoverRowCells = [hcNormal, hcSelected]
      OnGetAlignment = gDeudaGetAlignment
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
        'Inquilino'
        'Alquileres'
        'Impuestos'
        'Otros'
        'Total Neto'
        'Punitorios'
        'Total Deuda'
        'Mail'
        'DNI')
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
      ExplicitLeft = 98
      ExplicitTop = 59
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
        98
        64)
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
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 184
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Transparent = True
      Height = 52
      Width = 818
      object Shape1: TShape
        Left = 128
        Top = 25
        Width = 33
        Height = 10
        Brush.Color = clYellow
        Pen.Color = 4194368
      end
      object Label9: TLabel
        Left = 165
        Top = 23
        Width = 174
        Height = 13
        Caption = 'Tiene saldo alquiler/alquiler a cuenta'
      end
      object Shape2: TShape
        Left = 128
        Top = 38
        Width = 33
        Height = 10
        Brush.Color = clRed
        Pen.Color = 4194368
      end
      object Label10: TLabel
        Left = 164
        Top = 36
        Width = 134
        Height = 13
        Caption = 'En Prelegales/Legales/Juicio'
      end
      object btnGrabar: TAdvGlowButton
        Left = 552
        Top = 21
        Width = 150
        Height = 29
        BorderStyle = bsNone
        Caption = 'Imprimir Abonados'
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
        Visible = False
        OnClick = btnGrabarClick
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
        Left = 728
        Top = 21
        Width = 88
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
      object bitbtn1: TAdvGlowButton
        Left = 3
        Top = 20
        Width = 89
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
        TabOrder = 2
        TabStop = True
        OnClick = btnGrabarClick
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
      object ProgressBar1: TProgressBar
        Left = 2
        Top = 2
        Width = 814
        Height = 17
        Align = alTop
        TabOrder = 3
      end
      object AdvGlowButton1: TAdvGlowButton
        Left = 387
        Top = 21
        Width = 129
        Height = 29
        BorderStyle = bsNone
        Caption = 'Enviar Mails'
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
    object PanelMails: TPanel
      Left = 0
      Top = 155
      Width = 818
      Height = 29
      Align = alBottom
      Caption = 
        'Espere... enviando mails. NO podr'#225' realizar otras tareas mientra' +
        's se ejecuta el proceso. Aguarde por favor.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
  object plReporte: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte'
    Left = 488
    Top = 88
    object plReporteppField1: TppField
      FieldAlias = 'C'#243'digo'
      FieldName = 'C'#243'digo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object plReporteppField2: TppField
      FieldAlias = 'Inquilino'
      FieldName = 'Inquilino'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object plReporteppField3: TppField
      FieldAlias = 'Total Neto'
      FieldName = 'Total Neto'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporteppField4: TppField
      FieldAlias = 'Mail'
      FieldName = 'Mail'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
  object Titulo: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'Titulo'
    OnGetFieldValue = TituloGetFieldValue
    Left = 392
    Top = 141
    object TituloppField1: TppField
      FieldAlias = 'Filtro por Codigo'
      FieldName = 'Filtro por Codigo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object TituloppField4: TppField
      FieldAlias = 'Filtro por Inquilino'
      FieldName = 'Filtro por Inquilino'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object TituloppField5: TppField
      FieldAlias = 'Filtro por mes'
      FieldName = 'Filtro por mes'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
  end
  object Reporte: TppReport
    AutoStop = False
    DataPipeline = plReporte
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listado de Inmuebles'
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
    Template.FileName = 
      'S:\Plantillas\PedidosPendientes\Pedidos_Pendientes\Pedidos_Pendi' +
      'entes.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 385
    Top = 213
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'plReporte'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 52388
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Listado de deuda de inquilinos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 24
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9525
        mmLeft = 20902
        mmTop = 17463
        mmWidth = 150813
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Caption = 'Mes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 39423
        mmWidth = 7535
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Caption = 'Inquilino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 44450
        mmWidth = 14986
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel41: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label41'
        Caption = 'Filtrado por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 32279
        mmWidth = 20638
        BandType = 1
        LayerName = Foreground
      end
      object Region: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region'
        Pen.Style = psClear
        mmHeight = 7673
        mmLeft = 794
        mmTop = 2117
        mmWidth = 196058
        BandType = 1
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label8'
          AutoSize = False
          Caption = 'SALOMON INMOBILIARIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'TIMES NEW ROMAN'
          Font.Size = -18
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 6615
          mmLeft = 3175
          mmTop = 3175
          mmWidth = 150813
          BandType = 1
          LayerName = Foreground
        end
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        DataField = 'Filtro por mes'
        DataPipeline = Titulo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Titulo'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 39423
        mmWidth = 121709
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        DataField = 'Filtro por Inquilino'
        DataPipeline = Titulo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Titulo'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 44450
        mmWidth = 121709
        BandType = 1
        LayerName = Foreground
      end
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 196058
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Inquilino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 33073
        mmTop = 1058
        mmWidth = 83608
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 132027
        mmTop = 1058
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 529
        mmWidth = 279665
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'Inquilino'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3217
        mmLeft = 33073
        mmTop = 529
        mmWidth = 83608
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'Total Neto'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 529
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'C'#243'digo'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'Mail'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 529
        mmWidth = 106892
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Visible = False
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 264584
        mmTop = 3175
        mmWidth = 16404
        BandType = 8
        LayerName = Foreground
      end
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
  object reporte2: TppReport
    AutoStop = False
    DataPipeline = plreporte1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listado de Inmuebles'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'S:\Plantillas\PedidosPendientes\Pedidos_Pendientes\Pedidos_Pendi' +
      'entes.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 449
    Top = 301
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'plreporte1'
    object ppTitleBand2: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Inquilino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 1060
        mmWidth = 67733
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label4'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 1060
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Alquileres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 125942
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Impuestos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 147902
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Otros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 215900
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Punitorios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 190500
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label7'
        AutoSize = False
        Caption = 'DNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 97367
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        DataField = 'Inquilino'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 27517
        mmTop = 0
        mmWidth = 67733
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText4'
        DataField = 'C'#243'digo'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 0
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        DataField = 'Alquileres'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 125677
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        DataField = 'Impuestos'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        DataField = 'Punitorios'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 190500
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText15'
        DataField = 'Total Deuda'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 215900
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText3'
        DataField = 'Otros'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 171450
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText6'
        DataField = 'DNI'
        DataPipeline = plreporte1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plreporte1'
        mmHeight = 3440
        mmLeft = 97367
        mmTop = 0
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground1
      end
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
  object plreporte1: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte1'
    Left = 560
    Top = 280
    object plreporte2: TppField
      FieldAlias = 'C'#243'digo'
      FieldName = 'C'#243'digo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'Inquilino'
      FieldName = 'Inquilino'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object plreporte1ppField1: TppField
      FieldAlias = 'Alquileres'
      FieldName = 'Alquileres'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plreporte1ppField2: TppField
      FieldAlias = 'Impuestos'
      FieldName = 'Impuestos'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object plreporte1ppField3: TppField
      FieldAlias = 'Otros'
      FieldName = 'Otros'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object plreporte1ppField4: TppField
      FieldAlias = 'Total Deuda'
      FieldName = 'Total Deuda'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object plreporte1ppField5: TppField
      FieldAlias = 'Punitorios'
      FieldName = 'Punitorios'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object plreporte1ppField6: TppField
      FieldAlias = 'DNI'
      FieldName = 'DNI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
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
  end
  object ReporteBot: TppReport
    AutoStop = False
    DataPipeline = plReporte
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listado de Inmuebles'
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
    Template.FileName = 
      'S:\Plantillas\PedidosPendientes\Pedidos_Pendientes\Pedidos_Pendi' +
      'entes.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = []
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 449
    Top = 213
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'plReporte'
    object ppTitleBand3: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 196058
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel25: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Inquilino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 33073
        mmTop = 1058
        mmWidth = 83608
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel26: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 132027
        mmTop = 1058
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel27: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label4'
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 529
        mmWidth = 279665
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel28: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1'
        DataField = 'Inquilino'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3217
        mmLeft = 33073
        mmTop = 529
        mmWidth = 83608
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText18: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText2'
        DataField = 'Total Neto'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 529
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText4'
        DataField = 'C'#243'digo'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText20: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText5'
        DataField = 'Mail'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 529
        mmWidth = 106892
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand3: TppFooterBand
      Visible = False
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 197300
        mmTop = 3175
        mmWidth = 16404
        BandType = 8
        LayerName = Foreground2
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
end
