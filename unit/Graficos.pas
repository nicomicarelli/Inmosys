unit Graficos;

interface

uses Windows, Classes, Graphics, GifImg, JPeg, PNGImage;

  procedure CreatePieSeries;
  procedure CreateLineSeries;
  procedure CreateBarSeries;
  procedure CreateHorizBarSeries;
  
  // Manejo de imagenes
  function GetBmp(Handle: THandle; const resname: string): TBitmap;
  function GetPng(Handle: THandle; const resname: string): TPngImage;
  function GetJpeg(Handle: THandle; const resname: string): TJPEGImage;
  procedure Redimensionarpng(var origen: tpngImage; var destino:TpngImage);
  procedure pngToGray(var origen: tpngImage; var destino:TpngImage);

implementation

procedure CreateLineSeries;
//var
//  Line: TLineSeries;
//  Cam: String;
begin
(*
  DBChart.SeriesList.Clear;
  Line := TLineSeries.Create(Self);
  DBChart.AddSeries(Line);
  Line.Marks.Style := MarkStyles[rgEstiloEtiqueta.ItemIndex];
  Line.Marks.Visible := chEtiquetaVisible.Checked;
  Line.DataSource := qrConsulta;
  Line.SeriesColor := clBlue;

  if BuscarCampo(lbGraf1.Caption) then
    Cam := grCampos.Cells[1,grCampos.row]
  else
    Cam := BuscarItem(lbGraf1.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf1.tag);

  Line.XLabelsSource := Cam;
  Line.Pointer.InflateMargins := True;
  Line.Pointer.Style := psRectangle;
  Line.Pointer.Visible := False;

  if BuscarCampo(lbGraf2.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    Line.XValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    Cam :='';
    //Cam := BuscarItem(lbGraf2.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf2.tag);
    Line.XValues.DateTime := False;
  end;

  Line.XValues.Name := lbGraf2.Caption;
//  Line.XValues.Multiplier := 1;
  Line.XValues.Order := loAscending ;
  Line.XValues.ValueSource := Cam;

  if BuscarCampo(lbGraf3.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    Line.YValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    Cam := BuscarItem(lbGraf3.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf3.tag);
    Line.YValues.DateTime := False;
  end;

  Line.YValues.Name := lbGraf3.Caption;
//  Line.YValues.Multiplier := 1;
  Line.YValues.Order := loNone;
  Line.YValues.ValueSource := Cam; *)
end;

procedure CreateBarSeries;
//var
//  Bar: TBarSeries;
//  Cam: String;
begin
(*
  DBChart.SeriesList.Clear;
  Bar := TBarSeries.Create(Self);
  DBChart.AddSeries(Bar);
  Bar.ColorEachPoint := True;
  Bar.Marks.Style := MarkStyles[rgEstiloEtiqueta.ItemIndex];
  Bar.Marks.Visible := chEtiquetaVisible.Checked;
  Bar.DataSource := qrConsulta;
  Bar.SeriesColor := clBlue;

  if BuscarCampo(lbGraf1.Caption) then
    Cam := grCampos.Cells[1,grCampos.row]
  else
    Cam :=BuscarItem (lbGraf1.Caption);
    //else Cam := 'COLUMN'+ IntToStr(lbGraf1.tag);

  Bar.XLabelsSource := Cam;

  if BuscarCampo(lbGraf2.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    Bar.XValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    Cam:='';
    //Cam := 'COLUMN'+ IntToStr(lbGraf2.tag);
    //Cam :=BuscarItem (lbGraF2.Caption);
    Bar.XValues.DateTime := False;
  end;

  Bar.XValues.Name := lbGraf2.Caption;
//  Bar.XValues.Multiplier := 1;
  Bar.XValues.Order := loAscending;
  Bar.XValues.ValueSource := Cam;

  if BuscarCampo(lbGraf3.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    Bar.YValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    //Cam := 'COLUMN'+ IntToStr(lbGraf3.tag);
    Cam :=BuscarItem (lbGraF3.Caption);
    Bar.YValues.DateTime := False;
  end;

  Bar.YValues.Name := lbGraf3.Caption;
//  Bar.YValues.Multiplier := 1;
  Bar.YValues.Order := loNone;
  Bar.YValues.ValueSource := Cam; *)
end;

procedure CreateHorizBarSeries;
//var
//  HBar: THorizBarSeries;
//  Cam: String;
begin
(*
  DBChart.SeriesList.Clear;
  HBar := THorizBarSeries.Create(Self);
  DBChart.AddSeries(HBar);
  HBar.ColorEachPoint := True;
  HBar.Marks.Style := MarkStyles[rgEstiloEtiqueta.ItemIndex];
  HBar.Marks.Visible := chEtiquetaVisible.Checked;
  HBar.DataSource := qrConsulta;
  HBar.SeriesColor := clBlue;

  if BuscarCampo(lbGraf1.Caption) then
    Cam := grCampos.Cells[1,grCampos.row]
  else
    Cam := BuscarItem(lbGraf1.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf1.tag);

  HBar.XLabelsSource := Cam;

  if BuscarCampo(lbGraf2.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    HBar.XValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    Cam := BuscarItem(lbGraf2.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf2.tag);
    HBar.XValues.DateTime := False;
  end;

  HBar.XValues.Name := lbGraf2.Caption;
//  HBar.XValues.Multiplier := 1;
  HBar.XValues.Order := loNone;
  HBar.XValues.ValueSource := Cam;

  if BuscarCampo(lbGraf3.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    HBar.YValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    Cam := BuscarItem(lbGraf3.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf3.tag);
    HBar.YValues.DateTime := False;
  end;

  HBar.YValues.Name := lbGraf3.Caption;
//  HBar.YValues.Multiplier := 1;
  HBar.YValues.Order := loNone;
  HBar.YValues.ValueSource := Cam; *)
end;


procedure CreatePieSeries;
//var
//  Pie: TPieSeries;
//  Cam: string;
begin
(*
  DBChart.SeriesList.Clear;
  Pie := TPieSeries.Create(Self);
  DBChart.AddSeries(Pie);
  Pie.Marks.Style := MarkStyles[rgEstiloEtiqueta.ItemIndex];
  Pie.Marks.Visible := chEtiquetaVisible.Checked;
  Pie.ShowInLegend := False;

  if BuscarCampo(lbGraf1.Caption) then
  begin
    Cam := grCampos.Cells[1,grCampos.row];
    Pie.PieValues.DateTime := (grCampos.Cells[5,grCampos.row] = 'D');
  end
  else
  begin
    //Cam := 'COLUMN'+ IntToStr(lbGraf1.tag);
    Cam := BuscarItem(lbGraf1.Caption);
    Pie.PieValues.DateTime := False;
  end;

  Pie.XLabelsSource := Cam;
  Pie.OtherSlice.Text := 'Other';
  Pie.PieValues.Name := lbGraf1.Caption;
//  Pie.PieValues.Multiplier := 1;
  Pie.PieValues.Order := loNone;

  if BuscarCampo(lbGraf2.Caption) then
    Cam := grCampos.Cells[1,grCampos.row]
  else
    Cam := BuscarItem(lbGraf2.Caption);
    //Cam := 'COLUMN'+ IntToStr(lbGraf2.tag);

  Pie.PieValues.ValueSource := Cam;
  Pie.DataSource := qrConsulta; *)

end;

function GetBmp(Handle: THandle; const resname: string): TBitmap;
// toma el JPEG del recurso
var
  Stream: TResourceStream;
begin
  Stream := TResourceStream.Create(  Handle , ResName, RT_RCDATA );  // ojo!
  try
    Result := TBitmap.Create;
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

function GetPng(Handle: THandle; const resname: string): TPngImage;
// toma el JPEG del recurso
var
  Stream: TResourceStream;
begin
  Stream := TResourceStream.Create(  Handle , ResName, RT_RCDATA );  // ojo!
  try
    Result := TPngImage.Create;
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

function GetJpeg(Handle: THandle; const resname: string): TJPEGImage;
// toma el JPEG del recurso
var
  Stream: TResourceStream;
begin
  Stream := TResourceStream.Create(  Handle , ResName, RT_RCDATA );  // ojo!
  try
    Result := TJPEGImage.Create;
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;


procedure Redimensionarpng(var origen: tpngImage; var destino:TpngImage);
var
  bmp: TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.Width := 16;
  bmp.Height := 16;
  bmp.Canvas.StretchDraw( RECT( 0, 0, 16, 16), Origen);
  Destino.Assign( bmp);
end;

procedure pngToGray(var origen: tpngImage; var destino:TpngImage);
var
  bmp: TBitmap;
  Color: PCardinal;
  Count, y, x, Gray: Cardinal;
begin
  Bmp := TBitmap.Create;
  Bmp.Width := Origen.Width;
  with Bmp do
  begin
    Height := Origen.Height;
    PixelFormat := pf32Bit;
    Canvas.StretchDraw(Rect(0, 0, Width - 1, Height - 1), Origen);
    Count := Abs(Cardinal(ScanLine[1]) - Cardinal(ScanLine[0])) div 4;
    y := Height;
    repeat Dec(y);
      Color := ScanLine[y];
      x := Count;
      repeat Dec(x);
        Gray := (GetRValue(Color^) + GetGValue(Color^) + GetBValue(Color^)) div 3;
        Color^ := RGB(Gray, Gray, Gray);
        Inc(Color);
      until x = 0;
    until y = 0;
  end;
  Destino.Assign(bmp);
end;

end.
