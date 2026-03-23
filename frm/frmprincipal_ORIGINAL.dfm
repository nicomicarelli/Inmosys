object fPrincipal: TfPrincipal
  Left = -8
  Top = -8
  BorderStyle = bsSingle
  ClientHeight = 838
  ClientWidth = 1600
  Color = clCream
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
        Page = rbpInformes
      end
      item
        Caption = 'Consorcios'
        Page = rbpConfiguracion
      end
      item
        Caption = 'Cuentas Corrientes'
        Page = RibbonPage1
      end
      item
        Caption = 'Impuestos y Servicios'
        Page = RibbonPage2
      end>
    DesignSize = (
      1600
      143)
    StyleName = 'Ribbon - Obsidian'
    object RibbonApplicationMenuBar1: TRibbonApplicationMenuBar
      ActionManager = acmMenuPrincipal
      OptionItems = <>
      RecentItems = <>
    end
    object rbpInformes: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Recibos y Cobros'
      Index = 1
      object rbgImpuestos: TRibbonGroup
        Left = 4
        Top = 3
        Width = 302
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Recibos Se'#241'a'
        GroupIndex = 0
      end
      object RibbonGroup5: TRibbonGroup
        Left = 308
        Top = 3
        Width = 452
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Recibos y Liquidaciones'
        GroupIndex = 1
      end
      object RibbonGroup9: TRibbonGroup
        Left = 762
        Top = 3
        Width = 352
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Fondos y Caja'
        GroupIndex = 2
      end
      object RibbonGroup10: TRibbonGroup
        Left = 1116
        Top = 3
        Width = 137
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Listados'
        GroupIndex = 3
      end
    end
    object rbpConfiguracion: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Consorcios'
      Index = 2
      object RibbonGroup6: TRibbonGroup
        Left = 4
        Top = 3
        Width = 223
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Consorcios'
        GroupIndex = 0
      end
      object RibbonGroup7: TRibbonGroup
        Left = 229
        Top = 3
        Width = 175
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Aisgnaci'#243'n de Gastos'
        GroupIndex = 1
      end
      object RibbonGroup8: TRibbonGroup
        Left = 406
        Top = 3
        Width = 60
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Liquidaci'#243'n'
        GroupIndex = 2
      end
    end
    object RibbonPage1: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Cuentas Corrientes'
      Index = 3
      object RibbonGroup11: TRibbonGroup
        Left = 4
        Top = 3
        Width = 236
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Cuentas Corrientes'
        GroupIndex = 0
      end
      object RibbonGroup12: TRibbonGroup
        Left = 242
        Top = 3
        Width = 638
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Listados'
        GroupIndex = 1
      end
      object RibbonGroup13: TRibbonGroup
        Left = 882
        Top = 3
        Width = 197
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Historial'
        GroupIndex = 2
      end
    end
    object RibbonPage2: TRibbonPage
      Left = 0
      Top = 50
      Width = 1599
      Height = 93
      Caption = 'Impuestos y Servicios'
      Index = 4
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
        Width = 77
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Movimientos'
        GroupIndex = 1
      end
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
        Width = 448
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Conceptos y Datos Fijos'
        GroupAlign = gaHorizontal
        GroupIndex = 0
      end
      object RibbonGroup2: TRibbonGroup
        Left = 454
        Top = 3
        Width = 332
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Inmuebles'
        GroupIndex = 1
      end
      object RibbonGroup3: TRibbonGroup
        Left = 788
        Top = 3
        Width = 269
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Automatizaci'#243'n'
        GroupIndex = 2
      end
      object RibbonGroup4: TRibbonGroup
        Left = 1059
        Top = 3
        Width = 132
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Notas '
        GroupIndex = 3
      end
      object RibbonGroup14: TRibbonGroup
        Left = 1193
        Top = 3
        Width = 143
        Height = 86
        ActionManager = acmMenuPrincipal
        Caption = 'Cuenta Corriente'
        GroupIndex = 4
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
      OnExecute = e
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
            Action = actListadoDatosFijos
            Caption = '&Listado Datos Fijos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actTiposIVA
            Caption = '&Tipos de IVA'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actBackup
            Caption = '&Backup de Datos'
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
            Action = actListadoInmuebles
            Caption = '&Listado Inmuebles'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actContratosEscalonados
            Caption = '&Contratos Escalonados'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoContratosEscalonados
            Caption = 'Li&stado Contratos Escalonados'
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
            Action = actAutomatizacion
            Caption = '&ABM Automatizacion'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actMovimientos
            Caption = 'A&BM Movimientos'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actGenAutom
            Caption = '&Generar Automatizaci'#243'n'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup3
      end
      item
        Items = <
          item
            Action = actabmNotas
            Caption = '&ABM Notas '
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actRecordatorio
            Caption = '&Ver nota en Windows'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup4
      end
      item
        Items = <
          item
            Action = actReciboReservaInmueble
            Caption = '&Recibo de Reserva'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actReciboSenaInmueble
            Caption = 'R&ecibo de Se'#241'a'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actReciboReservaVenta
            Caption = 'Rec&ibo de Reserva Venta'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actReciboSenaInmueblesVta
            Caption = 'Re&cibo de Se'#241'a Venta'
            CommandProperties.ButtonSize = bsLarge
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
            Caption = 'F&actura A'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actFacturaB
            Caption = '&Factura B'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actLibroIVAVentas
            Caption = 'L&ibro IVA Ventas'
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
        ActionBar = RibbonGroup6
      end
      item
        Items = <
          item
            Action = actAsignacionGastos
            Caption = '&Asignacion a Consorcios'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actAsignacionDeptos
            Caption = 'A&signacion a Departamentos'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup7
      end
      item
        Items = <
          item
            Action = actCobrarInquilino
            Caption = '&Cobrar a Inquilino'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup8
      end
      item
        Items = <
          item
            Action = actRecibosPendientes
            Caption = '&Recibos Pendientes'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actImpuestosPendientes
            Caption = '&Impuestos Pendientes'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actPasarHistorico
            Caption = 'P&asar al Historico'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actRecuperarHistorico
            Caption = 'R&ecuperar del Historico'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actPlanillaCaja
            Caption = '&Planilla de Caja'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup9
      end
      item
        Items = <
          item
            Action = actListadoCobrados
            Caption = '&Listado Cobrados'
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
        ActionBar = RibbonGroup10
      end
      item
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
          end
          item
            Caption = '-'
          end
          item
            Action = actCtaCteColaboradores
            Caption = '&Colaboradores'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup11
      end
      item
        Items = <
          item
            Action = actListadoDeudaxPropietario
            Caption = 'L&istado de Deuda por Propietario'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
          item
            Action = actListadoDeudaInquilinos
            Caption = '&Listado de Deuda por Inquilino'
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Caption = '-'
          end
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
            Caption = 'Lista&do de Recupero de Gastos'
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
        ActionBar = RibbonGroup14
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
            Action = actCrearMovimientos
            Caption = '&Generar Movimientos'
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup16
      end>
    Left = 720
    Top = 152
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
      OnExecute = actABMConsorciosExecute
    end
    object actABMDepartamentos: TAction
      Caption = 'ABM Departamentos'
      OnExecute = actABMDepartamentosExecute
    end
    object actCargaGastos: TAction
      Caption = 'ABM Gastos'
      OnExecute = actCargaGastosExecute
    end
    object actAsignacionGastos: TAction
      Caption = 'Asignacion a Consorcios'
      OnExecute = actAsignacionGastosExecute
    end
    object actAsignacionDeptos: TAction
      Caption = 'Asignacion a Departamentos'
      OnExecute = actAsignacionDeptosExecute
    end
    object actCobrarInquilino: TAction
      Caption = 'Cobrar a Inquilino'
      OnExecute = actCobrarInquilinoExecute
    end
    object actRazonesSociales: TAction
      Caption = 'Razones Sociales'
      OnExecute = actRazonesSocialesExecute
    end
    object actRecibosPendientes: TAction
      Caption = 'Recibos Pendientes'
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
      Caption = 'Listado Cobrados'
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
      Caption = 'Backup de Datos'
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
  object dxSkinController1: TdxSkinController
    Kind = lfOffice11
    SkinName = 'Black'
    Left = 704
    Top = 232
  end
end
