unit frmNuevaTareaGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Grids, ALIGRID,
  StdCtrls, DB, DBtables, DBCtrls, ExtCtrls, Buttons, Menus, ComCtrls, StrUtils,
  Funciones,
  //*flxComboUtils,
  frmDatos, frmGestionEmail, SQLExpr;

type
  TfNuevaTareaGestion = class(TForm)
    pmReglas: TPopupMenu;
    Eliminartarea1: TMenuItem;
    pcTareas: TPageControl;
    tabGeneral: TTabSheet;
    lbNombre: TLabel;
    Label2: TLabel;
    edNombre: TEdit;
    mDescripcion: TMemo;
    gpReglas: TGroupBox;
    Label3: TLabel;
    lbCondicion: TLabel;
    lbValor: TLabel;
    Label4: TLabel;
    gReglas: TStringAlignGrid;
    cbCondicion: TComboBox;
    edValor: TEdit;
    cbNexo: TComboBox;
    btAgregar: TBitBtn;
    tabConfigEmail: TTabSheet;
    pnAcciones: TPanel;
    Label6: TLabel;
    Label1: TLabel;
    btAgregarVariable: TBitBtn;
    Label5: TLabel;
    Label7: TLabel;
    edNombreRemitente: TEdit;
    edAsuntoEmail: TEdit;
    reCuerpo: TMemo;
    lbVariablePreview: TLabel;
    cbVariables: TComboBox;
    cbCampos: TComboBox;
    btSalir: TBitBtn;
    btGrabar: TBitBtn;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure prInicializar;

    procedure btAgregarClick(Sender: TObject);
    procedure btGrabarClick(Sender: TObject);
    procedure Eliminartarea1Click(Sender: TObject);
    procedure btAgregarVariableClick(Sender: TObject);
    procedure SetPreview(Sender: TObject);
    procedure cbVariablesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    procedure prCargarComboCampos;
    procedure prGrabarNuevaTarea;
    procedure prActualizarTarea;
    procedure prGrabarCondiciones(nIDTarea: Integer);
    function  fxValidarRequeridos: Boolean;
  public
    FIDPlantilla, FIDTarea: integer;
    Modo: TModo;
    Proceso: TProcesosMail;
    Transaccion: TTransactionDesc;

    procedure prCargarTarea(pniCodigoWF: Integer);
  end;

var
  fNuevaTareaGestion: TfNuevaTareaGestion;

implementation

{$R *.dfm}

  uses frmPrincipal;

const
  niColCampo           = 0;
  niColCondicion       = 1;
  niColValor           = 2;
  niColNexo            = 3;
  niColCodigoCampo     = 4;

procedure TfNuevaTareaGestion.btAgregarClick(Sender: TObject);
var
  I: Integer;
  boError: Boolean;
  d: TfieldType;
begin
  if (cbCampos.ItemIndex = null) or (Trim(edValor.Text) = '') then
    Exit;

  boError := False;
  d := fGestionEmail.CDS.Fields.Fields[cbCampos.ItemIndex].DataType;
  case d of
    ftInteger, ftLargeInt:
    begin
      try
        StrToInt64(edValor.Text);
      except
        MostrarDialogoAceptar('El valor ingresado debe ser un número entero. Verifique por favor.');
        boError := True;
      end;
    end;
    ftFloat, ftCurrency, ftSingle:
    begin
      try
        edValor.Text := AnsiReplaceStr(edValor.Text, '.', DecimalSeparator);
        StrToFloat(edValor.Text);
      except
        MostrarDialogoAceptar('El valor ingresado debe ser un número. Verifique por favor.');
        boError := True;
      end;
    end;
    ftDate, ftDateTime:
    begin
      try
        StrToDateTime(edValor.Text);
      except
        MostrarDialogoAceptar('El valor ingresado debe ser una fecha válida. Ej: 10/05/1989. Verifique por favor.');
        boError := True;
      end;
    end;
  end;

  if boError then
  begin
    edValor.SetFocus;
    edValor.SelectAll;
    Exit;
  end;

  if gReglas.Cells[niColCampo, 1] <> '' then
    gReglas.RowCount := gReglas.RowCount + 1;

  for I := 1 to gReglas.RowCount - 1 do
    if gReglas.Cells[niColCampo, I] = '' then
    begin
      gReglas.Cells[niColCampo, I]       := cbCampos.Text;
      gReglas.Cells[niColCondicion, I]   := cbCondicion.Text;
      gReglas.Cells[niColValor, I]       := edValor.Text;
      gReglas.Cells[niColNexo, I]        := cbNexo.Text;
      gReglas.Cells[niColCodigoCampo, I] := IntToStr(cbCampos.ItemIndex);
    end;

  cbCampos.ItemIndex := -1;
  cbCondicion.ItemIndex := -1;
  edValor.Text := '';
end;

procedure TfNuevaTareaGestion.btAgregarVariableClick(Sender: TObject);
var
  niLargoTexto, niNumeroLinea: Integer;
begin
  if (cbVariables.ItemIndex = -1) or (Trim(cbVariables.Text) = '') then
    Exit;

  //obtengo la linea en la que esta el cursor para despues sumarsela al copy dado que pierde una posición por linea nueva
  niNumeroLinea := SendMessage(reCuerpo.Handle, EM_LINEFROMCHAR, reCuerpo.SelStart, 0);
  niLargoTexto := Length(Copy(reCuerpo.Text, 1, reCuerpo.SelStart));

  reCuerpo.Text :=
  // Copio el texto antes de la ubicación del cursor
    Copy(reCuerpo.Text, 1, reCuerpo.SelStart + niNumeroLinea) +
  // agrego el texto de la variable
    lbVariablePreview.Caption +
  // agrego lo que estaba despues del cursor
    Copy(reCuerpo.Text, reCuerpo.SelStart + reCuerpo.SelLength  + niNumeroLinea + 1, length(reCuerpo.Text));

  // borro la selección
  reCuerpo.SelLength := 0;
  // seteo el cursor despues del texto insertado
  reCuerpo.SelStart := niLargoTexto + Length(lbVariablePreview.Caption) + 1;
  reCuerpo.SelLength := Length(lbVariablePreview.Caption) + 1;

  reCuerpo.SetFocus;
end;

procedure TfNuevaTareaGestion.btGrabarClick(Sender: TObject);
begin
  if not fxValidarRequeridos then
    Exit;

  if Modo = mNUEVO then
    prGrabarNuevaTarea
  else if Modo = mMODIFICACION then
    prActualizarTarea;

  Close;
end;

procedure TfNuevaTareaGestion.SetPreview(Sender: TObject);
var s:string;
    i:integer;
begin
  s := Trim(cbVariables.Text);
  if (cbVariables.ItemIndex = -1) or (s = '') then
  begin
    lbVariablePreview.Visible := False;
    Exit;
  end;

  with fGestionEmail.CDS do
  begin
    for i := 0 to Fields.Count -1 do
    begin
       if Fields.Fields[i].DisplayLabel = s then
       begin
          s := Fields.Fields[i].FieldName;
          break;
       end;
    end;
  end;

  lbVariablePreview.Visible := True;
  lbVariablePreview.Caption := '[' + s + ']';
end;

procedure TfNuevaTareaGestion.cbVariablesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SetPreview( Sender );
end;

procedure TfNuevaTareaGestion.Eliminartarea1Click(Sender: TObject);
begin
  if gReglas.Cells[0, gReglas.Row] <> '' then
    if gReglas.RowCount = 2 then
      gReglas.Limpiar
    else
      gReglas.RemoveRow(gReglas.Row);
end;

procedure TfNuevaTareaGestion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  fNuevaTareaGestion:=nil;
end;

procedure TfNuevaTareaGestion.FormCreate(Sender: TObject);
begin
  prInicializar;
end;

procedure TfNuevaTareaGestion.FormShow(Sender: TObject);
begin
  fPrincipal.Center(fNuevaTareaGestion);
  pcTareas.ActivePage := tabGeneral;
  edNombre.SetFocus;
end;

procedure TfNuevaTareaGestion.prCargarTarea(pniCodigoWF: Integer);
var
  qTarea: TSQLQuery;
  I: Integer;
begin
  qTarea := CrearQuery;
  FIDPlantilla            := 0;
  FIDTarea                := 0;
  try
    qTarea.SQL.Text :=
      ' Select WF.IDWorkFlow, WF.Nombre, WF.Descripcion, C.operador, C.valor, C.nexo, C.IdCampo, ' +
      '        P.IDPlantilla, P.AsuntoEmail, P.RemitenteEmail, P.Cuerpomail ' +
      '   From WorkFlow WF ' +
      '  Inner Join CondicionesWF C On C.IDWorkFlow = WF.IDWorkFlow ' +
      '  Inner Join PlantillasMailWF P On P.IDWorkFlow = WF.IDWorkFlow ' +
      '  Where WF.IdWorkFlow = :pniIDWF ';

    qTarea.ParamByName('pniIDWF').AsInteger := pniCodigoWF;
    qTarea.Open;

    if not qTarea.IsEmpty then
    begin
      edNombre.Text           := qTarea.FieldByName('Nombre').AsString;
      mDescripcion.Lines.Text := qTarea.FieldByName('Descripcion').AsString;

      FIDPlantilla            := qTarea.FieldByName('IDPlantilla').AsInteger;
      FIDTarea                := qTarea.FieldByName('IDWorkFlow').AsInteger;

      edAsuntoEmail.Text      := qTarea.FieldByName('AsuntoEmail').AsString;
      edNombreRemitente.Text  := qTarea.FieldByName('RemitenteEmail').AsString;
      reCuerpo.Lines.Text     := qTarea.FieldByName('Cuerpomail').AsString;
    end;

    While not qTarea.Eof do
    begin
      cbCampos.ItemIndex  := qTarea.FieldByName('IdCampo').AsInteger;

      for I := 0 to cbCondicion.Items.Count - 1 do
        if cbCondicion.Items[I] = qTarea.FieldByName('Operador').AsString then
          cbCondicion.ItemIndex := I;

      edValor.Text := qTarea.FieldByName('Valor').AsString;

      if qTarea.FieldByName('Nexo').AsString = 'And' then
      begin
        for I := 0 to cbNexo.Items.Count - 1 do
          if cbNexo.Items[I] = 'Y' then
            cbNexo.ItemIndex := I;
      end
      else if qTarea.FieldByName('Nexo').AsString = 'Or' then
      begin
        for I := 0 to cbNexo.Items.Count - 1 do
          if cbNexo.Items[I] = 'O' then
            cbNexo.ItemIndex := I;
      end;
      btAgregarClick(nil);
      qTarea.Next;
    end;
  finally
    qTarea.Free;
  end;
end;

procedure TfNuevaTareaGestion.prGrabarCondiciones(nIDTarea: Integer);
var
  qReglas: TSQLQuery;
  I: Integer;
begin
  qReglas := CrearQuery;
  try
      qReglas.SQL.Text :=
        ' Insert Into CondicionesWF (IdWorkFlow , IDPLANTILLA , IDCampo , Operador , Valor , Nexo , FechaModificacion)' +
        '                    Values (:IdWorkFlow, :IDPLANTILLA, :IDCampo, :Operador, :Valor, :Nexo, current_timestamp) ';

      for I := 1 to gReglas.RowCount -1 do
      begin
        qReglas.ParamByName('IdWorkFlow').AsInteger  := nIDTarea;
        qReglas.ParamByName('IDPLANTILLA').AsInteger := FIDPlantilla;
        qReglas.ParamByName('IDCampo').AsInteger     := StrToInt(gReglas.Cells[niColCodigoCampo, I]);
        qReglas.ParamByName('Operador').AsString     := gReglas.Cells[niColCondicion, I];
        qReglas.ParamByName('Valor').AsString        := gReglas.Cells[niColValor, I];

        if gReglas.Cells[niColNexo, I] = 'Y' then
          qReglas.ParamByName('Nexo').AsString := 'And'
        else if gReglas.Cells[niColNexo, I] = 'O' then
          qReglas.ParamByName('Nexo').AsString := 'Or';

        qReglas.ExecSQL;
      end;
  finally
     qReglas.Free;
  end;
end;

procedure TfNuevaTareaGestion.prGrabarNuevaTarea;
var
  qNuevaTarea, qNuevaPlantilla: TSQLQuery;

begin
  qNuevaTarea      := CrearQuery;
  qNuevaPlantilla  := CrearQuery;
  if DM.Conexion.InTransaction then
    DM.Conexion.Rollback(Transaccion);
  DM.Conexion.StartTransaction(Transaccion);
  try
    try
      qNuevaTarea.SQL.Text := 'SELECT GEN_ID(GEN_WORKFLOW_ID, 1) AS ID FROM RDB$DATABASE';
      qNuevaTarea.Open;
      FIDTarea := qNuevaTarea.FieldByName('ID').AsInteger;
      qNuevaTarea.close;

      qNuevaTarea.SQL.Text := 'SELECT GEN_ID(GEN_PLANTILLASMAILWF_ID, 1) AS ID FROM RDB$DATABASE';
      qNuevaTarea.Open;
      FIDPlantilla := qNuevaTarea.FieldByName('ID').AsInteger;
      qNuevaTarea.close;

      qNuevaTarea.SQL.Text :=
        'Insert Into WorkFlow (IDWorkFlow , Nombre ,  IDModuloWF, Descripcion , FechaModificacion)' +
                     ' Values (:IDWorkFlow, :Nombre, :IDModuloWF, :Descripcion, current_timestamp)';
      qNuevaTarea.ParamByName('IDWorkFlow').AsInteger  := FIDTarea;
      qNuevaTarea.ParamByName('Nombre').AsString       := edNombre.Text;
      qNuevaTarea.ParamByName('IDModuloWF').AsInteger  := ord(Proceso);
      qNuevaTarea.ParamByName('Descripcion').AsString  := mDescripcion.Lines.Text;
      qNuevaTarea.ExecSQL;

      qNuevaPlantilla.SQL.Text :=
        ' Insert Into PlantillasMailWF (IDWORKFLOW , IDPlantilla , AsuntoEmail , RemitenteEmail , Cuerpomail, FechaModificacion)' +
                              ' Values (:IDWORKFLOW, :IDPlantilla, :AsuntoEmail, :RemitenteEmail, :Cuerpomail, current_timestamp) ';

      qNuevaPlantilla.ParamByName('IDWORKFLOW').AsInteger     := FIDTarea;
      qNuevaPlantilla.ParamByName('IDPlantilla').AsInteger    := FIDPlantilla;
      qNuevaPlantilla.ParamByName('AsuntoEmail').AsString     := edAsuntoEmail.Text;
      qNuevaPlantilla.ParamByName('RemitenteEmail').AsString  := edNombreRemitente.Text;
      qNuevaPlantilla.ParamByName('Cuerpomail').AsString      := reCuerpo.Lines.Text;
      qNuevaPlantilla.ExecSQL;

      prGrabarCondiciones(FIDTarea);

      DM.Conexion.Commit(Transaccion);
    except
      On E: Exception do
      begin
        DM.Conexion.Rollback(Transaccion);
        MostrarDialogoAceptar('Ocurrio un error al grabar la tarea. Datos Técnicos: ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(qNuevaTarea);
    FreeAndNil(qNuevaPlantilla);
  end;
end;

procedure TfNuevaTareaGestion.prActualizarTarea;
var
  qActualizarTarea, qReglas, qActualizarPlantilla: TSQLQuery;
begin
  qReglas := CrearQuery;
  qActualizarTarea := CrearQuery;
  qActualizarPlantilla := CrearQuery;

  if DM.Conexion.InTransaction then
    DM.Conexion.Rollback(Transaccion);
  DM.Conexion.StartTransaction(Transaccion);
  try
    try
      qActualizarTarea.SQL.Text :=
        ' Update WorkFlow ' +
        '    Set Nombre            = :Nombre, ' +
        '        Descripcion       = :Descripcion, ' +
        '        FechaModificacion = current_timestamp ' +
        '  Where IDWorkFlow      = :IDWorkFlow ';

      qActualizarTarea.ParamByName('IdWorkFlow').AsInteger  := FIDTarea;
      qActualizarTarea.ParamByName('Nombre').AsString       := edNombre.Text;
      qActualizarTarea.ParamByName('Descripcion').AsString  := mDescripcion.Lines.Text;
      qActualizarTarea.ExecSQL;

      qActualizarPlantilla.SQL.Text :=
        ' Update PlantillasMailWF ' +
        '    Set IDWorkFlow         = :IDWorkFlow, ' +
        '        AsuntoEmail        = :AsuntoEmail, ' +
        '        RemitenteEmail     = :RemitenteEmail, ' +
        '        CuerpoMail         = :CuerpoMail, ' +
        '        FechaModificacion  = current_timestamp ' +
         '  Where IDPlantilla      = :IDPlantilla ';
      qActualizarPlantilla.ParamByName('AsuntoEmail').AsString     := edAsuntoEmail.Text;
      qActualizarPlantilla.ParamByName('RemitenteEmail').AsString  := edNombreRemitente.Text;
      qActualizarPlantilla.ParamByName('CuerpoMail').AsString      := reCuerpo.Text;
      qActualizarPlantilla.ParamByName('IDWorkFlow').AsInteger     := FIDTarea;
      qActualizarPlantilla.ParamByName('IDPlantilla').AsInteger    := FIDPlantilla;
      qActualizarPlantilla.ExecSQL;

      qReglas.SQL.Text :=
        ' Delete From CondicionesWF ' +
        '  Where IDWorkFlow = :pIdWF ';
      qReglas.ParamByName('pIdWF').AsInteger := FIDTarea;
      qReglas.ExecSQL;

      prGrabarCondiciones(FIDTarea);

      DM.Conexion.Commit(Transaccion);
    except
      On E: Exception do
      begin
        DM.Conexion.Rollback(Transaccion);
        MostrarDialogoAceptar('Ocurrio un error al actualizar la tarea. Datos Técnicos: ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(qActualizarTarea);
  end;
end;

procedure TfNuevaTareaGestion.prInicializar;
begin
  prCargarComboCampos;
  gReglas.ColWidths[niColCodigoCampo] := -1;
end;

function TfNuevaTareaGestion.fxValidarRequeridos: Boolean;
begin
  Result := False;
  if Trim(edNombre.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un nombre para la tarea. Verifique por favor.');
    pcTareas.ActivePage := tabGeneral;
    edNombre.SetFocus;
    Exit;
  end;

  if Trim(mDescripcion.Lines.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar una descripción para la tarea. Verifique por favor.');
    pcTareas.ActivePage := tabGeneral;
    mDescripcion.SetFocus;
    Exit;
  end;

  if gReglas.Cells[0, 1] = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar al menos una regla para que se ejecute la tarea. Verifique por favor.');
    pcTareas.ActivePage := tabGeneral;
    cbCampos.SetFocus;
    Exit;
  end;

  if Trim(edAsuntoEmail.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un asunto para el email. Verifique por favor.');
    pcTareas.ActivePage := tabConfigEmail;
    edAsuntoEmail.SetFocus;
    Exit;
  end;

  if Trim(edNombreRemitente.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un remitente para el email. Verifique por favor.');
    pcTareas.ActivePage := tabConfigEmail;
    edNombreRemitente.SetFocus;
    Exit;
  end;

  if Trim(reCuerpo.Lines.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe ingresar un texto para el cuerpo del email. Verifique por favor.');
    pcTareas.ActivePage := tabConfigEmail;
    reCuerpo.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfNuevaTareaGestion.prCargarComboCampos;
var i: byte;
begin
  // los campos del client data set
  cbCampos.Items.Clear;
  cbVariables.Items.Clear;
  with fGestionEmail.CDS do
  begin
     for i := 0 to Fields.Count -1 do
     begin
        if Fields.Fields[i].Visible then
        begin
          cbCampos.Items.Add( Fields.Fields[i].DisplayLabel );
          cbVariables.Items.Add( Fields.Fields[i].DisplayLabel );
        end;
     end;
  end;
end;

end.
