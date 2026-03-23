object FTablero: TFTablero
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tablero de decisi'#243'n'
  ClientHeight = 431
  ClientWidth = 902
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 399
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Transparent = True
    Height = 32
    Width = 902
    object btnSalir: TAdvGlowButton
      Left = 810
      Top = 2
      Width = 90
      Height = 28
      Align = alRight
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
      BorderStyle = bsNone
      Caption = 'Volver'
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
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Transparent = True
    Height = 53
    Width = 902
    object Label1: TLabel
      Left = 221
      Top = 3
      Width = 76
      Height = 16
      Caption = 'Indicadores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 554
      Top = 3
      Width = 175
      Height = 16
      Caption = 'Balance General Conceptos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 27
      Width = 74
      Height = 14
      Caption = 'Fecha Desde:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 176
      Top = 27
      Width = 34
      Height = 14
      Caption = 'Hasta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Actualizar: TAdvGlowButton
      Left = 801
      Top = 2
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
      TabOrder = 0
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
    object Edit1: TEdit
      Left = 88
      Top = 25
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 221
      Top = 25
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
      OnChange = Edit2Change
      OnKeyPress = Edit2KeyPress
    end
    object TodosCodigos: TcxCheckBox
      Left = 302
      Top = 24
      Caption = 'Todos'
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      State = cbsChecked
      Style.Color = clBlack
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Transparent = True
      OnClick = TodosCodigosClick
      Width = 66
    end
  end
  object Lista: TAdvSmoothTileList
    Left = 0
    Top = 53
    Width = 456
    Height = 346
    AnimationFactor = 4.000000000000000000
    Fill.Color = clWhite
    Fill.ColorMirror = clNone
    Fill.ColorMirrorTo = clNone
    Fill.GradientType = gtSolid
    Fill.GradientMirrorType = gtSolid
    Fill.BorderColor = 6973542
    Fill.Rounding = 0
    Fill.ShadowOffset = 0
    Fill.Glow = gmNone
    Tiles = <
      item
        Content.Text = 'Tile 1'
        ContentMaximized.Text = 'Description for Tile 1'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end
      item
        Content.Text = 'Tile 2'
        ContentMaximized.Text = 'Description for Tile 2'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end
      item
        Content.Text = 'Tile 3'
        ContentMaximized.Text = 'Description for Tile 3'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end
      item
        Content.Text = 'Tile 4'
        ContentMaximized.Text = 'Description for Tile 4'
        DeleteIndicator = 'X'
        SubTiles = <>
        Tag = 0
      end>
    TileAppearance.LargeViewFill.Color = 12369084
    TileAppearance.LargeViewFill.ColorMirror = clNone
    TileAppearance.LargeViewFill.ColorMirrorTo = clNone
    TileAppearance.LargeViewFill.GradientType = gtSolid
    TileAppearance.LargeViewFill.GradientMirrorType = gtNone
    TileAppearance.LargeViewFill.Opacity = 180
    TileAppearance.LargeViewFill.BorderColor = 10987431
    TileAppearance.LargeViewFill.Rounding = 0
    TileAppearance.LargeViewFill.ShadowOffset = 0
    TileAppearance.LargeViewFill.Glow = gmNone
    TileAppearance.SmallViewFill.Color = 12369084
    TileAppearance.SmallViewFill.ColorMirror = clNone
    TileAppearance.SmallViewFill.ColorMirrorTo = clNone
    TileAppearance.SmallViewFill.GradientType = gtSolid
    TileAppearance.SmallViewFill.GradientMirrorType = gtNone
    TileAppearance.SmallViewFill.Opacity = 180
    TileAppearance.SmallViewFill.BorderColor = 10987431
    TileAppearance.SmallViewFill.Rounding = 0
    TileAppearance.SmallViewFill.ShadowOffset = 0
    TileAppearance.SmallViewFill.Glow = gmNone
    TileAppearance.SmallViewFillSelected.Color = 10655892
    TileAppearance.SmallViewFillSelected.ColorTo = 8749179
    TileAppearance.SmallViewFillSelected.ColorMirror = 8156785
    TileAppearance.SmallViewFillSelected.ColorMirrorTo = 6775131
    TileAppearance.SmallViewFillSelected.GradientType = gtVertical
    TileAppearance.SmallViewFillSelected.GradientMirrorType = gtVertical
    TileAppearance.SmallViewFillSelected.BorderColor = 6973542
    TileAppearance.SmallViewFillSelected.Rounding = 0
    TileAppearance.SmallViewFillSelected.ShadowOffset = 0
    TileAppearance.SmallViewFillSelected.Glow = gmNone
    TileAppearance.SmallViewFillDisabled.Color = clMoneyGreen
    TileAppearance.SmallViewFillDisabled.ColorTo = clMoneyGreen
    TileAppearance.SmallViewFillDisabled.ColorMirror = clMoneyGreen
    TileAppearance.SmallViewFillDisabled.ColorMirrorTo = clMoneyGreen
    TileAppearance.SmallViewFillDisabled.GradientType = gtSolid
    TileAppearance.SmallViewFillDisabled.GradientMirrorType = gtSolid
    TileAppearance.SmallViewFillDisabled.BorderColor = 10987431
    TileAppearance.SmallViewFillDisabled.Rounding = 0
    TileAppearance.SmallViewFillDisabled.ShadowOffset = 0
    TileAppearance.SmallViewFillDisabled.Glow = gmNone
    TileAppearance.SmallViewFillHover.Color = 12369084
    TileAppearance.SmallViewFillHover.ColorMirror = clNone
    TileAppearance.SmallViewFillHover.ColorMirrorTo = clNone
    TileAppearance.SmallViewFillHover.GradientType = gtSolid
    TileAppearance.SmallViewFillHover.GradientMirrorType = gtNone
    TileAppearance.SmallViewFillHover.Opacity = 220
    TileAppearance.SmallViewFillHover.BorderColor = 10987431
    TileAppearance.SmallViewFillHover.Rounding = 0
    TileAppearance.SmallViewFillHover.ShadowOffset = 0
    TileAppearance.SmallViewFillHover.Glow = gmNone
    TileAppearance.LargeViewFont.Charset = DEFAULT_CHARSET
    TileAppearance.LargeViewFont.Color = clWindowText
    TileAppearance.LargeViewFont.Height = -11
    TileAppearance.LargeViewFont.Name = 'Tahoma'
    TileAppearance.LargeViewFont.Style = []
    TileAppearance.SmallViewFont.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFont.Color = clWindowText
    TileAppearance.SmallViewFont.Height = -11
    TileAppearance.SmallViewFont.Name = 'Tahoma'
    TileAppearance.SmallViewFont.Style = []
    TileAppearance.SmallViewFontSelected.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFontSelected.Color = clWindowText
    TileAppearance.SmallViewFontSelected.Height = -11
    TileAppearance.SmallViewFontSelected.Name = 'Tahoma'
    TileAppearance.SmallViewFontSelected.Style = []
    TileAppearance.SmallViewFontDisabled.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFontDisabled.Color = clWindowText
    TileAppearance.SmallViewFontDisabled.Height = -11
    TileAppearance.SmallViewFontDisabled.Name = 'Tahoma'
    TileAppearance.SmallViewFontDisabled.Style = []
    TileAppearance.SmallViewFontHover.Charset = DEFAULT_CHARSET
    TileAppearance.SmallViewFontHover.Color = clWindowText
    TileAppearance.SmallViewFontHover.Height = -11
    TileAppearance.SmallViewFontHover.Name = 'Tahoma'
    TileAppearance.SmallViewFontHover.Style = []
    TileAppearance.StatusIndicatorAppearance.Fill.Color = clRed
    TileAppearance.StatusIndicatorAppearance.Fill.ColorMirror = clNone
    TileAppearance.StatusIndicatorAppearance.Fill.ColorMirrorTo = clNone
    TileAppearance.StatusIndicatorAppearance.Fill.GradientType = gtSolid
    TileAppearance.StatusIndicatorAppearance.Fill.GradientMirrorType = gtSolid
    TileAppearance.StatusIndicatorAppearance.Fill.BorderColor = clGray
    TileAppearance.StatusIndicatorAppearance.Fill.Rounding = 0
    TileAppearance.StatusIndicatorAppearance.Fill.ShadowOffset = 0
    TileAppearance.StatusIndicatorAppearance.Fill.Glow = gmNone
    TileAppearance.StatusIndicatorAppearance.Font.Charset = DEFAULT_CHARSET
    TileAppearance.StatusIndicatorAppearance.Font.Color = clWhite
    TileAppearance.StatusIndicatorAppearance.Font.Height = -11
    TileAppearance.StatusIndicatorAppearance.Font.Name = 'Tahoma'
    TileAppearance.StatusIndicatorAppearance.Font.Style = []
    TileAppearance.DeleteIndicatorAppearance.Fill.Color = clBlack
    TileAppearance.DeleteIndicatorAppearance.Fill.ColorMirror = clNone
    TileAppearance.DeleteIndicatorAppearance.Fill.ColorMirrorTo = clNone
    TileAppearance.DeleteIndicatorAppearance.Fill.GradientType = gtSolid
    TileAppearance.DeleteIndicatorAppearance.Fill.GradientMirrorType = gtSolid
    TileAppearance.DeleteIndicatorAppearance.Fill.BorderColor = clWhite
    TileAppearance.DeleteIndicatorAppearance.Fill.Rounding = 0
    TileAppearance.DeleteIndicatorAppearance.Fill.ShadowOffset = 0
    TileAppearance.DeleteIndicatorAppearance.Fill.Glow = gmNone
    TileAppearance.DeleteIndicatorAppearance.Font.Charset = DEFAULT_CHARSET
    TileAppearance.DeleteIndicatorAppearance.Font.Color = clWhite
    TileAppearance.DeleteIndicatorAppearance.Font.Height = -11
    TileAppearance.DeleteIndicatorAppearance.Font.Name = 'Tahoma'
    TileAppearance.DeleteIndicatorAppearance.Font.Style = []
    Header.Fill.Color = 10655892
    Header.Fill.ColorTo = 8749179
    Header.Fill.ColorMirror = 8156785
    Header.Fill.ColorMirrorTo = 6775131
    Header.Fill.GradientType = gtVertical
    Header.Fill.GradientMirrorType = gtVertical
    Header.Fill.BorderColor = 6973542
    Header.Fill.Rounding = 0
    Header.Fill.ShadowOffset = 0
    Header.Fill.Glow = gmNone
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Footer.Visible = False
    Footer.Fill.Color = 10655892
    Footer.Fill.ColorTo = 8749179
    Footer.Fill.ColorMirror = 8156785
    Footer.Fill.ColorMirrorTo = 6775131
    Footer.Fill.GradientType = gtVertical
    Footer.Fill.GradientMirrorType = gtVertical
    Footer.Fill.BorderColor = 6973542
    Footer.Fill.Rounding = 0
    Footer.Fill.ShadowOffset = 0
    Footer.Fill.Glow = gmNone
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -11
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Align = alLeft
    TabOrder = 2
    DoubleBuffered = True
  end
  object PageControl1: TPageControl
    Left = 456
    Top = 53
    Width = 446
    Height = 346
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Datos Fijos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 438
        Height = 318
        Align = alClient
        TabOrder = 0
        object gCajas: TcxGridDBTableView
          PopupMenu = popOpciones
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <
            item
              Links = <>
              SummaryItems = <>
            end>
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
          OptionsView.GroupByBox = False
          OptionsView.GroupByHeaderLayout = ghlHorizontal
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object Tablero_Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 49
          end
          object Tablero_Descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 242
          end
          object Tablero_Importe: TcxGridDBColumn
            Caption = 'Importe'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 110
          end
          object Tablero_Sobre: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            GroupIndex = 0
            Options.Editing = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = gCajas
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sobres'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 438
        Height = 318
        Align = alClient
        TabOrder = 0
        object gSobres: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
          OptionsView.GroupByBox = False
          object Sobres_Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 49
          end
          object Sobres_Descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 242
          end
          object Sobres_Importe: TcxGridDBColumn
            Caption = 'Importe'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 110
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = gSobres
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Propietarios'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 438
        Height = 318
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 0
        object gPropietarios: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '$,0.00;$-,0.00'
              Kind = skSum
              FieldName = 'Importe'
              Column = Propietario_Importe
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupByHeaderLayout = ghlHorizontal
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object Propietario_Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 49
          end
          object Propietario_Descripcion: TcxGridDBColumn
            Caption = 'Propietario'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 302
          end
          object Propietario_Importe: TcxGridDBColumn
            Caption = 'Importe'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 118
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = gPropietarios
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Honorarios'
      ImageIndex = 3
      object cxGrid4: TcxGrid
        Left = 0
        Top = 0
        Width = 438
        Height = 240
        Align = alClient
        TabOrder = 0
        object gHonorarios: TcxGridDBTableView
          PopupMenu = popOpciones
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '$ #,##0.00;$ -#,##0.00'
              Kind = skSum
              Column = Honorarios_Importe
            end>
          DataController.Summary.SummaryGroups = <
            item
              Links = <>
              SummaryItems = <>
            end>
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupByHeaderLayout = ghlHorizontal
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object Honorarios_Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 49
          end
          object Honorarios_Descripcion: TcxGridDBColumn
            Caption = 'Descripci'#243'n'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Width = 242
          end
          object Honorarios_Importe: TcxGridDBColumn
            Caption = 'Importe'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 110
          end
          object Honorarios_Sobre: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            GroupIndex = 0
            Options.Editing = False
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = gHonorarios
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 240
        Width = 438
        Height = 78
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object cxGrid5: TcxGrid
          Left = 0
          Top = 0
          Width = 438
          Height = 78
          Align = alClient
          TabOrder = 0
          object gPorcentajes: TcxGridDBTableView
            PopupMenu = popOpciones
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$ #,##0.00;$ -#,##0.00'
                Kind = skSum
                Column = gPorcentajes_Importe
              end>
            DataController.Summary.SummaryGroups = <
              item
                Links = <>
                SummaryItems = <>
              end>
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Sin datos a mostrar>'
            OptionsView.GroupByBox = False
            OptionsView.GroupByHeaderLayout = ghlHorizontal
            OptionsView.GroupFooters = gfAlwaysVisible
            OptionsView.GroupSummaryLayout = gslAlignWithColumns
            object gPorcentajes_Codigo: TcxGridDBColumn
              Caption = 'C'#243'digo'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.Moving = False
              Width = 49
            end
            object gPorcentajes_Descripcion: TcxGridDBColumn
              Caption = 'Descripci'#243'n'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.GroupFooters = False
              Options.Grouping = False
              Options.Moving = False
              Width = 242
            end
            object gPorcentajes_Importe: TcxGridDBColumn
              Caption = 'Monto'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 110
            end
            object gPorcentajes_Sobre: TcxGridDBColumn
              Caption = 'Porc.'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              GroupIndex = 0
              Options.Editing = False
              Width = 30
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = gPorcentajes
          end
        end
      end
    end
  end
  object chAgrupado: TCheckBox
    Left = 698
    Top = 29
    Width = 97
    Height = 17
    Caption = 'Ver Agrupado'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = chAgrupadoClick
  end
  object popOpciones: TPopupMenu
    Left = 552
    Top = 160
    object VerContratoEscalonado1: TMenuItem
      Caption = 'Compensar Dato Fijo'
      OnClick = VerContratoEscalonado1Click
    end
    object PasaralHistorico1: TMenuItem
      Caption = 'Pasar al Historico'
      OnClick = PasaralHistorico1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 120
    object MarcarRetirado: TMenuItem
      Caption = 'Marcar dinero como retirado'
      OnClick = MarcarRetiradoClick
    end
  end
end
