unit frmConfirmacionRecibos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, DBTables, Db, Grids, DBGrids, DBCtrls,
  ComCtrls, Mask, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL, IBTable,
  ActnList, ImgList, ToolWin, Funciones, Declaraciones, sqlExpr, Numedit, Aligrid,
  System.Actions, FXQuery, AdvGlowButton, dbClient;

type
  TfConfirmacionRecibos = class(TForm)
    aclActionList: TActionList;
    actNuevo: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actBorrar: TAction;
    ImageList1: TImageList;
    actCerrar: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    NumEdit1: TNumEdit;
    NumEdit2: TNumEdit;
    gPendiente: TStringAlignGrid;
    Label4: TLabel;
    cbTipo: TComboBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    chPasarACaja: TCheckBox;
    chPendienteRetirar: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actGrabarExecute(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NumEdit1Exit(Sender: TObject);
    procedure NumEdit2Exit(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure cbTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    fCodinq: string;
    fGrilla: TStringAlignGrid;
    EsLiquidacion: Boolean;
    EsComisiones: Boolean;
    EsDevolucion: Boolean;
    ClaveAnomalia: Boolean;
    cdsAnomalias: TClientDataSet;
    class procedure Ejecutar;
  end;

var
  fConfirmacionRecibos: TfConfirmacionRecibos;
  fGeneracionNumeroRecibo: TfConfirmacionRecibos;

implementation

uses frmdatos, frmprincipal, frmRecibosPendientes, frmListadoCobrados;

{$R *.DFM}



procedure TfConfirmacionRecibos.cbTipoClick(Sender: TObject);
begin
  if cbTipo.ItemIndex = 0 then
  begin
    Combobox1.Items.Clear;
    Combobox1.Items.Add('X');
    Combobox1.Items.Add('B');
    Combobox1.Items.Add('D');
    chPendienteRetirar.Visible := False;
    chPasarACaja.Visible := True;
  end
  else
  begin
    Combobox1.Items.Clear;
    Combobox1.Items.Add('A');
    Combobox1.Items.Add('T');
    Combobox1.Items.Add('P');
    chPendienteRetirar.Visible := True;
    chPasarACaja.Visible := True;
  end;
end;

procedure TfConfirmacionRecibos.ComboBox1Click(Sender: TObject);
begin
//  if (Combobox1.Text = 'D') or (Combobox1.Text = 'T') or (Combobox1.Text = 'P') then
  begin
    NumEdit1.Text := FormatFloat('0000', ToFloat(FCodinq));

    if cbTipo.Text = 'Recibo' then
      NumEdit2.Text := FormatFloat('00000000', fxObtenerProximoNumero(ToFloat(FCodinq), Combobox1.Text, 'RE'))
    else if cbTipo.Text = 'Liquidación' then
      NumEdit2.Text := FormatFloat('00000000', fxObtenerProximoNumero(ToFloat(FCodinq), Combobox1.Text, 'LI'));
  end;
end;

procedure TfConfirmacionRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Self = fConfirmacionRecibos then
    fConfirmacionRecibos := nil;
  if Self = fGeneracionNumeroRecibo then
  fGeneracionNumeroRecibo := nil;
end;

procedure TfConfirmacionRecibos.FormCreate(Sender: TObject);
begin
  ClaveAnomalia:= False;
  if Self = fGeneracionNumeroRecibo then
  begin
    FormStyle := fsNormal;
    Hide;
  end;

end;

procedure TfConfirmacionRecibos.FormShow(Sender: TObject);
begin
  fPrincipal.Center(Self);
end;

procedure TfConfirmacionRecibos.NumEdit1Exit(Sender: TObject);
begin
  try
    NumEdit1.Text := FormatFloat('0000', ToFloat(Numedit1.Text));
  Except
    NumEdit1.Text := '0001';
  end;

end;

procedure TfConfirmacionRecibos.NumEdit2Exit(Sender: TObject);
begin
  try
    NumEdit2.Text := FormatFloat('00000000', ToFloat(Numedit2.Text));
  Except
    NumEdit1.Text := '00000000';
  end;
end;

procedure TfConfirmacionRecibos.actGrabarExecute(Sender: TObject);
var
  q, qVale, qPrelegales: TFXQuery;
  I, J: Integer;
  EsDebe: Boolean;
  boEncontro: Boolean;
  stTipo: string;
begin
  if Length(Numedit1.Text) > 4 then
  begin
    MostrarDialogoAceptar('El código de propiedad no puede tener más de 4 dígitos.');
    Exit;
  end;
  if Length(Numedit2.Text) > 8 then
  begin
    MostrarDialogoAceptar('El número de comprobante no puede tener más de 8 dígitos.');
    Exit;
  end;
  if Trim(cbTipo.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe seleccionar el tipo');
    Exit;
  end;
  if Trim(Combobox1.Text) = '' then
  begin
    MostrarDialogoAceptar('Debe seleccionar la letra');
    Exit;
  end;
  q := CrearQuery;
  qVale := CrearQuery;

  q.SQL.Text := ' Select * from Cabezarecibos where TIPO =:tipo and letra = :Letra and Numero=:Numero';

  if cbTipo.ItemIndex = 0 then
    q.ParamByName('Tipo').AsString := 'RE'
  else if cbTipo.ItemIndex = 1 then
    q.ParamByName('Tipo').AsString := 'LI'
  else if cbTipo.ItemIndex = 2 then
    q.ParamByName('Tipo').AsString := 'FA';
  q.ParamByName('Letra').AsString := Combobox1.Text;
  q.ParamByName('Numero').AsFloat := ToFloat(NumEdit1.Text + Numedit2.Text);
  q.Open;

  if not q.IsEmpty then
  begin
    if cbTipo.ItemIndex = 1 then
      MostrarDialogoAceptar('La Liquidacion ya se encuentra registrada. Deberá pasar los importes manualmente a caja.');
    if cbTipo.ItemIndex = 2 then
      MostrarDialogoAceptar('La Factura ya se encuentra registrada. Deberá pasar los importes manualmente a caja.');
    if cbTipo.ItemIndex = 0 then
      MostrarDialogoAceptar('El Recibo ya se encuentra registrado. Deberá pasar los importes manualmente a caja.');

    Exit;
  end;

  try
    if not EsComisiones then
    begin
      if cbTipo.ItemIndex = 0 then
      begin
        if MostrarDialogoSiNo('¿Confirma el recibo?', mbYes) then
        begin
          DM.IniciarTransaccion;
          try
            insertarcabezarecibo(FCodinq, 'Now', 'RE', Combobox1.Text, NumEdit1.Text + Numedit2.Text, '1', BoolToInt(chPendienteRetirar.Checked),BoolToInt(ClaveAnomalia));
            if ClaveAnomalia then
            begin
              cdsAnomalias.First;
              while not cdsAnomalias.eof do
              begin
                InsertarAnomalia(FCodinq,
                                 'Now',
                                 'RE',
                                 Combobox1.Text,
                                 NumEdit1.Text + Numedit2.Text,
                                 cdsAnomalias.FieldByName('Descripcion').AsString);
                cdsAnomalias.Next;
              end;
            end;

            for I := 1 to fGrilla.RowCount - 1 do
            begin
               if EsDevolucion then
                 InsertarCuerpoRecibo(fGrilla.Cells[0,I],
                  fGrilla.Cells[2,I],
                  'RE',
                  Combobox1.Text,
                  NumEdit1.Text + Numedit2.Text,
                  INttostr(I),
                  fGrilla.Cells[1,I],
                  fGrilla.Cells[3,I],
                  fGrilla.Cells[4,I],
                  fGrilla.Cells[5,I],
                  fGrilla.Cells[6,I],
                  '-' + fGrilla.Cells[7,I],
                  fGrilla.Cells[8,I],
                  fGrilla.Cells[9,I],
                  fGrilla.Cells[10,I],
                  fGrilla.Cells[11,I],
                  fGrilla.Cells[12,I],
                  ToInt(fGrilla.Cells[13,I]))
               else
                 InsertarCuerpoRecibo(fGrilla.Cells[0,I],
                  fGrilla.Cells[2,I],
                  'RE',
                  Combobox1.Text,
                  NumEdit1.Text + Numedit2.Text,
                  INttostr(I),
                  fGrilla.Cells[1,I],
                  fGrilla.Cells[3,I],
                  fGrilla.Cells[4,I],
                  fGrilla.Cells[5,I],
                  fGrilla.Cells[6,I],
                  fGrilla.Cells[7,I],
                  fGrilla.Cells[8,I],
                  fGrilla.Cells[9,I],
                  fGrilla.Cells[10,I],
                  fGrilla.Cells[11,I],
                  fGrilla.Cells[12,I],
                  ToInt(fGrilla.Cells[13,I]));

                if fGrilla.Cells[10,I] = '09' then
                begin
                  InsertarImpuestos(fGrilla.Cells[0,I],
                    fGrilla.Cells[2,I],
                    'RE',
                    Combobox1.Text,
                    NumEdit1.Text + Numedit2.Text,
                    fGrilla.Cells[5,I],
                    fGrilla.Cells[6,I],
                    fGrilla.Cells[7,I],
                    ToInt(fGrilla.Cells[13,I]));
                end;
             end;
             DM.ConfirmarTransaccion;
             MostrarDialogoAceptar('Se registro con éxito el recibo: ' + Combobox1.text + ' ' + NumEdit1.Text + '-' + Numedit2.TexT);
             Close;
          except
            DM.CancelarTransaccion;
          end;
        end;
      end;

        if cbTipo.ItemIndex = 1 then
        begin
          for I := 1 to fGrilla.RowCount - 1 do
            for J := 0 to fGrilla.ColCount - 1 do
              gPendiente.Cells[J,I] := fGrilla.Cells[J,I];

          gPendiente.RowCount := fGrilla.RowCount;

          if MostrarDialogoSiNo('¿Confirma la Liquidación?', mbYes) then
          begin
            DM.IniciarTransaccion;
            try
              insertarcabezarecibo(FCodinq, 'Now', 'LI', Combobox1.Text, NumEdit1.Text + Numedit2.Text, '1', BoolToInt(chPendienteRetirar.Checked),BoolToInt(ClaveAnomalia));

              if ClaveAnomalia then
              begin
                cdsAnomalias.First;
                while not cdsAnomalias.eof do
                begin
                  InsertarAnomalia(FCodinq,
                                   'Now',
                                   'LI',
                                   Combobox1.Text,
                                   NumEdit1.Text + Numedit2.Text,
                                   cdsAnomalias.FieldByName('Descripcion').AsString);
                  cdsAnomalias.Next;
                end;
              end;

              for I := 1 to fGrilla.RowCount - 1 do
              begin
                if fGrilla.Cells[7,I] = '' then
                  Continue;
                if fGrilla.Cells[3,I] = '' then
                  Continue;
    //            if fGrilla.Cells[7,I] = '0.00' then
    //              Continue;

                if ToFloat(fGrilla.Cells[7,I]) < 0 then
                  EsDebe := True
                else
                  EsDebe := False;

                InsertarCuerpoRecibo(fGrilla.Cells[0,I],
                  fGrilla.Cells[2,I],
                  'LI',
                  Combobox1.Text,
                  NumEdit1.Text + Numedit2.Text,
                  INttostr(I),
                  fGrilla.Cells[1,I],
                  fGrilla.Cells[3,I],
                  fGrilla.Cells[4,I],
                  fGrilla.Cells[5,I],
                  fGrilla.Cells[6,I],
                  fGrilla.Cells[7,I],
                  fGrilla.Cells[8,I],
                  fGrilla.Cells[9,I],
                  fGrilla.Cells[4,I],
                  '',
                  fGrilla.Cells[12,I],
                  ToInt(fGrilla.Cells[13,I]));

                  if fGrilla.Cells[4,I] = '27' then
                  begin
                    InsertarImpuestos(fGrilla.Cells[0,I],
                      fGrilla.Cells[2,I],
                      'LI',
                      Combobox1.Text,
                      NumEdit1.Text + Numedit2.Text,
                      fGrilla.Cells[5,I],
                      fGrilla.Cells[6,I],
                      fGrilla.Cells[7,I],
                      ToInt(fGrilla.Cells[13,I]));
                  end;
              end;
              DM.ConfirmarTransaccion;
              MostrarDialogoAceptar('Se registro con éxito la Liquidación: ' + Combobox1.text + ' ' + NumEdit1.Text + '-' + Numedit2.TexT);
              Close;
            except
              DM.CancelarTransaccion;
            end;
          end;
        end;

        if cbTipo.ItemIndex = 2 then
        begin
          if MostrarDialogoSiNo('¿Confirma la Factura?', mbYes) then
          begin
            DM.IniciarTransaccion;
            try
              insertarcabezarecibo(FCodinq, 'Now', 'FA', Combobox1.Text, NumEdit1.Text + Numedit2.Text, '1', BoolToInt(chPendienteRetirar.Checked),BoolToInt(ClaveAnomalia));
              for I := 1 to fGrilla.RowCount - 1 do
              begin
                 InsertarCuerpoRecibo(FCodinq,
                    fGrilla.Cells[2,I],
                    'FA',
                    Combobox1.Text,
                    NumEdit1.Text + Numedit2.Text,
                    INttostr(I),
                    fGrilla.Cells[1,I],
                    fGrilla.Cells[3,I],
                    fGrilla.Cells[4,I],
                    fGrilla.Cells[5,I],
                    fGrilla.Cells[6,I],
                    fGrilla.Cells[7,I],
                    fGrilla.Cells[8,I],
                    fGrilla.Cells[9,I],
                    fGrilla.Cells[10,I],
                    fGrilla.Cells[11,I],
                    fGrilla.Cells[12,I],
                    ToInt(fGrilla.Cells[12,I]));

                  if fGrilla.Cells[10,I] = '09' then
                  begin
                    InsertarImpuestos(fGrilla.Cells[0,I],
                      fGrilla.Cells[2,I],
                      'FA',
                      Combobox1.Text,
                      NumEdit1.Text + Numedit2.Text,
                      fGrilla.Cells[5,I],
                      fGrilla.Cells[6,I],
                      fGrilla.Cells[7,I],
                      ToInt(fGrilla.Cells[13,I]));
                  end;
                end;
              DM.ConfirmarTransaccion;
              MostrarDialogoAceptar('Se registro con éxito la Factura: ' + Combobox1.text + ' ' + NumEdit1.Text + '-' + Numedit2.TexT);
              Close;
            except
              DM.CancelarTransaccion;
            end;
          end;
        end;
      end;
      finally
        FreeAndNil(q);
      end;

      if chPasarACaja.Checked then
      begin
        if Assigned(fRecibosPendientes) then
          FreeAndNil(fRecibosPendientes);

        if fRecibosPendientes = nil then
          Application.CreateForm(TfRecibosPendientes, fRecibosPendientes)
        else
          fRecibosPendientes.Show;
        fRecibosPendientes.FSoloPendientes := False;
        fRecibosPendientes.Label5.Visible := True;
        fRecibosPendientes.Label2.Visible := True;
        fRecibosPendientes.cbTipo.Visible := True;
        fRecibosPendientes.cbLetra.Visible := True;

        fRecibosPendientes.ActualizarClick(nil);
        boEncontro := False;
        for I := 1 to fRecibosPendientes.gDetalle.RowCount - 1 do
        begin
          if cbTipo.ItemIndex = 0 then
            stTipo := 'RE'
          else
            stTipo := 'LI';

          if (fRecibosPendientes.gDetalle.Cells[3, I] = stTipo) and
             (fRecibosPendientes.gDetalle.Cells[4, I] = Combobox1.Text) and
             (fRecibosPendientes.gDetalle.Cells[5, I] = Numedit1.Text + '-' + Numedit2.Text) then
          begin
            fRecibosPendientes.gDetalle.ColorRow[I] := clYellow;
            boEncontro := True;
            Break;
          end;
        end;
        if boEncontro then
          fRecibosPendientes.btnImprimirClick(nil);
        fRecibosPendientes.Close;
        if boEncontro then
        begin
          qPrelegales := CrearQuery;
          try
            qPrelegales.Sql.Text :=
              ' Select Prelegales ' +
              '   from Inmuebles' +
              '  where Codinq = :Codinq';
            qPrelegales.ParambyName('Codinq').AsString := FCodinq;
            qPrelegales.Open;

            if qPrelegales.FieldbyName('Prelegales').AsInteger = 1 then
            begin
              if fListadoCobrados = nil then
                Application.CreateForm(TfListadoCobrados, fListadoCobrados)
              else
                fListadoCobrados.Show;
              fListadoCobrados.boMostrarMensaje := False;
              fListadoCobrados.TodosCodigos.Checked := False;
              fListadoCobrados.edDesde.Text := FCodinq;
              fListadoCobrados.edHasta.Text := FCodinq;
              fListadoCobrados.edFechaDesde.Text := '01/01/2020';
              fListadoCobrados.edFechaHasta.Text := FormatDatetime('dd/mm/yyyy', Date);
              fListadoCobrados.Checkbox1.Checked := False;
              fListadoCobrados.ActualizarClick(nil);
              if fListadoCobrados.gDeuda.Cells[8, 1] = '' then
              begin
                DM.IniciarTransaccion;
                try
                  qPrelegales.Sql.Text :=
                    ' Update Inmuebles set Prelegales = 0' +
                    '  Where Codinq = :Codinq ';
                  qPrelegales.ParambyName('Codinq').AsString := FCodinq;
                  qPrelegales.ExecSql;
                  DM.ConfirmarTransaccion;
                except
                  DM.CancelarTransaccion;
                end;
              end;
//              fListadoCobrados.Close;
            end;

          finally
            qPrelegales.Free;
          end;
        end;

      end;
end;



class procedure TfConfirmacionRecibos.Ejecutar;
begin
end;

procedure TfConfirmacionRecibos.btnCerrarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfConfirmacionRecibos.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
