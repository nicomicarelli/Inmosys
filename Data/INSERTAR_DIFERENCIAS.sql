SET TERM ^ ;

create or alter procedure SP_INSERTARDIFERENCIAS (
    CODIGOVALE integer)
returns (
    CODINQ varchar(5),
    CODITEM varchar(3),
    DESCRIPCION varchar(100),
    PROPIETARIO varchar(100),
    ITEM varchar(100),
    PERIODO varchar(100),
    DIFERENCIA double precision,
    CLAVEREGISTRO varchar(16),
    POSICION integer,
    FECHA varchar(8),
    DIFSTRING varchar(100))
as
declare variable CEDULON double precision;
begin
  for Select cu.codinq, cu.descripcion, cu.codigoitem, cu.entra - CU.Sale as Diferencia, I.propietario
  from cuerpovales cu
 inner join cabezavales ca on ca.codigo=cu.codigo
 inner join inmuebles I on Cu.codinq = I.codinq
 where ca.cerrado = 0
   and ca.codigoempresa in (1,2,3)
   and cu.entra - cu.Sale > 0
   AND CA.CODIGO = :codigovale
  into :codinq, :descripcion, :coditem, :DIFERENCIA, :propietario do
  begin
    descripcion = CAST(descripcion AS VARCHAR(100));

    if (:coditem = '09') then
    begin
      item = 'IMP Y/O SERVICIOS';
      PERIODO = REPLACE(:descripcion, 'IMP Y/O SERVICIOS ', '');
      FECHA = '20250605';
    end
    else
    begin
      item = 'IMPUESTOS A DESCONTAR';
      PERIODO = REPLACE(:descripcion, 'IMPUESTOS A DESCONTAR ', '');
      FECHA = '20250610';
    end

    DIFSTRING = CAST(DIFERENCIA AS VARCHAR(100));
    POSICION = POSITION('.', DIFSTRING);
    DIFSTRING = SUBSTRING(difstring FROM 1 FOR posicion + 2);

   INSERT INTO ITEMAUTOM (CODINQ, FECHA, ITEM, PERIODO, IMPORTE, CODPRO, CODITEM, CLAVE,
      TIPOINGRESO, REGISTRO, USUARIO)
   VALUES (:CODINQ, :FECHA, :ITEM, :PERIODO,
     :DIFSTRING, :PROPIETARIO, :CODITEM, :FECHA||:CODINQ||:CODITEM, '3', (SELECT MAX(REGISTRO) + 1 FROM ITEMAUTOM), 'ADMIN');
  END
END^

SET TERM ; ^
