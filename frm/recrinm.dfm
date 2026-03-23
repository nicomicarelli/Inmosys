object frecrinm: Tfrecrinm
  Left = 292
  Top = 246
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recibo de Reserva'
  ClientHeight = 255
  ClientWidth = 513
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 17
    Top = 11
    Width = 101
    Height = 13
    Caption = 'C'#243'digo de propiedad:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 17
    Top = 41
    Width = 116
    Height = 13
    Caption = 'Fecha del Comprobante:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 17
    Top = 71
    Width = 99
    Height = 13
    Caption = 'Nombre del Inquilino:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 17
    Top = 131
    Width = 87
    Height = 13
    Caption = 'Importe de la se'#241'a'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 17
    Top = 161
    Width = 62
    Height = 13
    Caption = 'Dias Habiles:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 191
    Width = 45
    Height = 13
    Caption = 'Dato Fijo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 101
    Width = 81
    Height = 13
    Caption = 'DNI del Inquilino:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 224
    Width = 513
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 9
    object btnImprimir: TAdvGlowButton
      Left = 1
      Top = 2
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
      Left = 423
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
  object Edit1: TEdit
    Left = 146
    Top = 8
    Width = 43
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 147
    Top = 38
    Width = 88
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 147
    Top = 68
    Width = 353
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
    OnKeyPress = Edit3KeyPress
  end
  object Edit5: TEdit
    Left = 147
    Top = 158
    Width = 203
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 5
    OnKeyPress = Edit5KeyPress
  end
  object Combobox1: TEdit
    Left = 195
    Top = 8
    Width = 305
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 147
    Top = 128
    Width = 78
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
    OnKeyPress = Edit4KeyPress
  end
  object edtCodigo: TEdit
    Left = 147
    Top = 188
    Width = 48
    Height = 21
    Cursor = crIBeam
    Ctl3D = True
    MaxLength = 5
    ParentCtl3D = False
    TabOrder = 6
    OnEnter = edtCodigoEnter
    OnKeyPress = edtCodigoKeyPress
  end
  object cbxDatoFijo: TComboBox
    Left = 200
    Top = 188
    Width = 292
    Height = 21
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 7
    OnClick = cbxDatoFijoClick
    OnExit = cbxDatoFijoExit
  end
  object gImpresion: TStringAlignGrid
    Left = 68
    Top = 191
    Width = 534
    Height = 91
    ColCount = 14
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
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
  object Edit6: TEdit
    Left = 146
    Top = 98
    Width = 79
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 10
    OnKeyPress = Edit6KeyPress
  end
  object Reporte: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Recibo de Se'#241'a - ORIGINAL'
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
    Left = 352
    Top = 16
    Version = '16.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 114036
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'Fecha'
        DataPipeline = plDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plDatos'
        mmHeight = 3725
        mmLeft = 124206
        mmTop = 15342
        mmWidth = 73025
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'ORIGINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3895
        mmLeft = 121920
        mmTop = 35560
        mmWidth = 15748
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'Nombre'
        DataPipeline = plDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plDatos'
        mmHeight = 3725
        mmLeft = 15342
        mmTop = 34392
        mmWidth = 89165
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        DataField = 'Texto'
        DataPipeline = plDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'plDatos'
        mmHeight = 52123
        mmLeft = 14023
        mmTop = 61913
        mmWidth = 177271
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
  object plDatos: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plDatos'
    OnGetFieldValue = plDatosGetFieldValue
    Left = 312
    Top = 3
    object plDatosppField1: TppField
      FieldAlias = 'Fecha'
      FieldName = 'Fecha'
      FieldLength = 50
      DisplayWidth = 10
      Position = 0
    end
    object plDatosppField2: TppField
      FieldAlias = 'Nombre'
      FieldName = 'Nombre'
      FieldLength = 50
      DisplayWidth = 10
      Position = 1
    end
    object plDatosppField3: TppField
      FieldAlias = 'Letras'
      FieldName = 'Letras'
      FieldLength = 50
      DisplayWidth = 10
      Position = 2
    end
    object plDatosppField4: TppField
      FieldAlias = 'Importe'
      FieldName = 'Importe'
      FieldLength = 50
      DisplayWidth = 10
      Position = 3
    end
    object plDatosppField5: TppField
      FieldAlias = 'Dias'
      FieldName = 'Dias'
      FieldLength = 50
      DisplayWidth = 10
      Position = 4
    end
    object plDatosppField6: TppField
      FieldAlias = 'Inmueble'
      FieldName = 'Inmueble'
      FieldLength = 50
      DisplayWidth = 10
      Position = 5
    end
    object plDatosppField7: TppField
      FieldAlias = 'Texto'
      FieldName = 'Texto'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
  end
  object ReporteDuplicado: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Recibo de Se'#241'a - ORIGINAL'
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
    Left = 408
    Top = 24
    Version = '16.02'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 114036
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        DataField = 'Fecha'
        DataPipeline = plDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plDatos'
        mmHeight = 3725
        mmLeft = 124206
        mmTop = 15342
        mmWidth = 73025
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'DUPLICADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 121973
        mmTop = 35454
        mmWidth = 17727
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        DataField = 'Nombre'
        DataPipeline = plDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plDatos'
        mmHeight = 3725
        mmLeft = 15342
        mmTop = 34392
        mmWidth = 89165
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        DataField = 'Texto'
        DataPipeline = plDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'plDatos'
        mmHeight = 50006
        mmLeft = 14023
        mmTop = 64029
        mmWidth = 177271
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
