object fLiquidacionesHistoricas: TfLiquidacionesHistoricas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Recibos Hist'#243'ricos'
  ClientHeight = 415
  ClientWidth = 906
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
    Top = 65
    Width = 906
    Height = 166
    Align = alTop
    ColCount = 9
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentShowHint = False
    PopupMenu = popEliminar
    ShowHint = True
    TabOrder = 0
    OnClick = gDetalleClick
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      83
      80
      235
      30
      40
      113
      -1
      111
      185)
    Cells = (
      0
      0
      'Fecha'
      1
      0
      'C'#243'digo'
      2
      0
      'Inquilino'
      3
      0
      'Tipo'
      4
      0
      'Letra'
      5
      0
      'N'#250'mero'
      7
      0
      'Usuario'
      8
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
      0
      1
      1
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
  object gCuerpo: TStringAlignGrid
    Left = 0
    Top = 230
    Width = 906
    Height = 130
    Align = alBottom
    ColCount = 8
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      83
      81
      37
      231
      153
      90
      64
      80)
    Cells = (
      0
      0
      'Fecha'
      1
      0
      'C'#243'digo'
      2
      0
      'Linea'
      3
      0
      'Item'
      4
      0
      'Per'#237'odo'
      5
      0
      'Importe'
      6
      0
      'Codinq'
      7
      0
      'IDMovimiento')
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
      0
      1
      1
      1
      0
      2
      1
      0
      0
      5
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
  object Panel3: TPanel
    Left = 0
    Top = 360
    Width = 906
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object Shape1: TShape
      Left = 1
      Top = 4
      Width = 38
      Height = 9
      Brush.Color = clYellow
    end
    object Label4: TLabel
      Left = 49
      Top = 1
      Width = 210
      Height = 13
      Caption = 'Recibos Seleccionados para Ingresar a Caja'
    end
    object Label10: TLabel
      Left = 330
      Top = 1
      Width = 229
      Height = 13
      Caption = 'Liquidaci'#243'n pendiente de entregar al propietario'
    end
    object Shape2: TShape
      Left = 282
      Top = 4
      Width = 38
      Height = 9
      Brush.Color = 12171775
    end
    object btnImprimir: TAdvGlowButton
      Left = 0
      Top = 22
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
    object btnSalir: TAdvGlowButton
      Left = 807
      Top = 22
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 66
      Height = 13
      Caption = 'Fecha Desde:'
    end
    object Label3: TLabel
      Left = 163
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label2: TLabel
      Left = 530
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Letra:'
    end
    object Label5: TLabel
      Left = 370
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object Label6: TLabel
      Left = 3
      Top = 37
      Width = 66
      Height = 13
      Caption = 'C'#243'digo Desde'
    end
    object Label7: TLabel
      Left = 163
      Top = 37
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label8: TLabel
      Left = 368
      Top = 37
      Width = 56
      Height = 13
      Caption = 'Propietario:'
    end
    object Edit8: TEdit
      Left = 201
      Top = 5
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      OnChange = Edit8Change
      OnKeyPress = Edit8KeyPress
    end
    object Todos: TCheckBox
      Left = 298
      Top = 7
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = TodosClick
    end
    object Edit6: TEdit
      Left = 77
      Top = 5
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
      OnChange = Edit6Change
      OnKeyPress = Edit6KeyPress
    end
    object cbTipo: TComboBox
      Left = 432
      Top = 5
      Width = 91
      Height = 21
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 2
      ParentFont = False
      TabOrder = 3
      Text = 'Liquidaci'#243'n'
      OnClick = cbTipoClick
      Items.Strings = (
        ''
        'Recibo'
        'Liquidaci'#243'n')
    end
    object cbLetra: TComboBox
      Left = 578
      Top = 5
      Width = 38
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        ''
        'X'
        'B'
        'D'
        'A'
        'T'
        '')
    end
    object edDesde: TEdit
      Left = 77
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 5
      OnChange = edDesdeChange
    end
    object edHasta: TEdit
      Left = 201
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 6
      OnChange = edHastaChange
    end
    object TodosCodigos: TCheckBox
      Left = 298
      Top = 34
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = TodosCodigosClick
    end
    object edPropietario: TEdit
      Left = 432
      Top = 32
      Width = 295
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 8
      OnChange = edPropietarioChange
      OnKeyPress = Edit6KeyPress
    end
    object TodosPropietarios: TCheckBox
      Left = 735
      Top = 34
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = TodosPropietariosClick
    end
    object Actualizar: TAdvGlowButton
      Left = 807
      Top = 25
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
      TabOrder = 10
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
    object chIncluirControlados: TCheckBox
      Left = 639
      Top = 7
      Width = 119
      Height = 17
      Caption = 'Incluir Controlados'
      Checked = True
      State = cbChecked
      TabOrder = 11
      OnClick = TodosPropietariosClick
    end
  end
  object gImpresion: TStringAlignGrid
    Left = 32
    Top = 133
    Width = 737
    Height = 91
    ColCount = 14
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
      'Propietario'
      13
      0
      'IDMovimiento')
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
    Left = 32
    Top = 267
    Width = 623
    Height = 91
    ColCount = 13
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
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
    Left = 528
    Top = 136
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
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'ES COPIA FIEL DEL ORIGINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 73025
        mmTop = 23019
        mmWidth = 50271
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
        726F63656475726506536F75726365066770726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D2020706C4C697150726F5B27
        50726F706965746172696F275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D6506095661726961626C6531094576656E744E616D6506064F6E43
        616C63074576656E7449440221084361726574506F730102220202000001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F566172
        6961626C65384F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F7572636506B170726F636564757265205661726961626C65
        384F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A20206966204C656E67746828706C5265706F7274655B27496D706F
        727465275D29203E2033207468656E200D0A2020202056616C7565203A3D2027
        242027202B20706C5265706F7274655B27496D706F727465275D0D0A2020656C
        73650D0A2020202056616C7565203A3D2027273B200D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D6506095661726961626C6538094576656E744E61
        6D6506064F6E43616C63074576656E7449440221084361726574506F73010203
        0203000001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060F5661726961626C65334F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365066E70726F6365647572652056
        61726961626C65334F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027546F74616C3A
        20242027202B20706C546974756C6F5B27546F74616C275D3B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D6506095661726961626C653309457665
        6E744E616D6506064F6E43616C63074576656E7449440221084361726574506F
        730102030202000001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060F5661726961626C65364F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365068470726F63656475
        7265205661726961626C65364F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2020706C
        5265706F7274655B27446972656363696F6E275D202B20272027202B2020706C
        5265706F7274655B27506572696F646F275D3B0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506095661726961626C6536094576656E744E616D65
        06064F6E43616C63074576656E7449440221084361726574506F730102030202
        000001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F5661726961626C65394F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365149500000070726F63656475726520
        5661726961626C65394F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027456C20C3BA
        6C74696D6F2064C3AD612068C3A162696C2064652063616461206D65732C206E
        6F2068616272C3A1206174656E6369C3B36E20616C2070C3BA626C69636F2E27
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961
        626C6539094576656E744E616D6506064F6E43616C63074576656E7449440221
        084361726574506F730102000200000000}
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
  object plLiqPro: TppDBPipeline
    DataSource = DataSource1
    UserName = 'plLiqPro'
    Left = 552
    Top = 168
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
  object qLiqPro: TFXQuery
    Connection = DM.Conexion
    Left = 669
    Top = 118
  end
  object DataSource1: TDataSource
    DataSet = qLiqPro
    Left = 207
    Top = 233
  end
  object popEliminar: TPopupMenu
    Left = 256
    Top = 104
    object EliminarRecibo1: TMenuItem
      Caption = 'Eliminar Recibo'
      OnClick = EliminarRecibo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Marcarcomopendientederetirar1: TMenuItem
      Caption = 'Marcar liquidaci'#243'n como pendiente de retirar'
      OnClick = Marcarcomopendientederetirar1Click
    end
    object Marcarcomoretirada1: TMenuItem
      Caption = 'Marcar liquidaci'#243'n como retirada'
      OnClick = Marcarcomoretirada1Click
    end
    object LiquidacinControlada1: TMenuItem
      Caption = 'Liquidaci'#243'n Controlada'
      OnClick = LiquidacinControlada1Click
    end
  end
  object ReporteDuplicado: TppReport
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
    Left = 616
    Top = 152
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
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label7'
        Caption = 'ES COPIA FIEL DEL ORIGINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 73025
        mmTop = 23019
        mmWidth = 50271
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
      object ppLabel5: TppLabel
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
        726F63656475726506536F75726365066770726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D2020706C4C697150726F5B27
        50726F706965746172696F275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D6506095661726961626C6531094576656E744E616D6506064F6E43
        616C63074576656E7449440221084361726574506F730102220202000001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F566172
        6961626C65384F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F7572636506B170726F636564757265205661726961626C65
        384F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A20206966204C656E67746828706C5265706F7274655B27496D706F
        727465275D29203E2033207468656E200D0A2020202056616C7565203A3D2027
        242027202B20706C5265706F7274655B27496D706F727465275D0D0A2020656C
        73650D0A2020202056616C7565203A3D2027273B200D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D6506095661726961626C6538094576656E744E61
        6D6506064F6E43616C63074576656E7449440221084361726574506F73010203
        0203000001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060F5661726961626C65334F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365066E70726F6365647572652056
        61726961626C65334F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027546F74616C3A
        20242027202B20706C546974756C6F5B27546F74616C275D3B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D6506095661726961626C653309457665
        6E744E616D6506064F6E43616C63074576656E7449440221084361726574506F
        730102030202000001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060F5661726961626C65364F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365068470726F63656475
        7265205661726961626C65364F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2020706C
        5265706F7274655B27446972656363696F6E275D202B20272027202B2020706C
        5265706F7274655B27506572696F646F275D3B0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506095661726961626C6536094576656E744E616D65
        06064F6E43616C63074576656E7449440221084361726574506F730102030202
        000001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F5661726961626C65394F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365149500000070726F63656475726520
        5661726961626C65394F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027456C20C3BA
        6C74696D6F2064C3AD612068C3A162696C2064652063616461206D65732C206E
        6F2068616272C3A1206174656E6369C3B36E20616C2070C3BA626C69636F2E27
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961
        626C6539094576656E744E616D6506064F6E43616C63074576656E7449440221
        084361726574506F730102000200000000}
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
end
