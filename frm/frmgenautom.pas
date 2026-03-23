unit frmgenautom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBTables, Db, IBQuery, IBCustomDataSet,
  IBTable, Grids, DBGrids, ComCtrls, frmdatos, ToolWin, ImgList, sqlexpr, DBClient, Provider,
  ALIGRID, FXQuery, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  AdvGlowButton, cxGroupBox;

type
  Tfgenautom = class(TForm)
    Panel4: TPanel;
    Edit1: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label10: TLabel;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    ImageList1: TImageList;
    gNoLiquida: TStringAlignGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    gAutomatizados: TStringAlignGrid;
    chAutomatizados: TCheckBox;
    gCuotasRepetidas: TStringAlignGrid;
    Panel8: TPanel;
    Label11: TLabel;
    cxGroupBox1: TcxGroupBox;
    btnGrabar: TAdvGlowButton;
    btnSalir: TAdvGlowButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    boAutomatizando: Boolean;
  public
    class procedure Ejecutar;
  end;

var
  fgenautom: Tfgenautom;

implementation

uses funciones, frmprincipal;

{$R *.DFM}

function periodoimpuestos(Mes, Anio: string):string;
begin
  Result := 'PER. ' + Mes + '/' + Anio;
end;

function periodoalquiler(Mes, Anio:string):string;
begin
  Result := 'CORRESPONDE ' + Mes + '/' + Anio;
end;

function transformafecha(var a:string):string;
var dia,mes,ano,f:string;
begin
  f := datetostr(date());
  delete(f,3,8);
  dia := f;
  f := datetostr(date());
  delete(f,1,3);
  delete(f,3,5);
  mes := f;
  f := datetostr(date());
  delete (f,1,6);
  ano := f;
  a := ano + mes + dia;
  Result := a;
end;

function devuelvemes(var Mes:integer):string;
begin
 case Mes of
  1: Result  := 'ENERO';
  2: Result  := 'FEBRERO';
  3: Result  := 'MARZO';
  4: Result  := 'ABRIL';
  5: Result  := 'MAYO';
  6: Result  := 'JUNIO';
  7: Result  := 'JULIO';
  8: Result  := 'AGOSTO';
  9: Result  := 'SEPTIEMBRE';
  10: Result := 'OCTUBRE';
  11: Result := 'NOVIEMBRE';
  12: Result := 'DICIEMBRE';
 END;
end;
procedure Tfgenautom.Edit1Exit(Sender: TObject);
var
  a: Integer;
begin
  a:=Toint(edit1.text);
  if (a<1) or (a>12) then
  begin
    MostrarDialogoAceptar('El mes debe ser un valor entre 1 y 12');
    edit1.setfocus;
  end;

  if Trim(edit1.text) <> '' then
    edit1.text:=FormatFloat('00', ToFloat(edit1.text));

end;

procedure Tfgenautom.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  a:integer;
  b,d:string;
begin
  if key=#13 then
  begin
    b:=edit1.text;
    if length(b)=0 then
    begin
      d:=FormatDatetime('dd/mm/yyyy', date());
      delete(d,1,3);
      delete(d,3,5);

      edit1.text:=FormatFloat('00', ToFloat(d));
    end;
    a:=strtoint(edit1.text);
    if (a<1) or (a>12) then
      edit1.setfocus
    else
    begin
      b:=devuelvemes(a);
      label3.visible:=true;
      label3.caption:=b;
      edit2.SetFocus;
    end;
    edit1.text:=FormatFloat('00', ToFloat(edit1.text));
  end;
end;

procedure Tfgenautom.Edit2KeyPress(Sender: TObject; var Key: Char);
var
 Fila, a:integer;
 b,r:string;
 qAutomatizando: TFxQuery;
begin
  if key=#13 then
  begin
    b:=FormatDatetime('dd/mm/yyyy', date());
    delete(b,1,6);
    if edit2.text='' then
      edit2.text:=b;
    a:=strtoint(edit2.text);
    if a < 2014 then
      edit2.SetFocus
    else
    begin
      edit3.setfocus;
      a:=strtoint(edit1.text);
      r:='';
      case a of
        1: r:='CON RENTAS';
        3: r:='CON RENTAS';
        6: r:='CON RENTAS';
        9: r:='CON RENTAS';
      end;
      label5.visible:=true;
      label5.caption:='Se liquida ' + label3.caption + ' de ' + edit2.text + ' ' + r;
      edit3.setfocus;

     qAutomatizando := CrearQuery;
     Fila := 1;
     gAutomatizados.BeginUpdate;
     try
       qAutomatizando.SQL.Text := 'Select Distinct I.codinq, I.Inquilino from AUTOMATIZADOS A Inner Join Inmuebles I on I.Codinq = A.Codinq where A.mes=:MES and A.ano= :ANO';
       qAutomatizando.ParamByName('Mes').AsInteger := ToInt(edit1.Text);
       qAutomatizando.ParamByName('Ano').AsInteger := ToInt(edit2.Text);
       qAutomatizando.Open;

       while not qAutomatizando.Eof do
       begin
         gAutomatizados.Cells[0, Fila] := qAutomatizando.fieldbyname('Codinq').asString;
         gAutomatizados.Cells[1, Fila] := qAutomatizando.fieldbyname('Inquilino').asString;
         qAutomatizando.Next;
         Inc(Fila);

       end;
       if Fila < 2 then
         gAutomatizados.RowCount := 2
       else
         gAutomatizados.RowCount := Fila;
     finally
       gAutomatizados.EndUpdate;
       qAutomatizando.Free;
     end;
    end;
  end;
end;

procedure Tfgenautom.Edit2Exit(Sender: TObject);
var
 a:integer;
 b:string;
begin
 b:=edit2.Text;
 if b='' then
   edit2.text:='2014';
 a:=strtoint(edit2.text);
 if a < 2014 then
   edit2.SetFocus
 else
   edit3.setfocus;
end;

procedure Tfgenautom.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
  begin
    if edit3.text='' then
      edit3.text:='1';
    edit4.setfocus;
  end;
end;

procedure Tfgenautom.Edit4Exit(Sender: TObject);
var
  a,b:integer;
  c:string;
begin
  if edit4.Text = '' then
    Exit;

  a:=strtoint(edit3.text);
  b:=strtoint(edit4.text);
  if a>b then
  begin
    edit3.setfocus;
    edit3.text:='';
    edit4.text:='';
  end
  else
  begin
    a:=strtoint(edit1.text);
    if a=1 then
      a:=12
    else
      a:=a-1;
    c:=devuelvemes(a);
//    label8.visible:=true;
//    label8.caption:='MES EXPENSAS CARINAR II: ' + c;
  end;
end;

procedure Tfgenautom.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    if edit4.text='' then
      edit4.text:='9999';
    boAutomatizando := True;
    btnGrabar.Enabled := False;
    bitbtn1click(Self);
    boAutomatizando := False;
  end;
end;

procedure Tfgenautom.BitBtn2Click(Sender: TObject);
begin
  edit1.text:='';
  edit2.text:='';
  edit3.text:='';
  edit4.text:='';
  edit1.SetFocus;
  label5.visible:=false;
  label8.visible:=false;
  label3.Visible:=false;
end;

procedure Tfgenautom.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure Tfgenautom.btnGrabarClick(Sender: TObject);
begin
  btnGrabar.Enabled := False;
  boAutomatizando := True;
  bitbtn1click(Self);
  boAutomatizando := False;
end;

procedure Tfgenautom.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure Tfgenautom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action    := cafree;
 fGenAutom := nil;
end;

procedure Tfgenautom.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not boAutomatizando;
end;

procedure Tfgenautom.BitBtn1Click(Sender: TObject);
var
  i,j,l:integer;
  de,ha,des,has,ac:string;
  dei,hai,aci,mesi,ANOI,pagare:integer;
  peralq,perimpu,pro,mes,mesl,ano,anol,dgrcuota:string;
  imp,fecha,dest,exp:string;
  acis,cod,clave:string;
  n:integer;
  CodinqDesde, CodinqHasta: Double;
  q: TFXQuery;
  qConsulta: TClientDataSet;
  dspProvider: TDataSetProvider;
  FechaCtaCte: TDatetime;
  Registro: Integer;
  Fila: Integer;
  FilaRepetidas: Integer;
  qAutomatizando: TFXQuery;
  qCuotaExiste: TFXQuery;
  qUpdate: TFXQuery;
  ObrasDesde, obrasHasta: Integer;
  ExisteCuota: Boolean;

begin

 q := CrearQuery;
 qUpdate := CrearQuery;
 qAutomatizando := CrearQuery;
 qConsulta := TClientDataSet.Create(nil);
 dspProvider := TDataSetProvider.Create(nil);
  if ToInt(edit1.Text) = 0 then
  begin
    MostrarDialogoAceptar('Verifique el mes ingresado. El mismo es inválido');
    Exit;
  end;
  if ToInt(edit1.Text) > 12 then
  begin
    MostrarDialogoAceptar('Verifique el mes ingresado. El mismo es inválido');
    Exit;
  end;
  if ToInt(edit1.Text) < 1 then
  begin
    MostrarDialogoAceptar('Verifique el mes ingresado. El mismo es inválido');
    Exit;
  end;
 if Edit1.Text = '' then
 begin
   MostrarDialogoAceptar('Debe introducir el mes. Verifique por favor.');
   Exit;
 end;
 if Edit2.Text = '' then
 begin
   MostrarDialogoAceptar('Debe introducir el año. Verifique por favor.');
   Exit;
 end;
 if Edit3.Text = '' then
 begin
   MostrarDialogoAceptar('Debe introducir el inquilino desde. Verifique por favor.');
   Exit;
 end;
 if Edit4.Text = '' then
 begin
   MostrarDialogoAceptar('Debe introducir el inquilino hasta. Verifique por favor.');
   Exit;
 end;
   if not MostrarDialogoSINO('Verifique que la pantalla "ABM de Automatización" se encuentre cerrada en todas las terminales. ' + #13#10#13#10 +' ¿Esta seguro de Automatizar con esos valores?', mbYes) then
     Exit;

   try
     DM.IniciarTransaccion;
     try
       gNoLiquida.Vaciar;
       gAutomatizados.Vaciar;
       gCuotasRepetidas.Vaciar;
       label12.Caption:='Automatizando por favor espere...';
       fecha:=datetostr(date());
       mes:=edit1.text;
       ano:=edit2.text;
       perimpu:=periodoimpuestos(mes,ano);
       mes:=label3.caption;
       peralq:=periodoalquiler(mes,ano);
       mes:=edit1.text;
       ano:=edit2.text;
       if length(mes)=1 then
       begin
         mes:='0'+mes;
       end;
       de:=edit3.Text;
       ha:=edit4.text;

       CodinqDesde := Strtofloat(de);
       CodinqHasta := strtofloat(ha);

       q.sql.Text := ' Select I.Codinq, I.Inquilino, i.liquidacion  ' +
                            '  From inmuebles i ' +
                            ' where i.codinq >= :Codinqdesde and i.codinq <= :codinqhasta and ((I.Liquidacion = :liquida) or (I.Liquidacion = :liqMin )) ' +
                            ' order by I.codinq';
       q.ParamByName('Liquida').AsString:='N';
       q.ParamByName('LiqMin').AsString:='n';
       q.ParamByName('Codinqdesde').AsString:=Formatfloat('0000',Codinqdesde);
       q.ParamByName('Codinqhasta').AsString:=FormatFloat('0000',CodinqHasta);
       q.Open;
       Fila := 1;
       while not q.eof do
       begin
         gNoLiquida.Cells[0, Fila] := q.FieldByName('Codinq').AsString;
         gNoLiquida.Cells[1, Fila] := q.FieldByName('Inquilino').AsString;
         Inc(Fila);
         q.Next;
       end;

       if Fila < 2 then
         gNoLiquida.RowCount := 2
       else
         gNoLiquida.RowCount := Fila;

       q.sql.Text := ' Select a.*, i.liquidacion from automatizacion a ' +
                            '  Inner join inmuebles i on i.codinq=a.codinq ' +
                            '  where a.codinq=i.codinq and '+
                            '        ((i.liquidacion=:snis) or (i.liquidacion=:snii)) ' +
                            '        and i.codinq >= :Codinqdesde and i.codinq <= :codinqhasta ' +
                            ' order by a.codinq';
       q.ParamByName('snis').AsString:='S';
       q.ParamByName('snii').AsString:='I';
       q.ParamByName('Codinqdesde').AsString:=Formatfloat('0000',Codinqdesde);
       q.ParamByName('Codinqhasta').AsString:=FormatFloat('0000',CodinqHasta);
       q.Open;

       Label11.Caption := 'Actualizando Contratos Escalonados...';
       Label11.Visible := True;

       ProgressBar1.Position := 0;

       dspProvider.DataSet := q;
       qConsulta.Data := dspProvider.Data;
       ProgressBar1.Max := qConsulta.RecordCount;

       I := 0;

       while not q.eof do
       begin
         Inc(I);
         fPrincipal.ActualizarContratosEscalonados( StrToDatetime('01/'+Mes+'/'+Ano), q.FieldByName('Codinq').AsString);
         fPrincipal.ActualizarComisionesEscalonadas( StrToDatetime('01/'+Mes+'/'+Ano), q.FieldByName('Codinq').AsString);
         ProgressBar1.Position := I;
         Application.ProcessMessages;
         q.Next;
       end;

       q.Close;
       q.Open;
       q.First;

       dspProvider.DataSet := q;
       qConsulta.Data := dspProvider.Data;

       dei:=strtoint(de);
       hai:=strtoint(ha);
       progressbar1.Min:=0;
       progressbar1.Max:=qConsulta.RecordCount;
       Fila := 1;
       FilaRepetidas := 1;

       qCuotaExiste := CrearQuery;
       qCuotaExiste.Sql.Text :=
         'Select * from Itemautom ' +
         ' Where Codinq = :Codinq '+
         '   and Coditem = :Coditem ' +
         '   and Periodo = :Periodo ' +
         '   and Item = :Item ';

       I := 0;
       Label11.Caption := 'Generando Automatización...';
       Label11.Visible := True;

       while not qConsulta.Eof do
       begin
         Inc(I);
         progressbar1.Position:=i;
         Application.ProcessMessages;

         pro:=qConsulta.fieldbyname('Propietario').asstring;
         aci:=qConsulta.fieldbyname('Codinq').asinteger;

         ObrasDesde := q.FieldbyName('PPOBRASID').AsInteger;
         ObrasHasta := q.FieldbyName('PPOBRASIH').AsInteger;

         if (ToFloat(qConsulta.fieldbyName('PPOBRASI').AsString)<>0) then
         begin
           if ToFloat(FloatToStr(ToFloat(Edit2.Text)) + FormatFloat('00',(ToFloat(Edit1.Text)))) >=
             ToFloat(qConsulta.fieldbyName('PPOBRASIANIO').AsString + FormatFloat('00',qConsulta.fieldbyName('PPOBRASIMES').AsFloat)) then
           begin
             qCuotaExiste.Close;
             qCuotaExiste.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(inttostr(aci)));
             qCuotaExiste.ParambyName('Coditem').AsString := '300';
             qCuotaExiste.ParambyName('Item').AsString := 'PLAN DE PAGO OBRAS ';
             qCuotaExiste.ParambyName('Periodo').AsString := qConsulta.fieldbyName('PPOBRASID').AsString+' DE '+qConsulta.fieldbyName('PPOBRASIH').AsString;
             qCuotaExiste.Open;

             if not qCuotaExiste.IsEmpty then
             begin
               gCuotasRepetidas.Cells[0, FilaRepetidas] := qConsulta.fieldbyname('Codinq').asString;
               gCuotasRepetidas.Cells[1, FilaRepetidas] := qConsulta.fieldbyname('Inquilino').asString;
               gCuotasRepetidas.Cells[2, FilaRepetidas] := 'PLAN DE PAGO OBRAS - INQUILINO';
               gCuotasRepetidas.Cells[3, FilaRepetidas] := qConsulta.fieldbyName('PPOBRASID').AsString+' DE '+qConsulta.fieldbyName('PPOBRASIH').AsString;
               Inc(FilaRepetidas);
               gCuotasRepetidas.RowCount := FilaRepetidas +1;
               qConsulta.Next;
               Continue;
             end;
           end;
         end;

         if (ToFloat(qConsulta.fieldbyName('PPOBRASP').AsString)<>0) then
         begin
           if ToFloat(FloatToStr(ToFloat(Edit2.Text)) + FormatFloat('00',(ToFloat(Edit1.Text)))) >=
             ToFloat(qConsulta.fieldbyName('PPOBRASPANIO').AsString + FormatFloat('00',qConsulta.fieldbyName('PPOBRASPMES').AsFloat)) then
           begin
             qCuotaExiste.Close;
             qCuotaExiste.ParambyName('Codinq').AsString := FormatFloat('0000', ToFloat(inttostr(aci)));
             qCuotaExiste.ParambyName('Coditem').AsString := '301';
             qCuotaExiste.ParambyName('Item').AsString := 'PLAN DE PAGO OBRAS ';
             qCuotaExiste.ParambyName('Periodo').AsString := qConsulta.fieldbyName('PPOBRASPD').AsString+' DE '+qConsulta.fieldbyName('PPOBRASPH').AsString;
             qCuotaExiste.Open;

             if not qCuotaExiste.IsEmpty then
             begin
               gCuotasRepetidas.Cells[0, FilaRepetidas] := qConsulta.fieldbyname('Codinq').asString;
               gCuotasRepetidas.Cells[1, FilaRepetidas] := qConsulta.fieldbyname('Inquilino').asString;
               gCuotasRepetidas.Cells[2, FilaRepetidas] := 'PLAN DE PAGO OBRAS - PROPIETARIO';
               gCuotasRepetidas.Cells[3, FilaRepetidas] := qConsulta.fieldbyName('PPOBRASPD').AsString+' DE '+qConsulta.fieldbyName('PPOBRASPH').AsString;
               Inc(FilaRepetidas);
               gCuotasRepetidas.RowCount := FilaRepetidas +1;
               qConsulta.Next;
               Continue;
             end;
           end;
         end;

//         qAutomatizando.SQL.Text := 'Select * from AUTOMATIZADOS where codinq = :CODINQ and mes=:MES and ano= :ANO';
//         qAutomatizando.ParamByName('codinq').AsString := qConsulta.fieldbyname('Codinq').asString;
//         qAutomatizando.ParamByName('Mes').AsInteger := ToInt(edit1.Text);
//         qAutomatizando.ParamByName('Ano').AsInteger := ToInt(edit2.Text);
//         qAutomatizando.Open;
//
//         if not qAutomatizando.IsEmpty then
//         begin
//           gAutomatizados.Cells[0, Fila] := qConsulta.fieldbyname('Codinq').asString;
//           gAutomatizados.Cells[1, Fila] := qConsulta.fieldbyname('Inquilino').asString;
//           Inc(Fila);
//           if not chAutomatizados.Checked then
//           begin
//             qConsulta.Next;
//             Continue;
//           end;
//         end;

         qAutomatizando.SQL.Text := 'INSERT INTO AUTOMATIZADOS VALUES(:CODINQ, :MES, :ANO)';
         qAutomatizando.ParamByName('codinq').AsString := qConsulta.fieldbyname('Codinq').asString;
         qAutomatizando.ParamByName('Mes').AsInteger := ToInt(edit1.Text);
         qAutomatizando.ParamByName('Ano').AsInteger := ToInt(edit2.Text);
         qAutomatizando.ExecSQL;

         if (aci>=dei) and (aci<=hai) then
         begin
           fecha:=ano+mes+'05';
           FechaCtaCte := StrToDatetime('05/'+Mes+'/'+Ano);
           acis:=inttostr(aci);
           acis := FormatFloat('0000', ToFloat(Acis));

           if (ToFloat(qConsulta.fieldbyName('PPOBRASI').AsString)<>0) then
           begin
             if ToFloat(FloatToStr(ToFloat(Edit2.Text)) + FormatFloat('00',(ToFloat(Edit1.Text)))) >=
               ToFloat(qConsulta.fieldbyName('PPOBRASIANIO').AsString + FormatFloat('00',qConsulta.fieldbyName('PPOBRASIMES').AsFloat)) then
             begin
               Registro := InsertarItemAutom(acis,fecha,'PLAN DE PAGO OBRAS ',qConsulta.fieldbyName('PPOBRASID').AsString+' DE '+qConsulta.fieldbyName('PPOBRASIH').AsString, qConsulta.fieldByName('PPOBRASI').asstring,Trim(Pro), '300',3);

               if ObrasDesde>ObrasHasta then
               begin
                 qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPobrasI=:ppobrasi, ppOBRASID = 0, ppOBRASIH = 0 where codinq =:Codinq';
                 qUpdate.ParamByName('ppobrasi').AsString := '0.00';
                 qUpdate.ParamByName('Codinq').AsString := acis;
                 qUpdate.ExecSQL;
               end
               else if ObrasDesde<ObrasHasta then
               begin
                 qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET ppOBRASID = ppOBRASID + 1 where codinq =:Codinq';
                 qUpdate.ParamByName('Codinq').AsString := acis;
                 qUpdate.ExecSQL;
               end;
             end;
           end;

           if qConsulta.fieldbyName('Pagare').asInteger = 1 then
           begin
             InsertarItemAutom(acis,fecha,'NOTA','EL INQUILINO TIENE DOCUMENTACION EN CARTERA.','',Trim(Pro), '15',3);
           end;
           if qConsulta.fieldByName('Alquiler').asstring<>'0.00' then
           begin
             if Uppercase(qConsulta.fieldByName('Liquidacion').asstring)='S' then
             begin
               Registro := InsertarItemAutom(acis,fecha,'ALQUILER',PERALQ,qConsulta.fieldByName('Alquiler').asstring,Trim(Pro), '01',3);
             end;
           end;
           if qConsulta.fieldbyName('Bonificacion').AsString<>'0.00' then
           begin
             Registro := InsertarItemAutom(acis,fecha,'BONIFICACION',PERALQ,'-' + qConsulta.fieldByName('Bonificacion').asstring,Trim(Pro), '11',3);
           end;
           if qConsulta.fieldbyName('Agua9').AsString<>'0.00' then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','AGUAS CORDOBESAS ' + PERIMPU, qConsulta.fieldByName('Agua9').asstring,Trim(Pro), '09',3);
           end;
           if qConsulta.fieldbyName('Agua2').AsString<>'0.00' then
           begin
             Registro := InsertarItemAutom(acis,fecha,'AGUAS CORDOBESAS','PAGO ' + PERIMPU, qConsulta.fieldByName('Agua2').asstring,Trim(Pro), '02',3);
           end;
           if qConsulta.fieldbyName('Muni9').AsString<>'0.00' then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','TASA MUNICIPAL ' + PERIMPU, qConsulta.fieldByName('Muni9').asstring,Trim(Pro), '09',3);
           end;
           if qConsulta.fieldbyName('Muni5').AsString<>'0.00' then
           begin
             Registro := InsertarItemAutom(acis,fecha,'TASA MUNICIPAL','PAGO ' + PERIMPU, qConsulta.fieldByName('Muni5').asstring,Trim(Pro), '05',3);
           end;
           if qConsulta.fieldbyName('Itsi9').AsString<>'0.00' then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','I.T.S.I. ' + PERIMPU, qConsulta.fieldByName('ITSI9').asstring,Trim(Pro), '09',3);
           end;

           if (qConsulta.fieldbyName('RECUPEROGASTOS').AsString<>'0.00') and (qConsulta.fieldbyName('RECUPEROGASTOS').AsString<>'') then
           begin
             if Uppercase(qConsulta.fieldByName('Liquidacion').asstring)='S' then
             begin
               Registro := InsertarItemAutom(acis,fecha,'RECUPERO DE GASTOS ', 'PERIODO ' + Copy(PERIMPU, 5, 20), qConsulta.fieldByName('RecuperoGastos').asstring,Trim(Pro), '90',3);
             end;
           end;

           dgrcuota := cuotadgr(mes,ano, qConsulta.fieldbyName('Cuotas').AsInteger);
           if qConsulta.fieldbyName('DGR9').AsString<>'0.00' then
           begin
             mesi:=strtoint(edit1.text);
             if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
             begin
               if (mesi=1) or (mesi=3) or (mesi=6) or (mesi=9) then
               begin
                 Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','D.G.R. ' + DGRCUOTA, qConsulta.fieldByName('DGR9').asstring,Trim(Pro), '09',3);
               end;
             end
             else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
             begin
               if (mesi<11) then
               begin
                 Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','D.G.R. ' + DGRCUOTA, qConsulta.fieldByName('DGR9').asstring,Trim(Pro), '09',3);
               end;
             end
             else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
             begin
                 Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','D.G.R. ' + DGRCUOTA, qConsulta.fieldByName('DGR9').asstring,Trim(Pro), '09',3);
             end;
           end;
           if qConsulta.fieldbyName('DGR4').AsString<>'0.00' then
           begin
             mesi:=strtoint(edit1.text);
             if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
             begin
               if (mesi=1) or (mesi=3) or (mesi=6) or (mesi=9) then
               begin
                 Registro := InsertarItemAutom(acis,fecha,'D.G.R. ','PAGO ' + DGRCUOTA, qConsulta.fieldByName('DGR4').asstring,Trim(Pro), '04',3);
               end
             end
             else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
             begin
               if (mesi<11) then
               begin
                 Registro := InsertarItemAutom(acis,fecha,'D.G.R. ','PAGO ' + DGRCUOTA, qConsulta.fieldByName('DGR4').asstring,Trim(Pro), '04',3);
               end;
             end
             else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
             begin
               Registro := InsertarItemAutom(acis,fecha,'D.G.R. ','PAGO ' + DGRCUOTA, qConsulta.fieldByName('DGR4').asstring,Trim(Pro), '04',3);
             end;
           end;
           if (qConsulta.fieldbyName('Expensas9').AsString<>'0.00') and (qConsulta.fieldbyName('EstadoExpensas').AsString='MES EN CURSO') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','EXPS. COMUNES '+MES+'/'+ano, qConsulta.fieldByName('EXPENSAS9').asstring,Trim(Pro), '09',3);
           end;
           if (qConsulta.fieldbyName('Expensas9').AsString<>'0.00') and (qConsulta.fieldbyName('EstadoExpensas').AsString='MES VENCIDO') then
           begin
             mesi:=strtoint(edit1.text);
             ano:=edit2.Text;
             anol:=ano;
             if mesi=1 then
             begin
               mesi:=12;
               anoi:=strtoint(ano)-1;
               anol:=inttostr(anoi);
             end
             else
               mesi:=mesi-1;
             mesl:=devuelvemes(mesi);

             Registro := InsertarItemAutom(acis,fecha,'IMP Y/O SERVICIOS','EXPS. COMUNES '+MESl+'/'+anol, qConsulta.fieldByName('EXPENSAS9').asstring,Trim(Pro), '09',3);
           end;

           if (qConsulta.fieldbyName('Expensas14').AsString<>'0.00') and (qConsulta.fieldbyName('EstadoExpensas').AsString='MES EN CURSO') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'EXPENSAS COMUNES','CORRESPONDE '+MES+'/'+ano, qConsulta.fieldByName('EXPENSAS14').asstring,Trim(Pro), '14',3);
           end;

           if (qConsulta.fieldbyName('Expensas14').AsString<>'0.00') and (qConsulta.fieldbyName('EstadoExpensas').AsString='MES VENCIDO') then
           begin
             mesi:=strtoint(edit1.text);
             ano:=edit2.Text;
             anol:=ano;
             if mesi=1 then
             begin
               mesi:=12;
               anoi:=strtoint(ano)-1;
               anol:=inttostr(anoi);
             end
             else
               mesi:=mesi-1;
             mesl:=devuelvemes(mesi);

             Registro := InsertarItemAutom(acis,fecha,'EXPENSAS COMUNES','CORRESPONDE '+MESl+'/'+anol, qConsulta.fieldByName('EXPENSAS14').asstring,Trim(Pro), '14',3);
           end;

           if (qConsulta.fieldbyName('PPDGRI').AsString<>'0.00') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'P.P. D.G.R. ',qConsulta.fieldbyName('PPDGRID').AsString+' DE '+qConsulta.fieldbyName('PPDGRIH').AsString, qConsulta.fieldByName('PPDGRI').asstring,Trim(Pro), '09',3);
           end;
           if (qConsulta.fieldbyName('PPAGUAI').AsString<>'0.00') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'P.P. AGUAS CORDOBESAS ',qConsulta.fieldbyName('PPAGUAID').AsString+' DE '+qConsulta.fieldbyName('PPAGUAIH').AsString, qConsulta.fieldByName('PPAGUAI').asstring,Trim(Pro), '09',3);
           end;
           if (qConsulta.fieldbyName('PPTMUNI').AsString<>'0.00') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'P.P. TASA MUNICIPAL ',qConsulta.fieldbyName('PPTMUNID').AsString+' DE '+qConsulta.fieldbyName('PPTMUNIH').AsString, qConsulta.fieldByName('PPTMUNI').asstring,Trim(Pro), '09',3);
           end;
           fecha:=ano+mes+'10';
           ObrasDesde := q.FieldbyName('PPOBRASPD').AsInteger;
           ObrasHasta := q.FieldbyName('PPOBRASPH').AsInteger;

           if qConsulta.fieldbyName('Comision').AsString<>'0.00' then
           begin
             if Uppercase(qConsulta.fieldByName('Liquidacion').asstring)='S' then
             begin
               Registro := InsertarItemAutom(acis,fecha,'COMISION POR ADMINISTRACION','DE ALQUILER ' + PERALQ,qConsulta.fieldByName('Comision').asstring,Trim(Pro), '12',3);
             end;
           end;

           if ToFloat(qConsulta.fieldbyName('ComisionExtraordinaria').AsString)<>0 then
           begin
             if Uppercase(qConsulta.fieldByName('Liquidacion').asstring)='S' then
             begin
               Registro := InsertarItemAutom(acis,fecha,'COMISION EXTRAORD. POR ADMINISTRACION','DE ALQUILER '+peralq,qConsulta.fieldByName('ComisionExtraordinaria').asstring,Trim(Pro), '121',3);
             end;
           end;

           if qConsulta.fieldbyName('Agua27').AsFloat<>0 then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR','AGUAS CORDOBESAS ' + PERIMPU, qConsulta.fieldByName('Agua27').asstring,Trim(Pro), '27',3);
           end;

           if qConsulta.fieldbyName('Muni27').AsFloat<>0 then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR','TASA MUNICIPAL ' + PERIMPU, qConsulta.fieldByName('Muni27').asstring,Trim(Pro), '27',3);
           end;

           if qConsulta.fieldbyName('Itsi27').AsFloat<>0 then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR','I.T.S.I ' + PERIMPU, qConsulta.fieldByName('Itsi27').asstring,Trim(Pro), '27',3);
           end;

           if qConsulta.fieldbyName('DGR27').AsFloat<>0 then
           begin
             mesi:=strtoint(edit1.text);
             if qConsulta.fieldbyName('Cuotas').AsInteger = 4 then
             begin
               if (mesi=1) or (mesi=3) or (mesi=6) or (mesi=9) then
               begin
                 Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR','D.G.R. ' + DGRCUOTA, qConsulta.fieldByName('DGR27').asstring,Trim(Pro), '27',3);
               end;
             end
             else if qConsulta.fieldbyName('Cuotas').AsInteger = 10 then
             begin
               if (mesi<11) then
               begin
                 Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR','D.G.R. ' + DGRCUOTA, qConsulta.fieldByName('DGR27').asstring,Trim(Pro), '27',3);
               end;
             end
             else if qConsulta.fieldbyName('Cuotas').AsInteger = 12 then
             begin
               Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR','D.G.R. ' + DGRCUOTA, qConsulta.fieldByName('DGR27').asstring,Trim(Pro), '27',3);
             end;

           end;

           if (qConsulta.fieldbyName('Expensas27').AsFloat<>0) and (qConsulta.fieldbyName('EstadoExpensas').AsString='MES EN CURSO') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR ','EXPS. COMUNES '+MES+'/'+ano, qConsulta.fieldByName('EXPENSAS27').asstring,Trim(Pro), '27',3);
           end;

           if (qConsulta.fieldbyName('Expensas27').AsFloat<>0) and (qConsulta.fieldbyName('EstadoExpensas').AsString='MES VENCIDO') then
           begin
             mesi:=strtoint(edit1.text);
             ano:=edit2.Text;
             anol:=ano;
             if mesi=1 then
             begin
               mesi:=12;
               anoi:=strtoint(ano)-1;
               anol:=inttostr(anoi);
             end
             else
               mesi:=mesi-1;
             mesl:=devuelvemes(mesi);

             Registro := InsertarItemAutom(acis,fecha,'IMPUESTOS A DESCONTAR ','EXPS. COMUNES '+MESl+'/'+anol, qConsulta.fieldByName('EXPENSAS27').asstring,Trim(Pro), '27',3);
           end;
           if (qConsulta.fieldbyName('PPDGRP').AsString<>'0.00') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'P.P. D.G.R.',qConsulta.fieldbyName('PPDGRPD').AsString+' DE '+qConsulta.fieldbyName('PPDGRPH').AsString, qConsulta.fieldByName('PPDGRP').asstring,Trim(Pro), '27',3);
           end;

           if (qConsulta.fieldbyName('PPAGUAP').AsString<>'0.00') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'P.P. AGUAS CORDOBESAS ',qConsulta.fieldbyName('PPAGUAPD').AsString+' DE '+qConsulta.fieldbyName('PPAGUAPH').AsString, qConsulta.fieldByName('PPAGUAP').asstring,Trim(Pro), '27',3);
           end;

           if (qConsulta.fieldbyName('PPTMUNP').AsString<>'0.00') then
           begin
             Registro := InsertarItemAutom(acis,fecha,'P.P. TASA MUNICIPAL ',qConsulta.fieldbyName('PPTMUNPD').AsString+' DE '+qConsulta.fieldbyName('PPTMUNH').AsString, qConsulta.fieldByName('PPTMUNP').asstring,Trim(Pro), '27',3);
           end;

           if (ToFloat(qConsulta.fieldbyName('PPOBRASP').AsString)<>0) then
           begin
             if ToFloat(FloatToStr(ToFloat(Edit2.Text)) + FormatFloat('00',(ToFloat(Edit1.Text)))) >=
               ToFloat(qConsulta.fieldbyName('PPOBRASPANIO').AsString + FormatFloat('00',qConsulta.fieldbyName('PPOBRASPMES').AsFloat)) then
             begin
               Registro := InsertarItemAutom(acis,fecha,'PLAN DE PAGO OBRAS ',qConsulta.fieldbyName('PPOBRASPD').AsString+' DE '+qConsulta.fieldbyName('PPOBRASPH').AsString, qConsulta.fieldByName('PPOBRASP').asstring,Trim(Pro), '301',3);

               if ObrasDesde>ObrasHasta then
               begin
                 qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET PPobrasp=:ppobrasP, ppOBRASPD = 0, ppOBRASPH = 0 where codinq =:Codinq';
                 qUpdate.ParamByName('ppobrasP').AsString := '0.00';
                 qUpdate.ParamByName('Codinq').AsString := acis;
                 qUpdate.ExecSQL;
               end
               else if ObrasDesde<ObrasHasta then
               begin
                 qUpdate.SQL.Text := ' UPDATE AUTOMATIZACION SET ppOBRASPD = ppOBRASPD + 1 where codinq =:Codinq';
                 qUpdate.ParamByName('Codinq').AsString := acis;
                 qUpdate.ExecSQL;
               end;
             end;
           end;
           label12.Caption:='Automatización Completada';
         end;
         qConsulta.Next;
       end;

       if Fila < 2 then
         gAutomatizados.RowCount := 2
       else
         gAutomatizados.RowCount := Fila;
     DM.ConfirmarTransaccion;
     MostrarDialogoAceptar('Proceso terminado exitosamente');
   except
     DM.CancelarTransaccion;
   end;
 finally
   freeandnil(q);
   freeandnil(qAutomatizando);
   FreeAndNil(qCOnsulta);
   FreeAndNil(dspProvider);
 end;

end;


procedure Tfgenautom.FormCreate(Sender: TObject);
begin
  fPrincipal.Center(self);
end;

class procedure Tfgenautom.Ejecutar;
begin
end;

procedure Tfgenautom.ToolButton1Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
end;

end.
