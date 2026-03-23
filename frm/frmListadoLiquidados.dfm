object fListadoLiquidados: TfListadoLiquidados
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Recibos y Cobros - Listado Liquidados'
  ClientHeight = 437
  ClientWidth = 753
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
    Top = 68
    Width = 753
    Height = 180
    Align = alTop
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentShowHint = False
    PopupMenu = popOpciones
    ShowHint = True
    TabOrder = 1
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      64
      250
      250
      64
      100)
    Cells = (
      0
      0
      'C'#243'digo'
      1
      0
      'Propietario'
      2
      0
      'Inquilino'
      3
      0
      'Mes'
      4
      0
      'A'#241'o')
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
      1
      3
      1
      0
      3
      1
      2
      3
      1
      0
      4
      1
      0
      3
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 753
    Height = 189
    Align = alClient
    TabOrder = 2
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 154
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Transparent = True
      Height = 34
      Width = 751
      object btnGrabar: TAdvGlowButton
        Left = 3
        Top = 2
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
        Left = 658
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
      object bitbtn1: TAdvGlowButton
        Left = 159
        Top = 2
        Width = 154
        Height = 29
        BorderStyle = bsNone
        Caption = 'Imprimir Adeudados'
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
    object gDetalle1: TStringAlignGrid
      Left = 1
      Top = 1
      Width = 751
      Height = 153
      Align = alClient
      DefaultRowHeight = 17
      FixedCols = 0
      RowCount = 20
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      ParentShowHint = False
      PopupMenu = popOpciones
      ShowHint = True
      TabOrder = 1
      OnDblClick = gDetalleDblClick
      ShowCellHints = False
      OnFixedColClick = gDetalleFixedColClick
      ColWidths = (
        64
        250
        250
        164
        -1)
      Cells = (
        0
        0
        'C'#243'digo'
        1
        0
        'Propietario'
        2
        0
        'Inquilino'
        3
        0
        'Estado'
        4
        0
        'A'#241'o')
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
        1
        3
        1
        0
        3
        1
        2
        3
        1
        0
        4
        1
        0
        3
        1
        0)
      PropRow = ()
      PropFixedCol = ()
      PropFixedRow = ()
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Transparent = True
    Height = 68
    Width = 753
    object Label1: TLabel
      Left = 10
      Top = 17
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
      Left = 170
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label4: TLabel
      Left = 370
      Top = 17
      Width = 23
      Height = 13
      Caption = 'Mes:'
    end
    object Label5: TLabel
      Left = 494
      Top = 17
      Width = 23
      Height = 13
      Caption = 'A'#241'o:'
    end
    object edDesde: TEdit
      Left = 85
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
      Left = 85
      Top = 40
      Width = 203
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      OnChange = edDescripcionChange
    end
    object edHasta: TEdit
      Left = 208
      Top = 14
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 1
      OnChange = edHastaChange
    end
    object TodosCodigos: TCheckBox
      Left = 294
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
      Left = 294
      Top = 42
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = TodosDescripcionClick
    end
    object ComboBox1: TComboBox
      Left = 397
      Top = 14
      Width = 81
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      Items.Strings = (
        'ENERO'
        'FEBRERO'
        'MARZO'
        'ABRIL'
        'MAYO'
        'JUNIO'
        'JULIO'
        'AGOSTO'
        'SEPTIEMBRE'
        'OCTUBRE'
        'NOVIEMBRE'
        'DICIEMBRE')
    end
    object SpinEdit1: TSpinEdit
      Left = 523
      Top = 14
      Width = 54
      Height = 22
      MaxValue = 2100
      MinValue = 2013
      TabOrder = 4
      Value = 2013
    end
    object Actualizar: TAdvGlowButton
      Left = 663
      Top = 38
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
      TabOrder = 7
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
  end
  object plReporte: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte'
    Left = 496
    Top = 192
    object plReporteppField2: TppField
      FieldAlias = 'Inquilino'
      FieldName = 'Inquilino'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object plReporteppField3: TppField
      FieldAlias = 'Mes'
      FieldName = 'Mes'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object plReporteppField4: TppField
      FieldAlias = 'A'#241'o'
      FieldName = 'A'#241'o'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporteppField5: TppField
      FieldAlias = 'Importe'
      FieldName = 'Importe'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object plReporteppField1: TppField
      FieldAlias = 'Propietario'
      FieldName = 'Propietario'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object plReporteppField6: TppField
      FieldAlias = 'C'#243'digo'
      FieldName = 'C'#243'digo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
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
        Caption = 'Listado de Propietarios Liquidados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 24
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9525
        mmLeft = 22490
        mmTop = 17198
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
        mmLeft = 85196
        mmTop = 1058
        mmWidth = 63236
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Mes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 152400
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
        Caption = 'A'#241'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 174361
        mmTop = 1058
        mmWidth = 19844
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
        Caption = 'Propietario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 26458
        mmTop = 1058
        mmWidth = 56092
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
        mmLeft = 85196
        mmTop = 529
        mmWidth = 63236
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'Mes'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 152400
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
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'A'#241'o'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 174361
        mmTop = 529
        mmWidth = 19844
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'Propietario'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 529
        mmWidth = 56092
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
  object popOpciones: TPopupMenu
    Left = 208
    Top = 128
    object VerDatosInmueblwe1: TMenuItem
      Caption = 'Ver Datos Inmueble'
      Default = True
    end
    object VerContratoEscalonado1: TMenuItem
      Caption = 'Ver Contrato Escalonado'
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
  object Reporte2: TppReport
    AutoStop = False
    DataPipeline = plReporte2
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
    Left = 417
    Top = 285
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'plReporte2'
    object ppTitleBand2: TppTitleBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 52388
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Listado de Propietarios NO Liquidados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 24
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9525
        mmLeft = 22490
        mmTop = 17198
        mmWidth = 150813
        BandType = 1
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppRegion1: TppRegion
        DesignLayer = ppDesignLayer2
        UserName = 'Region'
        Pen.Style = psClear
        mmHeight = 7673
        mmLeft = 794
        mmTop = 2117
        mmWidth = 196058
        BandType = 1
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel14: TppLabel
          DesignLayer = ppDesignLayer2
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
          LayerName = Foreground1
        end
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 794
        mmLeft = 1323
        mmTop = 5291
        mmWidth = 196058
        BandType = 0
        LayerName = Foreground1
      end
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
        mmLeft = 85196
        mmTop = 1058
        mmWidth = 63236
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 152400
        mmTop = 1058
        mmWidth = 16140
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 529
        mmWidth = 279665
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Propietario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1058
        mmWidth = 78581
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
        DataPipeline = plReporte2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plReporte2'
        mmHeight = 3217
        mmLeft = 85196
        mmTop = 529
        mmWidth = 63236
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        DataField = 'Estado'
        DataPipeline = plReporte2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plReporte2'
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 529
        mmWidth = 39158
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        DataField = 'Propietario'
        DataPipeline = plReporte2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plReporte2'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 529
        mmWidth = 78581
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Pen.Color = clGray
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 1323
        mmTop = 7673
        mmWidth = 196058
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
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
  object plReporte2: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte1'
    Left = 512
    Top = 296
    object ppField1: TppField
      FieldAlias = 'Inquilino'
      FieldName = 'Inquilino'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppField6: TppField
      FieldAlias = 'C'#243'digo'
      FieldName = 'C'#243'digo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object plReporte2ppField1: TppField
      FieldAlias = 'Propietario'
      FieldName = 'Propietario'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporte2ppField2: TppField
      FieldAlias = 'Estado'
      FieldName = 'Estado'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
end
