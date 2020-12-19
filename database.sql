83149300

Denmark	5822763
Norway	5367580
Sweden	10338368
Belarus	207600
Ghana	238533
Guinea	245857
Guyana	214969
Laos	236800
Romania	238391
Uganda	241550
United Kingdom	242900

SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

Table-E
Albania	3200000
Algeria	32900000

SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

name	length(name)
Italy	5
Malta	5
Spain	5

Andorra	936

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

name	continent	population
Afghanistan	Asia	32225560
Albania	Europe	2845955
Algeria	Africa	43000000
Andorra	Europe	77543
Angola	Africa	31127674
Antigua and Barbuda	Caribbean	96453
Argentina	South America	44938712
Armenia	Eurasia	2957500
Australia	Oceania	25690023
Austria	Europe	8902600
Azerbaijan	Asia	10067108
Bahamas	Caribbean	385340
Bahrain	Asia	1543300
Bangladesh	Asia	168506944
Barbados	Caribbean	287025
Belarus	Europe	9408400
Belgium	Europe	11524454
Belize	North America	408487
Benin	Africa	11733059
Bhutan	Asia	741672
Bolivia	South America	11469896
Bosnia and Herzegovina	Europe	3301000
Botswana	Africa	2338851
Brazil	South America	211442625
Brunei	Asia	442400
Bulgaria	Europe	6951482
Burkina Faso	Africa	20870060
Burundi	Africa	10953317
Cabo Verde	Africa	491875
Cambodia	Asia	15288489
Cameroon	Africa	26545864
Canada	North America	38007166
Central African Republic	Africa	5496011
Chad	Africa	16244513
Chile	South America	19107216
China	Asia	1402378640
Colombia	South America	49395678
Comoros	Africa	873724
Congo, Democratic Republic of	Africa	69360000
Congo, Republic of	Africa	4559000
Costa Rica	North America	5058007
Côte d'Ivoire	Africa	23919000
Croatia	Europe	4076246
Cuba	Caribbean	11209628
Cyprus	Asia	875900
Czech Republic	Europe	10693939
Denmark	Europe	5822763
Djibouti	Africa	1078373
Dominica	Caribbean	71808
Dominican Republic	Caribbean	10358320
Results truncated. Only the first 50 rows have been shown.

name
Brazil
China
India
Indonesia
Nigeria
Pakistan
United States
