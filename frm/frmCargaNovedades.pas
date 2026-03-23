unit frmCargaNovedades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, frmPrincipal, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMemo, cxMaskEdit, Declaraciones, Funciones, ImgList, AdvGlowButton, sqlExpr,
  frmDatos, cxDropDownEdit, Grids, AdvObj, BaseGrid, AdvGrid, cxButtonEdit,
  Menus, cxCheckComboBox, FXQuery, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxCheckBox, Data.db,
  cxGroupBox;

type
  TfCargaNovedades = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edTitulo: TcxTextEdit;
    edMensaje: TcxMemo;
    edRespuesta: TcxMemo;
    Label4: TLabel;
    edIDNovedad: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    edFecha: TcxMaskEdit;
    Label7: TLabel;
    edCodigo: TcxTextEdit;
    ImageList1: TImageList;
    Label8: TLabel;
    edPropietario: TcxTextEdit;
    pnlSeleccion: TPanel;
    gLista: TAdvStringGrid;
    BtnAceptar: TAdvGlowButton;
    edInquilino: TcxButtonEdit;
    popSeleccion: TPopupMenu;
    Seleccionartodos1: TMenuItem;
    Deseleccionartodos1: TMenuItem;
    edFechaCobro: TcxCheckComboBox;
    chLeido: TCheckBox;
    Label9: TLabel;
    lbUsuarioCarga: TLabel;
    Label11: TLabel;
    lbUsuarioRespuesta: TLabel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure edFechaExit(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxMaskEdit1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxMaskEdit2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edFechaCobro1Exit(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnGrabarClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure gListaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BtnAceptarClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Seleccionartodos1Click(Sender: TObject);
    procedure Deseleccionartodos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FOperacion: TTipoOperacion;
    FCodigoInquilino: string;
    FDesde, FHasta: TDatetime;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function fxValidarDatos: Boolean;
  end;

var
  fCargaNovedades: TfCargaNovedades;

implementation

uses frmABMNovedades, liqin;

{$R *.dfm}

procedure TfCargaNovedades.BtnAceptarClick(Sender: TObject);
var
  I: Integer;
  Estado: Boolean;
  niCantidad: Integer;
  stCodinq, stDescripcion, stPropietario: string;
begin
  pnlSeleccion.Visible := False;

  niCantidad := 0;
  for I := 0 to gLista.RowCount - 1 do
  begin
    if gLista.GetCheckboxState(0, I, Estado) then
    begin
      if Estado then
      begin
        Inc(niCantidad);
        if niCantidad > 1 then
        begin
          stCodinq := '';
          stDescripcion := 'Selección multiple';
          stPropietario := '';
          edInquilino.Properties.ReadOnly := True;
          Break;
        end
        else
        begin
          stCodinq := gLista.Cells[1, I];
          stDescripcion := gLista.Cells[2, I];
          edCodigo.Text := stCodinq;
          edInquilino.Text := stDescripcion;
          stPropietario := edPropietario.Text;
        end;
      end;
    end;
  end;
  edCodigo.Text := stCodinq;
  edInquilino.Text := stDescripcion;
  edPropietario.Text := stPropietario;

  if niCantidad = 1 then
    edCodigoExit(nil);

end;

procedure TfCargaNovedades.btnGrabarClick(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
  Estado: Boolean;
  J: Integer;
  Usuario: string;
begin
  if not fxValidarDatos then
    Exit;

  if edRespuesta.Text <> '' then
    if length(edRespuesta.Text) < 5 then
    begin
      MostrarDialogoAceptar('La respuesta debe contener al menos 5 caracteres. Verifique por favor.');
      Exit;
    end;

  q := CrearQuery;
  DM.IniciarTransaccion;
  try
    try
      if FOperacion = toModificar then
        Usuario := lbUsuarioCarga.Caption;

      for I := 1 to gLista.RowCount - 1 do
      begin
        if gLista.GetCheckboxState(0, I, Estado) then
        begin
          if Estado then
          begin
            for J := 0 to edFechaCobro.Properties.Items.Count - 1 do
            begin
              if edFechaCobro.States[J] = cbsChecked then
              begin
                q.Sql.Text := 'Delete from Novedades Where idNovedad = :Novedad';
                if FOperacion = toModificar then
                  q.ParambyName('Novedad').AsInteger := ToInt(edIdNovedad.Text)
                else
                  q.ParambyName('Novedad').AsInteger := fxObtenerCodigo('NOVEDADES', 'IDNOVEDAD');
                q.ExecSql;

                q.Sql.Text := 'Insert Into Novedades Values (:Novedad, :Codinq, :Fecha, :FechaCobro, :Titulo, :Mensaje, :Respuesta,:Leida, :UsuarioCarga, :UsuarioRespuesta)';
                q.ParambyName('Novedad').AsInteger := fxObtenerCodigo('NOVEDADES', 'IDNOVEDAD');
                q.ParambyName('Codinq').AsString := gLista.Cells[1,I];
                q.ParambyName('Fecha').AsDateTime := StrToDate(edFecha.Text);
                q.ParambyName('FechaCobro').AsDateTime := StrToDate(edFechaCobro.Properties.Items[J].Description);
                q.ParambyName('Titulo').AsString := Trim(edTitulo.Text);
                q.ParambyName('Mensaje').AsString := Trim(edMensaje.Text);
                q.ParambyName('Respuesta').AsString := Trim(edRespuesta.Text);
                if chLeido.Checked then
                  q.ParambyName('Leida').AsInteger := 1
                else
                  q.ParambyName('Leida').AsInteger := 0;
                q.ParambyName('UsuarioCarga').AsString := Trim(lbUsuarioCarga.Caption);
                q.ParambyName('UsuarioRespuesta').AsString := Trim(fPrincipal.fUsuario);
                q.ExecSql;
              end;
            end;
          end;
        end;
      end;
      Dm.ConfirmarTransaccion;
      Close;
      MostrarDialogoAceptar('Novedad correctamente guardada');
    except
      on e: exception do
      begin
        Dm.CancelarTransaccion;
        MostrarDialogoAceptar('Se produjo un error al guardar la novedad.' + #13#10 +
          'Datos Técnicos: ' + e.message);
      end;
    end;

    if Assigned(FrmLiquidacionInquilinos) then
      FrmLiquidacionInquilinos.prCargarNovedades(fDesde, FHasta, FrmLiquidacionInquilinos.Edit1.Text);

  finally
    FreeAndNil(q);
  end;
end;

procedure TfCargaNovedades.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfCargaNovedades.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  I: Integer;
  Fecha: TDateTime;
begin
  FOperacion := Operacion;
  Fecha := Date - 60;

  for I := 1 to 120 do
  begin
    edFechaCobro.Properties.Items.AddCheckItem(FormatDateTime('05/mm/yyyy', Fecha));
    Fecha := IncMonth(Fecha);
  end;

  if Operacion = toNuevo then
  begin
    edIDNovedad.Text := IntToStr(fxObtenerCodigo('NOVEDADES', 'IDNOVEDAD'));
    edFecha.Text := FormatDateTime('dd/mm/yyyy', Date);
    edFechaCobro.Text := FormatDateTime('05/mm/yyyy', Date);
    edTitulo.Text := '';
    edMensaje.Text := '';
    edRespuesta.Text := '';
    lbUsuarioCarga.Caption := fPrincipal.fUsuario;
    lbUsuarioRespuesta.Caption := fPrincipal.fUsuario;
    Exit;
  end;

  if Operacion = toModificar then
  begin
    edTitulo.SetFocus;
    lbUsuarioRespuesta.Caption := fPrincipal.fUsuario;
  end;

  q := CrearQuery;
  try
    with q do
    begin
      SQL.Text := 'Select N.*, I.Inquilino, I.Propietario from Novedades N Inner Join Inmuebles I on I.Codinq = N.Codinq where N.IdNovedad=:Codigo';
      ParamByName('Codigo').AsString := pCodigo;
      Open;

      if not q.IsEmpty then
      begin
        edIdNovedad.Text   := FieldbyName('IDNovedad').AsString;
        edCodigo.Text      := FieldbyName('Codinq').AsString;
        edInquilino.Text   := FieldbyName('Inquilino').AsString;
        edPropietario.Text := FieldbyName('Propietario').AsString;
        edFecha.Text       := FieldbyName('Fecha').AsString;
        for I := 0 to 35 do
          if edFechaCobro.Properties.Items[I].Description = FieldbyName('FechaRelacion').AsString then
            edFechaCobro.States[I] := cbsChecked;

        edTitulo.Text      := FieldbyName('Titulo').AsString;
        edMensaje.Text     := FieldbyName('Mensaje').AsString;
        edRespuesta.Text   := FieldbyName('Respuesta').AsString;
        lbUsuarioCarga.Caption := FieldbyName('UsuarioCarga').AsString;
      end;
    end;

    if Operacion = toModificar then
    begin
      for I := 1 to gLista.RowCount - 1 do
        gLista.SetCheckboxState(0, I, False);

      for I := 1 to gLista.RowCount - 1 do
      begin
        if gLista.Cells[1,I] = edCodigo.Text then
          gLista.SetCheckboxState(0, I, True);
        gLista.ReadOnly[0, I] := True;
      end;
      lbUsuarioRespuesta.Caption := q.FieldbyName('UsuarioRespuesta').AsString;
    end;

    btnGrabar.Visible  := (Operacion in  [toNuevo, toModificar]);
    edIdNovedad.Properties.Readonly  := (Operacion in  [toNuevo, toModificar]);
    edCodigo.Properties.Readonly  := (Operacion in  [toNuevo, toModificar]);
    edInquilino.Properties.Readonly  := (Operacion in  [toNuevo, toModificar]);
    edPropietario.Properties.Readonly  := (Operacion in  [toNuevo, toModificar]);
//    edInquilino.Properties.Buttons.Items[0].Enabled := (Operacion in  [toNuevo]);
    if Assigned(fABMNovedades) then
      fABMNovedades.ActualizarClick(nil);
    if Operacion = toEliminar then
    begin
      Application.ProcessMessages;
      if MostrarDialogoSiNo('¿Esta seguro de elimiar la novedad seleccionada?') then
      begin
        DM.IniciarTransaccion;
        try
          q.Sql.text := 'Delete from novedades where IDNovedad = :Codigo';
          q.ParambyName('Codigo').AsString := pCodigo;
          q.ExecSql;
          DM.ConfirmarTransaccion;
          MostrarDialogoAceptar( 'Datos eliminados correctamente.');
          Close;
          if Assigned(fABMNovedades) then
            fABMNovedades.ActualizarClick(nil);
        except
          DM.CancelarTransaccion;
        end;
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfCargaNovedades.edFechaExit(Sender: TObject);
begin
  try
    StrToDate(edFecha.Text);
  Except
    edFecha.Text := FormatDateTime('dd/mm/yyyy', Date);
  end;

  edFecha.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edFecha.Text));

end;

procedure TfCargaNovedades.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  pnlSeleccion.Visible := True;
  edCodigo.Text := '';
  edInquilino.Text := '';
  edPropietario.Text := '';
end;

procedure TfCargaNovedades.cxMaskEdit1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TfCargaNovedades.edFechaCobro1Exit(Sender: TObject);
begin
  try
    StrToDate(edFechaCobro.Text);
  except
    edFechaCobro.Text := FormatDateTime('05/mm/yyyy', Date);
  end;

  if (edFechaCobro.text = '05/  /    ') or (edFechaCobro.text = '5 /  /    ') then
    edFechaCobro.Text := FormatDateTime('05/mm/yyyy', Date);
  edFechaCobro.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edFechaCobro.Text));

end;

procedure TfCargaNovedades.cxMaskEdit2PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if Error then
    Error := False;
end;

procedure TfCargaNovedades.Deseleccionartodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gLista.RowCount - 1 do
    gLista.SetCheckboxState(0, I, False);
end;

procedure TfCargaNovedades.edCodigoExit(Sender: TObject);
var
  Tecla: Char;
begin
  Tecla := #13;
  edCodigoKeyPress(nil, Tecla);
end;

procedure TfCargaNovedades.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
  Codinq: string;
  I: Integer;
begin
  q := CrearQuery;
  try
    if not (Key in ['0'..'9', #8, #13, #9]) then
      Key := #0;

    if Key = #13 then
    begin
      if edCodigo.Text = '' then
        Exit;

      Codinq := FormatFloat('0000', ToFloat(edCodigo.Text));
      for I := 1 to gLista.RowCount - 1 do
        gLista.SetCheckboxState(0, I, False);

      for I := 1 to gLista.RowCount - 1 do
        if gLista.Cells[1,I] = edCodigo.Text then
          gLista.SetCheckboxState(0, I, True);

      with q do
      begin
        Close;
        Sql.Text := ' Select Inquilino, Propietario from inmuebles where codinq = :Codinq';
        ParamByName('Codinq').AsString := Codinq;
        Open;
        if IsEmpty then
        begin
          MostrarDialogoAceptar('No existe un Inquilino con ese código. Verifique por favor.');
          edCodigo.SetFocus;
          btnGrabar.Enabled := False;
          Exit;
        end
        else
        begin
          edInquilino.Text := q.FieldbyName('Inquilino').AsString;
          edPropietario.Text := q.FieldbyName('Propietario').AsString;
          edCodigo.Text := Codinq;
        end;
      end;
      edTitulo.SetFocus;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfCargaNovedades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fCargaNovedades := nil;
end;

procedure TfCargaNovedades.FormCreate(Sender: TObject);
var
  q: TFXQuery;
  I: Integer;
begin
  q := CrearQuery;
  try
    fPrincipal.Center(Self);
    With q do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select Codinq, Inquilino from inmuebles Order by Codinq');
      Open;
      gLista.Clear;
      gLista.Cells[1, 0] := 'Código';
      gLista.Cells[2, 0] := 'Inquilino';
      I := 1;
      While not eof do
      begin
        gLista.RowCount := gLista.RowCount + 1;
        gLista.AddCheckBox(0,I,false,false);
        gLista.Cells[1,I] := FieldByName('Codinq').AsString;
        gLista.Cells[2,I] := FieldByName('Inquilino').AsString;
        gLista.Readonly[1,I] := True;
        gLista.Readonly[2,I] := True;
        Inc(I);
        Next;
      end;
      if I < 2 then
        gLista.RowCount := 2
      else
        gLista.RowCount := I;
    end;
  finally
    FreeAndNil(q);
  end;

end;

function TfCargaNovedades.fxValidarDatos: Boolean;
var
  I, niCantidad: Integer;

begin
  Result := True;
  if (Trim(edInquilino.Text) = '') or (Trim(edInquilino.Text) = '0000') then
  begin
    MostrarDialogoAceptar('Debe seleccionar un inquilino válido. Verifique por favor');
    Result := False;
    Exit;
  end;

  if (Length(Trim(edTitulo.Text)) <= 4) then
  begin
    MostrarDialogoAceptar('El título debe contener al menos 5 caracteres.');
    Result := False;
    Exit;
  end;

  if (Length(Trim(edMensaje.Text)) <= 4) then
  begin
    MostrarDialogoAceptar('El mensaje debe contener al menos 5 caracteres.');
    Result := False;
    Exit;
  end;

  niCantidad := 0;
  for I := 0 to edFechaCobro.Properties.Items.Count - 1 do
    if edFechaCobro.States[I] = cbsChecked then
      Inc(niCantidad);

  if niCantidad = 0 then
  begin
    MostrarDialogoAceptar('Debe seleccionar las fecha/s de cobro de la novedad.');
    Result := False;
    Exit;
  end;

  niCantidad := 0;
  if fOperacion = toModificar then
  begin
    for I := 0 to 11 do
      if edFechaCobro.States[I] = cbsChecked then
      begin
        Inc(niCantidad);
        if niCantidad > 1 then
        begin
          MostrarDialogoAceptar('No se puede seleccionar mas de una fecha si esta modificando una novedad.');
          Result := False;
          Exit;
        end;
      end;
  end;
end;

procedure TfCargaNovedades.gListaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1,2: HAlign := taLeftJustify;
  end;
end;

procedure TfCargaNovedades.Seleccionartodos1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to gLista.RowCount - 1 do
    gLista.SetCheckboxState(0, I, True);
end;

end.
