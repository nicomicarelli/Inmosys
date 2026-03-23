object fHistorialCaja: TfHistorialCaja
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Historial de Movimientos de Caja'
  ClientHeight = 412
  ClientWidth = 1138
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 375
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Transparent = True
    ExplicitWidth = 912
    Height = 37
    Width = 1138
    object btnSalir: TAdvGlowButton
      Left = 1045
      Top = 5
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
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    Transparent = True
    ExplicitWidth = 912
    Height = 82
    Width = 1138
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 66
      Height = 13
      Caption = 'C'#243'digo Desde'
    end
    object Label2: TLabel
      Left = 350
      Top = 11
      Width = 44
      Height = 13
      Caption = 'Inquilino:'
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
      Top = 38
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
    object edDesde: TEdit
      Left = 85
      Top = 6
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 0
      OnChange = edDesdeChange
      OnKeyPress = edDesdeKeyPress
    end
    object edDescripcion: TEdit
      Left = 402
      Top = 6
      Width = 203
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 9
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
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 10
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
      TabOrder = 5
      OnClick = TodosFPagoClick
    end
    object edtFecha: TEdit
      Left = 85
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 3
      OnChange = edtFechaChange
      OnKeyPress = edtFechaKeyPress
    end
    object edFechaHasta: TEdit
      Left = 208
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 4
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
      TabOrder = 6
      OnChange = edtItemDesdeChange
      OnKeyPress = edtItemDesdeKeyPress
    end
    object edItemHasta: TEdit
      Left = 208
      Top = 58
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 7
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
      TabOrder = 8
      OnClick = TodosItemsClick
    end
    object Actualizar: TAdvGlowButton
      Left = 1048
      Top = 47
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
      TabOrder = 11
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
  end
  object gDetalle: TStringAlignGrid
    Left = 0
    Top = 82
    Width = 1138
    Height = 293
    Align = alClient
    ColCount = 15
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    DrawSelection = False
    OnFixedColClick = gDetalleFixedColClick
    ExplicitWidth = 1045
    ColWidths = (
      73
      47
      310
      84
      84
      -1
      -1
      60
      30
      88
      44
      54
      74
      64
      90)
    Cells = (
      0
      0
      'Fecha'
      1
      0
      'C'#243'digo'
      2
      0
      'Item'
      3
      0
      'Entra'
      4
      0
      'Sale'
      5
      0
      'NumRecibo'
      6
      0
      'ID'
      7
      0
      'Comp.'
      8
      0
      'Letra'
      9
      0
      'N'#250'mero'
      10
      0
      'Item'
      11
      0
      'ID'
      12
      0
      'Usuario'
      13
      0
      'Operaci'#243'n'
      14
      0
      'F. Cambio')
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
      0
      3
      1
      1
      0
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
      3
      1
      0
      0
      4
      1
      0
      0
      8
      1
      2
      0
      10
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
end
