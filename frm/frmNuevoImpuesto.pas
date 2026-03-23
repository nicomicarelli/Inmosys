unit frmNuevoImpuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, ActnList, ImgList, ToolWin, Funciones, Menus, ALIGRID, sqlExpr, Declaraciones,
  Spin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, AdvObj, BaseGrid, AdvGrid, AdvGlowButton,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, System.Actions, fxQuery, cxGroupBox, AdvPanel;

type
  TfNuevoImpuesto = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    actCerrar: TAction;
    ImageList1: TImageList;
    pnlFondo: TAdvPanel;
    cxGroupBox2: TcxGroupBox;
    lblCodigo: TLabel;
    lblDescripcion: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDescripcion: TcxTextEdit;
    edtCodigo: TcxTextEdit;
    gDetalle: TAdvStringGrid;
    edDatoFijo: TcxTextEdit;
    edDescripcionDatoFijo: TcxTextEdit;
    edCodigos: TcxTextEdit;
    edPorcDesc: TcxTextEdit;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure actBorrarExecute(Sender: TObject);
    procedure DatosKeyPress(Sender: TObject; var Key: Char);
    procedure actBorrarUpdate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gDetalleGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure gDetalleSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edDatoFijoKeyPress(Sender: TObject; var Key: Char);
    procedure edPorcDescKeyPress(Sender: TObject; var Key: Char);
    procedure edPorcDescExit(Sender: TObject);
  private
    FOperacion: TTipoOperacion;
  public
    Property Operacion: TTipoOperacion read FOperacion write FOperacion;
    procedure Cargar(pCodigo: string; Operacion: TTipoOperacion);
    function ValidarDatos: Boolean;
  end;

var
  fNuevoImpuesto: TfNuevoImpuesto;

implementation

uses frmDatos, frmprincipal, frmABMDatosFijos, ABMImpuestosYServicios;
{$R *.DFM}

procedure TfNuevoImpuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fNuevoImpuesto := nil;
end;

procedure TfNuevoImpuesto.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(Self);

  gDetalle.Cells[0,1] := 'Identificación';
  gDetalle.Cells[0,2] := 'Fecha';
  gDetalle.Cells[0,3] := 'Importe';

  gDetalle.Cells[2,1] := '0';
  gDetalle.Cells[2,2] := '0';
  gDetalle.Cells[2,3] := '0';
  gDetalle.Cells[3,1] := '0';
  gDetalle.Cells[3,2] := '0';
  gDetalle.Cells[3,3] := '0';
  gDetalle.Col := 2;
  gDetalle.Row := 1;
  gDetalle.Colors[1,1] := clBtnFace;
  gDetalle.Colors[1,2] := clBtnFace;
  gDetalle.Colors[1,3] := clBtnFace;

(*  q := CrearQuery;
  try
    q.SQL.Text := 'Select * from sobres order by descripcion';
    q.Open;

    while not q.Eof do
    begin
      cboOtroSobre.items.Add(q.FieldByName('Descripcion').AsString);
      cboSobre.items.Add(q.FieldByName('Descripcion').AsString);
      cboDescuenta.items.Add(q.FieldByName('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end; *)
end;

procedure TfNuevoImpuesto.gDetalleGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow > 0 then
  case ACol of
    0,1: HAlign := taLeftJustify;
    2,3: HAlign := taRightJustify;
  end;
end;

procedure TfNuevoImpuesto.gDetalleKeyPress(Sender: TObject; var Key: Char);
begin
  if gDetalle.Col in [1,2,3] then
    if not (CharInSet(Key, ['0'..'9', #8])) then
      Key := #0;
end;

procedure TfNuevoImpuesto.gDetalleSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = 0 then
    CanSelect := False
  else if (ACol = 1) then
    CanSelect := False
  else if (ACol in [2,3]) then
    CanSelect := True;
end;

function TfNuevoImpuesto.ValidarDatos: Boolean;
begin
  Result := True;

  if Trim(edtCodigo.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un código. ', mtInformation);
    Result := False;
    Exit;
  end;

  if (Trim(edDatoFijo.Text) = '') or (Trim(edDescripcionDatoFijo.Text) = '') then
  begin
    MostrarDialogoAceptar('Debe ingresar un Dato Fijo. ', mtInformation);
    Result := False;
    Exit;
  end;

  if Trim(edtDescripcion.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una Descripción. ', mtInformation);
    Result := False;
    Exit;
  end;
end;

procedure TfNuevoImpuesto.actGrabarExecute(Sender: TObject);
var
  Codigo: string;
  Descripcion: string;
  q: TFXQuery;

begin
  Codigo := edtCodigo.Text;
  Descripcion := edtDescripcion.Text;

  if not ValidarDatos then
    Exit;

  Dm.IniciarTransaccion;
  q := CrearQuery;
  try
    try
      q.Sql.Text :=
        'Delete from EmpresasImpuestos where Codigo = :Codigo';
      q.ParamByName('Codigo').AsInteger := ToInt(edtCodigo.Text);
      q.ExecSQL;

      q.Sql.Text :=
        'Insert Into EmpresasImpuestos Values (:Codigo, :Descripcion, :Identificacion, :IDDesde, :IDHasta, :FechaDesde, :FechaHasta, :ImporteDesde, :ImporteHasta, :CantCodigos, :Porcentaje)';
      q.ParamByName('Codigo').AsInteger := ToInt(edtCodigo.Text);
      q.ParamByName('Descripcion').AsString := edtDescripcion.Text;
      q.ParamByName('Identificacion').AsString := edDatoFijo.Text;
      q.ParamByName('IDDesde').AsInteger := ToInt(gDetalle.Cells[2,1]);
      q.ParamByName('IDHasta').AsInteger := ToInt(gDetalle.Cells[3,1]);
      q.ParamByName('FechaDesde').AsInteger := ToInt(gDetalle.Cells[2,2]);
      q.ParamByName('FechaHasta').AsInteger := ToInt(gDetalle.Cells[3,2]);
      q.ParamByName('ImporteDesde').AsInteger := ToInt(gDetalle.Cells[2,3]);
      q.ParamByName('ImporteHasta').AsInteger := ToInt(gDetalle.Cells[3,3]);
      q.ParamByName('CantCodigos').AsInteger := ToInt(edCodigos.Text);
      q.ParamByName('Porcentaje').AsFloat := ToFloat(edPorcDesc.Text);
      q.ExecSQL;
      DM.ConfirmarTransaccion;
      MostrarDialogoAceptar('Datos grabados correctamente.');
      Close;
      if Assigned(FABMImpuestosYServicios) then
        FABMImpuestosYServicios.ActualizarClick(nil);
    Except
      on e: Exception do
      begin
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Ocurrio un error al grabar la Empresa de Impuestos.' + #13#10 +
                              'Detalles Técnicos: ' + e.message);
      end;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNuevoImpuesto.actBorrarExecute(Sender: TObject);
var
  q: TFXQuery;

begin
  if MostrarDialogoSino('Inmosys',
    '¿Esta seguro de elimiar el elemento seleccionado?', mtConfirmation) then
  begin
    DM.IniciarTransaccion;
    q := CrearQuery;
    try
      try
        q.Sql.Text :=
          'Delete from EmpresasImpuestos where Codigo = :Codigo';
        q.ParamByName('Codigo').AsInteger := ToInt(edtCodigo.Text);
        q.ExecSQL;
        DM.ConfirmarTransaccion;
        MostrarDialogoAceptar('Datos eliminados correctamente.');
      except
        DM.CancelarTransaccion;
        MostrarDialogoAceptar('Inmosys',
          'Ocurrio un error al eliminar el dato Fijo.', mtError);
      end;
    finally
      FreeAndNil(q);
    end;
    Close;
    if Assigned(FABMImpuestosYServicios) then
      FABMImpuestosYServicios.ActualizarClick(nil);
  end;
end;

procedure TfNuevoImpuesto.DatosKeyPress(Sender: TObject; var Key: Char);
begin
(*  q := CrearQuery;
  try
    if TWinControl(Sender).Name = 'edtCodigo' then
    begin
      if Key = #13 then
      begin
        if Length(edtCodigo.Text) = 1 then
          edtCodigo.Text := '0' + edtCodigo.Text;
        edtDescripcion.SetFocus;
        With q do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from conceptos where codigo = :Codigo');
          ParamByName('Codigo').AsString := edtCodigo.Text;
          Open;
        end;
        if not q.IsEmpty then
        begin
          MostrarDialogoAceptar(
            'Ya existe un Dato Fijo con ese Código. Verifique por favor.',
            mtInformation);
          edtCodigo.Text := '';
          edtCodigo.SetFocus;
          Exit;
        end;
        if edtCodigo.Text = '' then
          edtCodigo.SetFocus;
      end;
      if not(Key in ['0' .. '9', #8]) then
        Key := #0;
    end;

    if (TWinControl(Sender).Name = 'edtInquilinoPropietario') then
    begin
      if not(Key in ['0' .. '2', #8, #13]) then
        Key := #0;
      if Key = #13 then
      begin
        if edtInquilinoPropietario.Text = '' then
          edtInquilinoPropietario.SetFocus
        else
        begin
          cboAfecta.ItemIndex := StrToInt(edtInquilinoPropietario.Text);
          edtListadoInforme.SetFocus;
        end;
      end;
    end;

    if (TWinControl(Sender).Name = 'edtListadoInforme') then
    begin
      if not(Key in ['0' .. '3', #8, #13]) then
        Key := #0;
      if Key = #13 then
        if edtListadoInforme.Text = '' then
          edtListadoInforme.SetFocus
        else
        begin
          cboListado.ItemIndex := StrToInt(edtListadoInforme.Text);
          edtSobreDestino.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtSobreDestino') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtSobreDestino.Text = '' then
          edtSobreDestino.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtSobreDestino.Text;
          q.Open;

          cboSobre.ItemIndex := cboSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtDescuenta.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtOtroSobre') then
    begin
      if not(Key in ['0' .. '9', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtOtroSobre.Text = '' then
          edtOtroSobre.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtOtroSobre.Text;
          q.Open;

          cboOtroSobre.ItemIndex := cboOtroSobre.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          edtDescuenta.SetFocus;
        end;
    end;

    if (TWinControl(Sender).Name = 'edtDescuenta') then
    begin
      if not(Key in ['0' .. '4', #8, #13]) then
        Key := #0;

      if Key = #13 then
        if edtDescuenta.Text = '' then
          edtDescuenta.SetFocus
        else
        begin
          q.SQL.Text :=
            ' Select Descripcion from sobres where Codigo = :Codigo';
          q.ParamByName('Codigo').AsString := edtDescuenta.Text;
          q.Open;

          cboDescuenta.ItemIndex := cboDescuenta.items.indexof
            (q.FieldByName('Descripcion').AsString);

          if FOperacion = toMostrar then
            Exit;
          btnGrabar.SetFocus;
        end;
    end;
  finally
    FreeAndNil(q);
  end; *)
end;

procedure TfNuevoImpuesto.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtDescripcion.SetFocus;
end;

procedure TfNuevoImpuesto.actBorrarUpdate(Sender: TObject);
begin
  actBorrar.Enabled := (Trim(edtCodigo.Text) <> '');
end;

procedure TfNuevoImpuesto.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfNuevoImpuesto.Cargar(pCodigo: string; Operacion: TTipoOperacion);
var
  q: TFXQuery;
  Tecla: Char;
begin
  FOperacion := Operacion;
  if Operacion = toNuevo then
  begin
    edtCodigo.Text := IntToStr(fxObtenerCodigo('EmpresasImpuestos'));
    edtCodigo.Enabled := False;
    edtDescripcion.Text := '';

    gDetalle.Cells[0,1] := 'Identificación';
    gDetalle.Cells[0,2] := 'Fecha';
    gDetalle.Cells[0,3] := 'Importe';

    gDetalle.Cells[2,1] := '0';
    gDetalle.Cells[2,2] := '0';
    gDetalle.Cells[2,3] := '0';
    gDetalle.Cells[3,1] := '0';
    gDetalle.Cells[3,2] := '0';
    gDetalle.Cells[3,3] := '0';
    gDetalle.Col := 1;
    gDetalle.Row := 1;
    gDetalle.Colors[1,2] := clBtnFace;
    gDetalle.Colors[1,3] := clBtnFace;
  end;

  if (Operacion in [toNuevo, toModificar]) then
    edtDescripcion.SetFocus;

  if (Operacion in [toModificar, toEliminar]) then
  begin
    q := CrearQuery;
    try
      q.SQL.Text := 'Select E.*, C.Descripcion as Concepto from EmpresasImpuestos E Inner Join Conceptos C on C.codigo=E.Identificacion where E.Codigo=:Codigo';
      q.ParamByName('Codigo').AsString := pCodigo;
      q.Open;

      gDetalle.Cells[1,1] := q.FieldbyName('Concepto').AsString;
      gDetalle.Cells[2,1] := q.FieldbyName('IdentificacionDesde').AsString;
      gDetalle.Cells[3,1] := q.FieldbyName('IdentificacionHasta').AsString;
      gDetalle.Cells[2,2] := q.FieldbyName('FechaDesde').AsString;
      gDetalle.Cells[3,2] := q.FieldbyName('FechaHasta').AsString;
      gDetalle.Cells[2,3] := q.FieldbyName('ImporteDesde').AsString;
      gDetalle.Cells[3,3] := q.FieldbyName('ImporteHasta').AsString;
      edtCodigo.Text := q.FieldByName('Codigo').AsString;
      edCodigos.Text := q.FieldByName('CantCodigos').AsString;
      edtDescripcion.Text := q.FieldByName('Descripcion').AsString;
      edDatoFijo.Text := q.FieldByName('Identificacion').AsString;
      edPorcDesc.Text := FormatFloat('0.00', q.FieldByName('PorcentajeRecargo').AsFloat);
      Tecla := #13;
      edDatoFijoKeyPress(nil, Tecla);
    finally
      FreeAndNil(q);
    end;
  end;
  btnGrabar.Visible := (Operacion in [toNuevo, toModificar]);

  edtDescripcion.SetFocus;

  if (Operacion in [toNuevo, toModificar]) then
    gDetalle.Options := gDetalle.Options + [goediting]
  else
    gDetalle.Options := gDetalle.Options - [goediting];

  if Operacion = toEliminar then
  begin
    actBorrar.Execute;
    Close;
    if Assigned(FABMImpuestosYServicios) then
      FABMImpuestosYServicios.ActualizarClick(nil);
  end;
end;

procedure TfNuevoImpuesto.edDatoFijoKeyPress(Sender: TObject; var Key: Char);
var
  q: TFXQuery;
begin
 if not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;

  q := CrearQuery;
  try
    if Key = #13 then
    begin
      q.SQL.Text :=
        ' Select Descripcion '+
        '   From Conceptos '+
        '  Where Codigo = :Codigo';
      q.ParambyName('Codigo').AsString := edDatoFijo.Text;
      q.Open;

      edDescripcionDatoFijo.Text := q.FieldbyName('Descripcion').AsString;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfNuevoImpuesto.edPorcDescExit(Sender: TObject);
begin
  edPorcDesc.Text := FormatFloat('0.00', ToFloat(edPorcDesc.Text));
end;

procedure TfNuevoImpuesto.edPorcDescKeyPress(Sender: TObject; var Key: Char);
begin
 if not (CharInSet(Key, ['0'..'9', #8, #13])) then
    Key := #0;
end;

end.



