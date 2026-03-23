unit frmConsultaSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Funciones, sqlExpr, Grids,
  ALIGRID, FXQuery, AdvGlowButton;

type
  TfConsultarSobre = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Label4: TLabel;
    edFechaDesde: TEdit;
    edtSobreDestino: TEdit;
    cboSobre: TComboBox;
    lblSobreDestino: TLabel;
    PageControl1: TPageControl;
    General: TTabSheet;
    gDetalle: TStringAlignGrid;
    Label3: TLabel;
    edFechaHasta: TEdit;
    chSaldoAnterior: TCheckBox;
    chSoloSaldos: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    edtTotal: TEdit;
    btnSalir: TAdvGlowButton;
    Actualizar: TAdvGlowButton;
    procedure edFechaHastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtSobreDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure cboSobreChange(Sender: TObject);
    procedure edFechaDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure ActualizarClick(Sender: TObject);
    procedure chSoloSaldosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultarSobre: TfConsultarSobre;

implementation

uses frmprincipal, frmdatos;

{$R *.dfm}

procedure TfConsultarSobre.ActualizarClick(Sender: TObject);
(*VAR
  Q, qFechaSaldo, qSaldo, qSaldo2: TFXQuery;
  Nexo: string;
  I: Integer;
  Suma: Double;
begin *)
var
  q, qSaldo, qHistorico, qFechaSaldo, qEntreFechas: TFXQuery;
  qSobres: TFXQuery;
  SumaRI, RI, I, J, K: Integer;
  Pagina: Integer;
  Suma: Double;
  SumaHistorico: Double;
  SumaR: Double;
  Encontrado: boolean;
  EncontradoR: boolean;
  Tiempo: TDateTime;
  Nexo: string;
  ndTotal: Double;
  SobreAnt: Integer;
  Fila: Integer;
  Saldo: Double;
begin
  q := CrearQuery;
  qHistorico := CrearQuery;
  qSobres := CrearQuery;
  qFechaSaldo := CrearQuery;
  qEntreFechas := CrearQuery;
  Tiempo := Now;

  try
    Application.ProcessMessages;

    qFechaSaldo.SQL.Text :=
      ' Select Max(H.Fecha) as Fecha ' +
      '   From HistoricoCajaDetalles H '+
      '  Inner Join Conceptos C on C.Codigo = H.Coditem '+
      '  Where C.Sobre = :Sobre ';
    qFechaSaldo.ParamByName('Sobre').AsInteger := ToInt(edtSobreDestino.Text);
    qFechaSaldo.Open;

    q.SQL.Text := ' SELECT IDTRANSACCION, CODINQ, CODITEM, FECHA, ITEM, PERIODO, ENTRA, SALE, TIPO, LETRA, '+
                  '  NUMERO, USUARIO, SOBRE, NOMBRESOBRE FROM ( '+
                  ' select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                  '   from CAJADETALLES CA '+
                  '  inner join CAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                  '  inner join conceptos co on co.codigo = ca.coditem '+
                  '  inner join sobres s on s.codigo = co.sobre where ((s.Codigo=:codigo) OR (s.DEPENDE = :CODIGO))  and ca.coditem <> :alq1';

    q.ParamByName('Alq1').AsString := '01';
    q.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');
    q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
    q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;

    q.SQL.aDD(' UNION select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                  '   from CAJADETALLES CA '+
                  '  inner join CAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                  '  inner join conceptos co on co.codigo = ca.coditem '+
                  '  inner join sobres s on s.codigo = co.OTROsobre where ((s.Codigo=:codigo) OR (S.DEPENDE = :CODIGO))  and ca.coditem <> :alq1');

    q.ParamByName('Alq1').AsString := '01';
    q.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');
    q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
    q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;

    q.SQL.Add (' UNION select CA1.IDTRANSACCION, CA1.CODINQ, CA1.CODITEM, CA1.FECHA, CA1.ITEM, CA1.periodo,  CA1.SALE, CA1.ENTRA, C1.TIPO, C1.LETRA, C1.NUMERO, c1.uSUARIO, s1.codigo as sobre, s1.descripcion as nombresobre '+
                  '   from CAJADETALLES CA1 '+
                  '  inner join CAJA C1 on CA1.IDTRANSACCION = C1.IDTRANSACCION '+
                  '  inner join conceptos co1 on co1.CODIGO = ca1.coditem '+
                  '  inner join sobres s1 on s1.codigo = co1.DESCUENTA where ((s1.Codigo=:codigo) OR (S1.DEPENDE = :CODIGO))');
    q.SQL.Add(' and C1.Fecha >=:desde and C1.Fecha <=:Hasta ');
    q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
    q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;
    q.SQL.Add ('union '+
     ' select CA2.IDTRANSACCION, CA2.CODINQ, CA2.CODITEM, CA2.FECHA, CA2.ITEM, CA2.PERIODO, CA2.ENTRA, '+
     '      CA2.SALE, C2.TIPO, C2.LETRA, '+
     '      C2.NUMERO, c2.uSUARIO,S2.CODIGO as SOBRE, S2.DESCRIPCION as NOMBRESOBRE '+
     ' from CAJADETALLES CA2 '+
     ' inner join CAJA C2 on CA2.IDTRANSACCION = C2.IDTRANSACCION '+
     ' inner join CONCEPTOS CO2 on CO2.CODIGO = CA2.CODITEM '+
     ' inner join SOBRES S2 on S2.CODIGO = CO2.SOBRE '+
     ' where ((s2.Codigo=:codigo) OR (S2.DEPENDE = :CODIGO))' +
     ' AND ca2.coditem = :aLQ and ca2.entra > 0 ');
    q.ParamByName('aLQ').AsString := '01';
    q.SQL.Add(' and C2.Fecha >=:desde and C2.Fecha <=:Hasta ');
    q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
    q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;

    q.SQL.Add ('union '+
               ' SELECT ALQ.IDTRANSACCION, ALQ.CODINQ, ALQ.CODITEM, ALQ.FECHA, ALQ.ITEM, ALQ.PERIODO, ALQ.ENTRA, ALQ.SALE - coalesce(COM.ENTRA,0) AS SALE, ALQ.TIPO, ALQ.LETRA, '+
               '        ALQ.NUMERO, ALQ.USUARIO, ALQ.SOBRE, ALQ.NOMBRESOBRE '+
               ' FROM ( '+
               ' select CA3.IDTRANSACCION, CA3.CODINQ, CA3.CODITEM, CA3.FECHA, CA3.ITEM, CA3.PERIODO, CA3.ENTRA, CA3.SALE, C3.TIPO, C3.LETRA, '+
               '        C3.NUMERO, C3.USUARIO, S3.CODIGO as SOBRE, S3.DESCRIPCION as NOMBRESOBRE '+
               ' from CAJADETALLES CA3 '+
               ' inner join CAJA C3 on CA3.IDTRANSACCION = C3.IDTRANSACCION '+
               ' inner join CONCEPTOS CO3 on CO3.CODIGO = CA3.CODITEM '+
               ' inner join SOBRES S3 on S3.CODIGO = CO3.SOBRE '+
               ' where ((s3.Codigo=:codigo) OR (S3.DEPENDE = :CODIGO)) and ca3.coditem = :Alq3 and ca3.SALE > 0 ');
              q.SQL.Add(' and CA3.Fecha >=:desde and CA3.Fecha <=:Hasta ');
              q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
              q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;

              q.SQL.Add('  ) AS ALQ                                                                            ');
              q.SQL.Add(' LEFT JOIN '+
               ' (select CA4.IDTRANSACCION, CA4.CODINQ, CA4.CODITEM, CA4.FECHA, CA4.ITEM, CA4.PERIODO, CA4.ENTRA, CA4.SALE, C4.TIPO, C4.LETRA, '+
               '        C4.NUMERO, C4.USUARIO, S4.CODIGO as SOBRE, S4.DESCRIPCION as NOMBRESOBRE '+
               ' from CAJADETALLES CA4 '+
               ' inner join CAJA C4 on CA4.IDTRANSACCION = C4.IDTRANSACCION '+
               ' inner join CONCEPTOS CO4 on CO4.CODIGO = CA4.CODITEM '+
               ' inner join SOBRES S4 on S4.CODIGO = CO4.SOBRE '+
               ' where CO4.DESCUENTA = :CODIGO and ca4.coditem = :COMision and ca4.ENTRA > 0 ');
              q.SQL.Add(' and CA4.Fecha >=:desde and CA4.Fecha <=:Hasta ');
              q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
              q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;

              q.SQL.Add('  ) AS COM ');
              q.SQL.Add( ' ON ALQ.TIPO=COM.TIPO AND ALQ.LETRA=COM.LETRA AND ALQ.NUMERO=COM.NUMERO AND ALQ.FECHA=COM.FECHA AND ALQ.CODINQ=COM.CODINQ ');

    q.ParamByName('aLQ3').AsString := '01';
    q.ParamByName('Comision').AsString := '12';

    q.SQL.Add(' and alq.Fecha >=:desde and alq.Fecha <=:Hasta ');
    q.ParamByName('Desde').AsDatetime := Strtodatetime(edFechaDesde.Text);
    q.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaHasta.Text)+1;

    q.SQL.Add(') Order by Sobre, Fecha desc, Codinq, Coditem ');
    Q.Prepared := True;

    qEntrefechas.SQL.Text := ' SELECT IDTRANSACCION, CODINQ, CODITEM, FECHA, ITEM, PERIODO, ENTRA, SALE, TIPO, LETRA, '+
                  '  NUMERO, USUARIO, SOBRE, NOMBRESOBRE FROM ( '+
                  ' select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                  '   from CAJADETALLES CA '+
                  '  inner join CAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                  '  inner join conceptos co on co.codigo = ca.coditem '+
                  '  inner join sobres s on s.codigo = co.sobre where ((s.Codigo=:codigo) or (s.Depende=:Codigo)) and ca.coditem <> :alq1';

    qEntrefechas.ParamByName('Alq1').AsString := '01';
    qEntrefechas.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');

    qEntrefechas.SQL.aDD(' UNION select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                  '   from CAJADETALLES CA '+
                  '  inner join CAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                  '  inner join conceptos co on co.codigo = ca.coditem '+
                  '  inner join sobres s on s.codigo = co.OTROsobre where ((s.Codigo=:codigo) or (s.Depende=:Codigo)) and ca.coditem <> :alq1');

    qEntrefechas.ParamByName('Alq1').AsString := '01';
    qEntrefechas.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');

    qEntrefechas.SQL.Add (' UNION select CA1.IDTRANSACCION, CA1.CODINQ, CA1.CODITEM, CA1.FECHA, CA1.ITEM, CA1.periodo,  CA1.SALE, CA1.ENTRA, C1.TIPO, C1.LETRA, C1.NUMERO, c1.uSUARIO, s1.codigo as sobre, s1.descripcion as nombresobre '+
                  '   from CAJADETALLES CA1 '+
                  '  inner join CAJA C1 on CA1.IDTRANSACCION = C1.IDTRANSACCION '+
                  '  inner join conceptos co1 on co1.CODIGO = ca1.coditem '+
                  '  inner join sobres s1 on s1.codigo = co1.DESCUENTA where ((s1.Codigo=:codigo) or (s1.Depende=:Codigo)) ');
    qEntrefechas.SQL.Add(' and C1.Fecha >=:desde and C1.Fecha <=:Hasta ');
    qEntrefechas.SQL.Add ('union '+
     ' select CA2.IDTRANSACCION, CA2.CODINQ, CA2.CODITEM, CA2.FECHA, CA2.ITEM, CA2.PERIODO, CA2.ENTRA, '+
     '      CA2.SALE, C2.TIPO, C2.LETRA, '+
     '      C2.NUMERO, c2.uSUARIO,S2.CODIGO as SOBRE, S2.DESCRIPCION as NOMBRESOBRE '+
     ' from CAJADETALLES CA2 '+
     ' inner join CAJA C2 on CA2.IDTRANSACCION = C2.IDTRANSACCION '+
     ' inner join CONCEPTOS CO2 on CO2.CODIGO = CA2.CODITEM '+
     ' inner join SOBRES S2 on S2.CODIGO = CO2.SOBRE '+
     ' where ((s2.Codigo=:codigo) or (s2.Depende=:Codigo)) and ca2.coditem = :aLQ and ca2.entra > 0 ');
    qEntrefechas.ParamByName('aLQ').AsString := '01';
    qEntrefechas.SQL.Add(' and C2.Fecha >=:desde and C2.Fecha <=:Hasta ');

    qEntrefechas.SQL.Add ('union '+
               ' SELECT ALQ.IDTRANSACCION, ALQ.CODINQ, ALQ.CODITEM, ALQ.FECHA, ALQ.ITEM, ALQ.PERIODO, ALQ.ENTRA, ALQ.SALE - coalesce(COM.ENTRA,0) AS SALE, ALQ.TIPO, ALQ.LETRA, '+
               '        ALQ.NUMERO, ALQ.USUARIO, ALQ.SOBRE, ALQ.NOMBRESOBRE '+
               ' FROM ( '+
               ' select CA3.IDTRANSACCION, CA3.CODINQ, CA3.CODITEM, CA3.FECHA, CA3.ITEM, CA3.PERIODO, CA3.ENTRA, CA3.SALE, C3.TIPO, C3.LETRA, '+
               '        C3.NUMERO, C3.USUARIO, S3.CODIGO as SOBRE, S3.DESCRIPCION as NOMBRESOBRE '+
               ' from CAJADETALLES CA3 '+
               ' inner join CAJA C3 on CA3.IDTRANSACCION = C3.IDTRANSACCION '+
               ' inner join CONCEPTOS CO3 on CO3.CODIGO = CA3.CODITEM '+
               ' inner join SOBRES S3 on S3.CODIGO = CO3.SOBRE '+
               ' where ((s3.Codigo=:codigo) or (s3.Depende=:Codigo)) and ca3.coditem = :Alq3 and ca3.SALE > 0 ');
              qEntrefechas.SQL.Add(' and CA3.Fecha >=:desde and CA3.Fecha <=:Hasta ');

              qEntrefechas.SQL.Add('  ) AS ALQ                                                                            ');
              qEntrefechas.SQL.Add(' LEFT JOIN '+
               ' (select CA4.IDTRANSACCION, CA4.CODINQ, CA4.CODITEM, CA4.FECHA, CA4.ITEM, CA4.PERIODO, CA4.ENTRA, CA4.SALE, C4.TIPO, C4.LETRA, '+
               '        C4.NUMERO, C4.USUARIO, S4.CODIGO as SOBRE, S4.DESCRIPCION as NOMBRESOBRE '+
               ' from CAJADETALLES CA4 '+
               ' inner join CAJA C4 on CA4.IDTRANSACCION = C4.IDTRANSACCION '+
               ' inner join CONCEPTOS CO4 on CO4.CODIGO = CA4.CODITEM '+
               ' inner join SOBRES S4 on S4.CODIGO = CO4.SOBRE '+
               ' where CO4.DESCUENTA = :CODIGO and ca4.coditem = :COMision and ca4.ENTRA > 0 ');
              qEntrefechas.SQL.Add(' and CA4.Fecha >=:desde and CA4.Fecha <=:Hasta ');

              qEntrefechas.SQL.Add('  ) AS COM ');
              qEntrefechas.SQL.Add( ' ON ALQ.TIPO=COM.TIPO AND ALQ.LETRA=COM.LETRA AND ALQ.NUMERO=COM.NUMERO AND ALQ.FECHA=COM.FECHA AND ALQ.CODINQ=COM.CODINQ ');

    qEntrefechas.ParamByName('aLQ3').AsString := '01';
    qEntrefechas.ParamByName('Comision').AsString := '12';

    qEntrefechas.SQL.Add(' and alq.Fecha >=:desde and alq.Fecha <=:Hasta ');
    qEntrefechas.ParamByName('Desde').AsDatetime := qFechaSaldo.FieldByName('Fecha').AsDatetime + 1;
    qEntrefechas.ParamByName('Hasta').AsDatetime := Strtodatetime(edFechaDesde.Text)-1;

    qEntrefechas.SQL.Add(') Order by Fecha desc, Codinq, Coditem ');
//    q.SQL.Add(' Order by ca1.Codinq, ca1.Sobre, ca1.Coditem ');
    qEntrefechas.Prepared := True;

    qHistorico.SQL.Text := ' SELECT IDTRANSACCION, CODINQ, CODITEM, FECHA, ITEM, PERIODO, ENTRA, SALE, TIPO, LETRA, '+
              '  NUMERO, USUARIO, SOBRE, NOMBRESOBRE FROM ( '+
              ' select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
              '   from HISTORICOCAJADETALLES CA '+
              '  inner join HISTORICOCAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
              '  inner join conceptos co on co.codigo = ca.coditem '+
              '  inner join sobres s on s.codigo = co.sobre where ((s.Codigo=:codigo) or (s.Depende=:Codigo)) and ca.coditem <> :alq1';

    qHistorico.ParamByName('Alq1').AsString := '01';
    qHistorico.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');

    qHistorico.SQL.aDD(' UNION select CA.IDTRANSACCION, CA.CODINQ, CA.CODITEM, CA.FECHA, CA.ITEM, CA.periodo,  CA.ENTRA, CA.SALE, C.TIPO, C.LETRA, C.NUMERO, c.uSUARIO,s.codigo as sobre, s.descripcion as nombresobre '+
                  '   from HISTORICOCAJADETALLES CA '+
                  '  inner join HISTORICOCAJA C on CA.IDTRANSACCION = C.IDTRANSACCION '+
                  '  inner join conceptos co on co.codigo = ca.coditem '+
                  '  inner join sobres s on s.codigo = co.OTROsobre where ((s.Codigo=:codigo) or (s.Depende=:Codigo)) and ca.coditem <> :alq1');

    qHistorico.ParamByName('Alq1').AsString := '01';
    qHistorico.SQL.Add(' and C.Fecha >=:desde and C.Fecha <=:Hasta ');

    qHistorico.SQL.Add (' UNION select CA1.IDTRANSACCION, CA1.CODINQ, CA1.CODITEM, CA1.FECHA, CA1.ITEM, CA1.periodo,  CA1.SALE, CA1.ENTRA, C1.TIPO, C1.LETRA, C1.NUMERO, c1.uSUARIO, s1.codigo as sobre, s1.descripcion as nombresobre '+
                  '   from HISTORICOCAJADETALLES CA1 '+
                  '  inner join HISTORICOCAJA C1 on CA1.IDTRANSACCION = C1.IDTRANSACCION '+
                  '  inner join conceptos co1 on co1.CODIGO = ca1.coditem '+
                  '  inner join sobres s1 on s1.codigo = co1.DESCUENTA where ((s1.Codigo=:codigo) or (s1.Depende=:Codigo)) ');
    qHistorico.SQL.Add(' and C1.Fecha >=:desde and C1.Fecha <=:Hasta ');
    qHistorico.SQL.Add ('union '+
     ' select CA2.IDTRANSACCION, CA2.CODINQ, CA2.CODITEM, CA2.FECHA, CA2.ITEM, CA2.PERIODO, CA2.ENTRA, '+
     '      CA2.SALE, C2.TIPO, C2.LETRA, '+
     '      C2.NUMERO, c2.uSUARIO,S2.CODIGO as SOBRE, S2.DESCRIPCION as NOMBRESOBRE '+
     ' from HISTORICOCAJADETALLES CA2 '+
     ' inner join HISTORICOCAJA C2 on CA2.IDTRANSACCION = C2.IDTRANSACCION '+
     ' inner join CONCEPTOS CO2 on CO2.CODIGO = CA2.CODITEM '+
     ' inner join SOBRES S2 on S2.CODIGO = CO2.SOBRE '+
     ' where ((s2.Codigo=:codigo) or (s2.Depende=:Codigo)) and ca2.coditem = :aLQ and ca2.entra > 0 ');
    qHistorico.ParamByName('aLQ').AsString := '01';
    qHistorico.SQL.Add(' and C2.Fecha >=:desde and C2.Fecha <=:Hasta ');

    qHistorico.SQL.Add ('union '+
               ' SELECT ALQ.IDTRANSACCION, ALQ.CODINQ, ALQ.CODITEM, ALQ.FECHA, ALQ.ITEM, ALQ.PERIODO, ALQ.ENTRA, ALQ.SALE - coalesce(COM.ENTRA,0) AS SALE, ALQ.TIPO, ALQ.LETRA, '+
               '        ALQ.NUMERO, ALQ.USUARIO, ALQ.SOBRE, ALQ.NOMBRESOBRE '+
               ' FROM ( '+
               ' select CA3.IDTRANSACCION, CA3.CODINQ, CA3.CODITEM, CA3.FECHA, CA3.ITEM, CA3.PERIODO, CA3.ENTRA, CA3.SALE, C3.TIPO, C3.LETRA, '+
               '        C3.NUMERO, C3.USUARIO, S3.CODIGO as SOBRE, S3.DESCRIPCION as NOMBRESOBRE '+
               ' from HISTORICOCAJADETALLES CA3 '+
               ' inner join HISTORICOCAJA C3 on CA3.IDTRANSACCION = C3.IDTRANSACCION '+
               ' inner join CONCEPTOS CO3 on CO3.CODIGO = CA3.CODITEM '+
               ' inner join SOBRES S3 on S3.CODIGO = CO3.SOBRE '+
               ' where ((s3.Codigo=:codigo) or (s3.Depende=:Codigo)) and ca3.coditem = :Alq3 and ca3.SALE > 0 ');
              qHistorico.SQL.Add(' and CA3.Fecha >=:desde and CA3.Fecha <=:Hasta ');

              qHistorico.SQL.Add('  ) AS ALQ                                                                            ');
              qHistorico.SQL.Add(' LEFT JOIN '+
               ' (select CA4.IDTRANSACCION, CA4.CODINQ, CA4.CODITEM, CA4.FECHA, CA4.ITEM, CA4.PERIODO, CA4.ENTRA, CA4.SALE, C4.TIPO, C4.LETRA, '+
               '        C4.NUMERO, C4.USUARIO, S4.CODIGO as SOBRE, S4.DESCRIPCION as NOMBRESOBRE '+
               ' from HISTORICOCAJADETALLES CA4 '+
               ' inner join HISTORICOCAJA C4 on CA4.IDTRANSACCION = C4.IDTRANSACCION '+
               ' inner join CONCEPTOS CO4 on CO4.CODIGO = CA4.CODITEM '+
               ' inner join SOBRES S4 on S4.CODIGO = CO4.SOBRE '+
               ' where CO4.DESCUENTA = :CODIGO and ca4.coditem = :COMision and ca4.ENTRA > 0 ');
              qHistorico.SQL.Add(' and CA4.Fecha >=:desde and CA4.Fecha <=:Hasta ');

              qHistorico.SQL.Add('  ) AS COM ');
              qHistorico.SQL.Add( ' ON ALQ.TIPO=COM.TIPO AND ALQ.LETRA=COM.LETRA AND ALQ.NUMERO=COM.NUMERO AND ALQ.FECHA=COM.FECHA AND ALQ.CODINQ=COM.CODINQ ');

    qHistorico.ParamByName('aLQ3').AsString := '01';
    qHistorico.ParamByName('Comision').AsString := '12';
    qHistorico.SQL.Add(' and alq.Fecha >=:desde and alq.Fecha <=:Hasta ');
    qHistorico.ParamByName('Desde').AsDatetime := Strtodatetime('01/01/2000');
    qHistorico.ParamByName('Hasta').AsDatetime := qFechaSaldo.FieldByName('Fecha').AsDatetime;

    qHistorico.SQL.Add(') Order by Fecha desc, Codinq, Coditem ');
    qHistorico.Prepared := True;


    gDetalle.Vaciar;
    qSobres.SQL.Text := 'Select Codigo, Descripcion from sobres Where Codigo = :Sobre or Depende = :Sobre';
    qSobres.Parambyname('Sobre').AsInteger := ToInt(edtSobreDestino.Text);
    qSobres.Open;


    I := 1;
    while not qSobres.Eof do
    begin
      if qSobres.FieldByName('Codigo').AsInteger <> ToInt(edtSobreDestino.Text) then
      begin
        qSobres.Next;
        Continue;
      end;

      q.Close;
      q.Parambyname('Codigo').AsInteger := qSobres.FieldByName('Codigo').AsInteger;
      q.Open;

      qEntreFechas.Close;
      qEntreFechas.Parambyname('Codigo').AsInteger := qSobres.FieldByName('Codigo').AsInteger;
      qEntreFechas.Open;

      if chSaldoAnterior.Checked then
      begin
        qHistorico.Close;
        qHistorico.Parambyname('Codigo').AsInteger := qSobres.FieldByName('Codigo').AsInteger;
        qHistorico.Open;

        SumaHistorico := 0;
        while Not qHistorico.Eof do
        begin
          SumaHistorico := SumaHistorico + qHistorico.FieldByName('Entra').asFloat - qHistorico.FieldByName('Sale').AsFloat;
          qHistorico.Next;
        end;
        while Not qEntreFechas.Eof do
        begin
          SumaHistorico := SumaHistorico + qEntreFechas.FieldByName('Entra').asFloat - qEntreFechas.FieldByName('Sale').AsFloat;
          qEntreFechas.Next;
        end;

        gDetalle.ColorRow[i] := clSkyBlue;
        gDetalle.Cells[2,I] := 'Saldo Anterior: ';

        if SumaHistorico > 0 then
          gDetalle.Cells[3,I] := FormatFloat('0.00', SumaHistorico)
        else
          gDetalle.Cells[4,I] := FormatFloat('0.00', SumaHistorico * -1);

        Inc(I);
      end;

      SobreAnt := -1;
      while not q.eof do
      begin
        if (SobreAnt <> -1) and (SobreAnt <> q.Fieldbyname('Sobre').AsInteger) then
        begin
          if Saldo >= 0 then
            gDetalle.Cells[3,Fila] := FormatFloat('0.00',Saldo)
          else
            gDetalle.Cells[4,Fila] := FormatFloat('0.00',Saldo);
          Saldo := 0;
        end;

        if SobreAnt <> q.Fieldbyname('Sobre').AsInteger then
        begin
          gDetalle.ColorRow[I] := clSkyBlue;
          gDetalle.Cells[2,I] := q.FieldByName('NombreSobre').AsString;
          Fila := I;
          Inc(I);
        end;

        gDetalle.Cells[0,I] := FormatDatetime('dd/mm/yyyy', q.FieldByName('Fecha').AsDatetime);
        gDetalle.Cells[1,I] := q.FieldByName('Codinq').AsString;
        gDetalle.Cells[2,I] := q.FieldByName('ITem').AsString  + ' ' + q.FieldByName('Periodo').AsString;
        gDetalle.Cells[3,I] := FormatFloat('0.00',q.FieldByName('Entra').AsFloat);
        gDetalle.Cells[4,I] := FormatFloat('0.00',q.FieldByName('Sale').AsFloat);
        gDetalle.Cells[6,I] := q.FieldByName('IDTransaccion').AsString;
        gDetalle.Cells[10,I] := q.FieldByName('Coditem').AsString;
        gDetalle.Cells[12,I] := q.FieldByName('uSUARIO').AsString;

        if q.FieldByName('Tipo').AsString = 'FA'  then
          gDetalle.Cells[7,I] := 'Factura'
        else if q.FieldByName('Tipo').AsString = 'LI'  then
          gDetalle.Cells[7,I] := 'Liquidación'
        else if q.FieldByName('Tipo').AsString = 'RE'  then
          gDetalle.Cells[7,I] := 'Recibo'
        else if q.FieldByName('Tipo').AsString = 'MA'  then
          gDetalle.Cells[7,I] := 'Manual';

        gDetalle.Cells[8,I] := q.FieldByName('Letra').AsString;
        gDetalle.Cells[9,I] := FormatFloat('0000-00000000', q.FieldByName('Numero').AsFloat);
        Saldo := Saldo + q.FieldByName('Entra').AsFloat - q.FieldByName('Sale').AsFloat;
        Suma := Suma + q.FieldByName('Entra').AsFloat - q.FieldByName('Sale').AsFloat;
        SobreAnt := q.FieldbyName('Sobre').AsInteger;
        Inc(I);

        if I < 2 then
          gDetalle.RowCount := 2
        else
          gDetalle.RowCount := I;
        q.Next;
      end;

      qSobres.Next;
    end;

    if Saldo >= 0 then
      gDetalle.Cells[3,Fila] := FormatFloat('0.00',Saldo)
    else
      gDetalle.Cells[4,Fila] := FormatFloat('0.00',Saldo);

    edtTotal.Text := FormatFloat('0.00', Suma + SumaHistorico);

    if chSoloSaldos.Checked then
    begin
      for I := 1 to gDetalle.RowCount - 1 do
        if gDetalle.ColorRow[I] <> clSkyBlue then
          gDetalle.RowHeights[I] := -1;
    end
    else
      for I := 1 to gDetalle.RowCount - 1 do
        gDetalle.RowHeights[I] := 17;

  finally
    FreeAndNil(q);
    FreeAndNil(qSobres);
    FreeAndNil(qEntreFechas);
  end;
end;

procedure TfConsultarSobre.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsultarSobre.cboSobreChange(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    q.SQL.Text := ' Select codigo from sobres where descripcion = :Descripcion';
    q.ParamByName('Descripcion').AsString := cboSobre.Text;
    q.Open;

    edtSobreDestino.Text := q.FieldByName('Codigo').AsString;
    General.Caption := cboSobre.Text;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfConsultarSobre.chSoloSaldosClick(Sender: TObject);
var
  I: Integer;
begin
  if chSoloSaldos.Checked then
  begin
    for I := 1 to gDetalle.RowCount - 1 do
      if gDetalle.ColorRow[I] <> clSkyBlue then
        gDetalle.RowHeights[I] := -1;
  end
  else
    for I := 1 to gDetalle.RowCount - 1 do
      gDetalle.RowHeights[I] := 17;
end;

procedure TfConsultarSobre.edFechaDesdeKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    if Length(edFechaDesde.Text)=6 then
      edFechaDesde.Text := TransformaFecha(edFechaDesde.Text);

    if edFechaDesde.Text = '' then
      edFechaDesde.Text := FormatDateTime('dd/mm/yyyy', Date);
    edFechaHasta.SetFocus;
  end;
end;

procedure TfConsultarSobre.edFechaHastaKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (CharInSet(Key, ['0'..'9', #8, #13, '/'])) then
    Key := #0;

  if Key = #13 then
  begin
    if Length(edFechaHasta.Text)=6 then
      edFechaHasta.Text := TransformaFecha(edFechaHasta.Text);

    if edFechaHasta.Text = '' then
      edFechaHasta.Text := FormatDateTime('dd/mm/yyyy', Date);
    edtSobreDestino.SetFocus;
  end;
end;

procedure TfConsultarSobre.edtSobreDestinoKeyPress(Sender: TObject;
  var Key: Char);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try

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
            ' Select Descripcion from sobres where Codigo = :Codigo Order by Descripcion';
          q.ParamByName('Codigo').AsString := edtSobreDestino.Text;
          q.Open;

          cboSobre.ItemIndex := cboSobre.items.indexof(q.FieldByName('Descripcion').AsString);
        end;
      General.Caption := cboSobre.Text;
    end;
  finally
    FreeAndNil(q);
  end;
end;

procedure TfConsultarSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConsultarSobre := nil;
  Action := caFree;
end;

procedure TfConsultarSobre.FormCreate(Sender: TObject);
var
  q: TFXQuery;
begin
  q := CrearQuery;
  try
    fPrincipal.Center(Self);
    q.SQL.Text := 'Select * from sobres order by Descripcion';
    q.Open;

    while not q.Eof do
    begin
      cboSobre.items.Add(q.FieldByName('Descripcion').AsString);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

end.
