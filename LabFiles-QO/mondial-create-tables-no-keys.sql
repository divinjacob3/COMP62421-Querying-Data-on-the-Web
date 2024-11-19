
CREATE TABLE Country
(Name VARCHAR2(50) NOT NULL,
 Code VARCHAR2(4),
 Capital VARCHAR2(50),
 Province VARCHAR2(50),
 Area NUMBER CONSTRAINT CountryArea
   CHECK (Area >= 0),
 Population NUMBER CONSTRAINT CountryPop
   CHECK (Population >= 0));

CREATE TABLE City
(Name VARCHAR2(50),
 Country VARCHAR2(4),
 Province VARCHAR2(50),
 Population NUMBER CONSTRAINT CityPop
   CHECK (Population >= 0),
 Latitude NUMBER CONSTRAINT CityLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude NUMBER CONSTRAINT CityLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)) ,
 Elevation NUMBER);

CREATE TABLE Province
(Name VARCHAR2(50) CONSTRAINT PrName NOT NULL ,
 Country  VARCHAR2(4) CONSTRAINT PrCountry NOT NULL ,
 Population NUMBER CONSTRAINT PrPop
   CHECK (Population >= 0),
 Area NUMBER CONSTRAINT PrAr
   CHECK (Area >= 0),
 Capital VARCHAR2(50),
 CapProv VARCHAR2(50));

CREATE TABLE Economy
(Country VARCHAR2(4),
 GDP NUMBER CONSTRAINT EconomyGDP
   CHECK (GDP >= 0),
 Agriculture NUMBER,
 Service NUMBER,
 Industry NUMBER,
 Inflation NUMBER,
 Unemployment NUMBER);

CREATE TABLE Population
(Country VARCHAR2(4),
 Population_Growth NUMBER,
 Infant_Mortality NUMBER);

CREATE TABLE Politics
(Country VARCHAR2(4),
 Independence DATE,
 WasDependent VARCHAR2(50),
 Dependent  VARCHAR2(4),
 Government VARCHAR2(120));

CREATE TABLE Language
(Country VARCHAR2(4),
 Name VARCHAR2(50),
 Percentage NUMBER CONSTRAINT LanguagePercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE Religion
(Country VARCHAR2(4),
 Name VARCHAR2(50),
 Percentage NUMBER CONSTRAINT ReligionPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE EthnicGroup
(Country VARCHAR2(4),
 Name VARCHAR2(50),
 Percentage NUMBER CONSTRAINT EthnicPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE Countrypops
(Country VARCHAR2(4),
 Year NUMBER CONSTRAINT CountryPopsYear
   CHECK (Year >= 0),
 Population NUMBER CONSTRAINT CountryPopsPop
   CHECK (Population >= 0));

CREATE TABLE Provpops
(Province VARCHAR2(50),
 Country VARCHAR2(4),
 Year NUMBER CONSTRAINT ProvPopsYear
   CHECK (Year >= 0),
 Population NUMBER CONSTRAINT ProvPopsPop
   CHECK (Population >= 0));

CREATE TABLE Citypops
(City VARCHAR2(50),
 Country VARCHAR2(4),
 Province VARCHAR2(50),
 Year NUMBER CONSTRAINT CityPopsYear
   CHECK (Year >= 0),
 Population NUMBER CONSTRAINT CityPopsPop
   CHECK (Population >= 0));

CREATE TABLE Continent
(Name VARCHAR2(20),
 Area NUMBER(10));

CREATE TABLE borders
(Country1 VARCHAR2(4),
 Country2 VARCHAR2(4),
 Length NUMBER 
   CHECK (Length > 0));

CREATE TABLE encompasses
(Country VARCHAR2(4) NOT NULL,
 Continent VARCHAR2(20) NOT NULL,
 Percentage NUMBER,
   CHECK ((Percentage > 0) AND (Percentage <= 100)));

CREATE TABLE Organization
(Abbreviation VARCHAR2(12),
 Name VARCHAR2(100) NOT NULL,
 City VARCHAR2(50) ,
 Country VARCHAR2(4) , 
 Province VARCHAR2(50) ,
 Established DATE);

CREATE TABLE isMember
(Country VARCHAR2(4),
 Organization VARCHAR2(12),
 Type VARCHAR2(60) DEFAULT 'member');

CREATE TABLE Mountain
(Name VARCHAR2(50),
 Mountains VARCHAR2(50),
 Elevation NUMBER,
 Type VARCHAR2(10),
 Latitude NUMBER CONSTRAINT MountainLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude NUMBER CONSTRAINT MountainLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)));

CREATE TABLE Desert
(Name VARCHAR2(50),
 Area NUMBER,
 Latitude NUMBER CONSTRAINT DesertLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude NUMBER CONSTRAINT DesertLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)));

CREATE TABLE Island
(Name VARCHAR2(50),
 Islands VARCHAR2(50),
 Area NUMBER CONSTRAINT IslandAr check (Area >= 0),
 Elevation NUMBER,
 Type VARCHAR2(10),
Latitude NUMBER CONSTRAINT IslandLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude NUMBER CONSTRAINT IslandLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)));

CREATE TABLE Lake
(Name VARCHAR2(50),
 Area NUMBER CONSTRAINT LakeAr CHECK (Area >= 0),
 Depth NUMBER CONSTRAINT LakeDpth CHECK (Depth >= 0),
 Elevation NUMBER,
 Type VARCHAR2(12),
 River VARCHAR2(50),
Latitude NUMBER CONSTRAINT LakeLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude NUMBER CONSTRAINT LakeLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)));

CREATE TABLE Sea
(Name VARCHAR2(50),
 Depth NUMBER CONSTRAINT SeaDepth CHECK (Depth >= 0));

CREATE TABLE River
(Name VARCHAR2(50),
 River VARCHAR2(50),
 Lake VARCHAR2(50),
 Sea VARCHAR2(50),
 Length NUMBER CONSTRAINT RiverLength
   CHECK (Length >= 0),
SourceLatitude NUMBER CONSTRAINT SourceLat
   CHECK ((SourceLatitude >= -90) AND (SourceLatitude <= 90)) ,
SourceLongitude NUMBER CONSTRAINT SourceLon
   CHECK ((SourceLongitude >= -180) AND (SourceLongitude <= 180)),
   Mountains VARCHAR2(50),
 SourceElevation NUMBER,
EstuaryLatitude NUMBER CONSTRAINT EstuaryLat
   CHECK ((EstuaryLatitude >= -90) AND (EstuaryLatitude <= 90)) ,
EstuaryLongitude NUMBER CONSTRAINT EstuaryLon
   CHECK ((EstuaryLongitude >= -180) AND (EstuaryLongitude <= 180)),
 CONSTRAINT RivFlowsInto 
     CHECK ((River IS NULL AND Lake IS NULL)
            OR (River IS NULL AND Sea IS NULL)
            OR (Lake IS NULL AND Sea is NULL)));

CREATE TABLE RiverThrough
(River VARCHAR2(50),
 Lake  VARCHAR2(50));

CREATE TABLE geo_Mountain
(Mountain VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE geo_Desert
(Desert VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE geo_Island
(Island VARCHAR2(50) , 
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE geo_River
(River VARCHAR2(50) , 
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE geo_Sea
(Sea VARCHAR2(50) ,
 Country VARCHAR2(4),
 Province VARCHAR2(50));

CREATE TABLE geo_Lake
(Lake VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE geo_Source
(River VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE geo_Estuary
(River VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 Province VARCHAR2(50));

CREATE TABLE mergesWith
(Sea1 VARCHAR2(50) ,
 Sea2 VARCHAR2(50));

CREATE TABLE located
(City VARCHAR2(50) ,
 Province VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 River VARCHAR2(50),
 Lake VARCHAR2(50),
 Sea VARCHAR2(50) );

CREATE TABLE locatedOn
(City VARCHAR2(50) ,
 Province VARCHAR2(50) ,
 Country VARCHAR2(4) ,
 Island VARCHAR2(50));

CREATE TABLE islandIn
(Island VARCHAR2(50) ,
 Sea VARCHAR2(50) ,
 Lake VARCHAR2(50) ,
 River VARCHAR2(50) );

CREATE TABLE MountainOnIsland
(Mountain VARCHAR2(50),
 Island  VARCHAR2(50));

CREATE TABLE Airport
(IATACode VARCHAR(3),
 Name VARCHAR2(100) ,
 Country VARCHAR2(4) ,
 City VARCHAR2(50) ,
 Province VARCHAR2(50) ,
 Island VARCHAR2(50) ,
 Latitude NUMBER CONSTRAINT AirpLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude NUMBER CONSTRAINT AirpLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)) ,
 Elevation NUMBER ,
 gmtOffset NUMBER );
