-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GAwvkn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "eada" (
    "unitid" VARCHAR(6)   NOT NULL,
    "institution_name" VARCHAR   NOT NULL,
    "addr1_txt" VARCHAR   NOT NULL,
    "addr2_txt" VARCHAR   NOT NULL,
    "city_txt" VARCHAR   NOT NULL,
    "state_cd" VARCHAR(2)   NOT NULL,
    "zip_text" VARCHAR(9)   NOT NULL,
    "ClassificationCode" VARCHAR(2)   NOT NULL,
    "classification_name" VARCHAR   NOT NULL,
    "ClassificationOther" VARCHAR   NOT NULL,
    "EFMaleCount" INT   NOT NULL,
    "EFFemaleCount" INT   NOT NULL,
    "EFTotalCount" INT   NOT NULL,
    "sector_cd" VARCHAR(2)   NOT NULL,
    "sector_name" VARCHAR   NOT NULL,
    "RECRUITEXP_MEN" BIGINT   NOT NULL,
    "RECRUITEXP_TOTAL" BIGINT   NOT NULL,
    "GRND_TOTAL_REVENUE" BIGINT   NOT NULL,
    "GRND_TOTAL_EXPENSE" BIGINT   NOT NULL,
    "OPEXPPERTEAM_MEN_Baseball" BIGINT   NOT NULL,
    "OPEXPPERTEAM_MEN_Bskball" BIGINT   NOT NULL,
    "REV_MEN_Baseball" BIGINT   NOT NULL,
    "REV_MEN_Bskball" BIGINT   NOT NULL,
    "EXP_MEN_Baseball" BIGINT   NOT NULL,
    "EXP_MEN_Bskball" BIGINT   NOT NULL,
    CONSTRAINT "pk_eada" PRIMARY KEY (
        "unitid"
     )
);

CREATE TABLE "nba_geo" (
    "team" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state_cd" VARCHAR(2)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "stadium_lat" NUMERIC(6,3)   NOT NULL,
    "stadium_long" NUMERIC(6,3)   NOT NULL,
    CONSTRAINT "pk_nba_geo" PRIMARY KEY (
        "team"
     )
);

CREATE TABLE "mlb_geo" (
    "team" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state_cd" VARCHAR(2)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "stadium_lat" NUMERIC(6,3)   NOT NULL,
    "stadium_long" NUMERIC(6,3)   NOT NULL,
    CONSTRAINT "pk_mlb_geo" PRIMARY KEY (
        "team"
     )
);

CREATE TABLE "school_geo" (
    "unitid" VARCHAR(6)   NOT NULL,
    "institution_name" VARCHAR   NOT NULL,
    "school_lat" NUMERIC(6,3)   NOT NULL,
    "school_long" NUMERIC(6,3)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "nearest_nba" VARCHAR   NOT NULL,
    "dist_nearest_nba" NUMERIC(6,1)   NOT NULL,
    "nearest_mlb" VARCHAR   NOT NULL,
    "dist_nearest_mlb" NUMERIC(6,1)   NOT NULL
);

ALTER TABLE "school_geo" ADD CONSTRAINT "fk_school_geo_unitid_institution_name" FOREIGN KEY("unitid", "institution_name")
REFERENCES "eada" ("unitid", "institution_name");

ALTER TABLE "school_geo" ADD CONSTRAINT "fk_school_geo_nearest_nba" FOREIGN KEY("nearest_nba")
REFERENCES "nba_geo" ("team");

ALTER TABLE "school_geo" ADD CONSTRAINT "fk_school_geo_nearest_mlb" FOREIGN KEY("nearest_mlb")
REFERENCES "mlb_geo" ("team");

