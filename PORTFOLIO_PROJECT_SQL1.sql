/*List of houses with 3 or more bedrooms*/

SELECT house_size, acre_lot, bed, bath, city
FROM `realtor-data.zip`
WHERE BED > 3;

/*AVERAGE HOUSING PRICES*/
SELECT city, CAST(AVG(price) AS DECIMAL(10,2)) AS AVGPRICE
FROM `realtor-data.zip`
GROUP BY city
ORDER BY AVG(price) DESC;`realtor-data.zip`;

/*MOST EXPENSIVE PROPERTIES*/
SELECT *
FROM `realtor-data.zip`
ORDER BY PRICE DESC LIMIT 10;

/*LEAST EXPENSIVE PROPERTIES*/
SELECT *
FROM `realtor-data.zip`
ORDER BY price ASC LIMIT 10 ;

/*NO. OF BEDROOM DISTRIBUTION*/
SELECT BED, COUNT(*) AS COUNT
FROM`realtor-data.zip`
GROUP BY bed
ORDER BY BED;

/*PRICE PER BEDROOM*/
SELECT bed, CAST(AVG(price/bed) AS DECIMAL(10,2)) AS AvgPricePerBed
FROM `realtor-data.zip`
GROUP BY bed
ORDER BY BED ASC;

/*PRICE PER AREA*/
SELECT acre_lot, price,ROUND(AVG(price/acre_lot), 2) AS AvgPricePerAcreLot, zip_code
FROM `realtor-data.zip`
GROUP BY zip_code, acre_lot, price
ORDER BY AvgPricePerAcreLot DESC;

/*PRICE BY ZIPCODE*/
SELECT zip_code, AVG(PricE) AS AvgPrice
FROM `realtor-data.zip`
GROUP BY zip_code;

/*NO. OF HOMES IN EACH CITY*/
SELECT city, COUNT(*) AS TotalHomes
FROM `realtor-data.zip`
GROUP BY city;

/*RANK HOUSES BY PRICE*/
SELECT *, RANK() OVER (PARTITION BY city ORDER BY price DESC) AS price_rank
FROM `realtor-data.zip`;

/*CATEGORIZING HOMES BASED ON PRICE*/
SELECT city, acre_lot, zip_code, price,
  CASE 
    WHEN price < 100000 THEN 'Low'
    WHEN price BETWEEN 100000 AND 200000 THEN 'Medium'
    ELSE 'High'
  END AS price_range
FROM `realtor-data.zip`;

/*HOME PRICE DISTRIBUTION OVER SIZE, ACRE AND CITY*/
select house_size, acre_lot, city, avg(price) as AvgPrice
from`realtor-data.zip`
group by city, house_size, acre_lot
order by avgprice desc;

/*AVERAGE PRICE OF HOUSES IN EACH ZIPCODE HAVING MORE THAN 10 HOUSES*/
SELECT zip_code, AVG(price) AS avg_price
FROM `realtor-data.zip`
GROUP BY zip_code
HAVING COUNT(*) > 10;


/*TOTAL AREA COVERED BY HOMES IN EACH CITY*/
SELECT city, SUM(house_size) AS total_area
FROM `realtor-data.zip`
GROUP BY city;

/*PRICE RANGE IN EACH ZIPCODE*/
SELECT ZIP_CODE, MAX(price) - MIN(price) AS price_range
FROM `realtor-data.zip`
GROUP BY zip_code;

SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM housing_data) AS percentage_with_4_bedrooms
FROM housing_data
WHERE bedrooms >= 4;






