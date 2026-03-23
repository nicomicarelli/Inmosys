unit objLiquidaciones;

interface
uses generics.Collections;

type
  TobjMasItem = class
  public
    Codinq: string;
    fecha: string;
    item: string;
    periodo: string;
    Importe: string;
    codpro: string;
    coditem: string;
    clave: string;
    tipoingreso: string;
    registro: integer;
    dnipropietario: string;
    referente: string;
    constructor crear;
  end;

  ListaMasItems = TList<TobjMasITem>;

  TobjMasItems = Class(ListaMasItems);

implementation

{ objMasItem }

constructor TobjMasItem.crear;
begin
    Codinq := '';
    fecha := '';
    item := '';
    periodo := '';
    Importe := '';
    codpro := '';
    coditem := '';
    clave := '';
    tipoingreso := '';
    dnipropietario := '';
    referente := '';
    registro:= 0 ;

end;

end.
