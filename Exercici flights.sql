 -- set schema usairlineflights2 as default schema -- 
 -- Inicio --
Select * from flights;
/* 1 - Quantitat de registres de la taula de vols:
    hi ha 4910 registros */
SELECT COUNT(FlightNum) FROM flights;
/*2 - Retard promig de sortida i arribada segons l’aeroport origen.*/
Select Origin, avg (DepDelay), avg (ArrDelay) FROM flights group by Origin order by origin asc;
/* 3 - Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. A més, volen
     que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files):
      A l'exercici surt diferent al que requereix LAX, 2000, 02, 30 inclou dia y mes */
Select Origin, colYear, colMonth, DayofMonths,
avg (DepDelay), avg (ArrDelay)
FROM flights group by Origin, colYear, colMonth, DayofMonths;
/* 4 - Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
     consulta que abans i amb el mateix ordre).
     Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat.
      Los Angeles, 2000, 01, retard*/
select city, colYear, colMonth, DayofMonths,
avg (arrdelay), avg (depdelay)
from usairports, flights;
/* 5 - Les companyies amb més vols cancelats.
     A més, han d’estar ordenades de forma que les companyies
     amb més cancel·lacions apareguin les primeres.*/
select description, cancelled from carriers, flights order by cancelled desc;
/* 6 - L’identificador dels 10 avions que més distància han recorregut fent vols */
select flightid,distance from flights order by distance desc limit 10;
/* 7 - Companyies amb el seu retard promig només d’aquelles les quals els seus
       vols arriben al seu destí amb un retràs promig major de 10 minuts. */
select description,
avg (arrdelay)
from carriers,flights
where arrdelay > 10;