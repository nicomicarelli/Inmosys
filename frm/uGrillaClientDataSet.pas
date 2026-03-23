unit uGrillaClientDataSet;

interface

{ Dado un TStringAlingGrid o un CxGrid, obtenermos un TClientDataSet de esa vista/grilla.
  Es muy facil adaptarlo para un dbgrid. Del CxGrid tomamos su estructura TcxGridDBTableView

  Usado por el gestor de email. Y puede ser util para otras cosas      .pr.         }

uses
  Windows, SysUtils, Classes, DB, Aligrid, StrUtils, DBClient,
  cxClasses, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, Funciones;

type
   TCampos = Array of TFieldType;
   TGrillaClientDataSet = class
   type
     TCamposGrilla = record
        titulo: string;
        nombre: string;
        tipo  : TFieldType;
        tamano: byte;
     end;

   private
     FCampos : Array of TCamposGrilla;
     FArTipos: TCampos;
     Tabla   : TClientDataSet;
     FGrillaAlignGrid  : TStringAlignGrid;
     FGrid             : TcxGridDBTableView;

     Procedure EnsamblaCDS;
     function GetDataSet: TClientDataSet;
     procedure SetCampos(const Value: TCampos);
     procedure SetCxGrid(const Value: TcxGridDBTableView);
     procedure SetGrillaAlignGrid(const Value: TStringAlignGrid);
   public
     property AsAlignGrid: TStringAlignGrid write SetGrillaAlignGrid;
     property AsGrid: TcxGridDBTableView write SetCxGrid;
     property ArrayCampos : TCampos write SetCampos;
     property DataSet: TClientDataSet read GetDataSet;

     constructor create;
     destructor Destroy; reintroduce;

     class function fxCrearClientDataSet( Grilla: TStringAlignGrid; aCampos: TCampos ): TClientDataset; overload;
     class function fxCrearClientDataSet( Grilla: TcxGridDBTableView ): TClientDataset; overload;
   end;

implementation

constructor TGrillaClientDataSet.create;
begin
   Tabla := TClientDataSet.Create(nil);
end;

destructor TGrillaClientDataSet.Destroy;
begin
   Tabla.Free;
end;

Procedure TGrillaClientDataSet.EnsamblaCDS;

      function fxStrip( s: string ): string;
      const
         _HARD = 1;  // saque todo lo que sea invalido para un nombre de field.  .pr.
      begin
        s := UpperCase(trim(s));
        Result := Copy(Strip( s, _HARD ), 1, 30);
      end;

Var
  i:byte;
Begin
  if (FGrillaAlignGrid <> nil) then
  begin
      if length( FArTipos ) = 0 then
      begin
          SetLength( FCampos, FGrillaAlignGrid.ColCount );
          For i := 0 To FGrillaAlignGrid.ColCount - 1 Do
          Begin
              FCampos[i].Titulo := FGrillaAlignGrid.Cells[i,0];
              FCampos[i].Nombre := fxStrip(FGrillaAlignGrid.Cells[i,0]);
              FCampos[i].tipo   := FArTipos[i];
              FCampos[i].tamano := 0;
              if FArTipos[i] = ftString then
                 FCampos[i].tamano := 100;
          End;
      end
      else
      begin
          SetLength( FCampos, length(FArTipos) );
          For i := 0 to length(FArTipos) - 1 Do
          Begin
              FCampos[i].Titulo := FGrillaAlignGrid.Cells[i,0];
              FCampos[i].Nombre := fxStrip(FGrillaAlignGrid.Cells[i,0]);
              FCampos[i].tipo   := FArTipos[i];
              FCampos[i].tamano := 0;
              if FArTipos[i] = ftString then
                 FCampos[i].tamano := 100;
          End;
      end;
  end
  else
  begin
      SetLength( FCampos, Fgrid.ColumnCount );
      For i := 0 To Fgrid.ColumnCount - 1 Do
      Begin
          FCampos[i].Titulo := Fgrid.Columns[i].Caption;
          FCampos[i].Nombre := Fgrid.Columns[i].DataBinding.FieldName;
          FCampos[i].tipo   := Fgrid.Columns[i].DataBinding.Field.DataType;
          FCampos[i].tamano := 0;
          if Fgrid.Columns[i].DataBinding.Field.DataType = ftString then
             FCampos[i].tamano := 100;
      End;
  end;

  With Tabla.FieldDefs do
  begin
    Clear;
    For i := Low(FCampos) to High(FCampos) Do
    begin
       with AddFieldDef do
       begin
          Name        := FCampos[i].Nombre;
          DataType    := FCampos[i].tipo;
          Size        := FCampos[i].tamano;
          DisplayName := FCampos[i].Nombre;
       end;
    end;
  end;
  Tabla.CreateDataSet;
  For i := Low(FCampos) to High(FCampos) Do
  begin
     tabla.Fields[i].Name         := FCampos[i].Nombre;
     tabla.Fields[i].DisplayLabel := FCampos[i].Titulo;
  end;
  Tabla.Open;
end;

function TGrillaClientDataSet.GetDataSet: TClientDataSet;

      Procedure CopiaCelda( pValorCelda: String; pCampoTabla: TField );
      Begin
          If Assigned(pCampoTabla) Then
          Begin
            pValorCelda := Trim(pValorCelda);
            If pValorCelda = '' Then
              pCampoTabla.Clear
            Else
              pCampoTabla.Value := pValorCelda;
          End;
      End;

Var
  aCol, aRow: Integer;
Begin
  EnsamblaCDS;
  if (FGrillaAlignGrid <> nil) then
  begin
      if length( FArTipos ) = 0 then
      begin
        For aRow := FGrillaAlignGrid.FixedRows To FGrillaAlignGrid.Rowcount-1 Do
        Begin
            Tabla.Append;
            try
              For aCol := 0 To FGrillaAlignGrid.ColCount-1 Do
                CopiaCelda( FGrillaAlignGrid.Cells[aCol, aRow], Tabla.Fields.Fields[aCol] );

              Tabla.Post;
            except
              on e:exception do
              begin
                Tabla.Cancel;
                Result := nil;
                exit;
              end;
            end;
        End
      end
      else
      begin
        For aRow := FGrillaAlignGrid.FixedRows To FGrillaAlignGrid.Rowcount-1 Do
        Begin
            Tabla.Append;
            try
               For aCol := 0 to length(FArTipos) - 1 Do
                  CopiaCelda( FGrillaAlignGrid.Cells[aCol, aRow], Tabla.Fields.Fields[aCol] );

              Tabla.Post;
            except
              on e:exception do
              begin
                Tabla.Cancel;
                Result := nil;
                exit;
              end;
            end;
        End
      end;
  end
  else if (FGrid <> nil) then
  begin
      // recorremos la grilla y pasamos los datos que SE VEN al clientdataset
      Fgrid.DataController.DataSet.DisableControls;
      Fgrid.DataController.DataSet.First;
      While not Fgrid.DataController.DataSet.Eof do
      Begin
        Tabla.Append;
        try
          For aCol := 0 To Fgrid.ColumnCount -1 do
            CopiaCelda( Fgrid.Columns[aCol].DataBinding.Field.AsString, Tabla.Fields.Fields[aCol] );

          Tabla.Post;
        except
          on e:exception do
          begin
            MostrarDialogoError(e.message);
            Tabla.Cancel;
            Result := nil;
            exit;
          end;
        end;
        Fgrid.DataController.DataSet.Next;
      End;
      Fgrid.DataController.DataSet.EnableControls;
      Fgrid.DataController.DataSet.First;
  end;
  Result := Tabla;
End;

procedure TGrillaClientDataSet.SetCampos(const Value: TCampos);
begin
   FArTipos := Value;
end;

procedure TGrillaClientDataSet.SetCxGrid(const Value: TcxGridDBTableView);
begin
   FGrid := Value;
end;

procedure TGrillaClientDataSet.SetGrillaAlignGrid(const Value: TStringAlignGrid);
begin
   FGrillaAlignGrid := Value;
end;

class function TGrillaClientDataSet.fxCrearClientDataSet( Grilla: TStringAlignGrid; aCampos: TCampos ): TClientDataset;
begin
   with create do
   begin
      AsAlignGrid := Grilla;
      ArrayCampos := aCampos;
      Result := DataSet;
      Free;
   end;
end;

class function TGrillaClientDataSet.fxCrearClientDataSet( Grilla: TcxGridDBTableView ): TClientDataset;
begin
   with create do
   begin
      AsGrid := Grilla;
      Result := DataSet;
      Free;
   end;
end;

end.
