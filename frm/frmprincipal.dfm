object fPrincipal: TfPrincipal
  Left = -8
  Top = -8
  BorderStyle = bsSingle
  Caption = 'Inmosys 3.0'
  ClientHeight = 838
  ClientWidth = 1600
  Color = clMedGray
  TransparentColorValue = clAqua
  DockSite = True
  ParentFont = True
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 818
    Width = 1600
    Height = 20
    Panels = <
      item
        Width = 300
      end>
  end
  object rbMenuPrincipal: TRibbon
    Left = 0
    Top = 0
    Width = 1600
    Height = 143
    ActionManager = acmMenuPrincipal
    ScreenTips = ScreenTipsManager1
    ApplicationMenu.Caption = 'Ventanas Abiertas'
    ApplicationMenu.CommandType = ctCommands
    ApplicationMenu.Menu = RibbonApplicationMenuBar1
    Caption = 'Inmosys 3.0'
    QuickAccessToolbar.ShowMoreCommands = False
    Tabs = <
      item
        Caption = 'Carga de Datos'
        Page = rbpArchivos
      end
      item
        Caption = 'Recibos y Cobros'
        Page = rbpRecibosCobros
      end
      item
        Caption = 'Cuentas Corrientes'
        Page = rbpCuentasCorrientes
      end
      item
        Caption = 'Impuestos y Servicios'
        Page = rbpImpuestos
      end
      item
        Caption = 'Vales Gastos Fijos y Otros'
        Page = rbpVales
      end
      item
        Caption = 'Tablero de Control'
        Page = rbpTablero
      end>
    TabIndex = 2
    DesignSize = (
      1600
      143)
    StyleName = 'Ribbon - Obsidian'
    object RibbonApplicationMenuBar1: TRibbonApplicationMenuBar
      ActionManager = acmMenuPrincipal
      OptionItems = <>
      RecentItems = <>
    end
    object rbpArchivos: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Carga de Datos'
      Index = 0
      object RibbonGroup1: TRibbonGroup
        AlignWithMargins = True
        Left = 4
        Top = 3
        Width = 426
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Conceptos y Datos Fijos'
        GroupAlign = gaHorizontal
        GroupIndex = 0
      end
      object RibbonGroup2: TRibbonGroup
        Left = 432
        Top = 3
        Width = 303
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Inmuebles'
        GroupIndex = 1
      end
      object RibbonGroup3: TRibbonGroup
        Left = 737
        Top = 3
        Width = 293
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Automatizaci'#243'n'
        GroupIndex = 2
      end
      object RibbonGroup4: TRibbonGroup
        Left = 1032
        Top = 3
        Width = 50
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Notas '
        GroupIndex = 3
      end
      object RibbonGroup7: TRibbonGroup
        Left = 1084
        Top = 3
        Width = 118
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Mantenimiento de BD'
        GroupIndex = 4
      end
    end
    object rbpRecibosCobros: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Recibos y Cobros'
      Index = 1
      object rbgImpuestos: TRibbonGroup
        Left = 4
        Top = 3
        Width = 55
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Recibos '
        GroupIndex = 0
      end
      object RibbonGroup5: TRibbonGroup
        Left = 61
        Top = 3
        Width = 386
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Recibos y Liquidaciones'
        GroupIndex = 1
      end
      object RibbonGroup9: TRibbonGroup
        Left = 769
        Top = 3
        Width = 186
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Fondos y Caja'
        GroupIndex = 4
      end
      object RibbonGroup10: TRibbonGroup
        Left = 449
        Top = 3
        Width = 245
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Listado de recibos y Liquidaciones'
        GroupIndex = 2
      end
      object RibbonGroup17: TRibbonGroup
        Left = 696
        Top = 3
        Width = 71
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Impuestos'
        GroupIndex = 3
      end
    end
    object rbpImpuestos: TRibbonPage
      AlignWithMargins = True
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Impuestos y Servicios'
      Index = 3
      object RibbonGroup15: TRibbonGroup
        Left = 4
        Top = 3
        Width = 297
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Empresas de Servicios'
        GroupIndex = 0
      end
      object RibbonGroup16: TRibbonGroup
        Left = 303
        Top = 3
        Width = 326
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Movimientos'
        GroupIndex = 1
      end
      object RibbonGroup6: TRibbonGroup
        Left = 631
        Top = 3
        Width = 141
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Listados'
        GroupIndex = 2
      end
      object RibbonGroup18: TRibbonGroup
        Left = 774
        Top = 3
        Width = 582
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Informes'
        GroupIndex = 3
      end
    end
    object rbpVales: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Vales Gastos Fijos y Otros'
      Index = 4
      object rgpCategorias: TRibbonGroup
        Left = 4
        Top = 3
        Width = 70
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Categor'#237'as'
        GroupIndex = 0
      end
      object rgpVales: TRibbonGroup
        Left = 76
        Top = 3
        Width = 1060
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Vales Gastos Fijos y Otros'
        GroupIndex = 1
      end
      object rgpHistorico: TRibbonGroup
        Left = 1138
        Top = 3
        Width = 140
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Hist'#243'rico'
        GroupIndex = 2
      end
    end
    object rbpTablero: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Tablero de Control'
      Index = 5
      object RibbonGroup8: TRibbonGroup
        Left = 4
        Top = 3
        Width = 158
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Indicadores'
        GroupIndex = 0
      end
      object RibbonGroup14: TRibbonGroup
        Left = 164
        Top = 3
        Width = 54
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Tablero'
        GroupIndex = 1
      end
      object RibbonGroup21: TRibbonGroup
        Left = 220
        Top = 3
        Width = 66
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Anomal'#237'as'
        GroupIndex = 2
      end
      object RibbonGroup22: TRibbonGroup
        Left = 288
        Top = 3
        Width = 141
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Historial de Movimientos'
        GroupIndex = 3
      end
      object RibbonGroup23: TRibbonGroup
        Left = 431
        Top = 3
        Width = 244
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Informes'
        GroupIndex = 4
      end
    end
    object rbpCuentasCorrientes: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Cuentas Corrientes'
      Index = 2
      object RibbonGroup11: TRibbonGroup
        Left = 4
        Top = 3
        Width = 130
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Cuentas Corrientes'
        GroupIndex = 0
      end
      object RibbonGroup12: TRibbonGroup
        Left = 136
        Top = 3
        Width = 545
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Listados'
        GroupIndex = 1
      end
      object RibbonGroup13: TRibbonGroup
        Left = 683
        Top = 3
        Width = 197
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Historial'
        GroupIndex = 2
      end
    end
  end
  object actListaAcciones: TActionList
    Left = 944
    Top = 8
    object actSalir: TAction
      Caption = '&Salir'
      OnExecute = actSalirExecute
    end
    object actAbrirFormularios: TAction
    end
    object actContratos: TAction
      Caption = 'Actualiza Contratos'
      OnExecute = actContratosExecute
    end
  end
  object acmMenuPrincipal: TActionManager
    ActionBars = <
      item
        Items = <
          item
            ChangesAllowed = [caModify]
            Items = <
              item
                Caption = '&ActionClientItem0'
              end>
            Caption = '&Ventanas Recientes'
            KeyTip = 'F'
          end>
        AutoSize = False
      end
      item
        Items = <
          item
            Items = <
              item
                Caption = '&actNuevoInmueble'
              end
              item
                Caption = 'a&ctListadoInmuebles'
              end>
            Action = actInmuebles
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoInmuebles
            Caption = '&Listado Inmuebles'
          end>
      end
      item
        Items = <
          item
            Action = actDatosFijos
            Caption = '&Datos Fijos'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end>
      end
      item
        Items = <
          item
            BackgroundLayout = blLeftBanner
            Action = actDatosFijos
            Caption = '&Datos Fijos'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
            CommandProperties.GroupPosition = gpMiddle
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoDatosFijos
            Caption = '&Listado Datos Fijos'
          end>
      end
      item
        Items = <
          item
            Caption = '&ActionClientItem0'
          end>
      end
      item
      end
      item
        Items = <
          item
            Caption = '&ActionClientItem0'
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = actDatosFijos
            Caption = '&Datos Fijos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = actRubrosDatosFijos
            Caption = 'Ru&bros Datos Fijos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actRazonesSociales
            Caption = '&Razones Sociales'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actSobres
            Caption = '&Sobres'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actCajas
            Caption = 'C&ajas'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actConfiguracionMail
            Caption = '&Configurar E-Mail'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actUsuarios
            Caption = '&Usuarios'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup1
      end
      item
        Items = <
          item
            Caption = '&ActionClientItem0'
          end>
      end
      item
        Items = <
          item
            Action = actInmuebles
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actCargaNovedades
            Caption = 'Ca&rga de Novedades'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actActualizacionContratosEscalonados
                Caption = '&Actualizaci'#243'n masiva Contratos Escalonados '
              end
              item
                Action = actABMIndices
                Caption = 'A&BM Indices'
              end>
            Action = actContratosEscalonados
            Caption = '&Contratos Escalonados'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Action = actComisionesEscalonadas
            Caption = 'C&omisiones Escalonadas'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup2
      end
      item
        Items = <
          item
            Caption = '&ActionClientItem0'
          end>
      end
      item
        Items = <
          item
            Caption = '&ActionClientItem0'
          end>
      end
      item
        Items = <
          item
            Caption = '&ActionClientItem0'
          end>
      end
      item
        Items = <
          item
            ChangesAllowed = [caModify]
            Items = <
              item
                Caption = '&ActionClientItem0'
              end>
            Caption = '&ActionClientItem0'
            KeyTip = 'F'
          end>
        ActionBar = RibbonApplicationMenuBar1
        AutoSize = False
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actModificacionGastosRecupero
                Caption = '&Modificacion Gastos Recupero'
              end
              item
                Action = actModificacionAgua
                Caption = 'M&odificaci'#243'n Masiva Agua'
              end
              item
                Action = actModificacionMuni
                Caption = 'Mo&dificaci'#243'n Masiva Municipalidad'
              end
              item
                Action = actModificacionDGR
                Caption = 'Mod&ificacion Masiva D.G.R'
              end>
            Action = actAutomatizacion
            Caption = '&ABM Automatizacion'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actMovimientosRepetidos
                Caption = '&Movimientos Repetidos'
              end>
            Action = actMovimientos
            Caption = 'A&BM Movimientos'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actNoAutomatizados
                Caption = '&Ver No Automatizados'
              end>
            Action = actGenAutom
            Caption = '&Generar Automatizaci'#243'n'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end>
        ActionBar = RibbonGroup3
      end
      item
        Items = <
          item
            Action = actabmNotas
            Caption = '&ABM Notas '
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup4
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actReciboReservaInmueble
                Caption = '&Recibo de Reserva'
                CommandProperties.ButtonType = btDropDown
              end
              item
                Action = actReciboSenaInmueble
                Caption = 'R&ecibo de Se'#241'a'
              end
              item
                Action = actReciboReservaVenta
                Caption = 'Rec&ibo de Reserva Venta'
              end
              item
                Action = actReciboSenaInmueblesVta
                Caption = 'Re&cibo de Se'#241'a Venta'
              end
              item
                Action = actRecibosDevolucion
                Caption = 'Reci&bo Devoluci'#243'n Se'#241'a'
              end
              item
                Action = actReciboLocatarioSaliente
                Caption = 'Recib&o Locatario Saliente'
              end>
            Action = actRecibos
            Caption = '&Recibos'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btDropDown
          end>
        ActionBar = rbgImpuestos
      end
      item
        Items = <
          item
            Action = actReciboInquilino
            Caption = '&Recibo para Inquilino'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actReciboComisiones
            Caption = 'R&ecibo de Comisiones'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actFacturaA
            Caption = 'Re&cibo A'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actFacturaB
            Caption = 'Rec&ibo B'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = ActLiquidacionPropietario
            Caption = '&Liquidaci'#243'n para Propietarios'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup5
      end
      item
        Items = <
          item
            Action = actABMConsorcios
            Caption = '&ABM Consorcios'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actABMDepartamentos
            Caption = 'A&BM Departamentos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actCargaGastos
            Caption = 'AB&M Gastos'
            CommandProperties.ButtonSize = bsLarge
          end>
      end
      item
      end
      item
      end
      item
        Items = <
          item
            Action = actCajaDiaria
            Caption = '&Caja Diaria'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actPasarHistorico
                Caption = '&Pasar al Historico'
              end
              item
                Action = actRecuperarHistorico
                Caption = '&Recuperar del Historico'
              end>
            Action = actPlanillaCaja
            Caption = '&Planilla de Caja'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Action = actItemsRepetidos
            Caption = '&Items repetidos'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup9
      end
      item
        Items = <
          item
            Action = actListadoCobrados
            Caption = '&Deuda por Inquilino'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoLiquidados
            Caption = 'L&istado Liquidados'
            CommandProperties.ButtonSize = bsLarge
          end>
      end
      item
      end
      item
        Items = <
          item
            Action = actListadoCobrados
            Caption = 'D&euda por Inquilino'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = actListadoDeudabot
            Caption = '&Listado de Deuda Bot'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup11
      end
      item
        Items = <
          item
            Action = actListadoEntregaLiquidaciones
            Caption = 'Lis&tado de Entrega de Liquidaciones'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoCobroInquilino
            Caption = 'Li&stado de Cobros a Inquilino'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoRecupero
            Caption = '&Listado de Recupero de Gastos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoComisionesCobradas
            Caption = 'Listad&o de Comisiones Cobradas'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoComisiones
            Caption = 'List&ado de Comisiones'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup12
      end
      item
        Items = <
          item
            Action = actHistorialRetiroLiquidaciones
            Caption = 'H&istorial de Retiro de Liquidaciones'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actHistorialPagoInquilinos
            Caption = '&Historial Pago de Inquilinos'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup13
      end
      item
        Items = <
          item
            Action = actCtaCteInquilinos
            Caption = '&Inquilinos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actCtaCtePropietarios
            Caption = '&Propietarios'
            CommandProperties.ButtonSize = bsLarge
          end>
      end
      item
        Items = <
          item
            Action = actImpuestosYServicios
            Caption = '&ABM Empresas de Impuestos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actPorcentajesPropiedad
            Caption = '&Porcentajes de Cobro por Propiedad'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actIdentificacion
            Caption = 'I&dentificacion Impuestos'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup15
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actLecturaIA
                Caption = '&actLecturaIA'
              end>
            Action = actActualizacionValores
            Caption = '&Actualizar Importes'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Action = actCrearMovimientos
            Caption = '&Rastrear Dif. y Generar Mov.'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actImpuestosPagados
            Caption = '&Impuestos pagados'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actDevolverDineroACaja
            Caption = '&Devolver Dinero a caja'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup16
      end
      item
        Items = <
          item
            Action = actPagadosNoCobrados
            Caption = 'P&agados vs. No cobrados'
          end
          item
            Action = actListadoCobradosPagados
            Caption = '&Pagados vs. Cobrados'
          end
          item
            Action = actCobradosNoPagados
            Caption = '&Cobrados vs. No Pagados'
          end>
        ActionBar = RibbonGroup6
      end
      item
        Items = <
          item
            Action = actVerBackups
            Caption = '&Ver Backups'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = actBackup
            Caption = '&Gesti'#243'n de Backups '
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup7
      end
      item
      end
      item
        Items = <
          item
            Action = actIndicadores
            Caption = '&ABM Indicadores'
            ImageIndex = 58
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actRubrosIndicadores
            Caption = 'A&BM Rubros Indicadores'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup8
      end
      item
        Items = <
          item
            Action = actTablero
            Caption = '&Tablero'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup14
      end
      item
      end
      item
        Items = <
          item
            Action = actCategoriasVales
            Caption = '&Categor'#237'as de Vales'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = rgpCategorias
      end
      item
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actRepetidos
                Caption = '&Buscar Items Repetidos'
              end>
            Action = actTodosVales
            Caption = '&Todos'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
            CommandProperties.GroupPosition = gpStart
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actCubrirVales
                Caption = '&Cubrir Vales'
              end>
            Action = actPlanillaVales
            Caption = '&Impuestos'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actCubrirLocatarioSaliente
                Caption = '&Cubrir Vales Locatario Saliente'
              end>
            Action = actLocatarioSaliente
            Caption = '&Locatario Saliente'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actCubrirSaldoAlquiler
                Caption = '&Cubrir Saldo Alquiler'
              end>
            Action = actSaldoAlquiler
            Caption = 'Sal&do Alquiler'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end
          item
            Caption = '-'
          end
          item
            Action = actArreglos
            Caption = '&Extrajudiciales'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actExpensas
            Caption = 'E&xpensas'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actPersonales
            Caption = 'C&ompromisos Eduardo'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actGastosInmobiliaria
            Caption = '&Gastos Inmobiliaria'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actValesCuentasBancarias
            Caption = 'Cue&ntas Bancarias'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actComplejos
            Caption = 'Co&mplejos y Consorcios'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actEugenio
                Caption = '&Consorcio Eugenio I'
              end
              item
                Action = actEstudiantina
                Caption = 'C&onsorcio Estudiantina'
              end>
            Action = actConsorcios
            Caption = '&Honorarios'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btDropDown
          end
          item
            Caption = '-'
          end
          item
            Action = actBalanceMensual
            Caption = '&Balance Mensual'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actCajaFuerte
            Caption = '&Caja Fuerte'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actSoloInformativos
            Caption = '&Solo Informativos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = actOtros
            Caption = 'Ot&ros'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = rgpVales
      end
      item
        Items = <
          item
            Items = <
              item
                Action = actRecibosHistoricos
                Caption = '&Recibos Hist'#243'ricos'
              end
              item
                Action = actRecibosAnomalias
                Caption = 'R&ecibos con Anomalias'
              end
              item
                Action = actUltimoReciboAbonado
                Caption = '&Ultimo Recibo Abonado (Para PRELEGALES)'
              end>
            Action = actRecibosPendientes
            Caption = '&Recibos y Liquidaciones Pendientes'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
            CommandProperties.GroupPosition = gpMiddle
          end
          item
            Caption = '-'
          end
          item
            Items = <
              item
                Action = actLiquidacionesHistoricas
                Caption = '&Liquidaciones Hist'#243'ricas'
              end
              item
                Action = actLiquidacionesAnomalias
                Caption = 'L&iquidaciones con Anomalias'
              end
              item
                Action = actLiquidacionesnoretiradas
                Caption = 'Li&quidaciones NO Retiradas'
              end
              item
                Action = actNoLiquidados
                Caption = '&NO Liquidados'
              end
              item
                Action = actUltimaLiquidacion
                Caption = '&Ultima Liquidaci'#243'n'
              end>
            Action = actLiquidacionesPendientes
            Caption = '&Liq. Pendientes Negativas'
            CommandProperties.ButtonSize = bsLarge
            CommandProperties.ButtonType = btSplit
          end>
        ActionBar = RibbonGroup10
      end
      item
        Items = <
          item
            Action = actImpuestosPendientes
            Caption = '&Impuestos Pendientes'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup17
      end
      item
        Items = <
          item
            Action = actPasarHistoricoVales
            Caption = '&Pasar al Hist'#243'rico'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actRecuperarHistoricoVales
            Caption = '&Recuperar del Hist'#243'rico'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = rgpHistorico
      end
      item
        Items = <
          item
            Action = actAnomalias
            Caption = '&Anomal'#237'as'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup21
      end
      item
        Items = <
          item
            Action = actHistoriaMovimientos
            Caption = '&Historial de Movimientos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actHistorialCaja
            Caption = 'H&istorial de Caja'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup22
      end
      item
        Items = <
          item
            Action = actInformeRecibo
            Caption = 'I&nforme Cobrados'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actInformeRecuperoGastos
            Caption = 'In&forme Recupero Gastos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actInformeReciboLiquidacion
            Caption = '&Informe Liquidacion'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup23
      end
      item
        Items = <
          item
            Action = actAutomatizadoNoPagado
            Caption = '&Automatizado No Pagado'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actInformeImpuestosAutomatizadosPagados
            Caption = '&En Vale No Automatizado'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actValeNoAutomatizadoDiferencia
            Caption = 'E&n Vale Dif. No Automatizado'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actValeNoCobrado
            Caption = 'En &Vale No Cobrado'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actenvaledifnocobradas
            Caption = 'En Va&le Dif. No Cobradas'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = Action3
            Caption = '&Items Repetidos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actComisionesNoCobradas
            Caption = '&Comisiones No Cobradas'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup18
      end>
    Left = 176
    Top = 200
    StyleName = 'Ribbon - Obsidian'
    object actInmuebles: TAction
      Caption = '&ABM Inmuebles'
      OnExecute = actInmueblesExecute
    end
    object actContratosEscalonados: TAction
      Caption = 'Contratos Escalonados'
      OnExecute = actContratosEscalonadosExecute
    end
    object actListadoInmuebles: TAction
      Caption = 'Listado Inmuebles'
      OnExecute = actListadoInmueblesExecute
    end
    object actDatosFijos: TAction
      Caption = 'Datos Fijos'
      OnExecute = actDatosFijosExecute
    end
    object actListadoDatosFijos: TAction
      Caption = 'Listado Datos Fijos'
      OnExecute = actListadoDatosFijosExecute
    end
    object actListadoContratosEscalonados: TAction
      Caption = 'Listado Contratos Escalonados'
      OnExecute = actListadoContratosEscalonadosExecute
    end
    object actAutomatizacion: TAction
      Caption = 'ABM Automatizaci'#243'n'
      OnExecute = actAutomatizacionExecute
    end
    object actGenAutom: TAction
      Caption = 'actGenAutom'
      OnExecute = actGenAutomExecute
    end
    object actMovimientos: TAction
      Caption = 'ABM Movimientos'
      OnExecute = actMovimientosExecute
    end
    object actListadoMovimientos: TAction
      Caption = 'actListadoMovimientos'
    end
    object actabmNotas: TAction
      Caption = 'ABM Notas '
      OnExecute = actabmNotasExecute
    end
    object actRecordatorio: TAction
      Caption = 'actabmRecordatorio'
      OnExecute = actRecordatorioExecute
    end
    object actReciboSenaInmueble: TAction
      Caption = 'actReciboSenaInmueble'
      OnExecute = actReciboSenaInmuebleExecute
    end
    object actReciboReservaInmueble: TAction
      Caption = 'actReciboReservaInmueble'
      OnExecute = actReciboReservaInmuebleExecute
    end
    object actReciboSenaInmueblesVta: TAction
      Caption = 'actReciboSe'#241'aInmueblesVta'
      OnExecute = actReciboSenaInmueblesVtaExecute
    end
    object actReciboInquilino: TAction
      Caption = 'actReciboInquilino'
      OnExecute = actReciboInquilinoExecute
    end
    object actReciboComisiones: TAction
      Caption = 'actReciboComisiones'
      OnExecute = actReciboComisionesExecute
    end
    object ActLiquidacionPropietario: TAction
      Caption = 'Liquidaci'#243'n para Propietarios'
      OnExecute = ActLiquidacionPropietarioExecute
    end
    object actReciboReservaVenta: TAction
      Caption = 'Recibo de Reserva Venta'
      OnExecute = actReciboReservaVentaExecute
    end
    object actABMConsorcios: TAction
      Caption = 'ABM Consorcios'
    end
    object actABMDepartamentos: TAction
      Caption = 'ABM Departamentos'
    end
    object actCargaGastos: TAction
      Caption = 'ABM Gastos'
    end
    object actAsignacionGastos: TAction
      Caption = 'Asignacion a Consorcios'
    end
    object actAsignacionDeptos: TAction
      Caption = 'Asignacion a Departamentos'
    end
    object actCobrarInquilino: TAction
      Caption = 'Cobrar a Inquilino'
    end
    object actRazonesSociales: TAction
      Caption = 'Razones Sociales'
      OnExecute = actRazonesSocialesExecute
    end
    object actRecibosPendientes: TAction
      Caption = 'Recibos y Liquidaciones Pendientes'
      OnExecute = actRecibosPendientesExecute
    end
    object actPlanillaCaja: TAction
      Caption = 'Planilla de Caja'
      OnExecute = actPlanillaCajaExecute
    end
    object actSobres: TAction
      Caption = 'Sobres'
      OnExecute = actSobresExecute
    end
    object actImpuestosPendientes: TAction
      Caption = 'Impuestos Pendientes'
      OnExecute = actImpuestosPendientesExecute
    end
    object actUsuarios: TAction
      Caption = 'Usuarios'
      OnExecute = actUsuariosExecute
    end
    object actListadoCobrados: TAction
      Caption = 'Deuda por Inquilino'
      OnExecute = actListadoCobradosExecute
    end
    object actListadoLiquidados: TAction
      Caption = 'Listado Liquidados'
      OnExecute = actListadoLiquidadosExecute
    end
    object actCtaCteInquilinos: TAction
      Caption = 'Inquilinos'
      OnExecute = actCtaCteInquilinosExecute
    end
    object actCtaCtePropietarios: TAction
      Caption = 'Propietarios'
      OnExecute = actCtaCtePropietariosExecute
    end
    object actCtaCteColaboradores: TAction
      Caption = 'Colaboradores'
    end
    object actListadoDeudaInquilinos: TAction
      Caption = 'Listado de Deuda por Inquilino'
      OnExecute = actListadoDeudaInquilinosExecute
    end
    object actListadoDeudaxPropietario: TAction
      Caption = 'Listado de Deuda por Propietario'
      OnExecute = actListadoDeudaxPropietarioExecute
    end
    object actHistorialPagoInquilinos: TAction
      Caption = 'Historial Pago de Inquilinos'
      OnExecute = actHistorialPagoInquilinosExecute
    end
    object actHistorialRetiroLiquidaciones: TAction
      Caption = 'Historial de Retiro de Liquidaciones'
      OnExecute = actHistorialRetiroLiquidacionesExecute
    end
    object actListadoCobroInquilino: TAction
      Caption = 'Listado de Cobros a Inquilino'
      OnExecute = actListadoCobroInquilinoExecute
    end
    object actListadoEntregaLiquidaciones: TAction
      Caption = 'Listado de Entrega de Liquidaciones'
      OnExecute = actListadoEntregaLiquidacionesExecute
    end
    object actListadoComisiones: TAction
      Caption = 'Listado de Comisiones'
      OnExecute = actListadoComisionesExecute
    end
    object actBackup: TAction
      Caption = 'Gesti'#243'n de Backups '
      OnExecute = actBackupExecute
    end
    object actListadoRecupero: TAction
      Caption = 'Listado de Recupero de Gastos'
      OnExecute = actListadoRecuperoExecute
    end
    object actPasarHistorico: TAction
      Caption = 'Pasar al Historico'
      OnExecute = actPasarHistoricoExecute
    end
    object actRecuperarHistorico: TAction
      Caption = 'Recuperar del Historico'
      OnExecute = actRecuperarHistoricoExecute
    end
    object actTiposIVA: TAction
      Caption = 'Tipos de IVA'
      OnExecute = actTiposIVAExecute
    end
    object actFacturaB: TAction
      Caption = 'Factura B'
      OnExecute = actFacturaBExecute
    end
    object actFacturaA: TAction
      Caption = 'Factura A'
      OnExecute = actFacturaAExecute
    end
    object actLibroIVAVentas: TAction
      Caption = 'Libro IVA Ventas'
      OnExecute = actLibroIVAVentasExecute
    end
    object actImpuestosYServicios: TAction
      Caption = 'ABM Empresas de Impuestos'
      OnExecute = actImpuestosYServiciosExecute
    end
    object actIdentificacion: TAction
      Caption = 'Identificacion Impuestos'
      OnExecute = actIdentificacionExecute
    end
    object actPorcentajesPropiedad: TAction
      Caption = 'Porcentajes de Cobro por Propiedad'
      OnExecute = actPorcentajesPropiedadExecute
    end
    object actCrearMovimientos: TAction
      Caption = 'Generar Movimientos'
      OnExecute = actCrearMovimientosExecute
    end
    object actCargaNovedades: TAction
      Caption = 'Carga de Novedades'
      OnExecute = actCargaNovedadesExecute
    end
    object actListadoComisionesCobradas: TAction
      Caption = 'Listado de Comisiones Cobradas'
      OnExecute = actListadoComisionesCobradasExecute
    end
    object actActualizacionValores: TAction
      Caption = 'Actualizar Importes'
      OnExecute = actActualizacionValoresExecute
    end
    object actImpuestosPagados: TAction
      Caption = 'Impuestos pagados'
      OnExecute = actImpuestosPagadosExecute
    end
    object actDevolverDineroACaja: TAction
      Caption = 'Devolver Dinero a caja'
      OnExecute = actDevolverDineroACajaExecute
    end
    object actListadoCobradosPagados: TAction
      Caption = 'Pagados vs. Cobrados'
      OnExecute = actListadoCobradosPagadosExecute
    end
    object actPagadosNoCobrados: TAction
      Caption = 'actPagadosNoCobrados'
      OnExecute = actPagadosNoCobradosExecute
    end
    object actCobradosNoPagados: TAction
      Caption = 'actCobradosNoPagados'
      OnExecute = actCobradosNoPagadosExecute
    end
    object actCobradosPagados: TAction
      Caption = 'Cobrados vs. Pagados'
    end
    object Action1: TAction
      Caption = 'Realizar Backup'
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Limpieza por Contrato Nuevo'
      OnExecute = Action2Execute
    end
    object actComisionesEscalonadas: TAction
      Caption = 'Comisiones Escalonadas'
      OnExecute = actComisionesEscalonadasExecute
    end
    object actListadoComisionesEscalonadas: TAction
      Caption = 'Listado de Comisiones Escalonadas'
      OnExecute = actListadoComisionesEscalonadasExecute
    end
    object actMailsPropietarios: TAction
      Caption = 'Enviar Liquidaciones por Mail'
      OnExecute = actMailsPropietariosExecute
    end
    object actNuevaTarea: TAction
      Caption = 'Nueva Tarea Mail'
    end
    object actConfiguracionMail: TAction
      Caption = 'Configurar E-Mail'
      OnExecute = actConfiguracionMailExecute
    end
    object actLiquidacionesPendientes: TAction
      Caption = 'Liquidaciones Pendientes'
      OnExecute = actLiquidacionesPendientesExecute
    end
    object actModificacionGastosRecupero: TAction
      Caption = 'Modificacion Gastos Recupero'
      OnExecute = actModificacionGastosRecuperoExecute
    end
    object actIndicadores: TAction
      Caption = 'ABM Indicadores'
      OnExecute = actIndicadoresExecute
    end
    object actCajas: TAction
      Caption = 'Cajas'
      OnExecute = actCajasExecute
    end
    object actRubrosDatosFijos: TAction
      Caption = 'Rubros Datos Fijos'
      OnExecute = actRubrosDatosFijosExecute
    end
    object actCajaDiaria: TAction
      Caption = 'Caja Diaria'
      OnExecute = actCajaDiariaExecute
    end
    object actTablero: TAction
      Caption = 'Tablero'
      OnExecute = actTableroExecute
    end
    object actRubrosIndicadores: TAction
      Caption = 'ABM Rubros Indicadores'
      OnExecute = actRubrosIndicadoresExecute
    end
    object actCategoriasVales: TAction
      Caption = 'Categor'#237'as Vales'
      OnExecute = actCategoriasValesExecute
    end
    object actPlanillaVales: TAction
      Caption = 'Vales'
      OnExecute = actPlanillaValesExecute
    end
    object actRecibosHistoricos: TAction
      Caption = 'Recibos Hist'#243'ricos'
      OnExecute = actRecibosHistoricosExecute
    end
    object actLiquidacionesHistoricas: TAction
      Caption = 'Liquidaciones Hist'#243'ricas'
      OnExecute = actLiquidacionesHistoricasExecute
    end
    object actRecibos: TAction
      Caption = 'Recibos'
      OnExecute = actRecibosExecute
    end
    object actCubrirVales: TAction
      Caption = 'Cubrir Vales'
      OnExecute = actCubrirValesExecute
    end
    object actValesCuentasBancarias: TAction
      Caption = 'Cuentas Bancarias'
      OnExecute = actValesCuentasBancariasExecute
    end
    object actArreglos: TAction
      Caption = 'Arreglos'
      OnExecute = actArreglosExecute
    end
    object actPersonales: TAction
      Caption = 'Personales'
      OnExecute = actPersonalesExecute
    end
    object actGastosInmobiliaria: TAction
      Caption = 'Gastos Inmobiliaria'
      OnExecute = actGastosInmobiliariaExecute
    end
    object actOtros: TAction
      Caption = 'Otros'
      OnExecute = actOtrosExecute
    end
    object actNoAutomatizados: TAction
      Caption = 'Ver No Automatizados'
      OnExecute = actNoAutomatizadosExecute
    end
    object actModificacionDGR: TAction
      Caption = 'Modificacion Masiva D.G.R'
      OnExecute = actModificacionDGRExecute
    end
    object actModificacionMuni: TAction
      Caption = 'Modificaci'#243'n Masiva Municipalidad'
      OnExecute = actModificacionMuniExecute
    end
    object actModificacionAgua: TAction
      Caption = 'Modificaci'#243'n Masiva Agua'
      OnExecute = actModificacionAguaExecute
    end
    object actConsorcios: TAction
      Caption = 'Honorarios'
      OnExecute = actConsorciosExecute
    end
    object actComplejos: TAction
      Caption = 'Complejos y Consorcios'
      OnExecute = actComplejosExecute
    end
    object actTodosVales: TAction
      Caption = 'Todos'
      OnExecute = actTodosValesExecute
    end
    object actExpensas: TAction
      Caption = 'Expensas'
      OnExecute = actExpensasExecute
    end
    object actNoLiquidados: TAction
      Caption = 'NO Liquidados'
      OnExecute = actNoLiquidadosExecute
    end
    object actLocatarioSaliente: TAction
      Caption = 'Locatario Saliente'
      OnExecute = actLocatarioSalienteExecute
    end
    object actRecibosDevolucion: TAction
      Caption = 'Recibo Devoluci'#243'n Se'#241'a'
      OnExecute = actRecibosDevolucionExecute
    end
    object actReciboLocatarioSaliente: TAction
      Caption = 'Recibo Locatario Saliente'
      OnExecute = actReciboLocatarioSalienteExecute
    end
    object actLiquidacionesnoretiradas: TAction
      Caption = 'Liquidaciones NO Retiradas'
      OnExecute = actLiquidacionesnoretiradasExecute
    end
    object actRecibosAnomalias: TAction
      Caption = 'Recibos con Anomalias'
      OnExecute = actRecibosAnomaliasExecute
    end
    object actLiquidacionesAnomalias: TAction
      Caption = 'Liquidaciones con Anomalias'
      OnExecute = actLiquidacionesAnomaliasExecute
    end
    object actPasarHistoricoVales: TAction
      Caption = 'Pasar al Hist'#243'rico'
      OnExecute = actPasarHistoricoValesExecute
    end
    object actRecuperarHistoricoVales: TAction
      Caption = 'Recuperar del Hist'#243'rico'
      OnExecute = actRecuperarHistoricoValesExecute
    end
    object actBalanceMensual: TAction
      Caption = 'Balance Mensual'
      OnExecute = actBalanceMensualExecute
    end
    object actFuturosPresupuestos: TAction
      Caption = 'Futuros Presupuestos'
      OnExecute = actFuturosPresupuestosExecute
    end
    object actAnomalias: TAction
      Caption = 'Anomal'#237'as'
      OnExecute = actAnomaliasExecute
    end
    object actHistoriaMovimientos: TAction
      Caption = 'Historial de Movimientos'
      OnExecute = actHistoriaMovimientosExecute
    end
    object actHistorialCaja: TAction
      Caption = 'Historial de Caja'
      OnExecute = actHistorialCajaExecute
    end
    object actHistorialCuentaCorriente: TAction
      Caption = 'Historial Cuenta Corriente'
    end
    object actCubrirLocatarioSaliente: TAction
      Caption = 'Cubrir Vales Locatario Saliente'
      OnExecute = actCubrirLocatarioSalienteExecute
    end
    object actEstudiantina: TAction
      Caption = 'Consorcio Estudiantina'
      OnExecute = actEstudiantinaExecute
    end
    object actEugenio: TAction
      Caption = 'Consorcio Eugenio I'
      OnExecute = actEugenioExecute
    end
    object actSaldoAlquiler: TAction
      Caption = 'Saldo Alquiler'
      OnExecute = actSaldoAlquilerExecute
    end
    object actCubrirSaldoAlquiler: TAction
      Caption = 'Cubrir Saldo Alquiler'
      OnExecute = actCubrirSaldoAlquilerExecute
    end
    object actCajaFuerte: TAction
      Caption = 'Caja Fuerte'
      OnExecute = actCajaFuerteExecute
    end
    object actUltimaLiquidacion: TAction
      Caption = 'Ultima Liquidaci'#243'n'
      OnExecute = actUltimaLiquidacionExecute
    end
    object actUltimoReciboAbonado: TAction
      Caption = 'Ultimo Recibo Abonado (Para PRELEGALES)'
      OnExecute = actUltimoReciboAbonadoExecute
    end
    object actInformeReciboLiquidacion: TAction
      Caption = 'Informe Liquidacion'
      OnExecute = actInformeReciboLiquidacionExecute
    end
    object actInformeRecibo: TAction
      Caption = 'Informe Cobrados'
      OnExecute = actInformeReciboExecute
    end
    object actInformeRecuperoGastos: TAction
      Caption = 'Informe Recupero Gastos'
      OnExecute = actInformeRecuperoGastosExecute
    end
    object actActualizacionContratosEscalonados: TAction
      Caption = 'Actualizaci'#243'n masiva Contratos Escalonados '
      OnExecute = actActualizacionContratosEscalonadosExecute
    end
    object actInformeImpuestosAutomatizadosPagados: TAction
      Caption = 'actInformeImpuestosAutomatizadosPagados'
      OnExecute = actInformeImpuestosAutomatizadosPagadosExecute
    end
    object actValeNoAutomatizadoDiferencia: TAction
      Caption = 'actValeNoAutomatizadoDiferencia'
      OnExecute = actValeNoAutomatizadoDiferenciaExecute
    end
    object actAutomatizadoNoPagado: TAction
      Caption = 'Automatizado No Pagado'
      OnExecute = actAutomatizadoNoPagadoExecute
    end
    object actValeNoCobrado: TAction
      Caption = 'En Vale No Cobrado'
      OnExecute = actValeNoCobradoExecute
    end
    object actenvaledifnocobradas: TAction
      Caption = 'En Vale Dif. No Cobradas'
      OnExecute = actenvaledifnocobradasExecute
    end
    object actRepetidos: TAction
      Caption = 'Buscar Items Repetidos'
      OnExecute = actRepetidosExecute
    end
    object actABMIndices: TAction
      Caption = 'ABM Indices'
      OnExecute = actABMIndicesExecute
    end
    object actHonorarios: TAction
      Caption = 'Honorarios'
      OnExecute = actHonorariosExecute
    end
    object actItemsRepetidos: TAction
      Caption = 'Items repetidos'
      OnExecute = actItemsRepetidosExecute
    end
    object actMovimientosRepetidos: TAction
      Caption = 'Movimientos Repetidos'
      OnExecute = actMovimientosRepetidosExecute
    end
    object actComisionesNoCobradas: TAction
      Caption = 'Comisiones No Cobradas'
      OnExecute = actComisionesNoCobradasExecute
    end
    object Action3: TAction
      Caption = 'Items Repetidos'
      OnExecute = Action3Execute
    end
    object actVerBackups: TAction
      Caption = 'Ver Backups'
      OnExecute = actVerBackupsExecute
    end
    object actLecturaIA: TAction
      Caption = 'actLecturaIA'
      OnExecute = actLecturaIAExecute
    end
    object actListadoDeudabot: TAction
      Caption = 'Listado de Deuda Bot'
      OnExecute = actListadoDeudabotExecute
    end
    object actSoloInformativos: TAction
      Caption = 'Solo Informativos'
      OnExecute = actSoloInformativosExecute
    end
  end
  object ScreenTipsManager1: TScreenTipsManager
    FooterImage.Data = {
      07544269746D61709E020000424D9E0200000000000036000000280000000E00
      00000E000000010018000000000068020000C40E0000C40E0000000000000000
      0000FF0099FF0099FF0099B8B8B8DADADABDAFAAC7ACA2C9AEA3C1B3ADE7E7E7
      CFCFCFFF0099FF0099FF00990000FF0099FF0099C7C7C7BDA49BA65336B85029
      BC532AC1572BC55A2CB86039CBB0A4D9D9D9FF0099FF00990000FF0099C7C7C7
      9D6B5CAE4927B24C28BC6241DCBCAFDDAF9CC2582BC5592CC4592BB37E68D9D9
      D9FF00990000C7C7C7B9A099A84426AC4727B14B28C18E7CCFCFCFE3E3E3BF55
      2AC0562BC0562BBE552AC8AEA4CFCFCF0000DCDCDCA4543AA84627AA4626AE49
      27B25231B5826FC4836BBA522ABB532ABB532ABA5229AA5636E7E7E70000BEB1
      ADB0502FB65631A84426AB4727AD5B3FA8A8A8AB9188B64F29B75029B64F29B5
      4E29B34D28BFB1AC0000C2ABA3B35633BD6138B85932A84426AB4727A2A2A2A7
      A7A7AE5C3FB24C28B24C28B14B28AF4A27C4ABA20000C8B2AAB55B37BD643BC2
      693CBE6338AF4E2CA66855A8A8A8A9A3A1B3684EAD4827AC4827AB4726C2A9A1
      0000CFC6C2B96744BC673EC06A3EC26B3EC46C3DBF6538BF907CC7C7C7CFC2BE
      AA4727AE4B29AC4929BCAFAB0000EBEBEBC89780BB6A42BE6C41C98B6ADCC1B2
      CF9474DBBAA9E8E8E8EEEEEEC06137BA5932A6553BDBDBDB0000B8B8B8EBE3E0
      C2805DBB6F45CA8F6FF4F4F4F5F5F5F5F5F5F6F6F6E5C9BCBB5E37B25230C0A7
      A0C7C7C70000FF0099CECECEDBCAC1C2835FBE7952D8AE96E9D1C4EEDACFD9AA
      93BF6C47B45936A37465C7C7C7FF00990000FF0099FF0099DCDCDCEBE4E1C9A0
      87BC7751B96F46BA6C44B96740B06B4DC1AAA2C7C7C7FF0099FF00990000FF00
      99FF0099FF0099D6D6D6ECECECD3CCC8D1BFB5CEBBB2C9BFBADEDEDEB8B8B8FF
      0099FF0099FF00990000}
    Left = 552
    Top = 312
  end
  object ilMenu16x16: TImageList
    ColorDepth = cd32Bit
    Left = 88
    Top = 392
  end
  object ilMenu16x16_d: TImageList
    ColorDepth = cd32Bit
    Left = 170
    Top = 392
  end
  object ilMenu32x32_d: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 170
    Top = 448
  end
  object ilMenu32x32: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 88
    Top = 448
  end
end
