object fImpuestosPendientes: TfImpuestosPendientes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Impuestos Pendientes'
  ClientHeight = 419
  ClientWidth = 865
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
  object PageControl1: TPageControl
    Left = 0
    Top = 61
    Width = 865
    Height = 303
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Pendientes de Pago'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gDetalle: TStringAlignGrid
        Left = 0
        Top = 0
        Width = 857
        Height = 244
        Align = alClient
        ColCount = 12
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentShowHint = False
        PopupMenu = PopupMenu1
        ShowHint = True
        TabOrder = 0
        OnDblClick = gDetalleDblClick
        ShowCellHints = False
        OnFixedColClick = gDetalleFixedColClick
        ColWidths = (
          83
          81
          30
          30
          84
          122
          177
          64
          160
          -1
          80
          64)
        Cells = (
          0
          0
          'Fecha'
          1
          0
          'C'#243'digo'
          2
          0
          'Tipo'
          3
          0
          'Letra'
          4
          0
          'N'#250'mero'
          5
          0
          'Item'
          6
          0
          'Per'#237'odo'
          7
          0
          'Importe'
          8
          0
          'Usuario'
          9
          0
          'Usuario'
          10
          0
          'IDMovimiento'
          11
          0
          'Pendiente')
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
          2
          0
          1
          1
          1
          0
          2
          1
          2
          0
          3
          1
          2
          0
          4
          1
          0
          0
          5
          1
          1
          0
          6
          1
          1
          0
          7
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
      object Panel1: TPanel
        Left = 0
        Top = 244
        Width = 857
        Height = 31
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object Label2: TLabel
          Left = 533
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Total:'
        end
        object Label6: TLabel
          Left = 117
          Top = 10
          Width = 68
          Height = 13
          Caption = 'Total a Pagar:'
        end
        object edtTotal: TEdit
          Left = 567
          Top = 6
          Width = 107
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          MaxLength = 3
          TabOrder = 0
          Text = '0.00'
          OnChange = Edit8Change
          OnKeyPress = Edit8KeyPress
        end
        object Edit2: TEdit
          Left = 204
          Top = 6
          Width = 107
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          MaxLength = 3
          TabOrder = 1
          Text = '0.00'
          OnChange = Edit8Change
          OnKeyPress = Edit8KeyPress
        end
        object BitBtn1: TBitBtn
          Left = 317
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Calcular'
          TabOrder = 2
          OnClick = BitBtn1Click
        end
      end
    end
    object Pagados: TTabSheet
      Caption = 'Pagados'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gPagado: TStringAlignGrid
        Left = 0
        Top = 0
        Width = 857
        Height = 244
        Align = alClient
        ColCount = 11
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentShowHint = False
        PopupMenu = popEliminar
        ShowHint = True
        TabOrder = 0
        OnDblClick = gDetalleDblClick
        ShowCellHints = False
        OnFixedColClick = gPagadoFixedColClick
        ColWidths = (
          83
          81
          30
          30
          83
          122
          174
          64
          160
          -1
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
          'Tipo'
          3
          0
          'Letra'
          4
          0
          'N'#250'mero'
          5
          0
          'Item'
          6
          0
          'Per'#237'odo'
          7
          0
          'Importe'
          8
          0
          'Usuario'
          9
          0
          'Usuario'
          10
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
          2
          0
          1
          1
          1
          0
          2
          1
          2
          0
          3
          1
          2
          0
          4
          1
          0
          0
          5
          1
          1
          0
          6
          1
          1
          0
          7
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
        Top = 244
        Width = 857
        Height = 31
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object Label5: TLabel
          Left = 533
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Total:'
        end
        object Edit1: TEdit
          Left = 567
          Top = 5
          Width = 107
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          MaxLength = 3
          TabOrder = 0
          OnChange = Edit8Change
          OnKeyPress = Edit8KeyPress
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 364
    Width = 865
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Shape1: TShape
      Left = 1
      Top = 4
      Width = 38
      Height = 9
      Brush.Color = clYellow
    end
    object Label4: TLabel
      Left = 45
      Top = 2
      Width = 224
      Height = 13
      Caption = 'Impuestos seleccionados para marcar pagados'
    end
    object btnImprimir: TAdvGlowButton
      Left = 0
      Top = 22
      Width = 90
      Height = 29
      BorderStyle = bsNone
      Caption = 'Grabar'
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
      Left = 771
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
    object btnEliminar: TAdvGlowButton
      Left = 94
      Top = 22
      Width = 90
      Height = 29
      BorderStyle = bsNone
      Caption = 'Eliminar'
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
      OnClick = btnEliminarClick
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
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 865
    Height = 61
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 11
      Width = 66
      Height = 13
      Caption = 'Fecha Desde:'
    end
    object Label3: TLabel
      Left = 170
      Top = 11
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Label7: TLabel
      Left = 361
      Top = 39
      Width = 40
      Height = 13
      Caption = 'Per'#237'odo:'
    end
    object Label8: TLabel
      Left = 375
      Top = 9
      Width = 26
      Height = 13
      Caption = 'Item:'
    end
    object Label9: TLabel
      Left = 4
      Top = 38
      Width = 76
      Height = 13
      Caption = 'Inquilino desde:'
    end
    object Label10: TLabel
      Left = 170
      Top = 39
      Width = 32
      Height = 13
      Caption = 'Hasta:'
    end
    object Edit6: TEdit
      Left = 82
      Top = 6
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 0
      OnChange = Edit6Change
      OnKeyPress = Edit6KeyPress
    end
    object Edit8: TEdit
      Left = 208
      Top = 6
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 1
      OnChange = Edit8Change
      OnKeyPress = Edit8KeyPress
    end
    object TodosCodigos: TCheckBox
      Left = 305
      Top = 8
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = TodosCodigosClick
    end
    object Edit3: TEdit
      Left = 407
      Top = 36
      Width = 282
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 49
      TabOrder = 3
      OnChange = Edit3Change
      OnKeyPress = Edit6KeyPress
    end
    object TodosPeriodos: TCheckBox
      Left = 695
      Top = 37
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = TodosPeriodosClick
    end
    object Actualizar: TAdvGlowButton
      Left = 771
      Top = 26
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
      TabOrder = 5
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
    object edItem: TEdit
      Left = 407
      Top = 6
      Width = 282
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 49
      TabOrder = 6
      OnChange = edItemChange
      OnKeyPress = Edit6KeyPress
    end
    object TodosItems: TCheckBox
      Left = 695
      Top = 8
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = TodosItemsClick
    end
    object Edit4: TEdit
      Left = 82
      Top = 36
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 8
      OnChange = Edit4Change
    end
    object Edit5: TEdit
      Left = 208
      Top = 36
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 9
      OnChange = Edit5Change
    end
    object TodosInquilinos: TCheckBox
      Left = 305
      Top = 37
      Width = 52
      Height = 17
      Caption = 'Todos'
      Checked = True
      State = cbChecked
      TabOrder = 10
      OnClick = TodosInquilinosClick
    end
  end
  object plReporte: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'plReporte'
    Left = 568
    Top = 128
    object plReporteppField1: TppField
      FieldAlias = 'C'#243'digo'
      FieldName = 'C'#243'digo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object plReporteppField2: TppField
      FieldAlias = 'Descripci'#243'n'
      FieldName = 'Descripci'#243'n'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object plReporteppField3: TppField
      FieldAlias = 'Afecta'
      FieldName = 'Afecta'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object plReporteppField4: TppField
      FieldAlias = 'Destino'
      FieldName = 'Destino'
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
      FieldAlias = 'Filtro por Articulo'
      FieldName = 'Filtro por Articulo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object TituloppField4: TppField
      FieldAlias = 'Filtro por Descripci'#243'n'
      FieldName = 'Filtro por Descripci'#243'n'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object TituloppField2: TppField
      FieldAlias = 'Filtro por Afecta a'
      FieldName = 'Filtro por Afecta a'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object TituloppField3: TppField
      FieldAlias = 'Filtro por Destino'
      FieldName = 'Filtro por Destino'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
  object Reporte: TppReport
    AutoStop = False
    DataPipeline = plReporte
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listado de Datos Fijos'
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
    Left = 457
    Top = 109
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
        Caption = 'Listado de Conceptos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 24
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9525
        mmLeft = 19315
        mmTop = 17463
        mmWidth = 150813
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Caption = 'Articulo:'
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
        mmWidth = 13229
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Caption = 'Descripci'#243'n'
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
        mmWidth = 17949
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
        mmWidth = 196057
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
          mmLeft = 4763
          mmTop = 2117
          mmWidth = 147373
          BandType = 1
          LayerName = Foreground
        end
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        DataField = 'Filtro por Articulo'
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
        DataField = 'Filtro por Descripci'#243'n'
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
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        Caption = 'Afecta a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 146844
        mmTop = 39158
        mmWidth = 13801
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText12'
        DataField = 'Filtro por Afecta a'
        DataPipeline = Titulo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Titulo'
        mmHeight = 4149
        mmLeft = 161132
        mmTop = 39158
        mmWidth = 95515
        BandType = 1
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        Caption = 'Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 146844
        mmTop = 44715
        mmWidth = 12531
        BandType = 1
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        DataField = 'Filtro por Destino'
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
        mmLeft = 161132
        mmTop = 44450
        mmWidth = 76729
        BandType = 1
        LayerName = Foreground
      end
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 5291
        mmWidth = 196058
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Descripci'#243'n'
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
        Caption = 'Afecta a'
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
        mmWidth = 26723
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
        Caption = 'Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
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
        mmWidth = 196058
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
        DataField = 'Descripci'#243'n'
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
        DataField = 'Afecta'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3217
        mmLeft = 120915
        mmTop = 529
        mmWidth = 26723
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
        DataField = 'Destino'
        DataPipeline = plReporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReporte'
        mmHeight = 3217
        mmLeft = 154782
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
  object popEliminar: TPopupMenu
    Left = 256
    Top = 104
    object EliminarRecibo1: TMenuItem
      Caption = 'Marcar Como Pendiente'
      OnClick = EliminarRecibo1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 184
    object MenuItem1: TMenuItem
      Caption = 'Eliminar Impuesto'
      OnClick = MenuItem1Click
    end
    object Seleccionartodos1: TMenuItem
      Caption = 'Seleccionar todos'
      OnClick = Seleccionartodos1Click
    end
    object Deseleccionartodos1: TMenuItem
      Caption = 'Deseleccionar todos'
      OnClick = Deseleccionartodos1Click
    end
    object SeleccionartodoExceptoPendientes1: TMenuItem
      Caption = 'Seleccionar todo Excepto Pendientes'
      OnClick = SeleccionartodoExceptoPendientes1Click
    end
  end
end
