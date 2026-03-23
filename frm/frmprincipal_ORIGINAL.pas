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
  frmMovimientos, frmNotas, frmNotasWindows, Liqin, frmNuevoConsorcio, ABMGastosConsorcios,
  strUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxLookAndFeels, dxSkinsForm;

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
    rbpInformes: TRibbonPage;
    rbgImpuestos: TRibbonGroup;
    rbpConfiguracion: TRibbonPage;
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
    RibbonGroup6: TRibbonGroup;
    actABMConsorcios: TAction;
    actABMDepartamentos: TAction;
    actCargaGastos: TAction;
    actAsignacionGastos: TAction;
    RibbonGroup7: TRibbonGroup;
    actAsignacionDeptos: TAction;
    RibbonGroup8: TRibbonGroup;
    actCobrarInquilino: TAction;
    actRazonesSociales: TAction;
    RibbonGroup9: TRibbonGroup;
    actRecibosPendientes: TAction;
    actPlanillaCaja: TAction;
    actSobres: TAction;
    actImpuestosPendientes: TAction;
    actUsuarios: TAction;
    RibbonGroup10: TRibbonGroup;
    actListadoCobrados: TAction;
    actListadoLiquidados: TAction;
    RibbonPage1: TRibbonPage;
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
    RibbonGroup14: TRibbonGroup;
    actBackup: TAction;
    actListadoRecupero: TAction;
    actPasarHistorico: TAction;
    actRecuperarHistorico: TAction;
    actTiposIVA: TAction;
    actFacturaB: TAction;
    actFacturaA: TAction;
    actLibroIVAVentas: TAction;
    RibbonPage2: TRibbonPage;
    RibbonGroup15: TRibbonGroup;
    actImpuestosYServicios: TAction;
    actIdentificacion: TAction;
    actPorcentajesPropiedad: TAction;
    actCrearMovimientos: TAction;
    RibbonGroup16: TRibbonGroup;
    dxSkinController1: TdxSkinController;
    procedure botonsalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Listadodepropiedades1Click(Sender: TObject);
    procedure Listadodedatosfijos1Click(Sender: TObject);
    procedure ImprimirContratos1Click(Sender: TObject);
    procedure actSalirExecute(Sender: TObject);
    procedure e(Sender: TObject);
    procedure OrdenarRegistros1Click(Sender: TObject);
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
    procedure actABMConsorciosExecute(Sender: TObject);
    procedure actABMDepartamentosExecute(Sender: TObject);
    procedure actCargaGastosExecute(Sender: TObject);
    procedure actAsignacionGastosExecute(Sender: TObject);
    procedure actAsignacionDeptosExecute(Sender: TObject);
    procedure actCobrarInquilinoExecute(Sender: TObject);
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
  private
    { Private declarations }
  public
    fUsuario: String;
    procedure Center(F: TForm);
    procedure prCargarIconosMenu;
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  frmLogin, frmDatosFijos, frmABMDatosFijos, frmABMMovimientos, frmgenautom,
  recrinm, recsinm, recrinmvta, recsinmvta, ABMConsorcios, ABMDepartamentos,
  Asignaciongastosconsorcios, Asignaciongastosdepartamentos, LiquidacionGastos,
  frmLiquidacionComisiones, frmLiquidacionParaPropietarios,
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
  ABMGeneracionMovimientos;

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
  LLave: word;
  BarItem : TActionBarItem;
  ActItem : TActionClientItem;
  q: TSQLQuery;

begin
  ItemMenu := nil;
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
      llave  := q.FieldByName('CodigoMenu').AsInteger;
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

procedure TfPrincipal.Button3Click(Sender: TObject);
var
 cod:string;
 f:string;
 fd:string;
 FechaHasta:string;
 imp:string;
 i,j:integer;
begin
end;

procedure TfPrincipal.Listadodepropiedades1Click(Sender: TObject);
//var
// l:tflistpropiedades;
begin
// l:=tflistpropiedades.create(self);

end;

procedure TfPrincipal.Listadodedatosfijos1Click(Sender: TObject);
//var
// lf:tflistdatosfijos;
begin
// lf:=tflistdatosfijos.create(self);
end;

procedure TfPrincipal.ImprimirContratos1Click(Sender: TObject);
//var
// his:tFhistorico;
begin
// his:=tFHistorico.create(self);
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

procedure TfPrincipal.actTiposIVAExecute(Sender: TObject);
begin
  if FAlicuotasIVA = nil then
    Application.CreateForm(TFAlicuotasIVA, FAlicuotasIVA)
  else
    FAlicuotasIVA.Show;
end;

procedure TfPrincipal.actUsuariosExecute(Sender: TObject);
begin
  if FABMUsuarios = nil then
    Application.CreateForm(TFABMUsuarios, FABMUsuarios)
  else
    FABMUsuarios.Show;
end;

procedure TfPrincipal.e(Sender: TObject);
var
  mfrmClave:   TfrmClave;
//  mfrmGenerar: TfrmGenAutom;

begin
//  if (TWinControl(Sender).Name = mitDatosFijos.Name) then
//    TFrmDatosFijos.Create(Self);
end;



procedure TfPrincipal.OrdenarRegistros1Click(Sender: TObject);
var
i,j:integer;
begin
(*
 DM.ibtItemAutom.Open;
 DM.ibtItemAutom.Last;
 DM.ibtItemAutom.first;
 j:=DM.ibtItemAutom.RecordCount;
 for i:=1 to j do
 begin
  DM.ibtItemAutom.Edit;
  DM.ibtItemAutom.Fields[9].AsInteger:=DM.ibtItemAutom.RecNo;
  DM.ibtItemAutom.Post;
  DM.ibtItemAutom.Next;
 end; *)
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
  Elementos: TStringList;
  I:         Integer;
begin
  if TFrmClave.Ejecutar then
  begin
    prCargarIconosMenu;
    actContratos.Execute;
  end
  else
    Close;
end;


procedure TfPrincipal.ListView1DblClick(Sender: TObject);
begin
(*
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

procedure TfPrincipal.actABMConsorciosExecute(Sender: TObject);
begin
  if FABMCOnsorcios = nil then
    Application.CreateForm(TFABMConsorcios, FABMConsorcios)
  else
    FABMConsorcios.Show;
end;

procedure TfPrincipal.actABMDepartamentosExecute(Sender: TObject);
begin
  if FABMDepartamentos = nil then
    Application.CreateForm(TFABMDepartamentos, FABMDepartamentos)
  else
    FABMDepartamentos.Show;
end;

procedure TfPrincipal.actabmNotasExecute(Sender: TObject);
begin
  if FNotas = nil then
    Application.CreateForm(TFNotas, FNotas)
  else
    FNotas.Show;
end;

procedure TfPrincipal.actAsignacionDeptosExecute(Sender: TObject);
begin
  if frmAsignacionGastosdeptos = nil then
    Application.CreateForm(TfrmAsignacionGastosdeptos, frmAsignacionGastosdeptos)
  else
    frmAsignacionGastosdeptos.Show;
end;

procedure TfPrincipal.actAsignacionGastosExecute(Sender: TObject);
begin
  if frmAsignacionGastos = nil then
    Application.CreateForm(TfrmAsignacionGastos, frmAsignacionGastos)
  else
    frmAsignacionGastos.Show;
end;

procedure TfPrincipal.actAutomatizacionExecute(Sender: TObject);
begin
  if FAutomatizacion = nil then
    Application.CreateForm(TFAutomatizacion, FAutomatizacion)
  else
    FAutomatizacion.Show;
end;

procedure TfPrincipal.actBackupExecute(Sender: TObject);
begin
  if FBackUpDatos = nil then
    Application.CreateForm(TfBackupDatos, fBackupDatos)
  else
    fBackupDatos.Show;
end;

procedure TfPrincipal.actCargaGastosExecute(Sender: TObject);
begin
  if FABMGastosConsorcios = nil then
    Application.CreateForm(TFABMGastosConsorcios, FABMGastosCOnsorcios)
  else
    FABMGastosConsorcios.Show;
end;

procedure TfPrincipal.actCobrarInquilinoExecute(Sender: TObject);
begin
  if frmLiquidacionDeptos = nil then
    Application.CreateForm(TfrmLiquidacionDeptos, frmLiquidacionDeptos)
  else
    frmLiquidacionDeptos.Show;
end;

procedure TfPrincipal.actContratosEscalonadosExecute(Sender: TObject);
begin
  if FrmContratos = nil then
    Application.CreateForm(TFrmContratos, FrmContratos)
  else
    FrmContratos.Show;
end;

procedure TfPrincipal.actContratosExecute(Sender: TObject);
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
  ibqConsulta: TSQLQuery;
  q: TSQLQuery;

begin
// 24/06/2012
  ibqConsulta := CrearQuery;
  q := CrearQuery;
  try
    DM.IniciarTransaccion;

    FechaActual := DateToStr(Date());
    FechaActual := Funciones.FechaAlReves(FechaActual);

    With ibqConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.Add('Select * from contratos');
      Open;

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
            q.sql.Text := 'Update Inmuebles Set Alquiler = :Importe where Codinq = :Codigo';
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;
            Cambio := True;
          end;
        end;
        FechaDesde:=ibqConsulta.Fields[4].asstring;
        FechaHasta:=ibqConsulta.Fields[5].asstring;
        if (FechaDesde<>'') and (FechaHasta<>'') then
        begin
          if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
          begin
            Importe:=FormatFloat('0.00', ibqConsulta.Fields[6].asFloat);
            q.sql.Text := 'Update Inmuebles Set Alquiler = :Importe where Codinq = :Codigo';
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;
            Cambio := True;
          end;
        end;
        FechaDesde:=ibqConsulta.Fields[7].asstring;
        FechaHasta:=ibqConsulta.Fields[8].asstring;
        if (FechaDesde<>'') and (FechaHasta<>'') then
        begin
          if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
          begin
            Importe:=FormatFloat('0.00', ibqConsulta.Fields[9].asFloat);
            q.sql.Text := 'Update Inmuebles Set Alquiler = :Importe where Codinq = :Codigo';
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;
            Cambio := True;
          end;
        end;
        FechaDesde:=ibqConsulta.Fields[10].asstring;
        FechaHasta:=ibqConsulta.Fields[11].asstring;
        if (FechaDesde<>'') and (FechaHasta<>'') then
        begin
          if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
          begin
            Importe:=FormatFloat('0.00', ibqConsulta.Fields[12].asFloat);
            q.sql.Text := 'Update Inmuebles Set Alquiler = :Importe where Codinq = :Codigo';
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;
            Cambio := True;
          end;
        end;
        FechaDesde:=ibqConsulta.Fields[13].asstring;
        FechaHasta:=ibqConsulta.Fields[14].asstring;
        if (FechaDesde<>'') and (FechaHasta<>'') then
        begin
          if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
          begin
            Importe:=FormatFloat('0.00', ibqConsulta.Fields[15].asFloat);
            q.sql.Text := 'Update Inmuebles Set Alquiler = :Importe where Codinq = :Codigo';
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;
            Cambio := True;
          end;
        end;
        FechaDesde:=ibqConsulta.Fields[16].asstring;
        FechaHasta:=ibqConsulta.Fields[17].asstring;
        if (FechaDesde<>'') and (FechaHasta<>'') then
        begin
          if (FechaDesde<= FechaActual) and (FechaHasta>= FechaActual) then
          begin
            Importe:=FormatFloat('0.00', ibqConsulta.Fields[18].asFloat);
            q.sql.Text := 'Update Inmuebles Set Alquiler = :Importe where Codinq = :Codigo';
            q.ParamByName('Importe').AsString := Importe;
            q.ParamByName('Codigo').AsString := Codigo;
            q.ExecSql;
            Cambio := True;
          end;
        end;
        if Cambio then
        begin
          q.sql.Text := 'Update Automatizacion Set Alquiler = :Importe where Codinq = :Codigo';
          q.ParamByName('Importe').AsString := Importe;
          q.ParamByName('Codigo').AsString := Codigo;
          q.ExecSql;
        end;
        ibqConsulta.Next;
      end;
    end;
    With ibqConsulta do
    begin
      Close;
      Sql.Clear;
      Sql.Add('Select i.Codinq, i.Alquiler, a.Porcentaje from Inmuebles I, automatizacion a where i.Codinq = A.codinq order by codinq');
      Open;
    end;
    while not ibqConsulta.eof do
    begin
      if (ibqConsulta.FieldByName('Porcentaje').AsString <> '') or
        (ibqConsulta.FieldByName('Porcentaje').AsString <> '0') then
      begin
        Codigo := ibqConsulta.FieldByName('Codinq').AsString;
        Comision := ibqConsulta.FieldByName('Porcentaje').AsString;
        if (Comision <> '') and (Comision <> '0') then
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

          q.SQL.Text := 'Update Automatizacion Set Comision = :Importe where Codinq = :Codigo';
          q.ParamByName('Importe').AsString := Importe;
          q.ParamByName('Codigo').AsString := Codigo;
          q.ExecSQL;
        end;
      end;
      ibqConsulta.Next;
    end;
    DM.ConfirmarTransaccion;
  finally
    FreeAndNil(ibqConsulta);
    FreeAndNil(q);
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

procedure TfPrincipal.actDatosFijosExecute(Sender: TObject);
begin
  if FABMDatosFijos = nil then
    Application.CreateForm(TFABMDatosFijos, FABMDatosFijos)
  else
    FABMDatosFijos.Show;
  FABMDatosFijos.Actualizar.Click;
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

procedure TfPrincipal.actGenAutomExecute(Sender: TObject);
begin
  if FGenAutom = nil then
    Application.CreateForm(TFGenAutom, FGenAutom)
  else
    FGenAutom.Show;
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

procedure TfPrincipal.actInmueblesExecute(Sender: TObject);
begin
  if FABMInmuebles = nil then
    Application.CreateForm(TFABMInmuebles, FABMInmuebles)
  else
    FABMInmuebles.Show;
  FABMInmuebles.Actualizar.Click;
end;

procedure TfPrincipal.actLibroIVAVentasExecute(Sender: TObject);
begin
  if FLibroIVAVentas = nil then
    Application.CreateForm(TFLibroIVAVentas, FLibroIVAVentas)
  else
    FLibroIVAVentas.Show;
end;

procedure TfPrincipal.actIdentificacionExecute(Sender: TObject);
begin
  if fABMIdentificacionImpuestos = nil then
    Application.CreateForm(TfABMIdentificacionImpuestos, fABMIdentificacionImpuestos)
  else
    fABMIdentificacionImpuestos.Show;
end;

procedure TfPrincipal.actImpuestosPendientesExecute(Sender: TObject);
VAR
  RESULTADO: bOOLEAN;
begin
  TFClaveCaja.Ejecutar(Resultado);
  if not Resultado then
    Exit;
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

procedure TfPrincipal.actListadoCobroInquilinoExecute(Sender: TObject);
begin
  if FHistorialCobroInquilinos = nil then
    Application.CreateForm(TFHistorialCobroInquilinos, FHistorialCobroInquilinos)
  else
    FHistorialCobroInquilinos.Show;
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

procedure TfPrincipal.actMovimientosExecute(Sender: TObject);
begin
  if FABMMovimientos = nil then
    Application.CreateForm(TFABMMovimientos, FABMMovimientos)
  else
    FABMMovimientos.Show;
end;

procedure TfPrincipal.actPasarHistoricoExecute(Sender: TObject);
begin
  if FPasarHistorico = nil then
    Application.CreateForm(TFPasarHistorico, FPasarHistorico)
  else
    FPasarHistorico.Show;
end;

procedure TfPrincipal.actPlanillaCajaExecute(Sender: TObject);
var
  Resultado: Boolean;
begin
  TFClaveCaja.Ejecutar(Resultado);
  if not Resultado then
    Exit;

  if fPlanillaCaja = nil then
    Application.CreateForm(TFPlanillaCaja, fPlanillaCaja)
  else
    fPlanillaCaja.Show;
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

procedure TfPrincipal.actRecibosPendientesExecute(Sender: TObject);
VAR
  RESULTADO: bOOLEAN;
begin
  TFClaveCaja.Ejecutar(Resultado);
  if not Resultado then
    Exit;

  if fRecibosPendientes = nil then
    Application.CreateForm(TfRecibosPendientes, fRecibosPendientes)
  else
    fRecibosPendientes.Show;
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

end.

