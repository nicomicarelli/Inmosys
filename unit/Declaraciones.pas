unit Declaraciones;

interface
uses
  SysUtils, Forms, Windows, Classes,frmframeCajas, Generics.Collections,
  ComCtrls;

type
  TTipoOperacion = (toNuevo, toModificar, toEliminar, toMostrar, toCopia, toCopiaFiel, toCopiaLimpia);

  TTipoImpuesto = (tiAgua, tiMuni, tiDGR, tiExpensas, tiITSI,tiNinguno);
  TVista        = (tvVistaPrevia, tvExcel);
  TMeses = (ENE, FEB, MAR, ABR, MAY, JUN, JUL, AGO, SEP, OCT, NOV, DIC);
  TTipoTransaccion = (ttInquilino, ttPropietario, ttOtra);
  TBusqueda = (Codinq, Propietario, Inquilino, Ubicacion);
  TPantallaActiva = (paPagadosCobrados, paPagadosNoCobrados, paCobradosNoPagados,
    paImpuestosPagados, paDevolverDinero);
  TComisiones = class
  private
    FFecha:   string;
    FCodigo:  string;
    FImporte: string;
    FCelda:   Integer;
  public
    property Fecha: string read FFecha write FFecha;
    property Codigo: string read FCodigo write FCodigo;
    property Importe: string read FImporte write FImporte;
    property Celda: Integer read FCelda write FCelda;
  end;

  TImpuestos = class
  private
    FFecha:    string;
    FCodigo:   string;
    FImporte:  string;
    FImpuesto: TTipoImpuesto;
    FCelda:    Integer;
  public
    property Fecha: string read FFecha write FFecha;
    property Codigo: string read FCodigo write FCodigo;
    property Importe: string read FImporte write FImporte;
    property Impuesto: TTipoImpuesto read FImpuesto write FImpuesto;
    property Celda: Integer read FCelda write FCelda;
  end;

  TResumen = record
    FComisiones: string;
    FImpuestos:  string;
    FPropietario: string;
    FUsoDiario:  string;
    FSellado:    string;
    FVarios:     string;
    FCabanillas: string;
    FGarcia:     string;
  end;

  TSobre = Class
    Codigo: string;
    Descripcion: string;
    F: TFraCaja;
    R: TFraCaja;
    Pgc: TPageControl;
    Tbs: TTabSheet;
    Total: Double;
  End;

  tListaSobres = TList<TSobre>;
var
  DecimalSeparator: char;
  ThousandSeparator: char;

//  const
//    DLL_Menu = Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-4)+'\Librerias\Menues.dll';

implementation

{ TResumen }


end.
