-- Adapted from export from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GAwvkn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE eada(
    "unitid" VARCHAR(6) PRIMARY KEY,
    "institution_name" VARCHAR NOT NULL,
    "addr1_txt" VARCHAR,
    "addr2_txt" VARCHAR,
    "city_txt" VARCHAR,
    "state_cd" VARCHAR(2),
    "zip_text" VARCHAR(9),
    "ClassificationCode" VARCHAR(2)   NOT NULL,
    "classification_name" VARCHAR   NOT NULL,
    "ClassificationOther" VARCHAR,
    "EFMaleCount" INT   NOT NULL,
    "EFFemaleCount" INT   NOT NULL,
    "EFTotalCount" INT   NOT NULL,
    "sector_cd" VARCHAR(2),
    "sector_name" VARCHAR,
    "RECRUITEXP_MEN" BIGINT,
    "RECRUITEXP_TOTAL" BIGINT,
    "GRND_TOTAL_REVENUE" BIGINT,
    "GRND_TOTAL_EXPENSE" BIGINT,
    "OPEXPPERTEAM_MEN_Baseball" BIGINT,
    "OPEXPPERTEAM_MEN_Bskball" BIGINT,
    "REV_MEN_Baseball" BIGINT,
    "REV_MEN_Bskball" BIGINT,
    "EXP_MEN_Baseball" BIGINT,
    "EXP_MEN_Bskball" BIGINT,
	"lat" NUMERIC(6,3)   NOT NULL,
	"lon" NUMERIC(6,3)   NOT NULL
);

CREATE TABLE "nba_geo" (
    "team" VARCHAR  PRIMARY KEY,
    "city" VARCHAR   NOT NULL,
    "state_cd" VARCHAR(2)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "stadium_lat" NUMERIC(6,3)   NOT NULL,
    "stadium_long" NUMERIC(6,3)   NOT NULL
);

CREATE TABLE "mlb_geo" (
    "team" VARCHAR   PRIMARY KEY,
    "city" VARCHAR   NOT NULL,
    "state_cd" VARCHAR(2)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "stadium_lat" NUMERIC(6,3)   NOT NULL,
    "stadium_long" NUMERIC(6,3)   NOT NULL
);

CREATE TABLE "school_geo" (
    "unitid" VARCHAR(6)  REFERENCES eada(unitid),
    "institution_name" VARCHAR,
	"state_cd" VARCHAR(2) NOT NULL,
    "lat" NUMERIC(6,3)   NOT NULL,
    "lon" NUMERIC(6,3)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "nearest_mlb" VARCHAR REFERENCES mlb_geo("team"),
    "nearest_mlb_dist" NUMERIC(6,1)   NOT NULL,
    "nearest_nba" VARCHAR REFERENCES nba_geo("team"),
    "nearest_nba_dist" NUMERIC(6,1)   NOT NULL
);


