unit voEHandler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport,
  Aligrid, ppDB, ppDBJIT, ppTypes;

type
  TEHandler = class(TObject)
  private
    FGrilla: TStringAlignGrid;
    FRI: Integer;
    FSourse: TppJITPipeline;
    FFieldList: TStrings;

    function GetGridFieldValue(const aFieldName: String; aDataType : TppDataType):Variant;
    procedure SetDatos(const Value: TppJITPipeline);
  public
    constructor create(grilla : TStringAlignGrid; Datos : TppJITPipeline);overload;
    destructor Destroy; override;
    function GetDataSetName: String;
    function CheckBOF: Boolean;
    function CheckEOF: Boolean;
    procedure CloseDataSet(Sender: TObject);
    function GetBookmark: Integer;
    procedure GotoBookmark(aBookmark: Integer);
    procedure GotoFirstRecord(Sender: TObject);
    procedure GotoLastRecord(Sender: TObject);
    procedure OpenDataSet(Sender: TObject);
    procedure TraverseBy(aIncrement: Integer);
    function GetFieldValue(aFieldName: String): Variant;
    property Grilla: TStringAlignGrid read FGrilla Write FGrilla;
    property Datos: TppJITPipeline Write SetDatos;
  end;

implementation

uses frmPrincipal, Funciones;

function TEHandler.GetDataSetName: String;
begin
//  Result := 'Customer';
end;

function TEHandler.CheckBOF: Boolean;
begin
  Result := (FRI < 1);
end;

function TEHandler.CheckEOF: Boolean;
begin
  Result := (FRI >= FGrilla.RowCount);
end;

procedure TEHandler.CloseDataSet(Sender: TObject);
begin
  FRI := 0;
end;

function TEHandler.GetBookmark: Integer;
begin
  Result := FRI;
end;

procedure TEHandler.GotoBookmark(aBookmark: Integer);
begin
  FRI := aBookmark;
end;

procedure TEHandler.GotoFirstRecord(Sender: TObject);
begin
  FRI := 1;
end;

procedure TEHandler.GotoLastRecord(Sender: TObject);
begin
  FRI := FGrilla.RowCount - 1;
end;

procedure TEHandler.OpenDataSet(Sender: TObject);
begin
  FRI := 1;
end;

procedure TEHandler.TraverseBy(aIncrement: Integer);
begin
  FRI := FRI + aIncrement;
end;

function TEHandler.GetGridFieldValue(const aFieldName: String; aDataType : TppDataType):Variant;
var
  liFieldIndex: Integer;
  Valor : String;
begin
  if FRI <= 0 then
    FRI := 1;
    
  {find the column index of the field}
  liFieldIndex := FFieldList.IndexOf(aFieldName);

  if liFieldIndex < 0 then
    liFieldIndex := FFieldList.IndexOf(FSourse.FieldAliasForFieldName(aFieldName));

  {get the data from the grid cell}
  if liFieldIndex >= 0 then
  begin
    Valor := Trim(FGrilla.Cells[liFieldIndex, FRI]);

      case aDataType of
        dtInteger, dtLongint, dtSingle :
          Result := ConvertToInteger(Valor);

        dtDouble, dtExtended, dtCurrency :
          Result := ConvertToDouble(Valor);

        dtDate :
          Result := ConvertToDate(Valor);
        dtDateTime :

          Result := ConvertToDateTime(Valor);

        dtTime :
          Result := ConvertToTime(Valor);

        dtBoolean :
          Result := ConvertToBoolean(Valor);
      else
        Result := Valor;
      end;
  end
  else
    Result := '';
end; {function, GetGridFieldValue}

function TEHandler.GetFieldValue(aFieldName: String): Variant;
begin
  Result := GetGridFieldValue(aFieldName, FSourse.GetFieldDataType(aFieldName));
end;

procedure TEHandler.SetDatos(const Value: TppJITPipeline);
begin
  Value.Close;
  Value.Open;
  FSourse := Value;
  FRI := 0;
  FSourse.OnGetDataSetName := GetDataSetName;
  FSourse.OnCheckBOF := CheckBOF;
  FSourse.OnCheckEOF := CheckEOF;
  FSourse.OnCloseDataSet := CloseDataSet;
  FSourse.OnGetBookmark := GetBookmark;
  FSourse.OnGotoBookmark := GotoBookmark;
  FSourse.OnGotoFirstRecord := GotoFirstRecord;
  FSourse.OnGotoLastRecord := GotoLastRecord;
  FSourse.OnOpenDataSet := OpenDataSet;
  FSourse.OnTraverseBy := TraverseBy;
  FSourse.OnGetFieldValue := GetFieldValue;

  {the field names are stored in row[0] of the grid}
  FFieldList   := FGrilla.Rows[0];
end;

destructor TEHandler.destroy;
begin

  FSourse.OnGetDataSetName := nil;
  FSourse.OnCheckBOF := nil;
  FSourse.OnCheckEOF := nil;
  FSourse.OnCloseDataSet := nil;
  FSourse.OnGetBookmark := nil;
  FSourse.OnGotoBookmark := nil;
  FSourse.OnGotoFirstRecord := nil;
  FSourse.OnGotoLastRecord := nil;
  FSourse.OnOpenDataSet := nil;
  FSourse.OnTraverseBy := nil;
  FSourse.OnGetFieldAsDouble := nil;
  FSourse.OnGetFieldAsString := nil;
  FSourse.OnGetFieldValue := nil;
  FGrilla:=nil;
  FSourse:=nil;
  FFieldList:=nil;
  inherited;
end;

constructor TEHandler.create(grilla: TStringAlignGrid;Datos: TppJITPipeline);
begin
  FGrilla := grilla;
  SetDatos(Datos);
end;

end.
