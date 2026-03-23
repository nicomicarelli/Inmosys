object fListadoComisiones: TfListadoComisiones
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cuentas Corrientes - Listado de Comisiones'
  ClientHeight = 430
  ClientWidth = 764
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
    Top = 81
    Width = 764
    Height = 279
    Align = alClient
    ColCount = 6
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      58
      311
      64
      240
      64
      200)
    Cells = (
      0
      0
      'C'#243'digo'
      1
      0
      'Inquilino'
      2
      0
      'Codigo Item'
      3
      0
      'Item'
      4
      0
      'Importe'
      5
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
      0
      5
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
      3
      1
      0
      3
      1
      1
      0
      4
      1
      0
      0
      5
      1
      1
      0)
    PropRow = ()
    PropFixedCol = ()
    PropFixedRow = ()
  end
  object Panel1: TPanel
    Left = 0
    Top = 360
    Width = 764
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label8: TLabel
      Left = 617
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Total:'
    end
    object edtTotal: TEdit
      Left = 655
      Top = 4
      Width = 105
      Height = 21
      Alignment = taRightJustify
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 391
    Width = 764
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnGrabar: TAdvGlowButton
      Left = 3
      Top = 6
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
      Left = 670
      Top = 6
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Transparent = True
    Height = 81
    Width = 764
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 66
      Height = 13
      Caption = 'C'#243'digo Desde'
    end
    object Label2: TLabel
      Left = 352
      Top = 37
      Width = 64
      Height = 13
      Caption = 'Razon Social:'
    end
    object Label3: TLabel
      Left = 170
      Top = 11
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label4: TLabel
      Left = 10
      Top = 37
      Width = 66
      Height = 13
      Caption = 'Fecha Desde:'
    end
    object Label6: TLabel
      Left = 170
      Top = 37
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label5: TLabel
      Left = 10
      Top = 63
      Width = 59
      Height = 13
      Caption = 'Item Desde:'
    end
    object Label7: TLabel
      Left = 170
      Top = 63
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label9: TLabel
      Left = 350
      Top = 63
      Width = 42
      Height = 13
      Caption = 'Codigos:'
    end
    object Label10: TLabel
      Left = 350
      Top = 9
      Width = 44
      Height = 13
      Caption = 'Inquilino:'
    end
    object Actualizar: TAdvGlowButton
      Left = 670
      Top = 49
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
    object edDesde: TEdit
      Left = 85
      Top = 6
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 1
      OnChange = edDesdeChange
      OnKeyPress = edDesdeKeyPress
    end
    object edDescripcion: TEdit
      Left = 402
      Top = 6
      Width = 203
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = edDescripcionChange
      OnKeyPress = edDescripcionKeyPress
    end
    object edHasta: TEdit
      Left = 208
      Top = 6
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 3
      OnChange = edHastaChange
      OnKeyPress = edHastaKeyPress
    end
    object TodosCodigos: TCheckBox
      Left = 294
      Top = 8
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = TodosCodigosClick
    end
    object TodosDescripcion: TCheckBox
      Left = 611
      Top = 8
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = TodosDescripcionClick
    end
    object TodosFPago: TCheckBox
      Left = 294
      Top = 35
      Width = 52
      Height = 16
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = TodosFPagoClick
    end
    object edtFecha: TEdit
      Left = 85
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 7
      OnChange = edtFechaChange
      OnKeyDown = edtFechaKeyDown
      OnKeyPress = edtFechaKeyPress
    end
    object edFechaHasta: TEdit
      Left = 208
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 8
      OnChange = edFechaHastaChange
      OnKeyPress = edFechaHastaKeyPress
    end
    object edtItemDesde: TEdit
      Left = 85
      Top = 58
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 9
      OnChange = edtItemDesdeChange
      OnKeyDown = edtItemDesdeKeyDown
      OnKeyPress = edtItemDesdeKeyPress
    end
    object edItemHasta: TEdit
      Left = 208
      Top = 58
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 10
      OnChange = edItemHastaChange
    end
    object TodosItems: TCheckBox
      Left = 294
      Top = 60
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 11
      OnClick = TodosItemsClick
    end
    object Edit1: TEdit
      Left = 402
      Top = 58
      Width = 203
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 12
      OnChange = Edit1Change
      OnKeyPress = edDescripcionKeyPress
    end
    object todosComisiones: TCheckBox
      Left = 611
      Top = 60
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      Color = clBtnFace
      ParentColor = False
      State = cbChecked
      TabOrder = 13
      OnClick = todosComisionesClick
    end
    object cboRazonSocial: TComboBox
      Left = 423
      Top = 32
      Width = 182
      Height = 21
      ItemIndex = 0
      TabOrder = 14
      Text = 'Eduardo D. Garay'
      Items.Strings = (
        'Eduardo D. Garay'
        'Rodolfo F. Garay')
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
      FieldAlias = 'Filtro por Fecha'
      FieldName = 'Filtro por Fecha'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object TituloppField2: TppField
      FieldAlias = 'Filtro por Item'
      FieldName = 'Filtro por Item'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object TituloppField6: TppField
      FieldAlias = 'Filtro por Codigos'
      FieldName = 'Filtro por Codigos'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object TituloppField3: TppField
      FieldAlias = 'Total'
      FieldName = 'Total'
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 52388
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Listado de Comisiones'
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
        Caption = 'C'#243'digo:'
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
        mmWidth = 11853
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Caption = 'Fecha:'
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
        mmWidth = 10245
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
        DataField = 'Filtro por Codigo'
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
        mmWidth = 56886
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        DataField = 'Filtro por Fecha'
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
        mmWidth = 56886
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText101'
        DataField = 'Filtro por Item'
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
        mmLeft = 106363
        mmTop = 39423
        mmWidth = 56886
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'Filtro por Codigos'
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
        mmLeft = 106363
        mmTop = 44450
        mmWidth = 56886
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label101'
        Caption = 'Item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 39423
        mmWidth = 8213
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'C'#243'digos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 44450
        mmWidth = 13208
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 1058
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 82815
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 14023
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
        Caption = 'Importe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
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
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 529
        mmWidth = 63500
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'Codigo Item'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 529
        mmWidth = 7673
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
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'Item'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 529
        mmWidth = 82550
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'Importe'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 529
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
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'Total'
        DataPipeline = Titulo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'Titulo'
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 794
        mmWidth = 28840
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 794
        mmWidth = 19844
        BandType = 7
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
    Left = 496
    Top = 192
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
      FieldAlias = 'Codigo Item'
      FieldName = 'Codigo Item'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporteppField4: TppField
      FieldAlias = 'Item'
      FieldName = 'Item'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object plReporteppField5: TppField
      FieldAlias = 'Importe'
      FieldName = 'Importe'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
  end
end
