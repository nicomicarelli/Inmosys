unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ToolWin, ComCtrls, Menus, Buttons, DB, DBTables,
  ActnList,Funciones, ImgList, Grids, Aligrid, Ribbon, RibbonLunaStyleActnCtrls, ActnMan,
  ActnCtrls, PlatformDefaultStyleActnCtrls,
  frmInmuebles, ActnMenus, RibbonActnMenus, ScreenTips, frmABMInmuebles,
  RibbonObsidianStyleActnCtrls, PNGImage, Declaraciones, sqlexpr, Graficos, CommCtrl,
  frmContratosEscalonados, frmAbmContratos, frmAutomatizacion,
  frmMovimientos, frmNotas, frmNotasWindows, Liqin,
  strUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxLookAndFeels, FrmGestionEmail,
  System.Actions, FXQuery, AdvSmoothListBox, frmReciboDevolucion, frmReciboLocatarioSaliente;

type
  TfPrincipal = class(TForm)
    actListaAcciones: TActionList;
    actSalir: TAction;
    actAbrirFormularios: TAction;
    StatusBar1: TStatusBar;
    actContratos: TAction;
    acmMenuPrincipal: TActionManager;
    actInmuebles: TAction;
    actContratosEscalonados: TAction;
    actListadoInmuebles: TAction;
    ScreenTipsManager1: TScreenTipsManager;
    actDatosFijos: TAction;
    actListadoDatosFijos: TAction;
    rbMenuPrincipal: TRibbon;
    rbpArchivos: TRibbonPage;
    rbpRecibosCobros: TRibbonPage;
    rbgImpuestos: TRibbonGroup;
    ilMenu16x16: TImageList;
    ilMenu16x16_d: TImageList;
    ilMenu32x32_d: TImageList;
    ilMenu32x32: TImageList;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    actListadoContratosEscalonados: TAction;
    RibbonGroup3: TRibbonGroup;
    actAutomatizacion: TAction;
    actGenAutom: TAction;
    actMovimientos: TAction;
    actListadoMovimientos: TAction;
    RibbonGroup4: TRibbonGroup;
    actabmNotas: TAction;
    actRecordatorio: TAction;
    actReciboSenaInmueble: TAction;
    actReciboReservaInmueble: TAction;
    actReciboSenaInmueblesVta: TAction;
    RibbonGroup5: TRibbonGroup;
    actReciboInquilino: TAction;
    actReciboComisiones: TAction;
    ActLiquidacionPropietario: TAction;
    actReciboReservaVenta: TAction;
    actABMConsorcios: TAction;
    actABMDepartamentos: TAction;
    actCargaGastos: TAction;
    actAsignacionGastos: TAction;
    actAsignacionDeptos: TAction;
    actCobrarInquilino: TAction;
    actRazonesSociales: TAction;
    RibbonGroup9: TRibbonGroup;
    actRecibosPendientes: TAction;
    actPlanillaCaja: TAction;
    actSobres: TAction;
    actImpuestosPendientes: TAction;
    actUsuarios: TAction;
    actListadoCobrados: TAction;
    actListadoLiquidados: TAction;
    rbpCuentasCorrientes: TRibbonPage;
    RibbonGroup11: TRibbonGroup;
    RibbonGroup12: TRibbonGroup;
    actCtaCteInquilinos: TAction;
    actCtaCtePropietarios: TAction;
    actCtaCteColaboradores: TAction;
    actListadoDeudaInquilinos: TAction;
    actListadoDeudaxPropietario: TAction;
    RibbonGroup13: TRibbonGroup;
    actHistorialPagoInquilinos: TAction;
    actHistorialRetiroLiquidaciones: TAction;
    actListadoCobroInquilino: TAction;
    actListadoEntregaLiquidaciones: TAction;
    actListadoComisiones: TAction;
    actBackup: TAction;
    actListadoRecupero: TAction;
    actPasarHistorico: TAction;
    actRecuperarHistorico: TAction;
    actTiposIVA: TAction;
    actFacturaB: TAction;
    actFacturaA: TAction;
    actLibroIVAVentas: TAction;
    rbpImpuestos: TRibbonPage;
    RibbonGroup15: TRibbonGroup;
    actImpuestosYServicios: TAction;
    actIdentificacion: TAction;
    actPorcentajesPropiedad: TAction;
    actCrearMovimientos: TAction;
    RibbonGroup16: TRibbonGroup;
    actCargaNovedades: TAction;
    actListadoComisionesCobradas: TAction;
    actActualizacionValores: TAction;
    actImpuestosPagados: TAction;
    actDevolverDineroACaja: TAction;
    RibbonGroup6: TRibbonGroup;
    actListadoCobradosPagados: TAction;
    actPagadosNoCobrados: TAction;
    actCobradosNoPagados: TAction;
    actCobradosPagados: TAction;
    RibbonGroup7: TRibbonGroup;
    Action1: TAction;
    Action2: TAction;
    actComisionesEscalonadas: TAction;
    actListadoComisionesEscalonadas: TAction;
    actMailsPropietarios: TAction;
    actNuevaTarea: TAction;
    actConfiguracionMail: TAction;
    actLiquidacionesPendientes: TAction;
    actModificacionGastosRecupero: TAction;
    rbpTablero: TRibbonPage;
    RibbonGroup8: TRibbonGroup;
    actIndicadores: TAction;
    actCajas: TAction;
    actRubrosDatosFijos: TAction;
    actCajaDiaria: TAction;
    RibbonGroup14: TRibbonGroup;
    actTablero: TAction;
    actRubrosIndicadores: TAction;
    rbpVales: TRibbonPage;
    actCategoriasVales: TAction;
    rgpCategorias: TRibbonGroup;
    actPlanillaVales: TAction;
    actRecibosHistoricos: TAction;
    actLiquidacionesHistoricas: TAction;
    actRecibos: TAction;
    actCubrirVales: TAction;
    rgpVales: TRibbonGroup;
    actValesCuentasBancarias: TAction;
    actArreglos: TAction;
    actPersonales: TAction;
    actGastosInmobiliaria: TAction;
    actOtros: TAction;
    actNoAutomatizados: TAction;
    actModificacionDGR: TAction;
    actModificacionMuni: TAction;
    actModificacionAgua: TAction;
    actConsorcios: TAction;
    actComplejos: TAction;
    actTodosVales: TAction;
    actExpensas: TAction;
    actNoLiquidados: TAction;
    actLocatarioSaliente: TAction;
    actRecibosDevolucion: TAction;
    actReciboLocatarioSaliente: TAction;
    actLiquidacionesnoretiradas: TAction;
    actRecibosAnomalias: TAction;
    actLiquidacionesAnomalias: TAction;
    RibbonGroup10: TRibbonGroup;
    RibbonGroup17: TRibbonGroup;
    rgpHistorico: TRibbonGroup;
    actPasarHistoricoVales: TAction;
    actRecuperarHistoricoVales: TAction;
    actBalanceMensual: TAction;
    actFuturosPresupuestos: TAction;
    RibbonGroup21: TRibbonGroup;
    actAnomalias: TAction;
    RibbonGroup22: TRibbonGroup;
    actHistoriaMovimientos: TAction;
    actHistorialCaja: TAction;
    actHistorialCuentaCorriente: TAction;
    actCubrirLocatarioSaliente: TAction;
    actEstudiantina: TAction;
    actEugenio: TAction;
    actSaldoAlquiler: TAction;
    actCubrirSaldoAlquiler: TAction;
    actCajaFuerte: TAction;
    actUltimaLiquidacion: TAction;
    actUltimoReciboAbonado: TAction;
    RibbonGroup23: TRibbonGroup;
    actInformeReciboLiquidacion: TAction;
    actInformeRecibo: TAction;
    actInformeRecuperoGastos: TAction;
    actActualizacionContratosEscalonados: TAction;
    RibbonGroup18: TRibbonGroup;
    actInformeImpuestosAutomatizadosPagados: TAction;
    actValeNoAutomatizadoDiferencia: TAction;
    actAutomatizadoNoPagado: TAction;
    actValeNoCobrado: TAction;
    actenvaledifnocobradas: TAction;
    actRepetidos: TAction;
    actABMIndices: TAction;
    actHonorarios: TAction;
    actItemsRepetidos: TAction;
    actMovimientosRepetidos: TAction;
    actComisionesNoCobradas: TAction;
    Action3: TAction;
    actVerBackups: TAction;
    actLecturaIA: TAction;
    actListadoDeudabot: TAction;
    actSoloInformativos: TAction;
    procedure botonsalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSalirExecute(Sender: TObject);
    procedure CerrarHijos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure actContratosExecute(Sender: TObject);
    procedure actInmueblesExecute(Sender: TObject);
    procedure actDatosFijosExecute(Sender: TObject);
    procedure actListadoDatosFijosExecute(Sender: TObject);
    procedure actListadoInmueblesExecute(Sender: TObject);
    procedure actContratosEscalonadosExecute(Sender: TObject);
    procedure actListadoContratosEscalonadosExecute(Sender: TObject);
    procedure actAutomatizacionExecute(Sender: TObject);
    procedure actMovimientosExecute(Sender: TObject);
    procedure actGenAutomExecute(Sender: TObject);
    procedure actabmNotasExecute(Sender: TObject);
    procedure actRecordatorioExecute(Sender: TObject);
    procedure actReciboReservaInmuebleExecute(Sender: TObject);
    procedure actReciboSenaInmuebleExecute(Sender: TObject);
    procedure actReciboReservaVentaExecute(Sender: TObject);
    procedure actReciboSenaInmueblesVtaExecute(Sender: TObject);
    procedure actReciboInquilinoExecute(Sender: TObject);
    procedure actReciboComisionesExecute(Sender: TObject);
    procedure ActLiquidacionPropietarioExecute(Sender: TObject);
    procedure actRazonesSocialesExecute(Sender: TObject);
    procedure actRecibosPendientesExecute(Sender: TObject);
    procedure actPlanillaCajaExecute(Sender: TObject);
    procedure actSobresExecute(Sender: TObject);
    procedure actImpuestosPendientesExecute(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure actListadoCobradosExecute(Sender: TObject);
    procedure actListadoLiquidadosExecute(Sender: TObject);
    procedure actCtaCteInquilinosExecute(Sender: TObject);
    procedure actCtaCtePropietariosExecute(Sender: TObject);
    procedure actListadoDeudaInquilinosExecute(Sender: TObject);
    procedure actListadoDeudaxPropietarioExecute(Sender: TObject);
    procedure actHistorialPagoInquilinosExecute(Sender: TObject);
    procedure actHistorialRetiroLiquidacionesExecute(Sender: TObject);
    procedure actListadoCobroInquilinoExecute(Sender: TObject);
    procedure actListadoEntregaLiquidacionesExecute(Sender: TObject);
    procedure actListadoComisionesExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actListadoRecuperoExecute(Sender: TObject);
    procedure actPasarHistoricoExecute(Sender: TObject);
    procedure actRecuperarHistoricoExecute(Sender: TObject);
    procedure actTiposIVAExecute(Sender: TObject);
    procedure actFacturaBExecute(Sender: TObject);
    procedure actFacturaAExecute(Sender: TObject);
    procedure actLibroIVAVentasExecute(Sender: TObject);
    procedure actImpuestosYServiciosExecute(Sender: TObject);
    procedure actIdentificacionExecute(Sender: TObject);
    procedure actPorcentajesPropiedadExecute(Sender: TObject);
    procedure actCrearMovimientosExecute(Sender: TObject);
    procedure actCargaNovedadesExecute(Sender: TObject);
    procedure actListadoComisionesCobradasExecute(Sender: TObject);
    procedure actActualizacionValoresExecute(Sender: TObject);
    procedure actImpuestosPagadosExecute(Sender: TObject);
    procedure actDevolverDineroACajaExecute(Sender: TObject);
    procedure actPagadosNoCobradosExecute(Sender: TObject);
    procedure actListadoCobradosPagadosExecute(Sender: TObject);
    procedure actCobradosNoPagadosExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure actComisionesEscalonadasExecute(Sender: TObject);
    procedure actListadoComisionesEscalonadasExecute(Sender: TObject);
    procedure actMailsPropietariosExecute(Sender: TObject);
    procedure actNuevaTareaExecute(Sender: TObject);
    procedure actConfiguracionMailExecute(Sender: TObject);
    procedure actLiquidacionesPendientesExecute(Sender: TObject);
    procedure actModificacionGastosRecuperoExecute(Sender: TObject);
    procedure actIndicadoresExecute(Sender: TObject);
    procedure actCajasExecute(Sender: TObject);
    procedure actRubrosDatosFijosExecute(Sender: TObject);
    procedure actCajaDiariaExecute(Sender: TObject);
    procedure actTableroExecute(Sender: TObject);
    procedure actRubrosIndicadoresExecute(Sender: TObject);
    procedure actCategoriasValesExecute(Sender: TObject);
    procedure actPlanillaValesExecute(Sender: TObject);
    procedure actRecibosHistoricosExecute(Sender: TObject);
    procedure actLiquidacionesHistoricasExecute(Sender: TObject);
    procedure actRecibosExecute(Sender: TObject);
    procedure actCubrirValesExecute(Sender: TObject);
    procedure actNoAutomatizadosExecute(Sender: TObject);
    procedure actModificacionDGRExecute(Sender: TObject);
    procedure actModificacionMuniExecute(Sender: TObject);
    procedure actModificacionAguaExecute(Sender: TObject);
    procedure actArreglosExecute(Sender: TObject);
    procedure actPersonalesExecute(Sender: TObject);
    procedure actOtrosExecute(Sender: TObject);
    procedure actGastosInmobiliariaExecute(Sender: TObject);
    procedure actValesCuentasBancariasExecute(Sender: TObject);
    procedure actComplejosExecute(Sender: TObject);
    procedure actTodosValesExecute(Sender: TObject);
    procedure actExpensasExecute(Sender: TObject);
    procedure actNoLiquidadosExecute(Sender: TObject);
    procedure actLocatarioSalienteExecute(Sender: TObject);
    procedure actRecibosDevolucionExecute(Sender: TObject);
    procedure actReciboLocatarioSalienteExecute(Sender: TObject);
    procedure actLiquidacionesnoretiradasExecute(Sender: TObject);
    procedure actRecibosAnomaliasExecute(Sender: TObject);
    procedure actLiquidacionesAnomaliasExecute(Sender: TObject);
    procedure actPasarHistoricoValesExecute(Sender: TObject);
    procedure actRecuperarHistoricoValesExecute(Sender: TObject);
    procedure actFuturosPresupuestosExecute(Sender: TObject);
    procedure actBalanceMensualExecute(Sender: TObject);
    procedure actAnomaliasExecute(Sender: TObject);
    procedure actHistoriaMovimientosExecute(Sender: TObject);
    procedure actHistorialCajaExecute(Sender: TObject);
    procedure actCubrirLocatarioSalienteExecute(Sender: TObject);
    procedure actEugenioExecute(Sender: TObject);
    procedure actEstudiantinaExecute(Sender: TObject);
    procedure actSaldoAlquilerExecute(Sender: TObject);
    procedure actCubrirSaldoAlquilerExecute(Sender: TObject);
    procedure actCajaFuerteExecute(Sender: TObject);
    procedure actUltimaLiquidacionExecute(Sender: TObject);
    procedure actUltimoReciboAbonadoExecute(Sender: TObject);
    procedure actInformeReciboLiquidacionExecute(Sender: TObject);
    procedure actInformeReciboExecute(Sender: TObject);
    procedure actInformeRecuperoGastosExecute(Sender: TObject);
    procedure actConsorciosExecute(Sender: TObject);
    procedure actActualizacionContratosEscalonadosExecute(Sender: TObject);
    procedure actInformeImpuestosAutomatizadosPagadosExecute(Sender: TObject);
    procedure actValeNoAutomatizadoDiferenciaExecute(Sender: TObject);
    procedure actAutomatizadoNoPagadoExecute(Sender: TObject);
    procedure actValeNoCobradoExecute(Sender: TObject);
    procedure actenvaledifnocobradasExecute(Sender: TObject);
    procedure actRepetidosExecute(Sender: TObject);
    procedure actABMIndicesExecute(Sender: TObject);
    procedure actHonorariosExecute(Sender: TObject);
    procedure actItemsRepetidosExecute(Sender: TObject);
    procedure actMovimientosRepetidosExecute(Sender: TObject);
    procedure actComisionesNoCobradasExecute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure actVerBackupsExecute(Sender: TObject);
    procedure actLecturaIAExecute(Sender: TObject);
    procedure actListadoDeudabotExecute(Sender: TObject);
    procedure actSoloInformativosExecute(Sender: TObject);
  private
  public
    fUsuario: String;
    FCodigoCaja: Integer;
    procedure Center(F: TForm);
    procedure prCargarIconosMenu;
    procedure ActualizarContratosEscalonados(Fecha:TDateTime; pCodigo: String);
    procedure ActualizarComisionesEscalonadas(Fecha:TDateTime; pCodigo: String);
    procedure actConsorcioExecute(Sender: TObject);
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  frmLogin, frmDatosFijos, frmABMDatosFijos, frmABMMovimientos, frmgenautom,
  recrinm, recsinm, recrinmvta, recsinmvta, frmLiquidacionComisiones, frmLiquidacionParaPropietarios,
  frmABMRazonesSociales, frmRecibosPendientes, frmPlanillaCaja, frmABMSobres,
  frmdatos, frmImpuestosPendientes, frmclavecaja, frmABMUsuarios,
  frmListadoCobrados, frmListadoLiquidados, frmABMCtaCteInquilinos,
  frmABMCtaCtePropietarios, frmListadoDeudaInquilinos,
  frmListadoDeudaPropietarios, frmHistorialPagoInquilinos,
  frmHistorialRetiroLiquidaciones, frmHistorialCobroInquilinos,
  frmHistorialEntregaLiquidaciones, frmListadoComisiones, frmBackupDatos,
  frmPasarHistorico, frmRecuperarHistorico, frmAlicuotasIVA, frmFacturaA,
  frmFacturaB, frmLibroIVAVentas, ABMImpuestosYServicios,
  ABMIdentificacionImpuestos, ABMPorcentajesCobro, frmNuevoMovimientoImpuestos,
  ABMGeneracionMovimientos, frmABMNovedades, frmListadoComisionesCobradas,
  ABMActualizacionValores, ABMImpuestosPagados, ListadoImpuestosYServicios,
  frmComisionesEscalonadas, frmABMComisiones, frmConfiguracionMail,
  frmMailPropietarios, frmABMConfiguracionMails, frmModificacionRecuperoGastos,
  frmABMIndicadores, frmABMCajas, frmABMRubrosDatosFijos, frmTablero,
  frmABMRubrosIndicadores, frmABMCategoriasVales, frmABMVales,
  frmRecibosHistoricos, frmLiquidacionesHistoricas, frmCubrirVales,
  frmAutomatizados, frmModificacionRentas, frmLimpiarHistoriaPropiedad,
  frmPasarHistoricoVales, frmRecuperarHistoricoVales, frmAnomalias,
  frmHistorialMovimientos, frmHistorialCaja, frmCubrirValesArreglos,
  frmCubrirValesSaldoAlquiler, frmListadoUltimoLiquidados, frmActualizacionContratosEscalonados,
  frmInformeReciboLiquidacion, frmInformeImpuestosPagados,
  frmABMIndicesActualizacion, frmVerBackupDatos, frmLecturaIA;

{$R *.DFM}

procedure TfPrincipal.prCargarIconosMenu;
var
  pngImagen32: TPngImage;
  pngImagen16: TPngImage;
  bmpImagen16: TbITMAP;
  bmpImagen32: TbITMAP;
  i : Integer;
  J : Integer;
  Accion: String;
  ItemMenu : TAction;
  FHandle: THandle;
  BarItem : TActionBarItem;
  ActItem : TActionClientItem;
  q: TFXQuery;

begin
  FHandle := fxCargarLibreria(Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4)+'\Librerias\Menues.dll');
  q := CrearQuery;
  try
    if FHandle = 0 then
      Exit;

    q.SQL.Text :=
      ' Select distinct Accion, codigoMenu, ImageIndex'+
      '   from Menu'+
      '  where ImageIndex >= 1'+
      '  Order By ImageIndex asc';
    q.Open;

    for I := 0 to fprincipal.acmMenuPrincipal.ActionCount - 1 do
      TAction(fprincipal.acmMenuPrincipal.Actions[i]).ImageIndex := -1;

    while not q.Eof do
    begin
      Accion := q.FieldByName('Accion').AsString;
      ItemMenu := TAction(fPrincipal.FindComponent(Accion));

      if Assigned(ItemMenu) then
      begin
        ItemMenu.ImageIndex := q.FieldByName('ImageIndex').AsInteger -1;

        try
          pngImagen16 := TPngImage.create;
          pngImagen32 := TPngImage.create;
          bmpImagen32 := TbITMAP.create;
          bmpImagen16 := TbITMAP.create;
          try
            pngImagen32 := GetPng(FHandle, Trim(Accion));
            pngImagen16 := GetPng(FHandle, Trim(Accion));
            bmpImagen32.Assign(pngImagen32);

            fPrincipal.ilMenu16x16.Height := 16;
            fPrincipal.ilMenu16x16.Width := 16;
            ImageList_AddMasked(fPrincipal.IlMenu32x32.Handle, bmpImagen32.handle, ColorToRGB(clWhite));

            RedimensionarPng(pngImagen32, pngImagen16);
            bmpImagen16.Assign(pngImagen16);
            ImageList_AddMasked(fPrincipal.IlMenu16x16.Handle, bmpImagen16.handle, ColorToRGB(clWhite));

            PngToGray(pngImagen32, pngImagen32);
            bmpImagen32.Assign(pngImagen32);
            ImageList_AddMasked(fPrincipal.IlMenu32x32_d.Handle, bmpImagen32.handle, ColorToRGB(clWhite));

            PngToGray(pngImagen16, pngImagen16);
            bmpImagen16.Assign(pngImagen16);
            ImageList_AddMasked(fPrincipal.IlMenu16x16_d.Handle, bmpImagen16.handle, ColorToRGB(clWhite));
          finally
            pngImagen32.Free;
            pngImagen16.Free;
            bmpImagen32.Free;
            bmpImagen16.Free;
          end;
        except
          ItemMenu.ImageIndex := -1;
        end;
      end;
      q.Next;
    end;

  finally
    FreeLibrary(FHandle);
    FreeAndNil(q);
    fPrincipal.acmMenuPrincipal.Images              := fPrincipal.ilMenu16x16;
    fPrincipal.acmMenuPrincipal.DisabledImages      := fPrincipal.ilMenu16x16_d;
    fPrincipal.acmMenuPrincipal.LargeImages         := fPrincipal.ilMenu32x32;
    fPrincipal.acmMenuPrincipal.LargeDisabledImages := fPrincipal.ilMenu32x32_d;

    for i:= 0 to fPrincipal.acmMenuPrincipal.ActionBars.Count-1 do
    begin
      BarItem := TActionBarItem(fPrincipal.acmMenuPrincipal.ActionBars.Items[i]);
      for j := 0 to BarItem.Items.Count-1 do
      begin
        ActItem := TActionClientItem(BarItem.Items.Items[j]);
        SetearImageIndex(ActItem);
      end;
    end;

    for I := 0 to fPrincipal.ComponentCount -1 do
      if fPrincipal.Components[i].ClassNameIs('TRibbonGroup') then
        TRibbonGroup(fPrincipal.Components[i]).alignGroupControls;
  end;
end;

procedure TfPrincipal.botonsalirClick(Sender: TObject);
begin
  activemdichild.Close;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ObtenerRealizaBackup = 1) Then
  begin
    if MostrarDialogoSiNO('Se generará el backup de los datos del sistemsa. ¿Desea Continuar? ') then
    begin
      if fxGenerarBackup then
        MostrarDialogoAceptar('Backup Generado correctamente. No olvide copiarlo a un medio extraible.');
    end;
  end;

  Action := caFree;

end;


procedure TfPrincipal.actSaldoAlquilerExecute(Sender: TObject);
begin
  if fABMValesSaldoAlquiler = nil then
    Application.CreateForm(TFABMVales, fABMValesSaldoAlquiler)
  else
    fABMValesSaldoAlquiler.Show;
  fABMValesSaldoAlquiler.Categoria := 15;
  fABMValesSaldoAlquiler.cbCategoria.EditValue := 15;
  fABMValesSaldoAlquiler.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TfPrincipal.actSobresExecute(Sender: TObject);
begin
  if FABMSobres = nil then
    Application.CreateForm(TFABMSobres, FABMSobres)
  else
    FABMSobres.Show;
end;

procedure TfPrincipal.actSoloInformativosExecute(Sender: TObject);
begin
  if fABMValesSoloInformativos = nil then
    Application.CreateForm(TFABMVales, fABMValesSoloInformativos)
  else
    fABMValesSoloInformativos.Show;
  fABMValesSoloInformativos.Categoria := 19;
  fABMValesSoloInformativos.cbCategoria.EditValue := 19;
  fABMValesSoloInformativos.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actTableroExecute(Sender: TObject);
begin
  if FTablero = nil then
    Application.CreateForm(TFTablero, FTablero)
  else
    FTablero.Show;
end;

procedure TfPrincipal.actTiposIVAExecute(Sender: TObject);
begin
  if FAlicuotasIVA = nil then
    Application.CreateForm(TFAlicuotasIVA, FAlicuotasIVA)
  else
    FAlicuotasIVA.Show;
end;

procedure TfPrincipal.actTodosValesExecute(Sender: TObject);
begin
  if FABMVales = nil then
    Application.CreateForm(TFABMVales, FABMVales)
  else
    FABMVales.Show;
end;

procedure TfPrincipal.actUltimaLiquidacionExecute(Sender: TObject);
begin
  if fListadoUltimoLiquidados = nil then
    Application.CreateForm(TfListadoUltimoLiquidados, fListadoUltimoLiquidados)
  else
    fListadoUltimoLiquidados.Show;
  fListadoUltimoLiquidados.FTipo := 'LI';
  fListadoUltimoLiquidados.chDesocupados.Visible := False;
  fListadoUltimoLiquidados.chDesocupados.Visible := True;
end;

procedure TfPrincipal.actUltimoReciboAbonadoExecute(Sender: TObject);
begin
  if fListadoUltimoLiquidados = nil then
    Application.CreateForm(TfListadoUltimoLiquidados, fListadoUltimoLiquidados)
  else
    fListadoUltimoLiquidados.Show;
  fListadoUltimoLiquidados.FTipo := 'RE';
  fListadoUltimoLiquidados.Caption := 'Ultimo recibo cobrado';
  fListadoUltimoLiquidados.chDesocupados.Visible := True;

end;

procedure TfPrincipal.actUsuariosExecute(Sender: TObject);
begin
  if FABMUsuarios = nil then
    Application.CreateForm(TFABMUsuarios, FABMUsuarios)
  else
    FABMUsuarios.Show;
end;

procedure TfPrincipal.actValeNoAutomatizadoDiferenciaExecute(Sender: TObject);
begin
  if fInformeDifNoAutomatizadas = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeDifNoAutomatizadas)
  else
    fInformeDifNoAutomatizadas.Show;
  fInformeDifNoAutomatizadas.Caption := 'En Vale Diferencias No Automatizadas';
  fInformeDifNoAutomatizadas.TipoInforme := tiValeNoAutomatizadoDiferencia;
  fInformeDifNoAutomatizadas.gDetalle.ColCount := 6;
  fInformeDifNoAutomatizadas.gDetalle.PopupMenu := fInformeDifNoAutomatizadas.popOpciones;

end;

procedure TfPrincipal.actValeNoCobradoExecute(Sender: TObject);
begin
  if fInformeValeNoCobrado = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeValeNoCobrado)
  else
    fInformeValeNoCobrado.Show;
  fInformeValeNoCobrado.Caption := 'En Vale No Cobrado';
  fInformeValeNoCobrado.TipoInforme := tiValeNoCobrado;
  fInformeValeNoCobrado.gDetalle.ColCount := 6;
end;

procedure TfPrincipal.actValesCuentasBancariasExecute(Sender: TObject);
begin
  if FABMValesCuentasBancarias = nil then
    Application.CreateForm(TFABMVales, FABMValesCuentasBancarias)
  else
    FABMValesCuentasBancarias.Show;
  FABMValesCuentasBancarias.Categoria := 6;
  FABMValesCuentasBancarias.cbCategoria.EditValue := 6;
  FABMValesCuentasBancarias.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actVerBackupsExecute(Sender: TObject);
begin
  if FVerBackUpDatos = nil then
    Application.CreateForm(TfVerBackupDatos, fVerBackupDatos)
  else
    fVerBackupDatos.Show;
end;

procedure TfPrincipal.Center(F: TForm);
begin
  if f.FormStyle <> fsMDIChild then
    f.Left := (((Self.ClientWidth div 2 ) - (f.Width div 2)) + Self.Left)
  else
    f.Left := (((Self.ClientWidth div 2 ) - (f.Width div 2)));

  if f.FormStyle <> fsMDIChild then
    f.Top := (((Self.ClientHeight div 2 ) - (f.Height div 2))-103)
  else
    f.Top := ((((Self.ClientHeight -143 - 20) div 2 ) - (f.Height div 2)));

end;

procedure TfPrincipal.CerrarHijos1Click(Sender: TObject);
begin
 ActiveMdiChild.Close;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
var
  I, J, K: Integer;
  Pagina: TRibbonPage;
  Grupo: TRibbonGroup;
  Accion: TActionClientItem;
  Consorcio: TAction;
  q: TFXQuery;
begin
  if TFrmClave.Ejecutar then
  begin
    prCargarIconosMenu;
    actContratos.Execute;
    q := CrearQuery;
    try
      q.SQL.Text :=
        ' Select * from CategoriasVales' +
        '  Where EsConsorcio = 1';
      q.Open;
      for I := 0 to rbMenuPrincipal.Tabs.Count -1 do
      begin
        Pagina := TRibbonPage(rbMenuPrincipal.Tabs[I].Page);
        if Pagina.Name = 'rbpVales' then
        begin
          for J := 0 to Pagina.GroupCount - 1 do
          begin
            Grupo := TRibbonGroup(Pagina.Groups[J]);
            if Grupo.Name = 'rgpVales' then
            begin
              for K := 0 to Grupo.Items.Count - 1 do
              begin
                Accion := TActionClientItem(Grupo.Items[K]);
                if Assigned(Accion.Action) then
                begin
                  if Accion.Action.Name = 'actConsorcios' then
                  begin
                    Accion.Items.Clear;
                    while not q.Eof do
                    begin
                      Consorcio := TAction.Create(nil);
                      Consorcio.Name := 'actConsorcio' + q.FieldByName('Codigo').AsString;
                      Consorcio.Caption := q.FieldByName('Descripcion').AsString;
                      Consorcio.Tag := q.FieldByName('Codigo').AsInteger;
                      Consorcio.OnExecute := actConsorcioExecute;
                      Accion.Items.Add.Action := Consorcio;
                      q.Next;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    finally
      FreeAndNil(q);
    end;
  end
  else
    Close;
end;


procedure TfPrincipal.ListView1DblClick(Sender: TObject);
begin
(*
  procedure prAutomatizarValesDesfazados;
  begin
    if fInformeImpuestosPagados = nil then
      Application.CreateForm(TfInformeImpuestosPagados, fInformeImpuestosPagados)
    else
      fInformeImpuestosPagados.Show;
    fInformeImpuestosPagados.Caption := 'En Vale No Automatizado';
    fInformeImpuestosPagados.TipoInforme := tiValeNoAutomatizado;
    fInformeImpuestosPagados.gDetalle.ColCount := 6;
    fInformeImpuestosPagados.gDetalle.PopupMenu := fInformeImpuestosPagados.popOpciones;
    fInformeImpuestosPagados.edEmpresa.ItemIndex := 0;
    fInformeImpuestosPagados.ActualizarClick(nil);
  end;

  case listview1.ItemIndex of
    0:  TFrmListConceptos.Ejecutar;
    1:  TFrmInmuebles.Ejecutar;
    2:  TFrmContratos.Ejecutar;
    3:  TFrmAutomatizacion.Ejecutar;
    4:  TFrmGenAutom.Ejecutar;
    5:  TFrmMovimientos.Ejecutar;
    6:  TFrmListNotas.Ejecutar;
    7:  TListadoRecibos.Ejecutar;
    8:  TListados.Ejecutar;
    9:  TFHistorico.Ejecutar;
    10: TListCaja.Ejecutar;
    11: TfrmConsorcios.Ejecutar;
    12: TListConf.Ejecutar;
    14: Close;
  end;
*)
end;


procedure TfPrincipal.actABMIndicesExecute(Sender: TObject);
begin
 if FABMIndicesActualizacion = nil then
    Application.CreateForm(TFABMIndicesActualizacion, FABMIndicesActualizacion)
  else
    FABMIndicesActualizacion.Show;
  FABMIndicesActualizacion.Actualizar.Click;
end;

procedure TfPrincipal.actabmNotasExecute(Sender: TObject);
begin
  if FNotas = nil then
    Application.CreateForm(TFNotas, FNotas)
  else
    FNotas.Show;
end;

procedure TfPrincipal.actActualizacionContratosEscalonadosExecute(
  Sender: TObject);
begin
  if fActualizacionContratosEscalonados = nil then
    Application.CreateForm(TfActualizacionContratosEscalonados, fActualizacionContratosEscalonados)
  else
    fActualizacionContratosEscalonados.Show;

end;

procedure TfPrincipal.actActualizacionValoresExecute(Sender: TObject);
begin
  if fABMActualizacionValores = nil then
    Application.CreateForm(TfABMActualizacionValores, fABMActualizacionValores)
  else
    fABMActualizacionValores.Show;
end;

procedure TfPrincipal.actAnomaliasExecute(Sender: TObject);
begin
  if FAnomalias = nil then
    Application.CreateForm(TFAnomalias, FAnomalias)
  else
    FAnomalias.Show;
  FAnomalias.FSoloPendientes := False;
  FAnomalias.FSoloClave := True;

end;

procedure TfPrincipal.actArreglosExecute(Sender: TObject);
begin
  if FABMValesArreglos = nil then
    Application.CreateForm(TFABMVales, FABMValesArreglos)
  else
    FABMValesArreglos.Show;
  FABMValesArreglos.Categoria := 3;
  FABMValesArreglos.cbCategoria.EditValue := 3;
  FABMValesArreglos.cbCategoria.Enabled := False;

end;

procedure TfPrincipal.actAutomatizacionExecute(Sender: TObject);
begin
  if FAutomatizacion = nil then
    Application.CreateForm(TFAutomatizacion, FAutomatizacion)
  else
    FAutomatizacion.Show;
end;

procedure TfPrincipal.actAutomatizadoNoPagadoExecute(Sender: TObject);
begin
  if fInformeImpuestosPagados = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeAutomatizadoNoPagado)
  else
    fInformeAutomatizadoNoPagado.Show;
  fInformeAutomatizadoNoPagado.Caption := 'Automatizado No Pagado';
  fInformeAutomatizadoNoPagado.TipoInforme := tiAutomatizadoNoPagado;
  fInformeAutomatizadoNoPagado.cbVales.Visible := False;
  fInformeAutomatizadoNoPagado.edCodigo.Visible := False;
  fInformeAutomatizadoNoPagado.edEmpresa.Visible := False;
  fInformeAutomatizadoNoPagado.edVale.Visible := False;
  fInformeAutomatizadoNoPagado.Label1.Visible := False;
  fInformeAutomatizadoNoPagado.Label2.Visible := False;
  fInformeAutomatizadoNoPagado.Label4.Visible  := True;
  fInformeAutomatizadoNoPagado.edDatoFijo.Visible  := True;
  fInformeAutomatizadoNoPagado.btnEliminar.Visible := True;
  fInformeAutomatizadoNoPagado.gDetalle.ColCount := 6;

end;

procedure TfPrincipal.actBackupExecute(Sender: TObject);
begin
  if FBackUpDatos = nil then
    Application.CreateForm(TfBackupDatos, fBackupDatos)
  else
    fBackupDatos.Show;
end;

procedure TfPrincipal.actBalanceMensualExecute(Sender: TObject);
begin
  if FABMValesBalanceMensual = nil then
    Application.CreateForm(TFABMVales, FABMValesBalanceMensual)
  else
    FABMValesBalanceMensual.Show;
  FABMValesBalanceMensual.Categoria := 11;
  FABMValesBalanceMensual.cbCategoria.EditValue := 11;
  FABMValesBalanceMensual.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actCajaDiariaExecute(Sender: TObject);
begin
  if fPlanillaCajaChica = nil then
    Application.CreateForm(TFPlanillaCaja, fPlanillaCajaChica)
  else
    fPlanillaCajaChica.Show;

  fPlanillaCajaChica.boEsCajaDiaria := True;
  fPlanillaCajaChica.prInicializar;
end;

procedure TfPrincipal.actCajaFuerteExecute(Sender: TObject);
begin
  if FABMValesCajaFuerte = nil then
    Application.CreateForm(TFABMVales, FABMValesCajaFuerte)
  else
    FABMValesCajaFuerte.Show;
  FABMValesCajaFuerte.Categoria := 16;
  FABMValesCajaFuerte.cbCategoria.EditValue := 16;
  FABMValesCajaFuerte.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actCajasExecute(Sender: TObject);
begin
  if FABMCajas = nil then
    Application.CreateForm(TFABMCajas, FABMCajas)
  else
    FABMCajas.Show;
end;

procedure TfPrincipal.actCargaNovedadesExecute(Sender: TObject);
begin
  if fAbmNovedades = nil then
    Application.CreateForm(TfAbmNovedades, fAbmNovedades)
  else
    fAbmNovedades.Show;
end;

procedure TfPrincipal.actCategoriasValesExecute(Sender: TObject);
begin
  if FABMCategoriasVales = nil then
    Application.CreateForm(TFABMCategoriasVales, FABMCategoriasVales)
  else
    FABMCategoriasVales.Show;
end;

procedure TfPrincipal.actCobradosNoPagadosExecute(Sender: TObject);
begin
  if fListadoImpuestos = nil then
    Application.CreateForm(TfListadoImpuestos, fListadoImpuestos)
  else
    fListadoImpuestos.Show;
  fListadoImpuestos.Caption := 'Cedulones Cobrados no Pagados';
  fListadoImpuestos.PantallaActiva := paCobradosNoPagados;

end;

procedure TfPrincipal.actComisionesEscalonadasExecute(Sender: TObject);
begin
  if FABMComisionesEscalonadas = nil then
    Application.CreateForm(TFABMComisionesEscalonadas, FABMComisionesEscalonadas)
  else
    FABMComisionesEscalonadas.Show;
  FABMComisionesEscalonadas.Actualizar.Click;
end;

procedure TfPrincipal.actComisionesNoCobradasExecute(Sender: TObject);
begin
  if fInformeComisionesNoCobradas = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeComisionesNoCobradas)
  else
    fInformeComisionesNoCobradas.Show;
  fInformeComisionesNoCobradas.Caption := 'Items Automatizados Repetidos ';
  fInformeComisionesNoCobradas.TipoInforme := tiComisionesNoCobradas;
  fInformeComisionesNoCobradas.cbVales.Visible := False;
  fInformeComisionesNoCobradas.edCodigo.Visible := False;
  fInformeComisionesNoCobradas.edEmpresa.Visible := False;
  fInformeComisionesNoCobradas.edVale.Visible := False;
  fInformeComisionesNoCobradas.Label1.Visible := False;
  fInformeComisionesNoCobradas.Label2.Visible := False;
  fInformeComisionesNoCobradas.Label4.Visible  := False;
  fInformeComisionesNoCobradas.edDatoFijo.Visible  := False;
  fInformeComisionesNoCobradas.btnEliminar.Visible := False;
end;

procedure TfPrincipal.actComplejosExecute(Sender: TObject);
begin
  if FABMValesComplejos = nil then
    Application.CreateForm(TFABMVales, FABMValesComplejos)
  else
    FABMValesComplejos.Show;
  FABMValesComplejos.Categoria := 7;
  FABMValesComplejos.cbCategoria.EditValue := 7;
  FABMValesComplejos.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actConfiguracionMailExecute(Sender: TObject);
begin
  if fAbmConfiguracionMails = nil then
    Application.CreateForm(TfAbmConfiguracionMails, fAbmConfiguracionMails)
  else
    fAbmConfiguracionMails.Show;
end;

procedure TfPrincipal.actConsorcioExecute(Sender: TObject);
var
  Resultado: Boolean;
begin
  if (fPrincipal.fUsuario <> 'EDUARDO') AND (fPrincipal.fUsuario <> 'SILVIA') AND (fPrincipal.fUsuario <> 'ADMIN') AND (fPrincipal.fUsuario <> 'ROMINA') then
    EXIT;

  if TFClaveCaja.Ejecutar(nil, Resultado) then
  begin
    if not Resultado then
      Exit;
  end
  else
    Exit;

  if FABMValesConsorcioEugenio = nil then
    Application.CreateForm(TFABMVales, FABMValesConsorcioEugenio)
  else
    FABMValesConsorcioEugenio.Show;
  FABMValesConsorcioEugenio.Categoria := TAction(Sender).Tag;
  FABMValesConsorcioEugenio.cbCategoria.EditValue := TAction(Sender).Tag;
  FABMValesConsorcioEugenio.cbCategoria.Enabled := False;
  FABMValesConsorcioEugenio.ActualizarClick(nil);
end;

procedure TfPrincipal.actConsorciosExecute(Sender: TObject);
begin
//
end;

procedure TfPrincipal.actContratosEscalonadosExecute(Sender: TObject);
begin
  if FABMContratosEscalonados = nil then
    Application.CreateForm(TFABMContratosEscalonados, FABMContratosEscalonados)
  else
    FABMContratosEscalonados.Show;
  FABMContratosEscalonados.Actualizar.Click;
end;

procedure TfPrincipal.actContratosExecute(Sender: TObject);
begin
  DM.IniciarTransaccion;
  try
    ActualizarContratosEscalonados(Date, '0000');
    ActualizarComisionesEscalonadas(Date, '0000');
    DM.ConfirmarTransaccion;
  except
    DM.CancelarTransaccion;
  end;
end;

procedure TFPrincipal.ActualizarContratosEscalonados(Fecha:TDateTime; pCodigo: String);
var
  Codigo:      string;
  FechaActual: TDatetime;
  FechaDesde:  TDatetime;
  FechaHasta:  TDatetime;
  Importe:     string;
  Alquiler:    Double;
  Comision:    string;
  Centavos:    string;
  Porcentaje:  Double;
  Cambio:      Boolean;

  i,j:integer;
  ibqConsulta: tFXQuery;
  q, qAlquiler: tFXQuery;

begin
// 24/06/2012

  ibqConsulta := CrearQuery;
  q := CrearQuery;
  qAlquiler := CrearQuery;
  try
    try
      qAlquiler.Sql.Text := 'Select Codinq, Alquiler from Automatizacion ';
      if pCodigo <> '0000' then
      begin
        qAlquiler.Sql.Add(' Where Codinq = :Codinq');
        qAlquiler.ParambyName('Codinq').AsString := pCodigo;
      end;
      qAlquiler.Open;

      while not qAlquiler.Eof do
      begin
        q.Sql.Text :=
          ' Update Automatizacion Set Alquiler = :Alquiler where Codinq = :Codinq';
        q.ParamByName('Alquiler').AsString := FormatFloat('0.00', qAlquiler.FieldbyName('Alquiler').AsFloat);
        q.ParamByName('Codinq').AsString := qAlquiler.FieldbyName('Codinq').AsString;
        q.ExecSql;

        qAlquiler.Next;
      end;

      FechaActual := fECHA;

      With ibqConsulta do
      begin
        Close;
        Sql.Text :=
          'Select * from contratosescalonados ';
        if pCodigo <> '0000' then
        begin
          Sql.Add(' Where Codinq = :Codinq');
          ParambyName('Codinq').AsString := pCodigo;
        end;
        Sql.Add(' order by FechaDesde ');
        Open;

        q.sql.Text :=
          ' Update Inmuebles '+
          '    Set Alquiler = :Importe '+
          '  where Codinq = :Codigo';
        q.Prepared := True;

        qAlquiler.sql.Text :=
          ' Update Automatizacion '+
          '    Set Alquiler = :Importe '+
          '  where Codinq = :Codigo';
        qAlquiler.Prepared := True;

        First;
        while not eof do
        begin
          Codigo     := Fields[0].AsString;
          FechaDesde := Fields[1].asDatetime;
          FechaHasta := Fields[2].asDatetime;
          Cambio     := False;

          if (FechaDesde <= FechaActual) and (FechaHasta >= FechaActual) then
          begin
            q.Close;
            q.ParamByName('Importe').AsFloat := ibqConsulta.Fields[3].asFloat;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;

            qAlquiler.Close;
            qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[3].asFloat);
            qAlquiler.ParamByName('Codigo').AsString := Codigo;
            qAlquiler.ExecSql;
          end;

//          if not Cambio then
//          begin
//            FechaDesde:=ibqConsulta.Fields[4].asstring;
//            FechaHasta:=ibqConsulta.Fields[5].asstring;
//
//            if (FechaDesde<>'') and (FechaHasta<>'') then
//            begin
//              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
//              begin
//                Importe:=FormatFloat('0.00', ibqConsulta.Fields[6].asFloat);
//                q.Close;
//                q.ParamByName('Codigo').AsString := Codigo;
//                q.ParamByName('Importe').AsFloat := ibqConsulta.Fields[6].asFloat;
//                q.ExecSql;
//              qAlquiler.Close;
//              qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[6].asFloat);
//              qAlquiler.ParamByName('Codigo').AsString := Codigo;
//              qAlquiler.ExecSql;
//
//                Cambio := True;
//              end;
//            end;
//          end;
//
//          if not Cambio then
//          begin
//            FechaDesde:=ibqConsulta.Fields[7].asstring;
//            FechaHasta:=ibqConsulta.Fields[8].asstring;
//
//            if (FechaDesde<>'') and (FechaHasta<>'') then
//            begin
//              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
//              begin
//                Importe:=FormatFloat('0.00', ibqConsulta.Fields[9].asFloat);
//                q.Close;
//                q.ParamByName('Importe').AsFloat := ibqConsulta.Fields[9].asFloat;
//                q.ParamByName('Codigo').AsString := Codigo;
//                q.ExecSql;
//              qAlquiler.Close;
//              qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[9].asFloat);
//              qAlquiler.ParamByName('Codigo').AsString := Codigo;
//              qAlquiler.ExecSql;
//                Cambio := True;
//              end;
//            end;
//          end;
//
//          if not Cambio then
//          begin
//            FechaDesde:=ibqConsulta.Fields[10].asstring;
//            FechaHasta:=ibqConsulta.Fields[11].asstring;
//
//            if (FechaDesde<>'') and (FechaHasta<>'') then
//            begin
//              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
//              begin
//                Importe:=FormatFloat('0.00', ibqConsulta.Fields[12].asFloat);
//                q.Close;
//                q.ParamByName('Importe').AsFloat := ibqConsulta.Fields[12].asFloat;
//                q.ParamByName('Codigo').AsString := Codigo;
//                q.ExecSql;
//              qAlquiler.Close;
//              qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[12].asFloat);
//              qAlquiler.ParamByName('Codigo').AsString := Codigo;
//              qAlquiler.ExecSql;
//                Cambio := True;
//              end;
//            end;
//          end;
//
//          if not Cambio then
//          begin
//            FechaDesde:=ibqConsulta.Fields[13].asstring;
//            FechaHasta:=ibqConsulta.Fields[14].asstring;
//
//            if (FechaDesde<>'') and (FechaHasta<>'') then
//            begin
//              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
//              begin
//                Importe:=FormatFloat('0.00', ibqConsulta.Fields[15].asFloat);
//                q.Close;
//                q.ParamByName('Importe').AsFloat := ibqConsulta.Fields[15].asFloat;
//                q.ParamByName('Codigo').AsString := Codigo;
//                q.ExecSql;
//              qAlquiler.Close;
//              qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[15].asFloat);
//              qAlquiler.ParamByName('Codigo').AsString := Codigo;
//              qAlquiler.ExecSql;
//                Cambio := True;
//              end;
//            end;
//          end;
//
//          if not Cambio then
//          begin
//            FechaDesde:=ibqConsulta.Fields[16].asstring;
//            FechaHasta:=ibqConsulta.Fields[17].asstring;
//
//            if (FechaDesde<>'') and (FechaHasta<>'') then
//            begin
//              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
//              begin
//                Importe:=FormatFloat('0.00', ibqConsulta.Fields[18].asFloat);
//                q.Close;
//                q.ParamByName('Importe').AsFloat := ibqConsulta.Fields[18].asFloat;
//                q.ParamByName('Codigo').AsString := Codigo;
//                q.ExecSql;
//              qAlquiler.Close;
//              qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[18].asFloat);
//              qAlquiler.ParamByName('Codigo').AsString := Codigo;
//              qAlquiler.ExecSql;
//                Cambio := True;
//              end;
//            end;
//          end;
//
//          if Cambio then
//          begin
//            q.Close;
//            q.ParamByName('Importe').AsFloat := ToFloat(Importe);
//            q.ParamByName('Codigo').AsString := Codigo;
//            q.ExecSql;
//              qAlquiler.Close;
//              qAlquiler.ParamByName('Importe').AsString := FormatFloat('0.00', ToFloat(Importe));
//              qAlquiler.ParamByName('Codigo').AsString := Codigo;
//              qAlquiler.ExecSql;
//          end;
          ibqConsulta.Next;
        end;
      end;

      With ibqConsulta do
      begin
        Close;
        Sql.Clear;
        Sql.Add('Select i.Codinq, i.Alquiler, a.Porcentaje from Inmuebles I, automatizacion a where i.Codinq = A.codinq ');
        if pCodigo <> '0000' then
        begin
          Sql.Add(' and I.Codinq = :Codinq');
          ParambyName('Codinq').AsString := pCodigo;
        end;
        Sql.Add(' order by codinq');
        Open;
      end;

      while not ibqConsulta.eof do
      begin
        if (ToFloat(ibqConsulta.FieldByName('Porcentaje').AsString) <> 0) then
        begin
          Codigo := ibqConsulta.FieldByName('Codinq').AsString;
          Comision := ibqConsulta.FieldByName('Porcentaje').AsString;

          if ToFloat(Comision) <> 0 then
          begin
            Alquiler := ToFloat(ibqConsulta.FieldByName('Alquiler').AsString);

            Porcentaje := (ToFloat(AnsiReplaceStr(Comision, ',','.')));

            Importe    := FormatFloat('0.00', Porcentaje/100 * Alquiler);
            Centavos   := Copy(Importe,Length(Importe)-1,2);

            Delete(Importe, Length(Importe)-2,3);
            if StrToFloat(Centavos) > 51then
              Importe := FloatToStr(StrToFloat(Importe) + 1) + '00'
            else
              if StrToFloat(Centavos) > 0 then
                Importe := Importe + '50'
              else
                Importe := Importe + '00';

            Importe    := AgregarPunto2(Importe);

            q.SQL.Text := 'Update Automatizacion Set Alquiler = :Alquiler, Comision = :Importe where Codinq = :Codigo';
            q.ParamByName('Alquiler').AsString := FormatFloat('0.00', Alquiler);
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSQL;
          end;
        end;
        ibqConsulta.Next;
      end;
    except
    end;
    finally
      FreeAndNil(ibqConsulta);
      FreeAndNil(q);
      FreeAndNil(qAlquiler);
    end;
end;

procedure TFPrincipal.ActualizarComisionesEscalonadas(Fecha:TDateTime; pCodigo: String);
var
  Codigo:      string;
  FechaActual: string;
  FechaDesde:  string;
  FechaHasta:  string;
  Importe:     string;
  Alquiler:    Double;
  Comision:    string;
  Centavos:    string;
  Porcentaje:  Double;
  Cambio:      Boolean;

  i,j:integer;
  ibqConsulta: tFXQuery;
  q, qAlquiler: tFXQuery;

begin
// 24/06/2012
  ibqConsulta := CrearQuery;
  q := CrearQuery;
  qAlquiler := CrearQuery;
  try
    try

      qAlquiler.Sql.Text := 'Select Codinq, Alquiler, ComisionExtraordinaria from Automatizacion ';
      if pCodigo <> '0000' then
      begin
        qAlquiler.Sql.Add(' Where Codinq = :Codinq');
        qAlquiler.ParambyName('Codinq').AsString := pCodigo;
      end;
      qAlquiler.Open;

      while not qAlquiler.Eof do
      begin
        q.Sql.Text :=
          ' Update Automatizacion Set ComisionExtraordinaria = :Comision where Codinq = :Codinq';
        q.ParamByName('Comision').AsString := FormatFloat('0.00', qAlquiler.FieldbyName('ComisionExtraordinaria').AsFloat);
        q.ParamByName('Codinq').AsString := qAlquiler.FieldbyName('Codinq').AsString;
        q.ExecSql;
        qAlquiler.Next;
      end;

      FechaActual := FormatDateTime('YYYYMMDD', Fecha);

      With ibqConsulta do
      begin
        Close;
        Sql.Text :=
          'Select * from Comisiones ';
        if pCodigo <> '0000' then
        begin
          Sql.Add(' Where Codinq = :Codinq');
          ParambyName('Codinq').AsString := pCodigo;
        end;
        Open;

        q.sql.Text :=
          ' Update Automatizacion '+
          '    Set ComisionExtraordinaria = :Importe '+
          '  where Codinq = :Codigo';
        q.Prepared := True;

        while not eof do
        begin
          Codigo     := Fields[0].AsString;
          FechaDesde := Fields[1].asstring;
          FechaHasta := Fields[2].asstring;
          Cambio     := False;

          if (FechaDesde <> '') and (FechaHasta <> '') then
          begin
            if (FechaDesde <= FechaActual) and (FechaHasta >= FechaActual) then
            begin
              Importe:=FormatFloat('0.00', ibqConsulta.Fields[3].asFloat);
              q.Close;
              q.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[3].asFloat);
              q.ParamByName('Codigo').AsString := Codigo;
              q.ExecSql;
              ibqConsulta.Next;
              Continue;
            end;
          end;

          if not Cambio then
          begin
            FechaDesde:=ibqConsulta.Fields[4].asstring;
            FechaHasta:=ibqConsulta.Fields[5].asstring;

            if (FechaDesde<>'') and (FechaHasta<>'') then
            begin
              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
              begin
                Importe:=FormatFloat('0.00', ibqConsulta.Fields[6].asFloat);
                q.Close;
                q.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[6].asFloat);
                q.ParamByName('Codigo').AsString := Codigo;
                q.ExecSql;
                ibqConsulta.Next;
                Continue;
              end;
            end;
          end;

          if not Cambio then
          begin
            FechaDesde:=ibqConsulta.Fields[7].asstring;
            FechaHasta:=ibqConsulta.Fields[8].asstring;

            if (FechaDesde<>'') and (FechaHasta<>'') then
            begin
              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
              begin
                Importe:=FormatFloat('0.00', ibqConsulta.Fields[9].asFloat);
                q.Close;
                q.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[9].asFloat);
                q.ParamByName('Codigo').AsString := Codigo;
                q.ExecSql;
                ibqConsulta.Next;
                Continue;
              end;
            end;
          end;

          if not Cambio then
          begin
            FechaDesde:=ibqConsulta.Fields[10].asstring;
            FechaHasta:=ibqConsulta.Fields[11].asstring;

            if (FechaDesde<>'') and (FechaHasta<>'') then
            begin
              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
              begin
                Importe:=FormatFloat('0.00', ibqConsulta.Fields[12].asFloat);
                q.Close;
                q.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[12].asFloat);
                q.ParamByName('Codigo').AsString := Codigo;
                q.ExecSql;
                ibqConsulta.Next;
                Continue;
              end;
            end;
          end;

          if not Cambio then
          begin
            FechaDesde:=ibqConsulta.Fields[13].asstring;
            FechaHasta:=ibqConsulta.Fields[14].asstring;

            if (FechaDesde<>'') and (FechaHasta<>'') then
            begin
              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
              begin
                Importe:=FormatFloat('0.00', ibqConsulta.Fields[15].asFloat);
                q.Close;
                q.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[15].asFloat);
                q.ParamByName('Codigo').AsString := Codigo;
                q.ExecSql;
                ibqConsulta.Next;
                Continue;
              end;
            end;
          end;

          if not Cambio then
          begin
            FechaDesde:=ibqConsulta.Fields[16].asstring;
            FechaHasta:=ibqConsulta.Fields[17].asstring;

            if (FechaDesde<>'') and (FechaHasta<>'') then
            begin
              if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
              begin
                Importe:=FormatFloat('0.00', ibqConsulta.Fields[18].asFloat);
                q.Close;
                q.ParamByName('Importe').AsString := FormatFloat('0.00', ibqConsulta.Fields[18].asFloat);
                q.ParamByName('Codigo').AsString := Codigo;
                q.ExecSql;
                ibqConsulta.Next;
                Continue;
              end;
            end;
          end;
          ibqConsulta.Next;
        end;
      end;
    except
    end;
  finally
    FreeAndNil(ibqConsulta);
    FreeAndNil(q);
    FreeAndNil(qAlquiler);
  end;
end;

procedure TfPrincipal.actCrearMovimientosExecute(Sender: TObject);
begin
  if fABMGeneracionMovimientos = nil then
    Application.CreateForm(TfABMGeneracionMovimientos, fABMGeneracionMovimientos)
  else
    fABMGeneracionMovimientos.Show;
end;

procedure TfPrincipal.actCtaCteInquilinosExecute(Sender: TObject);
begin
  if FABMCtaCteInquilinos = nil then
    Application.CreateForm(TFABMCtaCteInquilinos, FABMCtaCteInquilinos)
  else
    FABMCtaCteInquilinos.Show;
end;

procedure TfPrincipal.actCtaCtePropietariosExecute(Sender: TObject);
begin
  if FABMCtaCtePropietarios = nil then
    Application.CreateForm(TFABMCtaCtePropietarios, FABMCtaCtePropietarios)
  else
    FABMCtaCtePropietarios.Show;
end;

procedure TfPrincipal.actCubrirValesExecute(Sender: TObject);
begin
 if FCubrirVales = nil then
    Application.CreateForm(TFCubrirVales, FCubrirVales)
  else
    FCubrirVales.Show;
  FCubrirVales.Actualizar.Click;
end;

procedure TfPrincipal.actCubrirLocatarioSalienteExecute(Sender: TObject);
begin
 if FCubrirValesArreglos = nil then
    Application.CreateForm(TFCubrirValesArreglos, FCubrirValesArreglos)
  else
    FCubrirValesArreglos.Show;
  FCubrirValesArreglos.Actualizar.Click;
end;

procedure TfPrincipal.actCubrirSaldoAlquilerExecute(Sender: TObject);
begin
 if FCubrirValesSaldoAlquiler = nil then
    Application.CreateForm(TFCubrirValesSaldoAlquiler, FCubrirValesSaldoAlquiler)
  else
    FCubrirValesSaldoAlquiler.Show;
  FCubrirValesSaldoAlquiler.Actualizar.Click;
end;

procedure TfPrincipal.actDatosFijosExecute(Sender: TObject);
begin
  if FABMDatosFijos = nil then
    Application.CreateForm(TFABMDatosFijos, FABMDatosFijos)
  else
    FABMDatosFijos.Show;
  FABMDatosFijos.Actualizar.Click;
end;

procedure TfPrincipal.actDevolverDineroACajaExecute(Sender: TObject);
begin
  if fABMDevolucionDinero = nil then
    Application.CreateForm(TfABMImpuestosPagados, fABMDevolucionDinero)
  else
    fABMDevolucionDinero.Show;
  fABMDevolucionDinero.PantallaActiva := paDevolverDinero;
  fABMDevolucionDinero.Caption := 'Devolver dinero a caja';
end;

procedure TfPrincipal.actenvaledifnocobradasExecute(Sender: TObject);
begin
  if fInformeValeNoCobradoDiferencias = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeValeNoCobradoDiferencias)
  else
    fInformeValeNoCobradoDiferencias.Show;
  fInformeValeNoCobradoDiferencias.Caption := 'En Vale Diferencias No Cobradas';
  fInformeValeNoCobradoDiferencias.TipoInforme := tiValeNoCobradoDiferencias;
  fInformeValeNoCobradoDiferencias.gDetalle.ColCount := 6;
end;

procedure TfPrincipal.actEstudiantinaExecute(Sender: TObject);
begin
  if FABMValesConsorcioEstudiantina = nil then
    Application.CreateForm(TFABMVales, FABMValesConsorcioEstudiantina)
  else
    FABMValesConsorcioEstudiantina.Show;
  FABMValesConsorcioEstudiantina.Categoria := 14;
  FABMValesConsorcioEstudiantina.cbCategoria.EditValue := 14;
  FABMValesConsorcioEstudiantina.cbCategoria.Enabled := False;
  FABMValesConsorcioEstudiantina.ActualizarClick(nil);
end;

procedure TfPrincipal.actEugenioExecute(Sender: TObject);
var
  Resultado: Boolean;
begin
  if TFClaveCaja.Ejecutar(nil, Resultado) then
  begin
    if not Resultado then
      Exit;
  end
  else
    Exit;

  if FABMValesConsorcioEugenio = nil then
    Application.CreateForm(TFABMVales, FABMValesConsorcioEugenio)
  else
    FABMValesConsorcioEugenio.Show;
  FABMValesConsorcioEugenio.Categoria := 13;
  FABMValesConsorcioEugenio.cbCategoria.EditValue := 13;
  FABMValesConsorcioEugenio.cbCategoria.Enabled := False;
  FABMValesConsorcioEugenio.ActualizarClick(nil);
end;

procedure TfPrincipal.actExpensasExecute(Sender: TObject);
begin
  if FABMValesOtros = nil then
    Application.CreateForm(TFABMVales, FABMValesExpensas)
  else
    FABMValesExpensas.Show;
  FABMValesExpensas.Categoria := 9;
  FABMValesExpensas.cbCategoria.EditValue := 9;
  FABMValesExpensas.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actFacturaAExecute(Sender: TObject);
begin
  if FFacturaA = nil then
    Application.CreateForm(TFFacturaA, FFacturaA)
  else
    FFacturaA.Show;
end;

procedure TfPrincipal.actFacturaBExecute(Sender: TObject);
begin
  if FFacturaB = nil then
    Application.CreateForm(TFFacturaB, FFacturaB)
  else
    FFacturaB.Show;
end;

procedure TfPrincipal.actFuturosPresupuestosExecute(Sender: TObject);
begin
  if FABMValesPresupuestos = nil then
    Application.CreateForm(TFABMVales, FABMValesPresupuestos)
  else
    FABMValesPresupuestos.Show;
  FABMValesPresupuestos.Categoria := 12;
  FABMValesPresupuestos.cbCategoria.EditValue := 12;
  FABMValesPresupuestos.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actGastosInmobiliariaExecute(Sender: TObject);
begin
  if FABMValesGastos = nil then
    Application.CreateForm(TFABMVales, FABMValesGastos)
  else
    FABMValesGastos.Show;
  FABMValesGastos.Categoria := 5;
  FABMValesGastos.cbCategoria.EditValue := 5;
  FABMValesGastos.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actGenAutomExecute(Sender: TObject);
begin
  if FGenAutom = nil then
    Application.CreateForm(TFGenAutom, FGenAutom)
  else
    FGenAutom.Show;
end;

procedure TfPrincipal.actMailsPropietariosExecute(Sender: TObject);
begin
  if fMailAPropietarios = nil then
    Application.CreateForm(TfMailAPropietarios, fMailAPropietarios)
  else
    fMailAPropietarios.Show;
end;

procedure TfPrincipal.actHistorialCajaExecute(Sender: TObject);
begin
  if FHistorialCaja = nil then
    Application.CreateForm(TFHistorialCaja, FHistorialCaja)
  else
    FHistorialCaja.Show;
end;

procedure TfPrincipal.actHistorialPagoInquilinosExecute(Sender: TObject);
begin
  if FHistorialPagoInquilinos = nil then
    Application.CreateForm(TFHistorialPagoInquilinos, FHistorialPagoInquilinos)
  else
    FHistorialPagoInquilinos.Show;
end;

procedure TfPrincipal.actHistorialRetiroLiquidacionesExecute(Sender: TObject);
begin
  if FHistorialRetiroLiquidaciones = nil then
    Application.CreateForm(TFHistorialRetiroLiquidaciones, FHistorialRetiroLiquidaciones)
  else
    FHistorialRetiroLiquidaciones.Show;
end;

procedure TfPrincipal.actHistoriaMovimientosExecute(Sender: TObject);
begin
  if FHistorialMovimientos = nil then
    Application.CreateForm(TFHistorialMovimientos, FHistorialMovimientos)
  else
    FHistorialMovimientos.Show;
end;

procedure TfPrincipal.actHonorariosExecute(Sender: TObject);
var
  resultado: Boolean;
begin
  if (fPrincipal.fUsuario <> 'EDUARDO') AND (fPrincipal.fUsuario <> 'SILVIA') AND (fPrincipal.fUsuario <> 'ADMIN') then
    EXIT;

  if TFClaveCaja.Ejecutar(nil, Resultado) then
  begin
    if not Resultado then
      Exit;
  end
  else
    Exit;

  if FABMValesCajaFuerte = nil then
    Application.CreateForm(TFABMVales, FABMValesCajaFuerte)
  else
    FABMValesCajaFuerte.Show;
  FABMValesCajaFuerte.Categoria := 18;
  FABMValesCajaFuerte.cbCategoria.EditValue := 18;
  FABMValesCajaFuerte.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actIndicadoresExecute(Sender: TObject);
begin
  if FABMIndicadores = nil then
    Application.CreateForm(TFABMIndicadores, FABMIndicadores)
  else
    FABMIndicadores.Show;
end;

procedure TfPrincipal.actInformeImpuestosAutomatizadosPagadosExecute(
  Sender: TObject);
begin
  if fInformeImpuestosPagados = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeImpuestosPagados)
  else
    fInformeImpuestosPagados.Show;
  fInformeImpuestosPagados.Caption := 'En Vale No Automatizado';
  fInformeImpuestosPagados.TipoInforme := tiValeNoAutomatizado;
  fInformeImpuestosPagados.gDetalle.ColCount := 6;
  fInformeImpuestosPagados.gDetalle.PopupMenu := fInformeImpuestosPagados.popOpciones;
end;

procedure TfPrincipal.actInformeReciboExecute(Sender: TObject);
begin
  if fInformeReciboLiquidacion = nil then
    Application.CreateForm(TfInformeReciboLiquidacion, fInformeRecibo)
  else
    fInformeRecibo.Show;
  fInformeRecibo.FTipo := 'RE';
  fInformeRecibo.Caption := 'Informe NO Cobrados Mensuales';
  fInformeRecibo.FCodigo := '01';

end;

procedure TfPrincipal.actInformeReciboLiquidacionExecute(Sender: TObject);
begin
  if fInformeReciboLiquidacion = nil then
    Application.CreateForm(TfInformeReciboLiquidacion, fInformeReciboLiquidacion)
  else
    fInformeReciboLiquidacion.Show;
  fInformeReciboLiquidacion.FTipo := 'LI';
  fInformeReciboLiquidacion.FCodigo := '01';

end;

procedure TfPrincipal.actInformeRecuperoGastosExecute(Sender: TObject);
begin
  if fInformeRecuperoGastos = nil then
    Application.CreateForm(TfInformeReciboLiquidacion, fInformeRecuperoGastos)
  else
    fInformeRecuperoGastos.Show;
  fInformeRecuperoGastos.FTipo := 'RE';
  fInformeRecuperoGastos.Caption := 'Informe Recupero Gastos';
  fInformeRecuperoGastos.FCodigo := '90';

end;

procedure TfPrincipal.actInmueblesExecute(Sender: TObject);
begin
  if FABMInmuebles = nil then
    Application.CreateForm(TFABMInmuebles, FABMInmuebles)
  else
    FABMInmuebles.Show;
  FABMInmuebles.Actualizar.Click;
end;

procedure TfPrincipal.Action1Execute(Sender: TObject);
begin
    if MostrarDialogoSiNO('Se generará el backup de los datos del sistemsa. ¿Desea Continuar? ') then
    begin
      if fxGenerarBackup then
        MostrarDialogoAceptar('Backup Generado correctamente. No olvide copiarlo a un medio extraible.');
    end;
end;

procedure TfPrincipal.Action2Execute(Sender: TObject);
begin
  if fLimpiarHistoriaPropiedad = nil then
    Application.CreateForm(TfLimpiarHistoriaPropiedad, fLimpiarHistoriaPropiedad)
  else
    fLimpiarHistoriaPropiedad.Show;
end;

procedure TfPrincipal.Action3Execute(Sender: TObject);
begin
  if fInformeValesRepetidos = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeValesRepetidos)
  else
    fInformeValesRepetidos.Show;
  fInformeValesRepetidos.Caption := 'En Vale Items Repetidos';
  fInformeValesRepetidos.TipoInforme := tiValesRepetidos;
  fInformeValesRepetidos.gDetalle.ColCount := 6;
  fInformeValesRepetidos.gDetalle.Cells[5,0] := 'Total';
  fInformeValesRepetidos.gDetalle.ColWidths[5] := 120;

end;

procedure TfPrincipal.actListadoComisionesCobradasExecute(Sender: TObject);
begin
  if FListadoComisionesCobradas = nil then
    Application.CreateForm(TFListadoComisionesCobradas, FListadoComisionesCobradas)
  else
    FListadoComisionesCobradas.Show;
end;

procedure TfPrincipal.actItemsRepetidosExecute(Sender: TObject);
begin
  if fPlanillaCajaRepetidos = nil then
    Application.CreateForm(TFPlanillaCaja, fPlanillaCajaRepetidos)
  else
    fPlanillaCajaRepetidos.Show;

  fPlanillaCajaRepetidos.boBuscaItemsRepetidos := True;
  fPlanillaCajaRepetidos.prInicializar;
end;

procedure TfPrincipal.actLecturaIAExecute(Sender: TObject);
begin
  if FlecturaIA = nil then
    Application.CreateForm(TFlecturaIA, FlecturaIA)
  else
    FlecturaIA.Show;
end;

procedure TfPrincipal.actLibroIVAVentasExecute(Sender: TObject);
begin
  if FLibroIVAVentas = nil then
    Application.CreateForm(TFLibroIVAVentas, FLibroIVAVentas)
  else
    FLibroIVAVentas.Show;
end;

procedure TfPrincipal.actLiquidacionesAnomaliasExecute(Sender: TObject);
begin
  if fLiquidacionesConAnomalias = nil then
    Application.CreateForm(TfLiquidacionesHistoricas, fLiquidacionesConAnomalias)
  else
    fLiquidacionesConAnomalias.Show;
  fLiquidacionesConAnomalias.FSoloPendientes := False;
  fLiquidacionesConAnomalias.Label5.Visible := False;
  fLiquidacionesConAnomalias.Label2.Visible := False;
  fLiquidacionesConAnomalias.cbTipo.Visible := False;
  fLiquidacionesConAnomalias.cbLetra.Visible := False;
  fLiquidacionesConAnomalias.Caption := 'Liquidaciones con Anomalias';
  fLiquidacionesConAnomalias.FSoloClave := True;
  fLiquidacionesConAnomalias.chIncluirControlados.Visible := True;
end;

procedure TfPrincipal.actLiquidacionesHistoricasExecute(Sender: TObject);
begin
  if fLiquidacionesHistoricas = nil then
    Application.CreateForm(TfLiquidacionesHistoricas, fLiquidacionesHistoricas)
  else
    fLiquidacionesHistoricas.Show;
  fLiquidacionesHistoricas.FSoloPendientes := False;
  fLiquidacionesHistoricas.Label5.Visible := False;
  fLiquidacionesHistoricas.Label2.Visible := False;
  fLiquidacionesHistoricas.cbTipo.Visible := False;
  fLiquidacionesHistoricas.cbLetra.Visible := False;
  fLiquidacionesHistoricas.Caption := 'Liquidaciones Históricas';
end;

procedure TfPrincipal.actLiquidacionesnoretiradasExecute(Sender: TObject);
begin
  if fLiquidacionesNoRetiradas = nil then
    Application.CreateForm(TfLiquidacionesHistoricas, fLiquidacionesNoRetiradas)
  else
    fLiquidacionesNoRetiradas.Show;
  fLiquidacionesNoRetiradas.FSoloPendientes := False;
  fLiquidacionesNoRetiradas.FSoloPendientesRetirar := True;
  fLiquidacionesNoRetiradas.Label5.Visible := False;
  fLiquidacionesNoRetiradas.Label2.Visible := False;
  fLiquidacionesNoRetiradas.cbTipo.Visible := False;
  fLiquidacionesNoRetiradas.cbLetra.Visible := False;
  fLiquidacionesNoRetiradas.Caption := 'Liquidaciones Pendientes de Retirar';
end;

procedure TfPrincipal.actLiquidacionesPendientesExecute(Sender: TObject);
begin
  if fRecibosPendientes = nil then
    Application.CreateForm(TfRecibosPendientes, fRecibosPendientes)
  else
    fRecibosPendientes.Show;
  fRecibosPendientes.FSoloPendientes := True;
  fRecibosPendientes.Label5.Visible := True;
  fRecibosPendientes.Label2.Visible := True;
  fRecibosPendientes.cbTipo.Visible := True;
  fRecibosPendientes.cbTipo.ItemIndex := 2;
  fRecibosPendientes.cbTipo.Enabled := False;
  fRecibosPendientes.cbLetra.Visible := True;
  fRecibosPendientes.Caption := 'Liquidaciones Pendientes';
end;

procedure TfPrincipal.actIdentificacionExecute(Sender: TObject);
begin
  if fABMIdentificacionImpuestos = nil then
    Application.CreateForm(TfABMIdentificacionImpuestos, fABMIdentificacionImpuestos)
  else
    fABMIdentificacionImpuestos.Show;
end;

procedure TfPrincipal.actImpuestosPagadosExecute(Sender: TObject);
begin
  if fABMImpuestosPagados = nil then
    Application.CreateForm(TfABMImpuestosPagados, fABMImpuestosPagados)
  else
    fABMImpuestosPagados.Show;
  fABMImpuestosPagados.PantallaActiva := paImpuestosPagados;

end;

procedure TfPrincipal.actImpuestosPendientesExecute(Sender: TObject);
begin
  if fImpuestosPendientes = nil then
    Application.CreateForm(TfImpuestosPendientes, fImpuestosPendientes)
  else
    fImpuestosPendientes.Show;
end;

procedure TfPrincipal.actImpuestosYServiciosExecute(Sender: TObject);
begin
  if fABMImpuestosyServicios = nil then
    Application.CreateForm(TfABMImpuestosyServicios, fABMImpuestosyServicios)
  else
    fABMImpuestosyServicios.Show;
end;

procedure TfPrincipal.ActLiquidacionPropietarioExecute(Sender: TObject);
begin
  if FrmLiquidacionPropietarios = nil then
    Application.CreateForm(TFrmLiquidacionPropietarios, FrmLiquidacionPropietarios)
  else
    FrmLiquidacionPropietarios.Show;
end;

procedure TfPrincipal.actListadoCobradosExecute(Sender: TObject);
begin
  if fListadoCobrados = nil then
    Application.CreateForm(TfListadoCobrados, fListadoCobrados)
  else
    fListadoCobrados.Show;
end;

procedure TfPrincipal.actListadoCobradosPagadosExecute(Sender: TObject);
begin
  if fListadoImpuestos = nil then
    Application.CreateForm(TfListadoImpuestos, fListadoImpuestos)
  else
    fListadoImpuestos.Show;
  fListadoImpuestos.Caption := 'Cedulones Cobrados y Pagados';
  fListadoImpuestos.PantallaActiva := paPagadosCobrados;
end;

procedure TfPrincipal.actListadoCobroInquilinoExecute(Sender: TObject);
begin
  if FHistorialCobroInquilinos = nil then
    Application.CreateForm(TFHistorialCobroInquilinos, FHistorialCobroInquilinos)
  else
    FHistorialCobroInquilinos.Show;
end;

procedure TfPrincipal.actListadoComisionesEscalonadasExecute(Sender: TObject);
begin
  if FABMComisionesEscalonadas = nil then
    Application.CreateForm(TFABMComisionesEscalonadas, FABMComisionesEscalonadas)
  else
    FABMComisionesEscalonadas.Show;
  FABMComisionesEscalonadas.Actualizar.Click;
end;

procedure TfPrincipal.actListadoComisionesExecute(Sender: TObject);
begin
  if FListadoComisiones = nil then
    Application.CreateForm(TFListadoComisiones, FListadoComisiones)
  else
    FListadoComisiones.Show;
end;

procedure TfPrincipal.actListadoContratosEscalonadosExecute(Sender: TObject);
begin
  if FABMContratosEscalonados = nil then
    Application.CreateForm(TFABMContratosEscalonados, FABMContratosEscalonados)
  else
    FABMContratosEscalonados.Show;
  FABMContratosEscalonados.Actualizar.Click;
end;

procedure TfPrincipal.actListadoDatosFijosExecute(Sender: TObject);
begin
  if FABMDatosFijos = nil then
    Application.CreateForm(TFABMDatosFijos, FABMDatosFijos)
  else
    FABMDatosFijos.Show;
  FABMDatosFijos.btnEliminar.Visible := False;
  FABMDatosFijos.btnModificar.Visible := False;
  FABMDatosFijos.btnNuevo.Visible := False;
  FABMDatosFijos.ActualizarClick(nil);
  FABMDatosFijos.Actualizar.Click;

end;

procedure TfPrincipal.actListadoDeudabotExecute(Sender: TObject);
begin
  if fListadoDeudaBot = nil then
    Application.CreateForm(TfListadoCobrados, fListadoDeudaBot)
  else
    fListadoDeudaBot.Show;
end;

procedure TfPrincipal.actListadoDeudaInquilinosExecute(Sender: TObject);
begin
  if FListadoDeudaInquilinos = nil then
    Application.CreateForm(TFListadoDeudaInquilinos, FListadoDeudaInquilinos)
  else
    FListadoDeudaInquilinos.Show;
end;

procedure TfPrincipal.actListadoDeudaxPropietarioExecute(Sender: TObject);
begin
  if FListadoDeudaPropietarios = nil then
    Application.CreateForm(TFListadoDeudaPropietarios, FListadoDeudaPropietarios)
  else
    FListadoDeudaPropietarios.Show;
end;

procedure TfPrincipal.actListadoEntregaLiquidacionesExecute(Sender: TObject);
begin
  if FHistorialEntregaLiquidaciones = nil then
    Application.CreateForm(TFHistorialEntregaLiquidaciones, FHistorialEntregaLiquidaciones)
  else
    FHistorialEntregaLiquidaciones.Show;
end;

procedure TfPrincipal.actListadoInmueblesExecute(Sender: TObject);
begin
  if FABMInmuebles = nil then
    Application.CreateForm(TFABMInmuebles, FABMInmuebles)
  else
    FABMInmuebles.Show;
  FABMInmuebles.btnEliminar.Visible := False;
  FABMInmuebles.btnModificar.Visible := False;
  FABMInmuebles.btnNuevo.Visible := False;
  FABMInmuebles.ActualizarClick(nil);
  FABMInmuebles.Actualizar.Click;
end;

procedure TfPrincipal.actListadoLiquidadosExecute(Sender: TObject);
begin
  if fListadoLiquidados = nil then
    Application.CreateForm(TfListadoLiquidados, fListadoLiquidados)
  else
    fListadoLiquidados.Show;
end;

procedure TfPrincipal.actListadoRecuperoExecute(Sender: TObject);
begin
  if FListadoComisiones = nil then
    Application.CreateForm(TFListadoComisiones, FListadoComisiones)
  else
    FListadoComisiones.Show;
  FListadoComisiones.Edit1.Visible := False;
  FListadoComisiones.Label9.Visible := False;
  FListadoComisiones.TodosComisiones.Visible := False;
  FListadoComisiones.Edit1.Text := '90';
end;

procedure TfPrincipal.actLocatarioSalienteExecute(Sender: TObject);
begin
  if fABMValesLocatarioSaliente = nil then
    Application.CreateForm(TFABMVales, fABMValesLocatarioSaliente)
  else
    fABMValesLocatarioSaliente.Show;
  fABMValesLocatarioSaliente.Categoria := 10;
  fABMValesLocatarioSaliente.cbCategoria.EditValue := 10;
  fABMValesLocatarioSaliente.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actModificacionAguaExecute(Sender: TObject);
begin
  if fModificacionRentas = nil then
    Application.CreateForm(TfModificacionRentas, fModificacionRentas)
  else
    fModificacionRentas.Show;
  fModificacionRentas.Tipo := 1;
  fModificacionRentas.Caption := 'Modificación Masiva Agua';
end;

procedure TfPrincipal.actModificacionDGRExecute(Sender: TObject);
begin
  if fModificacionRentas = nil then
    Application.CreateForm(TfModificacionRentas, fModificacionRentas)
  else
    fModificacionRentas.Show;
  fModificacionRentas.Tipo := 2;
  fModificacionRentas.Caption := 'Modificación Masiva D.G.R';
end;

procedure TfPrincipal.actModificacionGastosRecuperoExecute(Sender: TObject);
begin
  if FModificacionGastosRecupero = nil then
    Application.CreateForm(TFModificacionGastosRecupero, FModificacionGastosRecupero)
  else
    FModificacionGastosRecupero.Show;
end;

procedure TfPrincipal.actModificacionMuniExecute(Sender: TObject);
begin
  if fModificacionRentas = nil then
    Application.CreateForm(TfModificacionRentas, fModificacionRentas)
  else
    fModificacionRentas.Show;
  fModificacionRentas.Tipo := 3;
  fModificacionRentas.Caption := 'Modificación Masiva Tasa Municipal';
end;

procedure TfPrincipal.actMovimientosExecute(Sender: TObject);
begin
  if FABMMovimientos = nil then
    Application.CreateForm(TFABMMovimientos, FABMMovimientos)
  else
    FABMMovimientos.Show;
end;

procedure TfPrincipal.actMovimientosRepetidosExecute(Sender: TObject);
begin
  if FABMMovimientosRepetidos = nil then
    Application.CreateForm(TFABMMovimientos, FABMMovimientosRepetidos)
  else
    FABMMovimientosRepetidos.Show;
    FABMMovimientosRepetidos.Caption := 'Movimientos repetidos';

  FABMMovimientosRepetidos.gDetalle.Cells[3,0] := 'Veces';
  FABMMovimientosRepetidos.boItemsRepetidos := True;
end;

procedure TfPrincipal.actNoAutomatizadosExecute(Sender: TObject);
begin
  if fAutomatizados = nil then
    Application.CreateForm(TfAutomatizados, fAutomatizados)
  else
    fAutomatizados.Show;
end;

procedure TfPrincipal.actNoLiquidadosExecute(Sender: TObject);
begin
  if fListadoLiquidados = nil then
    Application.CreateForm(TfListadoLiquidados, fListadoLiquidados)
  else
    fListadoLiquidados.Show;
  FListadoLiquidados.gDetalle.Visible := False;
  FListadoLiquidados.btnGrabar.Visible := False;
  FListadoLiquidados.bitbtn1.Left := 2;
  FListadoLiquidados.bitbtn1.Width := 89;
  FListadoLiquidados.bitbtn1.Caption := 'Imprimir';
  FListadoLiquidados.Caption := 'Recibos y Cobros - NO Liquidados ';
end;

procedure TfPrincipal.actNuevaTareaExecute(Sender: TObject);
begin
//  if fNuevaTareaGestion = nil then
//    Application.CreateForm(TfNuevaTareaGestion, fNuevaTareaGestion)
//  else
//    fNuevaTareaGestion.Show;
end;

procedure TfPrincipal.actOtrosExecute(Sender: TObject);
begin
  if FABMValesOtros = nil then
    Application.CreateForm(TFABMVales, FABMValesOtros)
  else
    FABMValesOtros.Show;
  FABMValesOtros.Categoria := 1;
  FABMValesOtros.cbCategoria.EditValue := 1;
  FABMValesOtros.cbCategoria.Enabled := False;
end;

procedure TfPrincipal.actPagadosNoCobradosExecute(Sender: TObject);
begin
  if fListadoImpuestos = nil then
    Application.CreateForm(TfListadoImpuestos, fListadoImpuestos)
  else
    fListadoImpuestos.Show;
  fListadoImpuestos.Caption := 'Cedulones Pagados no Cobrados';
  fListadoImpuestos.PantallaActiva := paPagadosNoCobrados;
end;

procedure TfPrincipal.actPasarHistoricoExecute(Sender: TObject);
begin
  if FPasarHistorico = nil then
    Application.CreateForm(TFPasarHistorico, FPasarHistorico)
  else
    FPasarHistorico.Show;
end;

procedure TfPrincipal.actPasarHistoricoValesExecute(Sender: TObject);
begin
  if FPasarHistoricoVales = nil then
    Application.CreateForm(TFPasarHistoricoVales, FPasarHistoricoVales)
  else
    FPasarHistoricoVales.Show;
end;

procedure TfPrincipal.actPersonalesExecute(Sender: TObject);
begin
  if FABMValesPersonales = nil then
    Application.CreateForm(TFABMVales, FABMValesPersonales)
  else
    FABMValesPersonales.Show;
  FABMValesPersonales.Categoria := 4;
  FABMValesPersonales.cbCategoria.EditValue := 4;
  FABMValesPersonales.cbCategoria.Enabled := False;

end;

procedure TfPrincipal.actPlanillaCajaExecute(Sender: TObject);
begin
  if fPlanillaCaja = nil then
    Application.CreateForm(TFPlanillaCaja, fPlanillaCaja)
  else
    fPlanillaCaja.Show;
end;

procedure TfPrincipal.actPlanillaValesExecute(Sender: TObject);
begin
  if FABMValesImpuestos = nil then
    Application.CreateForm(TFABMVales, FABMValesImpuestos)
  else
    FABMValesImpuestos.Show;
  FABMValesImpuestos.Categoria := 2;
  FABMValesImpuestos.cbCategoria.EditValue := 2;
  FABMValesImpuestos.cbCategoria.Enabled := False;

end;

procedure TfPrincipal.actPorcentajesPropiedadExecute(Sender: TObject);
begin
  if fABMPorcentajeCobroImpuestos = nil then
    Application.CreateForm(TfABMPorcentajeCobroImpuestos, fABMPorcentajeCobroImpuestos)
  else
    fABMPorcentajeCobroImpuestos.Show;
end;

procedure TfPrincipal.actRazonesSocialesExecute(Sender: TObject);
begin
  if FABMRazonesSociales = nil then
    Application.CreateForm(TFABMRazonesSociales, FABMRazonesSociales)
  else
    FABMRazonesSociales.Show;
end;

procedure TfPrincipal.actReciboComisionesExecute(Sender: TObject);
begin
  if FLiquidacionComisiones = nil then
    Application.CreateForm(TFLiquidacionComisiones, FLiquidacionComisiones)
  else
    FLiquidacionComisiones.Show;
end;

procedure TfPrincipal.actReciboInquilinoExecute(Sender: TObject);
begin
  if FrmLiquidacionInquilinos = nil then
    Application.CreateForm(TFrmLiquidacionInquilinos, FrmLiquidacionInquilinos)
  else
    FrmLiquidacionInquilinos.Show;
end;

procedure TfPrincipal.actReciboLocatarioSalienteExecute(Sender: TObject);
begin
  if FReciboLocatarioSaliente = nil then
    Application.CreateForm(TFReciboLocatarioSaliente, FReciboLocatarioSaliente)
  else
    FReciboLocatarioSaliente.Show;
end;

procedure TfPrincipal.actReciboReservaInmuebleExecute(Sender: TObject);
begin
  if FRecRinm = nil then
    Application.CreateForm(TFRecRinm, FRecRinm)
  else
    FRecRinm.Show;
end;

procedure TfPrincipal.actReciboReservaVentaExecute(Sender: TObject);
begin
  if FRecRinmVta = nil then
    Application.CreateForm(TFRecRinmVta, FRecRinmVta)
  else
    FRecRinmVta.Show;
end;

procedure TfPrincipal.actRecibosAnomaliasExecute(Sender: TObject);
begin
  if fRecibosAnomalias = nil then
    Application.CreateForm(TfRecibosHistoricos, fRecibosAnomalias)
  else
    fRecibosAnomalias.Show;
  fRecibosAnomalias.Caption := 'Recibos con Anomalias ';
  fRecibosAnomalias.FSoloPendientes := False;
  fRecibosAnomalias.FSoloClave := True;
  fRecibosAnomalias.ChIncluirControlados.Visible := True;
  fRecibosAnomalias.Label5.Visible := True;
  fRecibosAnomalias.Label2.Visible := True;
  fRecibosAnomalias.cbTipo.Visible := True;
  fRecibosAnomalias.cbLetra.Visible := True;
end;

procedure TfPrincipal.actRecibosDevolucionExecute(Sender: TObject);
begin
  if FReciboDevolucion = nil then
    Application.CreateForm(TFReciboDevolucion, FReciboDevolucion)
  else
    FReciboDevolucion.Show;
end;

procedure TfPrincipal.actReciboSenaInmuebleExecute(Sender: TObject);
begin
  if FRecSinm = nil then
    Application.CreateForm(TFRecSinm, FRecSinm)
  else
    FRecSinm.Show;

end;

procedure TfPrincipal.actReciboSenaInmueblesVtaExecute(Sender: TObject);
begin
  if FRecSinmVTA = nil then
    Application.CreateForm(TFRecSinmVTA, FRecSinmVTA)
  else
    FRecSinmVTA.Show;

end;

procedure TfPrincipal.actRecibosExecute(Sender: TObject);
begin
//
end;

procedure TfPrincipal.actRecibosHistoricosExecute(Sender: TObject);
begin
  if fRecibosHistoricos = nil then
    Application.CreateForm(TfRecibosHistoricos, fRecibosHistoricos)
  else
    fRecibosHistoricos.Show;
  fRecibosHistoricos.FSoloPendientes := False;
  fRecibosHistoricos.Label5.Visible := True;
  fRecibosHistoricos.Label2.Visible := True;
  fRecibosHistoricos.cbTipo.Visible := True;
  fRecibosHistoricos.cbLetra.Visible := True;
end;

procedure TfPrincipal.actRecibosPendientesExecute(Sender: TObject);
begin
  if fRecibosPendientes = nil then
    Application.CreateForm(TfRecibosPendientes, fRecibosPendientes)
  else
    fRecibosPendientes.Show;
  fRecibosPendientes.FSoloPendientes := False;
  fRecibosPendientes.Label5.Visible := True;
  fRecibosPendientes.Label2.Visible := True;
  fRecibosPendientes.cbTipo.Visible := True;
  fRecibosPendientes.cbTipo.ItemIndex := 1;
  fRecibosPendientes.cbTipo.Enabled := False;

  fRecibosPendientes.cbLetra.Visible := True;
end;

procedure TfPrincipal.actRecordatorioExecute(Sender: TObject);
begin
  if FNotaWindows = nil then
    Application.CreateForm(TFNotaWindows, FNotaWindows)
  else
    FNotaWindows.Show;
end;

procedure TfPrincipal.actRecuperarHistoricoExecute(Sender: TObject);
begin
  if FRecuperarHistorico = nil then
    Application.CreateForm(TFRecuperarHistorico, FRecuperarHistorico)
  else
    FRecuperarHistorico.Show;
end;

procedure TfPrincipal.actRecuperarHistoricoValesExecute(Sender: TObject);
begin
  if FRecuperarHistoricoVales = nil then
    Application.CreateForm(TFRecuperarHistoricoVales, FRecuperarHistoricoVales)
  else
    FRecuperarHistoricoVales.Show;
end;

procedure TfPrincipal.actRepetidosExecute(Sender: TObject);
begin
  if fInformeItemsRepetidos = nil then
    Application.CreateForm(TfInformeImpuestosPagados, fInformeItemsRepetidos)
  else
    fInformeItemsRepetidos.Show;
  fInformeItemsRepetidos.Caption := 'Items Automatizados Repetidos ';
  fInformeItemsRepetidos.TipoInforme := tiRepetidos;
  fInformeItemsRepetidos.cbVales.Visible := False;
  fInformeItemsRepetidos.edCodigo.Visible := False;
  fInformeItemsRepetidos.edEmpresa.Visible := False;
  fInformeItemsRepetidos.edVale.Visible := False;
  fInformeItemsRepetidos.Label1.Visible := False;
  fInformeItemsRepetidos.Label2.Visible := False;
  fInformeItemsRepetidos.Label4.Visible  := True;
  fInformeItemsRepetidos.edDatoFijo.Visible  := True;
  fInformeItemsRepetidos.btnEliminar.Visible := False;
//  fInformeItemsRepetidos.gDetalle.ColWidths[3] := fInformeItemsRepetidos.gDetalle.ColWidths[3] - 60;
  fInformeItemsRepetidos.gDetalle.ColCount := 7;
  fInformeItemsRepetidos.gDetalle.ColumnHeaders.Add('Veces');
//  fInformeItemsRepetidos.gDetalle.ColWidths[5] := 60;
end;

procedure TfPrincipal.actRubrosDatosFijosExecute(Sender: TObject);
begin
  if FABMRubrosDatosFijos = nil then
    Application.CreateForm(TFABMRubrosDatosFijos, FABMRubrosDatosFijos)
  else
    FABMRubrosDatosFijos.Show;
  FABMRubrosDatosFijos.btnActualizar.Click;
end;

procedure TfPrincipal.actRubrosIndicadoresExecute(Sender: TObject);
begin
  if FABMRubrosIndicadores = nil then
    Application.CreateForm(TFABMRubrosIndicadores, FABMRubrosIndicadores)
  else
    FABMRubrosIndicadores.Show;
end;

end.

