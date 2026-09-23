-- Foundation Studio · Snowflake execution SQL
-- updated by sid in prod run
--Sid V3
-- foundation:stage 2
CREATE TABLE IF NOT EXISTS OGFS_DEMO.GOLD.dim_material (
  material_sk NUMBER AUTOINCREMENT PRIMARY KEY,
  material_key VARCHAR,
  canonical_material_name VARCHAR,
  business_line VARCHAR,
  cas_number VARCHAR,
  supplier VARCHAR,
  unit_of_measure VARCHAR,
  hazard_classification VARCHAR,
  valid_from TIMESTAMP_TZ,
  valid_to TIMESTAMP_TZ,
  is_current BOOLEAN
);

-- foundation:stage 3
UPDATE OGFS_DEMO.GOLD.dim_material d SET valid_from='1900-01-01'::TIMESTAMP_TZ
WHERE d.valid_from=(SELECT MIN(history.valid_from) FROM OGFS_DEMO.GOLD.dim_material history WHERE history.material_key=d.material_key);

-- foundation:stage 3
SET gold_scd_effective_at=CURRENT_TIMESTAMP();

-- foundation:stage 3
MERGE INTO OGFS_DEMO.GOLD.dim_material d
USING (SELECT source_raw.material_key,source_raw.canonical_material_name,source_raw.business_line,source_raw.cas_number,source_raw.supplier,source_raw.unit_of_measure,source_raw.hazard_classification FROM (SELECT * FROM OGFS_DEMO.SILVER.conformed_material) source_raw) s
ON d.material_key = s.material_key AND d.is_current = TRUE
WHEN MATCHED AND HASH(d.business_line,d.cas_number,d.supplier,d.unit_of_measure,d.hazard_classification) <> HASH(s.business_line,s.cas_number,s.supplier,s.unit_of_measure,s.hazard_classification) THEN UPDATE SET d.valid_to=$gold_scd_effective_at,d.is_current=FALSE
WHEN NOT MATCHED THEN INSERT (material_key,canonical_material_name,business_line,cas_number,supplier,unit_of_measure,hazard_classification,valid_from,valid_to,is_current) VALUES (s.material_key,s.canonical_material_name,s.business_line,s.cas_number,s.supplier,s.unit_of_measure,s.hazard_classification,'1900-01-01'::TIMESTAMP_TZ,'9999-12-31'::TIMESTAMP_TZ,TRUE);

-- foundation:stage 3
INSERT INTO OGFS_DEMO.GOLD.dim_material (material_key,canonical_material_name,business_line,cas_number,supplier,unit_of_measure,hazard_classification,valid_from,valid_to,is_current)
SELECT s.material_key,s.canonical_material_name,s.business_line,s.cas_number,s.supplier,s.unit_of_measure,s.hazard_classification,$gold_scd_effective_at,'9999-12-31'::TIMESTAMP_TZ,TRUE
FROM (SELECT source_raw.material_key,source_raw.canonical_material_name,source_raw.business_line,source_raw.cas_number,source_raw.supplier,source_raw.unit_of_measure,source_raw.hazard_classification FROM (SELECT * FROM OGFS_DEMO.SILVER.conformed_material) source_raw) s
WHERE NOT EXISTS (
  SELECT 1 FROM OGFS_DEMO.GOLD.dim_material current_row
  WHERE current_row.material_key=s.material_key AND current_row.is_current=TRUE AND HASH(current_row.business_line,current_row.cas_number,current_row.supplier,current_row.unit_of_measure,current_row.hazard_classification) = HASH(s.business_line,s.cas_number,s.supplier,s.unit_of_measure,s.hazard_classification)
);

-- foundation:stage 3
UPDATE OGFS_DEMO.GOLD.dim_material d
SET canonical_material_name=s.canonical_material_name
FROM (SELECT source_raw.material_key,source_raw.canonical_material_name,source_raw.business_line,source_raw.cas_number,source_raw.supplier,source_raw.unit_of_measure,source_raw.hazard_classification FROM (SELECT * FROM OGFS_DEMO.SILVER.conformed_material) source_raw) s
WHERE d.material_key=s.material_key AND d.is_current=TRUE
  AND (d.canonical_material_name IS DISTINCT FROM s.canonical_material_name);
