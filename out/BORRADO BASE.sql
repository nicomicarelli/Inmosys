delete from itemautom i where i.fecha <= '20220101';

delete from anomalias i where i.fecha <= '01/01/2022';

delete from automatizados i where i.ano < '2022';

delete from cabezacedulones i where i.anio < '2022';
delete from CUERPOCEDULONES i where i.anio < '2022';

delete from cabezarecibos i where i.fecha < '01/01/2022';
delete from cUERPOrecibos i where i.fecha < '01/01/2022';

DELETE FROM CIERRESCAJA;
DELETE FROM CIERRESCAJADETALLES;







