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
    "stadium_lat" COORD   NOT NULL,
    "stadium_long" COORD   NOT NULL,
    CONSTRAINT "pk_nba_geo" PRIMARY KEY (
        "team"
     )
);

CREATE TABLE "mlb_geo" (
    "team" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state_cd" VARCHAR(2)   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "stadium_lat" COORD   NOT NULL,
    "stadium_long" COORD   NOT NULL,
    CONSTRAINT "pk_mlb_geo" PRIMARY KEY (
        "team"
     )
);

CREATE TABLE "school_geo" (
    "unitid" VARCHAR(6)   NOT NULL,
    "institution_name" VARCHAR   NOT NULL,
    "school_lat" COORD   NOT NULL,
    "school_long" COORD   NOT NULL,
    "region" VARCHAR(3)   NOT NULL,
    "nearest_nba" VARCHAR   NOT NULL,
    "nearest_nba_lat" COORD   NOT NULL,
    "nearest_nba_long" COORD   NOT NULL,
    "dist_nearest_nba" INT   NOT NULL,
    "nearest_mlb" VARCHAR   NOT NULL,
    "nearest_mlb_lat" COORD   NOT NULL,
    "nearest_mlb_long" COORD   NOT NULL,
    "dist_nearest_mlb" INT   NOT NULL
);

ALTER TABLE "eada" ADD CONSTRAINT "fk_eada_unitid_institution_name" FOREIGN KEY("unitid", "institution_name")
REFERENCES "school_geo" ("unitid", "institution_name");

ALTER TABLE "nba_geo" ADD CONSTRAINT "fk_nba_geo_team_stadium_lat_stadium_long" FOREIGN KEY("team", "stadium_lat", "stadium_long")
REFERENCES "school_geo" ("nearest_nba", "nearest_nba_lat", "nearest_nba_long");

ALTER TABLE "mlb_geo" ADD CONSTRAINT "fk_mlb_geo_team_stadium_lat_stadium_long" FOREIGN KEY("team", "stadium_lat", "stadium_long")
REFERENCES "school_geo" ("nearest_mlb", "nearest_mlb_lat", "nearest_mlb_long");

