object fAbMCtaCteInquilinos: TfAbMCtaCteInquilinos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cuentas Corrientes - Inquilinos'
  ClientHeight = 408
  ClientWidth = 987
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
    Top = 84
    Width = 987
    Height = 227
    Align = alClient
    ColCount = 14
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = gDetalleDblClick
    ShowCellHints = False
    OnFixedColClick = gDetalleFixedColClick
    ColWidths = (
      58
      232
      78
      38
      242
      83
      -1
      -1
      -1
      -1
      70
      73
      200
      100)
    Cells = (
      0
      0
      'C'#243'digo'
      1
      0
      'Inquilino'
      2
      0
      'Fecha'
      3
      0
      'Item'
      4
      0
      'Descripcion'
      5
      0
      'Debe'
      6
      0
      'Pagado'
      7
      0
      'Codinq'
      8
      0
      'Coditem'
      9
      0
      'Registro'
      10
      0
      'Usuario'
      11
      0
      'IDMovimiento'
      12
      0
      'Propietario'
      13
      0
      'Saldo')
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
      0
      5
      0
      1
      2
      0
      10
      0
      1
      2
      0
      12
      0
      1
      2
      0
      13
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
      1
      3
      1
      0
      5
      1
      0
      3
      1
      0
      6
      1
      0
      0
      7
      1
      1
      0
      8
      1
      1
      0
      9
      1
      1
      0
      12
      1
      1
      0
      13
      1
      0
      0)
    PropRow = ()
    PropFixedCol = (
      6
      1
      2
      0
      7
      1
      2
      0
      8
      1
      2
      0
      9
      1
      2
      0)
    PropFixedRow = ()
  end
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 987
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label9: TLabel
      Left = 808
      Top = 1
      Width = 68
      Height = 13
      Caption = 'Total General:'
    end
    object Label11: TLabel
      Left = 435
      Top = 1
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Alquileres:'
    end
    object Label12: TLabel
      Left = 555
      Top = 1
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Impuestos:'
    end
    object Label13: TLabel
      Left = 666
      Top = 1
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Otros:'
    end
    object Edit1: TEdit
      Left = 808
      Top = 15
      Width = 105
      Height = 21
      Alignment = taRightJustify
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 435
      Top = 15
      Width = 105
      Height = 21
      Alignment = taRightJustify
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 371
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    Transparent = True
    Height = 37
    Width = 987
    object btnSalir: TAdvGlowButton
      Left = 891
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
    object btnEliminar: TAdvGlowButton
      Left = 402
      Top = 5
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
      TabOrder = 1
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Transparent = True
    Height = 84
    Width = 987
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
    object Actualizar: TAdvGlowButton
      Left = 894
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
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 7
      OnClick = TodosFPagoClick
    end
    object edtFecha: TEdit
      Left = 85
      Top = 32
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 5
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
      TabOrder = 6
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
      TabOrder = 8
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
      TabOrder = 9
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
      TabOrder = 10
      OnClick = TodosItemsClick
    end
  end
  object Edit3: TEdit
    Left = 555
    Top = 326
    Width = 105
    Height = 21
    Alignment = taRightJustify
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 666
    Top = 326
    Width = 105
    Height = 21
    Alignment = taRightJustify
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 5
  end
  object popOpciones: TPopupMenu
    Left = 344
    Top = 224
    object VerContratoEscalonado1: TMenuItem
      Caption = 'Ver Contrato Escalonado'
      OnClick = VerContratoEscalonado1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CompensarAutomaticamente1: TMenuItem
      Caption = 'Compensar Automaticamente'
      OnClick = CompensarAutomaticamente1Click
    end
    object CompensarMovimientoManual1: TMenuItem
      Caption = 'Compensar Movimiento Manual'
    end
  end
end
