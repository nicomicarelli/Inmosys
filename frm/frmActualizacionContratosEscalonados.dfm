object fActualizacionContratosEscalonados: TfActualizacionContratosEscalonados
  Left = 621
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Actualizacion Contratos Escalonados'
  ClientHeight = 420
  ClientWidth = 1007
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
  object pnlFondo: TAdvPanel
    Left = 0
    Top = 0
    Width = 1007
    Height = 420
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
      Top = 378
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Transparent = True
      Height = 42
      Width = 1007
      object btnSalir: TAdvGlowButton
        Left = 914
        Top = 3
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
        TabOrder = 1
        TabStop = True
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
      object btnImprimir: TAdvGlowButton
        Left = 99
        Top = 3
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
        TabOrder = 2
        TabStop = True
        OnClick = btnImprimirClick
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
    object cxGroupBox2: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Transparent = True
      Height = 54
      Width = 1007
      object Label3: TLabel
        Left = 5
        Top = 33
        Width = 84
        Height = 14
        Caption = '% Incremento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Top = 6
        Width = 74
        Height = 14
        Caption = 'Fecha Desde:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 191
        Top = 6
        Width = 45
        Height = 14
        Caption = 'Periodo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 191
        Top = 33
        Width = 37
        Height = 14
        Caption = 'Indice:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edFecha: TcxMaskEdit
        Left = 95
        Top = 4
        Properties.EditMask = '!99/99/0000;1;_'
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        TabOrder = 0
        Text = '  /  /    '
        Width = 79
      end
      object Actualizar: TAdvGlowButton
        Left = 914
        Top = 22
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
        TabOrder = 1
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
      object edIncremento: TcxTextEdit
        Left = 95
        Top = 30
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.UseLeftAlignmentOnEditing = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 7485192
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Text = '0'
        OnKeyPress = edIncrementoKeyPress
        Width = 79
      end
      object cbPeriodo: TComboBox
        Left = 242
        Top = 3
        Width = 104
        Height = 21
        ItemIndex = 0
        TabOrder = 3
        Text = 'TODOS'
        Items.Strings = (
          'TODOS'
          'MENSUAL'
          'BIMESTRAL'
          'TRIMESTRAL'
          'CUATRIMESTRAL'
          'SEMESTRAL'
          'ANUAL')
      end
      object AdvGlowButton1: TAdvGlowButton
        Left = 818
        Top = 22
        Width = 90
        Height = 29
        BorderStyle = bsNone
        Caption = 'Calcular'
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
      object cbIndice: TcxLookupComboBox
        Left = 242
        Top = 30
        Properties.KeyFieldNames = 'Codigo'
        Properties.ListColumns = <
          item
            FieldName = 'Descripcion'
          end>
        Properties.ListOptions.ShowHeader = False
        TabOrder = 5
        Width = 211
      end
    end
    object gDetalle: TAdvStringGrid
      Left = 0
      Top = 54
      Width = 1007
      Height = 324
      Cursor = crDefault
      Align = alClient
      ColCount = 14
      Ctl3D = True
      DefaultRowHeight = 19
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentCtl3D = False
      ParentFont = False
      PopupMenu = popOpciones
      ScrollBars = ssBoth
      TabOrder = 2
      OnClick = gDetalleClick
      GridLineColor = 15527152
      GridFixedLineColor = 13947601
      HoverRowCells = [hcNormal, hcSelected]
      OnGetAlignment = gDetalleGetAlignment
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
        'Propietario'
        'Fecha Desde'
        'Alquiler Actual'
        'Importe Actual'
        'Importe Nuevo'
        'NuevoImporte'
        'FechaUpdate'
        'CampoFecha'
        'Indice'
        'Perioricidad'
        'Porcentaje')
      ColumnSize.StretchAll = True
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
      EnhRowColMove = False
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
      FixedColWidth = 21
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
        21
        49
        200
        176
        96
        105
        98
        97
        104
        109
        113
        106
        84
        64)
      RowHeights = (
        19
        19)
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
      494C010104000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C03FFFFFFFFFFFFFFFFFFFFF000000E0
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
    object SeleccionarTodos1: TMenuItem
      Caption = 'Seleccionar Todos'
      OnClick = SeleccionarTodos1Click
    end
    object DeseleccionarTodos1: TMenuItem
      Caption = 'Deseleccionar Todos'
      OnClick = DeseleccionarTodos1Click
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
  object Reporte: TppReport
    AutoStop = False
    DataPipeline = plReporte
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
    Left = 241
    Top = 181
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
        Caption = 'Listado de Actualizaci'#243'n de Contratos Escalonados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 24
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9525
        mmLeft = 794
        mmTop = 17198
        mmWidth = 196057
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'Fecha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 39423
        mmWidth = 9525
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        Caption = '% Incremento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 44450
        mmWidth = 21166
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
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
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'Filtro por Fecha Desde'
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
        mmLeft = 26458
        mmTop = 39423
        mmWidth = 37306
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'Filtro por % Incremento'
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
        mmLeft = 26458
        mmTop = 44185
        mmWidth = 37306
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Caption = 'Periodo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 65352
        mmTop = 39423
        mmWidth = 12171
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'Filtro por Periodo'
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
        mmLeft = 86254
        mmTop = 39423
        mmWidth = 37306
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        DataField = 'Filtro por Indice'
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
        mmLeft = 86254
        mmTop = 44450
        mmWidth = 37306
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        Caption = 'Indice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 65352
        mmTop = 44450
        mmWidth = 8731
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
        ParentWidth = True
        Weight = 1.500000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 5292
        mmWidth = 284300
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
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 120915
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
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Alquiler Actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 142875
        mmTop = 1058
        mmWidth = 23813
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Indice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 217753
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Importe Actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 167746
        mmTop = 1058
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Importe Nuevo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 193675
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 240771
        mmTop = 1058
        mmWidth = 19844
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Porcentaje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 261939
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
        Anchors = []
        DataField = 'Inquilino'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
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
        Anchors = []
        DataField = 'Fecha Desde'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 120915
        mmTop = 529
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        Anchors = []
        DataField = 'Codigo'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3439
        mmLeft = 1323
        mmTop = 265
        mmWidth = 24606
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        Anchors = []
        DataField = 'Alquiler Actual'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 529
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Anchors = []
        DataField = 'Indice'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 217753
        mmTop = 530
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        Anchors = []
        DataField = 'Importe Actual'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 530
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        Anchors = []
        DataField = 'Importe Nuevo'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 193675
        mmTop = 530
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText12'
        Anchors = []
        DataField = 'Perioricidad'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 240771
        mmTop = 530
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        Anchors = []
        DataField = 'Porcentaje'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 261942
        mmTop = 794
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Pen.Color = clGray
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 1323
        mmTop = 7673
        mmWidth = 196058
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 3175
        mmWidth = 14288
        BandType = 8
        LayerName = Foreground
      end
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
  object plReporte: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte'
    Left = 240
    Top = 96
    object plReporteppField1: TppField
      FieldAlias = 'Codigo'
      FieldName = 'Codigo'
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
      FieldAlias = 'Propietario'
      FieldName = 'Propietario'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporteppField4: TppField
      FieldAlias = 'Fecha Desde'
      FieldName = 'Fecha Desde'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object plReporteppField5: TppField
      FieldAlias = 'Alquiler Actual'
      FieldName = 'Alquiler Actual'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object plReporteppField6: TppField
      FieldAlias = 'Importe Actual'
      FieldName = 'Importe Actual'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object plReporteppField7: TppField
      FieldAlias = 'Importe Nuevo'
      FieldName = 'Importe Nuevo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object plReporteppField8: TppField
      FieldAlias = 'Indice'
      FieldName = 'Indice'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object plReporteppField9: TppField
      FieldAlias = 'Perioricidad'
      FieldName = 'Perioricidad'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object plReporteppField10: TppField
      FieldAlias = 'Porcentaje'
      FieldName = 'Porcentaje'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
  end
  object Titulo: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'Titulo'
    OnGetFieldValue = TituloGetFieldValue
    Left = 312
    Top = 117
    object TituloppField1: TppField
      FieldAlias = 'Filtro por Fecha Desde'
      FieldName = 'Filtro por Fecha Desde'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object TituloppField4: TppField
      FieldAlias = 'Filtro por Periodo'
      FieldName = 'Filtro por Periodo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object TituloppField2: TppField
      FieldAlias = 'Filtro por % Incremento'
      FieldName = 'Filtro por % Incremento'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object TituloppField3: TppField
      FieldAlias = 'Filtro por Indice'
      FieldName = 'Filtro por Indice'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
end
