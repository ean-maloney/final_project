SELECT school_geo.*, "classification_name", "EFTotalCount", "REV_MEN_Baseball", "REV_MEN_Bskball"
FROM eada
LEFT JOIN school_geo ON eada.unitid = school_geo.unitid;
