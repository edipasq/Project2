CREATE TABLE "drug_crimes" (
	"index" INT NOT NULL,
    "state" VARCHAR(2) NOT NULL,
    "year" INT   NOT NULL,
    "number_of_crimes" INT   NOT NULL,
    "number_f" INT   NOT NULL,
    "number_m" INT   NOT NULL,
    CONSTRAINT COMPK PRIMARY KEY ("state","year")
); 


CREATE TABLE "overdose_deaths" (
	"index" INT NOT NULL,
    "state" VARCHAR(2)   NOT NULL,
    "year" INT   NOT NULL,    
    "number_of_deaths" INT   NOT NULL,
    "indicator" VARCHAR(255) NOT NULL,
    "name_of_state" VARCHAR(255) NOT NULL,
    CONSTRAINT COMPK2 PRIMARY KEY ("state","year")
);


   
