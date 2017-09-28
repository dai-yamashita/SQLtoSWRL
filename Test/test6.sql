SELECT 
n_name as SUPP_NATION, 
n_name as CUST_NATION, 
date_part('year', l_shipdate) as l_year,
SUM(l_extendedprice * (1 - l_discount)) AS volume
FROM 
SUPPLIER, LINEITEM, ORDERS, CUSTOMER, NATION
WHERE 
S_SUPPKEY = L_SUPPKEY AND 
O_ORDERKEY = L_ORDERKEY AND 
C_CUSTKEY = O_CUSTKEY AND 
S_NATIONKEY = N_NATIONKEY AND 
(N_NAME = 'FRANCE' OR N_NAME = 'GERMANY') AND
L_SHIPDATE BETWEEN date '1991-01-01' AND date '1998-12-31'
GROUP BY 
SUPP_NATION, CUST_NATION, L_YEAR
ORDER BY 
SUPP_NATION, CUST_NATION, L_YEAR;