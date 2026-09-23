-- Foundation Studio · generated orchestration
-- Single schedule mode has no independent downstream dispatcher.

CREATE OR REPLACE PROCEDURE OGFS_DEMO.SILVER.run_silver_pipeline()
RETURNS VARCHAR LANGUAGE SQL EXECUTE AS OWNER AS $$
BEGIN
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.quarantine_records (
  quarantine_id NUMBER AUTOINCREMENT, source_table VARCHAR, source_row_number NUMBER,
  rule_name VARCHAR, reason VARCHAR, site_code VARCHAR, review_status VARCHAR,
  source_data VARIANT, quarantined_at TIMESTAMP_TZ DEFAULT CURRENT_TIMESTAMP()
)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.not_captured_at_source AS
SELECT column1::VARCHAR source_table,column2::VARCHAR site_code,column3::VARCHAR site_name,
       column4::VARCHAR canonical_field,column5::VARCHAR reason
FROM VALUES (''LIMS_CURITIBA_AMOSTRAS'',''curitiba'',''Curitiba'',''project_reference'',''Not captured at source''),
(''LIMS_CURITIBA_AMOSTRAS'',''curitiba'',''Curitiba'',''spec_lower_limit'',''Not captured at source''),
(''LIMS_CURITIBA_AMOSTRAS'',''curitiba'',''Curitiba'',''spec_upper_limit'',''Not captured at source''),
(''LIMS_CURITIBA_AMOSTRAS'',''curitiba'',''Curitiba'',''approval_date'',''Not captured at source''),
(''LIMS_CURITIBA_AMOSTRAS'',''curitiba'',''Curitiba'',''storage_location'',''Not captured at source''),
(''LAB_MUESTRAS_BA'',''buenos_aires'',''Buenos Aires'',''comments'',''Not captured at source'')';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.rule_skips (
  source_table VARCHAR,site_code VARCHAR,canonical_field VARCHAR,rule_type VARCHAR,
  unavailable_inputs ARRAY,reason VARCHAR,recorded_at TIMESTAMP_TZ DEFAULT CURRENT_TIMESTAMP()
)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS
SELECT column1::VARCHAR source_method_name, column2::VARCHAR governed_standard_reference, column3::VARCHAR standard_body, column4::VARCHAR method_title, column5::VARCHAR applies_to_business_line
FROM VALUES (''Viscosity'',''ASTM D445'',''ASTM'',''Kinematic Viscosity of Transparent and Opaque Liquids'',''Lubricants''),
(''Kinematic Viscosity'',''ASTM D445'',''ASTM'',''Kinematic Viscosity of Transparent and Opaque Liquids'',''Lubricants''),
(''Kinematic Viscosity @ 100C'',''ASTM D445'',''ASTM'',''Kinematic Viscosity of Transparent and Opaque Liquids'',''Lubricants''),
(''KV100'',''ASTM D445'',''ASTM'',''Kinematic Viscosity of Transparent and Opaque Liquids'',''Lubricants''),
(''Visc @ 40C'',''ASTM D445'',''ASTM'',''Kinematic Viscosity of Transparent and Opaque Liquids'',''Lubricants''),
(''Flash Point'',''ASTM D93'',''ASTM'',''Flash Point by Pensky-Martens Closed Cup'',''Fuels''),
(''Flash Pt'',''ASTM D93'',''ASTM'',''Flash Point by Pensky-Martens Closed Cup'',''Fuels''),
(''Flash Point PMCC'',''ASTM D93'',''ASTM'',''Flash Point by Pensky-Martens Closed Cup'',''Fuels''),
(''Flash Point COC'',''ASTM D92'',''ASTM'',''Flash Point by Cleveland Open Cup'',''Lubricants''),
(''Flash Point Open Cup'',''ASTM D92'',''ASTM'',''Flash Point by Cleveland Open Cup'',''Lubricants''),
(''Pour Point'',''ASTM D97'',''ASTM'',''Pour Point of Petroleum Products'',''Lubricants''),
(''Acid Number'',''ASTM D664'',''ASTM'',''Acid Number by Potentiometric Titration'',''Lubricants''),
(''Total Acid Number'',''ASTM D664'',''ASTM'',''Acid Number by Potentiometric Titration'',''Lubricants''),
(''TAN'',''ASTM D664'',''ASTM'',''Acid Number by Potentiometric Titration'',''Lubricants''),
(''Base Number'',''ASTM D4739'',''ASTM'',''Base Number by Potentiometric Hydrochloric Acid Titration'',''Lubricants''),
(''TBN'',''ASTM D4739'',''ASTM'',''Base Number by Potentiometric Hydrochloric Acid Titration'',''Lubricants''),
(''Sulfur'',''ASTM D2622'',''ASTM'',''Sulfur by Wavelength Dispersive XRF'',''Fuels''),
(''Sulphur Content'',''ASTM D2622'',''ASTM'',''Sulfur by Wavelength Dispersive XRF'',''Fuels''),
(''Sulfur XRF'',''ASTM D4294'',''ASTM'',''Sulfur by Energy Dispersive XRF'',''Fuels''),
(''Sulfur EDXRF'',''ASTM D4294'',''ASTM'',''Sulfur by Energy Dispersive XRF'',''Fuels''),
(''Density'',''ASTM D4052'',''ASTM'',''Density, Relative Density, and API Gravity by Digital Density Meter'',''Fuels''),
(''API Gravity'',''ASTM D4052'',''ASTM'',''Density, Relative Density, and API Gravity by Digital Density Meter'',''Fuels''),
(''Water Content'',''ASTM D6304'',''ASTM'',''Water by Coulometric Karl Fischer Titration'',''Cross-business''),
(''Karl Fischer Water'',''ASTM D6304'',''ASTM'',''Water by Coulometric Karl Fischer Titration'',''Cross-business''),
(''Ash'',''ASTM D482'',''ASTM'',''Ash from Petroleum Products'',''Cross-business''),
(''Viscosity Index'',''ASTM D2270'',''ASTM'',''Calculating Viscosity Index from Kinematic Viscosity'',''Lubricants''),
(''VI'',''ASTM D2270'',''ASTM'',''Calculating Viscosity Index from Kinematic Viscosity'',''Lubricants''),
(''Cold Crank'',''ASTM D5293'',''ASTM'',''Apparent Viscosity by Cold-Cranking Simulator'',''Lubricants''),
(''CCS'',''ASTM D5293'',''ASTM'',''Apparent Viscosity by Cold-Cranking Simulator'',''Lubricants''),
(''Wear Metals'',''ASTM D5185'',''ASTM'',''Multielement Determination by ICP-AES'',''Lubricants''),
(''ICP Metals'',''ASTM D5185'',''ASTM'',''Multielement Determination by ICP-AES'',''Lubricants''),
(''Cloud Point'',''ASTM D2500'',''ASTM'',''Cloud Point of Petroleum Products'',''Fuels''),
(''Color'',''ASTM D1500'',''ASTM'',''ASTM Color of Petroleum Products'',''Cross-business''),
(''Oxidation Stability'',''ASTM D2274'',''ASTM'',''Oxidation Stability of Distillate Fuel Oil'',''Fuels''),
(''Aniline Point'',''ASTM D611'',''ASTM'',''Aniline Point and Mixed Aniline Point'',''Fuels''),
(''Bromine Number'',''ASTM D1159'',''ASTM'',''Bromine Numbers by Electrometric Titration'',''Chemicals''),
(''Boiling Range Distribution'',''ASTM D2887'',''ASTM'',''Boiling Range Distribution by Gas Chromatography'',''Fuels''),
(''SimDis'',''ASTM D2887'',''ASTM'',''Boiling Range Distribution by Gas Chromatography'',''Fuels''),
(''Cetane Index'',''ASTM D976'',''ASTM'',''Calculated Cetane Index of Distillate Fuels'',''Fuels''),
(''Sequence VIII'',''ASTM D6709'',''ASTM'',''Sequence VIII Engine Test'',''Lubricants''),
(''Sequence IVA'',''ASTM D6891'',''ASTM'',''Sequence IVA Engine Test'',''Lubricants''),
(''Sequence IIIF'',''ASTM D6984'',''ASTM'',''Sequence IIIF Engine Test'',''Lubricants''),
(''Deposit Sequence'',''ASTM D6593'',''ASTM'',''Sequence VG Engine Test for Deposit Formation'',''Lubricants''),
(''ROBO Oxidation'',''ASTM D7528'',''ASTM'',''ROBO Apparatus Oxidation Test'',''Lubricants''),
(''PDSC Oxidation'',''ASTM D6186'',''ASTM'',''Oxidation Induction Time by PDSC'',''Lubricants''),
(''Injector Fouling'',''ASTM D6421'',''ASTM'',''Electronic Port Fuel Injector Fouling'',''Fuels''),
(''Water Reaction Aviation Fuel'',''ASTM D1094'',''ASTM'',''Water Reaction of Aviation Fuels'',''Fuels''),
(''ILSAC GF-6'',''ILSAC GF-6'',''ILSAC'',''Passenger Car Engine Oil Performance Specification'',''Lubricants''),
(''API SP'',''API SP'',''API'',''API Service Category SP'',''Lubricants'')';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.governed_sample_status_reference AS
SELECT column1::VARCHAR source_value, column2::VARCHAR source_system, column3::VARCHAR governed_status
FROM VALUES (''Complete'',''Annandale'',''Completed''),
(''Closed'',''Houston'',''Completed''),
(''In Progress'',''Annandale'',''In Progress''),
(''Open'',''Houston'',''In Progress''),
(''Pending Review'',''Annandale'',''Pending Review''),
(''Awaiting QA'',''Houston'',''Pending Review''),
(''Concluido'',''Curitiba'',''Completed''),
(''Em Andamento'',''Curitiba'',''In Progress''),
(''Aguardando Revisao'',''Curitiba'',''Pending Review''),
(''Completado'',''Buenos Aires'',''Completed''),
(''En Progreso'',''Buenos Aires'',''In Progress''),
(''Pendiente Revision'',''Buenos Aires'',''Pending Review'')';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.unit_registry AS
SELECT column1::VARCHAR canonical_code,column2::VARCHAR display_name,column3::VARCHAR quantity_type,column4::VARCHAR accepted_alias
FROM VALUES (''CST'',''Centistokes'',''viscosity'',''CST''),
(''CST'',''Centistokes'',''viscosity'',''centistokes''),
(''CST'',''Centistokes'',''viscosity'',''mm2/s''),
(''CST'',''Centistokes'',''viscosity'',''mm²/s''),
(''SUS'',''Saybolt Universal Seconds'',''viscosity'',''SUS''),
(''SUS'',''Saybolt Universal Seconds'',''viscosity'',''SSU''),
(''SUS'',''Saybolt Universal Seconds'',''viscosity'',''Saybolt Universal Seconds''),
(''DEGC'',''Degrees Celsius'',''temperature'',''DEGC''),
(''DEGC'',''Degrees Celsius'',''temperature'',''C''),
(''DEGC'',''Degrees Celsius'',''temperature'',''Celsius''),
(''DEGC'',''Degrees Celsius'',''temperature'',''deg C''),
(''DEGC'',''Degrees Celsius'',''temperature'',''°C''),
(''DEGF'',''Degrees Fahrenheit'',''temperature'',''DEGF''),
(''DEGF'',''Degrees Fahrenheit'',''temperature'',''F''),
(''DEGF'',''Degrees Fahrenheit'',''temperature'',''Fahrenheit''),
(''DEGF'',''Degrees Fahrenheit'',''temperature'',''deg F''),
(''DEGF'',''Degrees Fahrenheit'',''temperature'',''°F''),
(''K'',''Kelvin'',''temperature'',''K''),
(''K'',''Kelvin'',''temperature'',''Kelvin''),
(''KG_M3'',''Kilograms per cubic metre'',''density'',''KG_M3''),
(''KG_M3'',''Kilograms per cubic metre'',''density'',''kg/m3''),
(''KG_M3'',''Kilograms per cubic metre'',''density'',''kg/m³''),
(''KG_M3'',''Kilograms per cubic metre'',''density'',''kg m-3''),
(''G_CM3'',''Grams per cubic centimetre'',''density'',''G_CM3''),
(''G_CM3'',''Grams per cubic centimetre'',''density'',''g/cm3''),
(''G_CM3'',''Grams per cubic centimetre'',''density'',''g/cm³''),
(''SG'',''Specific gravity'',''specific_gravity'',''SG''),
(''SG'',''Specific gravity'',''specific_gravity'',''specific gravity''),
(''SG'',''Specific gravity'',''specific_gravity'',''relative density''),
(''API'',''API gravity'',''specific_gravity'',''API''),
(''API'',''API gravity'',''specific_gravity'',''API gravity''),
(''API'',''API gravity'',''specific_gravity'',''deg API''),
(''API'',''API gravity'',''specific_gravity'',''°API''),
(''KG'',''Kilogram'',''mass'',''KG''),
(''KG'',''Kilogram'',''mass'',''kilogram''),
(''KG'',''Kilogram'',''mass'',''kilograms''),
(''G'',''Gram'',''mass'',''G''),
(''G'',''Gram'',''mass'',''gram''),
(''G'',''Gram'',''mass'',''grams''),
(''MG'',''Milligram'',''mass'',''MG''),
(''MG'',''Milligram'',''mass'',''milligram''),
(''MG'',''Milligram'',''mass'',''milligrams''),
(''LB'',''Pound'',''mass'',''LB''),
(''LB'',''Pound'',''mass'',''lbs''),
(''LB'',''Pound'',''mass'',''pound''),
(''LB'',''Pound'',''mass'',''pounds''),
(''L'',''Litre'',''volume'',''L''),
(''L'',''Litre'',''volume'',''litre''),
(''L'',''Litre'',''volume'',''liter''),
(''L'',''Litre'',''volume'',''litres''),
(''L'',''Litre'',''volume'',''liters''),
(''ML'',''Millilitre'',''volume'',''ML''),
(''ML'',''Millilitre'',''volume'',''millilitre''),
(''ML'',''Millilitre'',''volume'',''milliliter''),
(''M3'',''Cubic metre'',''volume'',''M3''),
(''M3'',''Cubic metre'',''volume'',''m³''),
(''M3'',''Cubic metre'',''volume'',''cubic metre''),
(''M3'',''Cubic metre'',''volume'',''cubic meter''),
(''US_GAL'',''US gallon'',''volume'',''US_GAL''),
(''US_GAL'',''US gallon'',''volume'',''US gal''),
(''US_GAL'',''US gallon'',''volume'',''gal US''),
(''US_GAL'',''US gallon'',''volume'',''US gallon''),
(''BAR'',''Bar'',''pressure'',''BAR''),
(''BAR'',''Bar'',''pressure'',''bars''),
(''KPA'',''Kilopascal'',''pressure'',''KPA''),
(''KPA'',''Kilopascal'',''pressure'',''kilopascal''),
(''KPA'',''Kilopascal'',''pressure'',''kilopascals''),
(''PSI'',''Pounds per square inch'',''pressure'',''PSI''),
(''PSI'',''Pounds per square inch'',''pressure'',''lb/in2''),
(''MG_KG'',''Milligrams per kilogram'',''concentration'',''MG_KG''),
(''MG_KG'',''Milligrams per kilogram'',''concentration'',''mg/kg''),
(''MG_KG'',''Milligrams per kilogram'',''concentration'',''ppm''),
(''PERCENT'',''Percent by mass'',''concentration'',''PERCENT''),
(''PERCENT'',''Percent by mass'',''concentration'',''%''),
(''PERCENT'',''Percent by mass'',''concentration'',''wt%''),
(''PERCENT'',''Percent by mass'',''concentration'',''mass %''),
(''PPM'',''Parts per million'',''sulfur_trace'',''PPM''),
(''PPM'',''Parts per million'',''sulfur_trace'',''mg/kg''),
(''PPM'',''Parts per million'',''sulfur_trace'',''mg kg-1''),
(''SULFUR_PERCENT'',''Sulphur percent by mass'',''sulfur_trace'',''SULFUR_PERCENT''),
(''SULFUR_PERCENT'',''Sulphur percent by mass'',''sulfur_trace'',''% sulfur''),
(''SULFUR_PERCENT'',''Sulphur percent by mass'',''sulfur_trace'',''% sulphur''),
(''SULFUR_PERCENT'',''Sulphur percent by mass'',''sulfur_trace'',''wt% sulfur''),
(''SULFUR_PERCENT'',''Sulphur percent by mass'',''sulfur_trace'',''wt% sulphur'')';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.quantity_types AS
SELECT column1::VARCHAR quantity_type,column2::VARCHAR display_name,column3::VARCHAR standard_unit
FROM VALUES (''viscosity'',''Kinematic viscosity'',''CST''),
(''temperature'',''Temperature'',''DEGC''),
(''density'',''Density'',''KG_M3''),
(''specific_gravity'',''Specific gravity / API gravity'',''SG''),
(''mass'',''Mass'',''KG''),
(''volume'',''Volume'',''L''),
(''pressure'',''Pressure'',''BAR''),
(''concentration'',''Concentration'',''MG_KG''),
(''sulfur_trace'',''Sulphur or trace content'',''PPM'')';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.unit_conversion_rules AS
SELECT column1::VARCHAR rule_id,column2::VARCHAR quantity_type,column3::VARCHAR from_unit,column4::VARCHAR to_unit,
       column5::VARCHAR conversion_kind,column6::NUMBER factor,column7::NUMBER offset,column8::VARCHAR expression,column9::VARCHAR inverse_rule_id
FROM VALUES (''sus_to_cst'',''viscosity'',''SUS'',''CST'',''formula'',NULL,NULL,''if(x < 100, 0.226*x - 195/x, 0.220*x - 135/x)'',''cst_to_sus''),
(''cst_to_sus'',''viscosity'',''CST'',''SUS'',''formula'',NULL,NULL,''if(x < 20.6, (x + sqrt(x*x + 176.28))/0.452, (x + sqrt(x*x + 118.8))/0.44)'',''sus_to_cst''),
(''f_to_c'',''temperature'',''DEGF'',''DEGC'',''linear_offset'',0.5555555555555556,-17.77777777777778,NULL,''c_to_f''),
(''c_to_f'',''temperature'',''DEGC'',''DEGF'',''linear_offset'',1.8,32,NULL,''f_to_c''),
(''k_to_c'',''temperature'',''K'',''DEGC'',''linear_offset'',1,-273.15,NULL,''c_to_k''),
(''c_to_k'',''temperature'',''DEGC'',''K'',''linear_offset'',1,273.15,NULL,''k_to_c''),
(''gcm3_to_kgm3'',''density'',''G_CM3'',''KG_M3'',''linear_factor'',1000,NULL,NULL,''kgm3_to_gcm3''),
(''kgm3_to_gcm3'',''density'',''KG_M3'',''G_CM3'',''linear_factor'',0.001,NULL,NULL,''gcm3_to_kgm3''),
(''api_to_sg'',''specific_gravity'',''API'',''SG'',''formula'',NULL,NULL,''141.5/(x+131.5)'',''sg_to_api''),
(''sg_to_api'',''specific_gravity'',''SG'',''API'',''formula'',NULL,NULL,''141.5/x-131.5'',''api_to_sg''),
(''g_to_kg'',''mass'',''G'',''KG'',''linear_factor'',0.001,NULL,NULL,''kg_to_g''),
(''kg_to_g'',''mass'',''KG'',''G'',''linear_factor'',1000,NULL,NULL,''g_to_kg''),
(''mg_to_kg'',''mass'',''MG'',''KG'',''linear_factor'',0.000001,NULL,NULL,NULL),
(''lb_to_kg'',''mass'',''LB'',''KG'',''linear_factor'',0.45359237,NULL,NULL,NULL),
(''ml_to_l'',''volume'',''ML'',''L'',''linear_factor'',0.001,NULL,NULL,''l_to_ml''),
(''l_to_ml'',''volume'',''L'',''ML'',''linear_factor'',1000,NULL,NULL,''ml_to_l''),
(''m3_to_l'',''volume'',''M3'',''L'',''linear_factor'',1000,NULL,NULL,NULL),
(''usgal_to_l'',''volume'',''US_GAL'',''L'',''linear_factor'',3.785411784,NULL,NULL,NULL),
(''kpa_to_bar'',''pressure'',''KPA'',''BAR'',''linear_factor'',0.01,NULL,NULL,''bar_to_kpa''),
(''bar_to_kpa'',''pressure'',''BAR'',''KPA'',''linear_factor'',100,NULL,NULL,''kpa_to_bar''),
(''psi_to_bar'',''pressure'',''PSI'',''BAR'',''linear_factor'',0.0689475729,NULL,NULL,NULL),
(''percent_to_mgkg'',''concentration'',''PERCENT'',''MG_KG'',''linear_factor'',10000,NULL,NULL,NULL),
(''sulfur_percent_to_ppm'',''sulfur_trace'',''SULFUR_PERCENT'',''PPM'',''linear_factor'',10000,NULL,NULL,NULL)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.silver_lims_annandale AS
 SELECT row_data.source_row_number,
  row_data.sample_id AS sample_id,
  LOWER(row_data.product_line) AS product_line,
  row_data.material_code AS material_code,
  row_data.batch_lot_number AS batch_lot_number,
  row_data.container_id AS container_id,
  COALESCE((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))), NULL) AS test_type,
  row_data.test_method_version AS test_method_version,
  row_data.instrument_id AS instrument_id,
  row_data.analyst_id AS analyst_id,
  row_data.reviewer_id AS reviewer_id,
  row_data.date_requested AS date_requested,
  row_data.date_received AS date_received,
  row_data.date_started AS date_started,
  row_data.date_completed AS date_completed,
  row_data.priority AS priority,
  row_data.submitter AS submitter,
  row_data.project_reference AS project_reference,
  row_data.result_value AS result_value,
  COALESCE((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))), NULL) AS result_unit,
  row_data.spec_lower_limit AS spec_lower_limit,
  row_data.spec_upper_limit AS spec_upper_limit,
  COALESCE((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))), NULL) AS sample_status,
  row_data.approval_status AS approval_status,
  row_data.approval_date AS approval_date,
  row_data.storage_location AS storage_location,
  row_data.retest_flag AS retest_flag,
  row_data.comments AS comments,
  row_data.site_code AS site_code,
  ''lims_annandale_samples'' AS source_table
FROM (SELECT row_data.* FROM OGFS_DEMO.BRONZE.lims_annandale_samples AS row_data WHERE NOT (COALESCE(((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL), FALSE))) AS row_data';
  EXECUTE IMMEDIATE '-- foundation:stage 3
INSERT INTO OGFS_DEMO.SILVER.quarantine_records
  (source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,quarantined_at)
SELECT source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,CURRENT_TIMESTAMP()
FROM (
SELECT ''LIMS_ANNANDALE_SAMPLES'' source_table, row_data.source_row_number,
        ''test_method_vocabulary'' rule_name, ''test_type: Code lookup failed'' reason,
       ''annandale'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_annandale_samples AS row_data
 WHERE (SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LIMS_ANNANDALE_SAMPLES'' source_table, row_data.source_row_number,
        ''uom_vocabulary'' rule_name, ''Unit cannot be resolved in unit_registry: ''||COALESCE(TO_VARCHAR(row_data.result_unit),''(missing)'')||'' (test method: ''||COALESCE(TO_VARCHAR(row_data.test_type),''(missing)'')||'')'' reason,
       ''annandale'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_annandale_samples AS row_data
 WHERE (SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LIMS_ANNANDALE_SAMPLES'' source_table, row_data.source_row_number,
        ''status_vocabulary'' rule_name, ''sample_status: Code lookup failed'' reason,
       ''annandale'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_annandale_samples AS row_data
 WHERE (SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL)
QUALIFY ROW_NUMBER() OVER (PARTITION BY source_table,source_row_number,rule_name ORDER BY reason)=1';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.silver_lims_houston AS
 SELECT row_data.source_row_number,
  row_data.sample_id AS sample_id,
  row_data.product_line AS product_line,
  row_data.material_code AS material_code,
  row_data.batch_lot_number AS batch_lot_number,
  row_data.container_id AS container_id,
  COALESCE((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))), NULL) AS test_type,
  row_data.test_method_version AS test_method_version,
  row_data.instrument_id AS instrument_id,
  row_data.analyst_id AS analyst_id,
  row_data.reviewer_id AS reviewer_id,
  row_data.date_requested AS date_requested,
  row_data.date_received AS date_received,
  row_data.date_started AS date_started,
  row_data.date_completed AS date_completed,
  row_data.priority AS priority,
  row_data.submitter AS submitter,
  row_data.project_reference AS project_reference,
  row_data.result_value AS result_value,
  COALESCE((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))), NULL) AS result_unit,
  row_data.spec_lower_limit AS spec_lower_limit,
  row_data.spec_upper_limit AS spec_upper_limit,
  COALESCE((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))), NULL) AS sample_status,
  row_data.approval_status AS approval_status,
  row_data.approval_date AS approval_date,
  row_data.storage_location AS storage_location,
  row_data.retest_flag AS retest_flag,
  row_data.comments AS comments,
  row_data.site_code AS site_code,
  ''lims_houston_samples'' AS source_table
FROM (SELECT row_data.* FROM OGFS_DEMO.BRONZE.lims_houston_samples AS row_data WHERE NOT (COALESCE(((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL), FALSE))) AS row_data';
  EXECUTE IMMEDIATE '-- foundation:stage 3
INSERT INTO OGFS_DEMO.SILVER.quarantine_records
  (source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,quarantined_at)
SELECT source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,CURRENT_TIMESTAMP()
FROM (
SELECT ''LIMS_HOUSTON_SAMPLES'' source_table, row_data.source_row_number,
        ''test_method_vocabulary'' rule_name, ''test_type: Code lookup failed'' reason,
       ''houston'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_houston_samples AS row_data
 WHERE (SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LIMS_HOUSTON_SAMPLES'' source_table, row_data.source_row_number,
        ''uom_vocabulary'' rule_name, ''Unit cannot be resolved in unit_registry: ''||COALESCE(TO_VARCHAR(row_data.result_unit),''(missing)'')||'' (test method: ''||COALESCE(TO_VARCHAR(row_data.test_type),''(missing)'')||'')'' reason,
       ''houston'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_houston_samples AS row_data
 WHERE (SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LIMS_HOUSTON_SAMPLES'' source_table, row_data.source_row_number,
        ''status_vocabulary'' rule_name, ''sample_status: Code lookup failed'' reason,
       ''houston'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_houston_samples AS row_data
 WHERE (SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL)
QUALIFY ROW_NUMBER() OVER (PARTITION BY source_table,source_row_number,rule_name ORDER BY reason)=1';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.silver_lims_curitiba AS
 SELECT row_data.source_row_number,
  row_data.sample_id AS sample_id,
  row_data.product_line AS product_line,
  row_data.material_code AS material_code,
  row_data.batch_lot_number AS batch_lot_number,
  row_data.container_id AS container_id,
  COALESCE((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))), NULL) AS test_type,
  row_data.test_method_version AS test_method_version,
  row_data.instrument_id AS instrument_id,
  row_data.analyst_id AS analyst_id,
  row_data.reviewer_id AS reviewer_id,
  row_data.date_requested AS date_requested,
  row_data.date_received AS date_received,
  row_data.date_started AS date_started,
  row_data.date_completed AS date_completed,
  row_data.priority AS priority,
  row_data.submitter AS submitter,
  NULL AS project_reference,
  row_data.result_value AS result_value,
  COALESCE((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))), NULL) AS result_unit,
  NULL AS spec_lower_limit,
  NULL AS spec_upper_limit,
  COALESCE((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))), NULL) AS sample_status,
  row_data.approval_status AS approval_status,
  NULL AS approval_date,
  NULL AS storage_location,
  row_data.retest_flag AS retest_flag,
  row_data.comments AS comments,
  row_data.site_code AS site_code,
  ''lims_curitiba_amostras'' AS source_table
FROM (SELECT row_data.* FROM OGFS_DEMO.BRONZE.lims_curitiba_amostras AS row_data WHERE NOT (COALESCE(((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL), FALSE))) AS row_data';
  EXECUTE IMMEDIATE '-- foundation:stage 3
INSERT INTO OGFS_DEMO.SILVER.quarantine_records
  (source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,quarantined_at)
SELECT source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,CURRENT_TIMESTAMP()
FROM (
SELECT ''LIMS_CURITIBA_AMOSTRAS'' source_table, row_data.source_row_number,
        ''test_method_vocabulary'' rule_name, ''test_type: Code lookup failed'' reason,
       ''curitiba'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_curitiba_amostras AS row_data
 WHERE (SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LIMS_CURITIBA_AMOSTRAS'' source_table, row_data.source_row_number,
        ''uom_vocabulary'' rule_name, ''Unit cannot be resolved in unit_registry: ''||COALESCE(TO_VARCHAR(row_data.result_unit),''(missing)'')||'' (test method: ''||COALESCE(TO_VARCHAR(row_data.test_type),''(missing)'')||'')'' reason,
       ''curitiba'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_curitiba_amostras AS row_data
 WHERE (SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LIMS_CURITIBA_AMOSTRAS'' source_table, row_data.source_row_number,
        ''status_vocabulary'' rule_name, ''sample_status: Code lookup failed'' reason,
       ''curitiba'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lims_curitiba_amostras AS row_data
 WHERE (SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL)
QUALIFY ROW_NUMBER() OVER (PARTITION BY source_table,source_row_number,rule_name ORDER BY reason)=1';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.silver_lims_buenos_aires AS
 SELECT row_data.source_row_number,
  row_data.sample_id AS sample_id,
  row_data.product_line AS product_line,
  row_data.material_code AS material_code,
  row_data.batch_lot_number AS batch_lot_number,
  row_data.container_id AS container_id,
  COALESCE((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))), NULL) AS test_type,
  row_data.test_method_version AS test_method_version,
  row_data.instrument_id AS instrument_id,
  row_data.analyst_id AS analyst_id,
  row_data.reviewer_id AS reviewer_id,
  row_data.date_requested AS date_requested,
  row_data.date_received AS date_received,
  row_data.date_started AS date_started,
  row_data.date_completed AS date_completed,
  row_data.priority AS priority,
  row_data.submitter AS submitter,
  row_data.project_reference AS project_reference,
  row_data.result_value AS result_value,
  COALESCE((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))), NULL) AS result_unit,
  row_data.spec_lower_limit AS spec_lower_limit,
  row_data.spec_upper_limit AS spec_upper_limit,
  COALESCE((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))), NULL) AS sample_status,
  row_data.approval_status AS approval_status,
  row_data.approval_date AS approval_date,
  row_data.storage_location AS storage_location,
  row_data.retest_flag AS retest_flag,
  NULL AS comments,
  row_data.site_code AS site_code,
  ''lab_muestras_ba'' AS source_table
FROM (SELECT row_data.* FROM OGFS_DEMO.BRONZE.lab_muestras_ba AS row_data WHERE NOT (COALESCE(((SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL), FALSE) OR COALESCE(((SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL), FALSE))) AS row_data';
  EXECUTE IMMEDIATE '-- foundation:stage 3
INSERT INTO OGFS_DEMO.SILVER.quarantine_records
  (source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,quarantined_at)
SELECT source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,CURRENT_TIMESTAMP()
FROM (
SELECT ''LAB_MUESTRAS_BA'' source_table, row_data.source_row_number,
        ''test_method_vocabulary'' rule_name, ''test_type: Code lookup failed'' reason,
       ''buenos_aires'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lab_muestras_ba AS row_data
 WHERE (SELECT MAX(ref.governed_standard_reference) FROM OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_method_name AS VARCHAR))) = LOWER(TRIM(CAST(row_data.test_type AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LAB_MUESTRAS_BA'' source_table, row_data.source_row_number,
        ''uom_vocabulary'' rule_name, ''Unit cannot be resolved in unit_registry: ''||COALESCE(TO_VARCHAR(row_data.result_unit),''(missing)'')||'' (test method: ''||COALESCE(TO_VARCHAR(row_data.test_type),''(missing)'')||'')'' reason,
       ''buenos_aires'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lab_muestras_ba AS row_data
 WHERE (SELECT MAX(ref.canonical_code) FROM OGFS_DEMO.SILVER.unit_registry AS ref WHERE ref.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(row_data.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(CAST(ref.accepted_alias AS VARCHAR))) = LOWER(TRIM(CAST(row_data.result_unit AS VARCHAR)))) IS NULL
UNION ALL

SELECT ''LAB_MUESTRAS_BA'' source_table, row_data.source_row_number,
        ''status_vocabulary'' rule_name, ''sample_status: Code lookup failed'' reason,
       ''buenos_aires'' site_code,
       ''quarantined'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(row_data.*) source_data
FROM OGFS_DEMO.BRONZE.lab_muestras_ba AS row_data
 WHERE (SELECT MAX(ref.governed_status) FROM OGFS_DEMO.SILVER.governed_sample_status_reference AS ref WHERE LOWER(TRIM(CAST(ref.source_value AS VARCHAR))) = LOWER(TRIM(CAST(row_data.sample_status AS VARCHAR)))) IS NULL)
QUALIFY ROW_NUMBER() OVER (PARTITION BY source_table,source_row_number,rule_name ORDER BY reason)=1';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.silver_raw_material_master AS
 SELECT row_data.source_row_number,
  row_data.canonical_material_name AS canonical_material_name,
  row_data.business_line AS business_line,
  row_data.source_material_code AS source_material_code,
  row_data.legacy_material_id AS legacy_material_id,
  row_data.cas_number AS cas_number,
  row_data.supplier AS supplier,
  row_data.supplier_grade AS supplier_grade,
  row_data.unit_of_measure AS unit_of_measure,
  row_data.density AS density,
  row_data.viscosity_grade AS viscosity_grade,
  row_data.hazard_classification AS hazard_classification,
  row_data.safety_data_sheet_ref AS safety_data_sheet_ref,
  row_data.shelf_life_months AS shelf_life_months,
  row_data.storage_conditions AS storage_conditions,
  row_data.approved_for_use AS approved_for_use,
  row_data.last_review_date AS last_review_date,
  ''raw_material_master'' AS source_table
FROM (SELECT row_data.* FROM OGFS_DEMO.BRONZE.raw_material_master AS row_data WHERE NOT (FALSE)) AS row_data';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE TABLE IF NOT EXISTS OGFS_DEMO.SILVER.golden_record_overrides (
  action_id VARCHAR,item_key VARCHAR,action VARCHAR,golden_key VARCHAR,
  source_table VARCHAR,source_row_number NUMBER,source_material_code VARCHAR,golden_values VARIANT,
  actor VARCHAR,decided_at TIMESTAMP_TZ,rationale VARCHAR
)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.material_identity_map AS
WITH base AS (
  SELECT DISTINCT source_material_code, legacy_material_id, canonical_material_name, cas_number,
    REGEXP_REPLACE(UPPER(TRIM(canonical_material_name)), ''[^A-Z0-9]'', '''') normalized_name,
    NULLIF(REGEXP_REPLACE(UPPER(TRIM(cas_number)), ''[^A-Z0-9]'', ''''), '''') normalized_cas
  FROM OGFS_DEMO.SILVER.silver_raw_material_master
  WHERE source_material_code IS NOT NULL AND canonical_material_name IS NOT NULL
),
canonical_targets AS (
  SELECT * FROM base WHERE legacy_material_id LIKE ''MAT-%''
  QUALIFY ROW_NUMBER() OVER (
    PARTITION BY legacy_material_id
    ORDER BY LENGTH(canonical_material_name) DESC,normalized_name,source_material_code
  )=1
),
ranked_targets AS (
  SELECT b.source_material_code,t.normalized_name target_name,
    JAROWINKLER_SIMILARITY(b.normalized_name,t.normalized_name) similarity_score,
    CASE WHEN b.legacy_material_id=t.legacy_material_id THEN ''raw_material_master_xref''
         WHEN b.normalized_cas=t.normalized_cas THEN ''cas_number''
         ELSE ''canonical_name_similarity'' END match_rule,
    ROW_NUMBER() OVER (PARTITION BY b.source_material_code ORDER BY
      IFF(b.legacy_material_id=t.legacy_material_id,1,0) DESC,
      IFF(b.normalized_cas IS NOT NULL AND b.normalized_cas=t.normalized_cas,1,0) DESC,
      JAROWINKLER_SIMILARITY(b.normalized_name,t.normalized_name) DESC,
      t.normalized_name) target_rank
  FROM base b JOIN canonical_targets t ON
    b.legacy_material_id=t.legacy_material_id
    OR (b.legacy_material_id LIKE ''LGC-%'' AND b.normalized_cas IS NOT NULL AND b.normalized_cas=t.normalized_cas)
    OR ((b.normalized_cas IS NULL OR t.normalized_cas IS NULL)
      AND JAROWINKLER_SIMILARITY(b.normalized_name,t.normalized_name) >= 85)
),
current_overrides AS (
  SELECT *
  FROM OGFS_DEMO.SILVER.golden_record_overrides
  QUALIFY ROW_NUMBER() OVER (PARTITION BY item_key ORDER BY decided_at DESC,action_id DESC)=1
),
resolved AS (
  SELECT b.*,r.target_name,r.match_rule,o.action override_action,o.golden_key override_golden_key
  FROM base b LEFT JOIN ranked_targets r ON r.source_material_code=b.source_material_code AND r.target_rank=1
  LEFT JOIN current_overrides o ON LOWER(o.source_material_code)=LOWER(b.source_material_code)
)
SELECT source_material_code,canonical_material_name,cas_number,
  COALESCE(
    IFF(override_action IN (''attach'',''create''),override_golden_key,NULL),
    IFF(override_action IN (''reject'',''undo''),''MAT_''||MD5(normalized_name||'':''||source_material_code),NULL),
    ''MAT_''||MD5(COALESCE(target_name,normalized_name))
  ) material_key,
  CASE WHEN override_action IN (''attach'',''create'') THEN ''golden_record_override''
       WHEN override_action IN (''reject'',''undo'') THEN ''steward_separate''
       ELSE COALESCE(match_rule,''unmatched_source_record'') END match_rule,
  85 similarity_threshold
FROM resolved';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.material_match_candidates AS
WITH base AS (
  SELECT DISTINCT i.material_key,m.source_material_code,m.canonical_material_name,
    REGEXP_REPLACE(UPPER(TRIM(canonical_material_name)), ''[^A-Z0-9]'', '''') normalized_name,
    NULLIF(REGEXP_REPLACE(UPPER(TRIM(cas_number)), ''[^A-Z0-9]'', ''''), '''') normalized_cas
  FROM OGFS_DEMO.SILVER.silver_raw_material_master m JOIN OGFS_DEMO.SILVER.material_identity_map i USING (source_material_code)
  WHERE m.source_material_code IS NOT NULL AND m.canonical_material_name IS NOT NULL
),
pairs AS (
  SELECT l.material_key left_material_key,r.material_key right_material_key,
    l.source_material_code left_code,r.source_material_code right_code,
    l.canonical_material_name left_name,r.canonical_material_name right_name,
    JAROWINKLER_SIMILARITY(l.normalized_name,r.normalized_name) similarity_score
  FROM base l JOIN base r ON l.material_key < r.material_key
  WHERE NOT (l.normalized_cas IS NOT NULL AND l.normalized_cas=r.normalized_cas)
)
SELECT left_material_key,right_material_key,MIN(left_code) left_code,MIN(right_code) right_code,
  MIN(left_name) left_name,MIN(right_name) right_name,MAX(similarity_score) similarity_score,
  85 similarity_threshold,''candidate_review'' review_status
FROM pairs
WHERE similarity_score < 85 AND similarity_score >= 85*0.75
GROUP BY left_material_key,right_material_key
QUALIFY ROW_NUMBER() OVER (PARTITION BY left_material_key ORDER BY MAX(similarity_score) DESC,right_material_key)=1';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.conformed_material AS
WITH base AS (
  SELECT i.material_key,
   MAX_BY(m.canonical_material_name,LENGTH(m.canonical_material_name)) canonical_material_name,
   MIN(m.business_line) business_line, MIN(m.cas_number) cas_number,
   MIN(m.supplier) supplier, MIN(m.unit_of_measure) unit_of_measure,
   MIN(m.hazard_classification) hazard_classification, MIN(m.source_material_code) source_material_code,
   COUNT(*) source_record_count, COUNT(DISTINCT m.canonical_material_name) source_name_count
  FROM OGFS_DEMO.SILVER.silver_raw_material_master m
  JOIN OGFS_DEMO.SILVER.material_identity_map i ON i.source_material_code=m.source_material_code
  GROUP BY i.material_key
),
overrides AS (
  SELECT golden_key,
    MAX_BY(golden_values,decided_at) golden_values
  FROM OGFS_DEMO.SILVER.golden_record_overrides
  WHERE action IN (''attach'',''create'')
  GROUP BY golden_key
)
SELECT b.material_key,
 COALESCE(o.golden_values:canonicalMaterialName::VARCHAR,b.canonical_material_name) canonical_material_name,
 COALESCE(o.golden_values:businessLine::VARCHAR,b.business_line) business_line,
 COALESCE(o.golden_values:casNumber::VARCHAR,b.cas_number) cas_number,
 COALESCE(o.golden_values:supplier::VARCHAR,b.supplier) supplier,
 COALESCE(o.golden_values:unitOfMeasure::VARCHAR,b.unit_of_measure) unit_of_measure,
 COALESCE(o.golden_values:hazardClassification::VARCHAR,b.hazard_classification) hazard_classification,
 b.source_material_code,b.source_record_count,b.source_name_count
FROM base b LEFT JOIN overrides o ON o.golden_key=b.material_key';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
INSERT INTO OGFS_DEMO.SILVER.quarantine_records
  (source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,quarantined_at)
SELECT source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,CURRENT_TIMESTAMP()
FROM (SELECT ''LIMS_ANNANDALE_SAMPLES'' source_table,
      b.source_row_number source_row_number, ''material_master_reference'' rule_name,
      ''Material code is missing from RAW_MATERIAL_MASTER and requires review'' reason,
      ''annandale'' site_code,
      ''flagged_for_review'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(b.*) source_data
    FROM OGFS_DEMO.BRONZE.lims_annandale_samples b
    LEFT JOIN OGFS_DEMO.SILVER.silver_raw_material_master m
      ON LOWER(TRIM(m.source_material_code)) = LOWER(TRIM(b.material_code))
    WHERE b.material_code IS NOT NULL AND m.source_material_code IS NULL
UNION ALL
SELECT ''LIMS_HOUSTON_SAMPLES'' source_table,
      b.source_row_number source_row_number, ''material_master_reference'' rule_name,
      ''Material code is missing from RAW_MATERIAL_MASTER and requires review'' reason,
      ''houston'' site_code,
      ''flagged_for_review'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(b.*) source_data
    FROM OGFS_DEMO.BRONZE.lims_houston_samples b
    LEFT JOIN OGFS_DEMO.SILVER.silver_raw_material_master m
      ON LOWER(TRIM(m.source_material_code)) = LOWER(TRIM(b.material_code))
    WHERE b.material_code IS NOT NULL AND m.source_material_code IS NULL
UNION ALL
SELECT ''LIMS_CURITIBA_AMOSTRAS'' source_table,
      b.source_row_number source_row_number, ''material_master_reference'' rule_name,
      ''Material code is missing from RAW_MATERIAL_MASTER and requires review'' reason,
      ''curitiba'' site_code,
      ''flagged_for_review'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(b.*) source_data
    FROM OGFS_DEMO.BRONZE.lims_curitiba_amostras b
    LEFT JOIN OGFS_DEMO.SILVER.silver_raw_material_master m
      ON LOWER(TRIM(m.source_material_code)) = LOWER(TRIM(b.material_code))
    WHERE b.material_code IS NOT NULL AND m.source_material_code IS NULL
UNION ALL
SELECT ''LAB_MUESTRAS_BA'' source_table,
      b.source_row_number source_row_number, ''material_master_reference'' rule_name,
      ''Material code is missing from RAW_MATERIAL_MASTER and requires review'' reason,
      ''buenos_aires'' site_code,
      ''flagged_for_review'' review_status, OBJECT_CONSTRUCT_KEEP_NULL(b.*) source_data
    FROM OGFS_DEMO.BRONZE.lab_muestras_ba b
    LEFT JOIN OGFS_DEMO.SILVER.silver_raw_material_master m
      ON LOWER(TRIM(m.source_material_code)) = LOWER(TRIM(b.material_code))
    WHERE b.material_code IS NOT NULL AND m.source_material_code IS NULL)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.conformed_test_method AS
WITH methods AS (SELECT test_type test_type FROM OGFS_DEMO.SILVER.silver_lims_annandale
UNION ALL
SELECT test_type test_type FROM OGFS_DEMO.SILVER.silver_lims_houston
UNION ALL
SELECT test_type test_type FROM OGFS_DEMO.SILVER.silver_lims_curitiba
UNION ALL
SELECT test_type test_type FROM OGFS_DEMO.SILVER.silver_lims_buenos_aires)
SELECT ''MTH_'' || MD5(COALESCE(r.governed_standard_reference, m.test_type)) test_method_key,
 COALESCE(r.governed_standard_reference, m.test_type) governed_standard_reference,
 MIN(r.standard_body) standard_body, MIN(r.method_title) method_title,
 MIN(r.applies_to_business_line) applies_to_business_line, COUNT(*) source_record_count
FROM methods m LEFT JOIN OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference r
 ON REGEXP_REPLACE(UPPER(TRIM(m.test_type)), ''[^A-Z0-9]'', '''') =
    REGEXP_REPLACE(UPPER(TRIM(r.source_method_name)), ''[^A-Z0-9]'', '''')
GROUP BY COALESCE(r.governed_standard_reference, m.test_type)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.conformed_lab_sample AS SELECT ''SMP_'' || MD5(''annandale:'' || s.source_row_number) lab_sample_key,
  m.material_key, tm.test_method_key, ''annandale'' site_code, s.product_line business_line,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) completion_date,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_requested)) requested_date,
 s.sample_status sample_status, 1 source_system_count
 FROM OGFS_DEMO.SILVER.silver_lims_annandale s
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
 LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
   ON REGEXP_REPLACE(UPPER(TRIM(tm.governed_standard_reference)), ''[^A-Z0-9]'', '''') =
       REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
UNION ALL
SELECT ''SMP_'' || MD5(''houston:'' || s.source_row_number) lab_sample_key,
  m.material_key, tm.test_method_key, ''houston'' site_code, s.product_line business_line,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) completion_date,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_requested)) requested_date,
 s.sample_status sample_status, 1 source_system_count
 FROM OGFS_DEMO.SILVER.silver_lims_houston s
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
 LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
   ON REGEXP_REPLACE(UPPER(TRIM(tm.governed_standard_reference)), ''[^A-Z0-9]'', '''') =
       REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
UNION ALL
SELECT ''SMP_'' || MD5(''curitiba:'' || s.source_row_number) lab_sample_key,
  m.material_key, tm.test_method_key, ''curitiba'' site_code, s.product_line business_line,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) completion_date,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_requested)) requested_date,
 s.sample_status sample_status, 1 source_system_count
 FROM OGFS_DEMO.SILVER.silver_lims_curitiba s
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
 LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
   ON REGEXP_REPLACE(UPPER(TRIM(tm.governed_standard_reference)), ''[^A-Z0-9]'', '''') =
       REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
UNION ALL
SELECT ''SMP_'' || MD5(''buenos_aires:'' || s.source_row_number) lab_sample_key,
  m.material_key, tm.test_method_key, ''buenos_aires'' site_code, s.product_line business_line,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) completion_date,
 TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_requested)) requested_date,
 s.sample_status sample_status, 1 source_system_count
 FROM OGFS_DEMO.SILVER.silver_lims_buenos_aires s
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
 LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
   ON REGEXP_REPLACE(UPPER(TRIM(tm.governed_standard_reference)), ''[^A-Z0-9]'', '''') =
       REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.conformed_test_result AS SELECT ''RES_'' || MD5(''silver_lims_annandale:'' || s.source_row_number) test_result_key,
  ''SMP_'' || MD5(''annandale:'' || s.source_row_number) lab_sample_key,
  tm.test_method_key, m.material_key, TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) result_date,
  s.result_value original_result_value, s.result_unit original_result_unit,
  IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) result_value, qt.standard_unit result_unit,
  IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) spec_lower_limit, IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)) spec_upper_limit,
  IFF(IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) BETWEEN IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) AND IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)),TRUE,FALSE) within_spec,
  CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END quantity_type, u.canonical_code recorded_unit_code,
  u.canonical_code<>qt.standard_unit conversion_applied,
  IFF(u.canonical_code=qt.standard_unit,''identity'',cr.rule_id) conversion_rule_id,
  ''silver_lims_annandale'' source_system
  FROM OGFS_DEMO.SILVER.silver_lims_annandale s
   LEFT JOIN OGFS_DEMO.BRONZE.lims_annandale_samples b ON b.source_row_number=s.source_row_number
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
  LEFT JOIN OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference mr
    ON REGEXP_REPLACE(UPPER(TRIM(mr.source_method_name)), ''[^A-Z0-9]'', '''')=REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
  LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
    ON tm.governed_standard_reference=COALESCE(mr.governed_standard_reference,s.test_type)
  LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
    ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
  LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
  LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
    ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
  WHERE s.result_value IS NOT NULL AND u.canonical_code IS NOT NULL AND qt.standard_unit IS NOT NULL
    AND (u.canonical_code=qt.standard_unit OR cr.rule_id IS NOT NULL)
UNION ALL
SELECT ''RES_'' || MD5(''silver_lims_houston:'' || s.source_row_number) test_result_key,
  ''SMP_'' || MD5(''houston:'' || s.source_row_number) lab_sample_key,
  tm.test_method_key, m.material_key, TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) result_date,
  s.result_value original_result_value, s.result_unit original_result_unit,
  IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) result_value, qt.standard_unit result_unit,
  IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) spec_lower_limit, IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)) spec_upper_limit,
  IFF(IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) BETWEEN IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) AND IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)),TRUE,FALSE) within_spec,
  CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END quantity_type, u.canonical_code recorded_unit_code,
  u.canonical_code<>qt.standard_unit conversion_applied,
  IFF(u.canonical_code=qt.standard_unit,''identity'',cr.rule_id) conversion_rule_id,
  ''silver_lims_houston'' source_system
  FROM OGFS_DEMO.SILVER.silver_lims_houston s
   LEFT JOIN OGFS_DEMO.BRONZE.lims_houston_samples b ON b.source_row_number=s.source_row_number
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
  LEFT JOIN OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference mr
    ON REGEXP_REPLACE(UPPER(TRIM(mr.source_method_name)), ''[^A-Z0-9]'', '''')=REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
  LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
    ON tm.governed_standard_reference=COALESCE(mr.governed_standard_reference,s.test_type)
  LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
    ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
  LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
  LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
    ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
  WHERE s.result_value IS NOT NULL AND u.canonical_code IS NOT NULL AND qt.standard_unit IS NOT NULL
    AND (u.canonical_code=qt.standard_unit OR cr.rule_id IS NOT NULL)
UNION ALL
SELECT ''RES_'' || MD5(''silver_lims_curitiba:'' || s.source_row_number) test_result_key,
  ''SMP_'' || MD5(''curitiba:'' || s.source_row_number) lab_sample_key,
  tm.test_method_key, m.material_key, TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) result_date,
  s.result_value original_result_value, s.result_unit original_result_unit,
  IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) result_value, qt.standard_unit result_unit,
  IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) spec_lower_limit, IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)) spec_upper_limit,
  IFF(IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) BETWEEN IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) AND IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)),TRUE,FALSE) within_spec,
  CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END quantity_type, u.canonical_code recorded_unit_code,
  u.canonical_code<>qt.standard_unit conversion_applied,
  IFF(u.canonical_code=qt.standard_unit,''identity'',cr.rule_id) conversion_rule_id,
  ''silver_lims_curitiba'' source_system
  FROM OGFS_DEMO.SILVER.silver_lims_curitiba s
   LEFT JOIN OGFS_DEMO.BRONZE.lims_curitiba_amostras b ON b.source_row_number=s.source_row_number
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
  LEFT JOIN OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference mr
    ON REGEXP_REPLACE(UPPER(TRIM(mr.source_method_name)), ''[^A-Z0-9]'', '''')=REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
  LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
    ON tm.governed_standard_reference=COALESCE(mr.governed_standard_reference,s.test_type)
  LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
    ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
  LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
  LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
    ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
  WHERE s.result_value IS NOT NULL AND u.canonical_code IS NOT NULL AND qt.standard_unit IS NOT NULL
    AND (u.canonical_code=qt.standard_unit OR cr.rule_id IS NOT NULL)
UNION ALL
SELECT ''RES_'' || MD5(''silver_lims_buenos_aires:'' || s.source_row_number) test_result_key,
  ''SMP_'' || MD5(''buenos_aires:'' || s.source_row_number) lab_sample_key,
  tm.test_method_key, m.material_key, TRY_TO_TIMESTAMP_NTZ(TO_VARCHAR(s.date_completed)) result_date,
  s.result_value original_result_value, s.result_unit original_result_unit,
  IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) result_value, qt.standard_unit result_unit,
  IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) spec_lower_limit, IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)) spec_upper_limit,
  IFF(IFF(u.canonical_code=qt.standard_unit,s.result_value,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.result_value) < 100, 0.226*(s.result_value) - 195/(s.result_value), 0.220*(s.result_value) - 135/(s.result_value)) WHEN ''cst_to_sus'' THEN IFF((s.result_value) < 20.6, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 176.28))/0.452, ((s.result_value) + SQRT((s.result_value)*(s.result_value) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.result_value) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.result_value) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.result_value) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.result_value) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.result_value) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.result_value) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.result_value)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.result_value)-131.5 WHEN ''g_to_kg'' THEN ((s.result_value) * 0.001) WHEN ''kg_to_g'' THEN ((s.result_value) * 1000) WHEN ''mg_to_kg'' THEN ((s.result_value) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.result_value) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.result_value) * 0.001) WHEN ''l_to_ml'' THEN ((s.result_value) * 1000) WHEN ''m3_to_l'' THEN ((s.result_value) * 1000) WHEN ''usgal_to_l'' THEN ((s.result_value) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.result_value) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.result_value) * 100) WHEN ''psi_to_bar'' THEN ((s.result_value) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.result_value) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.result_value) * 10000) END) BETWEEN IFF(s.spec_lower_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_lower_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_lower_limit) < 100, 0.226*(s.spec_lower_limit) - 195/(s.spec_lower_limit), 0.220*(s.spec_lower_limit) - 135/(s.spec_lower_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_lower_limit) < 20.6, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 176.28))/0.452, ((s.spec_lower_limit) + SQRT((s.spec_lower_limit)*(s.spec_lower_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_lower_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_lower_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_lower_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_lower_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_lower_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_lower_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_lower_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_lower_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_lower_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_lower_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_lower_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_lower_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_lower_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_lower_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_lower_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_lower_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_lower_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_lower_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_lower_limit) * 10000) END)) AND IFF(s.spec_upper_limit IS NULL,NULL,IFF(u.canonical_code=qt.standard_unit,s.spec_upper_limit,CASE cr.rule_id WHEN ''sus_to_cst'' THEN IFF((s.spec_upper_limit) < 100, 0.226*(s.spec_upper_limit) - 195/(s.spec_upper_limit), 0.220*(s.spec_upper_limit) - 135/(s.spec_upper_limit)) WHEN ''cst_to_sus'' THEN IFF((s.spec_upper_limit) < 20.6, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 176.28))/0.452, ((s.spec_upper_limit) + SQRT((s.spec_upper_limit)*(s.spec_upper_limit) + 118.8))/0.44) WHEN ''f_to_c'' THEN ((s.spec_upper_limit) * 0.5555555555555556 + -17.77777777777778) WHEN ''c_to_f'' THEN ((s.spec_upper_limit) * 1.8 + 32) WHEN ''k_to_c'' THEN ((s.spec_upper_limit) * 1 + -273.15) WHEN ''c_to_k'' THEN ((s.spec_upper_limit) * 1 + 273.15) WHEN ''gcm3_to_kgm3'' THEN ((s.spec_upper_limit) * 1000) WHEN ''kgm3_to_gcm3'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''api_to_sg'' THEN 141.5/((s.spec_upper_limit)+131.5) WHEN ''sg_to_api'' THEN 141.5/(s.spec_upper_limit)-131.5 WHEN ''g_to_kg'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''kg_to_g'' THEN ((s.spec_upper_limit) * 1000) WHEN ''mg_to_kg'' THEN ((s.spec_upper_limit) * 0.000001) WHEN ''lb_to_kg'' THEN ((s.spec_upper_limit) * 0.45359237) WHEN ''ml_to_l'' THEN ((s.spec_upper_limit) * 0.001) WHEN ''l_to_ml'' THEN ((s.spec_upper_limit) * 1000) WHEN ''m3_to_l'' THEN ((s.spec_upper_limit) * 1000) WHEN ''usgal_to_l'' THEN ((s.spec_upper_limit) * 3.785411784) WHEN ''kpa_to_bar'' THEN ((s.spec_upper_limit) * 0.01) WHEN ''bar_to_kpa'' THEN ((s.spec_upper_limit) * 100) WHEN ''psi_to_bar'' THEN ((s.spec_upper_limit) * 0.0689475729) WHEN ''percent_to_mgkg'' THEN ((s.spec_upper_limit) * 10000) WHEN ''sulfur_percent_to_ppm'' THEN ((s.spec_upper_limit) * 10000) END)),TRUE,FALSE) within_spec,
  CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END quantity_type, u.canonical_code recorded_unit_code,
  u.canonical_code<>qt.standard_unit conversion_applied,
  IFF(u.canonical_code=qt.standard_unit,''identity'',cr.rule_id) conversion_rule_id,
  ''silver_lims_buenos_aires'' source_system
  FROM OGFS_DEMO.SILVER.silver_lims_buenos_aires s
   LEFT JOIN OGFS_DEMO.BRONZE.lab_muestras_ba b ON b.source_row_number=s.source_row_number
  LEFT JOIN OGFS_DEMO.SILVER.material_identity_map mi ON LOWER(mi.source_material_code)=LOWER(s.material_code)
  LEFT JOIN OGFS_DEMO.SILVER.conformed_material m ON m.material_key=mi.material_key
  LEFT JOIN OGFS_DEMO.SILVER.governed_astm_ilsac_test_method_reference mr
    ON REGEXP_REPLACE(UPPER(TRIM(mr.source_method_name)), ''[^A-Z0-9]'', '''')=REGEXP_REPLACE(UPPER(TRIM(s.test_type)), ''[^A-Z0-9]'', '''')
  LEFT JOIN OGFS_DEMO.SILVER.conformed_test_method tm
    ON tm.governed_standard_reference=COALESCE(mr.governed_standard_reference,s.test_type)
  LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
    ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
  LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
  LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
    ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
  WHERE s.result_value IS NOT NULL AND u.canonical_code IS NOT NULL AND qt.standard_unit IS NOT NULL
    AND (u.canonical_code=qt.standard_unit OR cr.rule_id IS NOT NULL)';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
INSERT INTO OGFS_DEMO.SILVER.quarantine_records
  (source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,quarantined_at)
SELECT source_table,source_row_number,rule_name,reason,site_code,review_status,source_data,CURRENT_TIMESTAMP()
FROM (SELECT ''silver_lims_annandale'' source_table,s.source_row_number source_row_number,''uom_conversion'' rule_name,
      CASE WHEN CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL THEN ''Quantity type is unresolved for test method: ''||COALESCE(TO_VARCHAR(s.test_type),''(missing)'')
           WHEN u.canonical_code IS NULL THEN ''Unit is unrecognised: ''||COALESCE(TO_VARCHAR(s.result_unit),''(missing)'')
           ELSE ''Unit is recognised but no conversion path exists from ''||u.canonical_code||'' to ''||qt.standard_unit END reason,
      ''annandale'' site_code,''quarantined'' review_status,OBJECT_CONSTRUCT_KEEP_NULL(s.*) source_data
    FROM OGFS_DEMO.SILVER.silver_lims_annandale s
    LEFT JOIN OGFS_DEMO.BRONZE.lims_annandale_samples b ON b.source_row_number=s.source_row_number
    LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
      ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
    LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
    LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
      ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
    WHERE s.result_value IS NOT NULL AND (CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL OR u.canonical_code IS NULL OR qt.standard_unit IS NULL OR (u.canonical_code<>qt.standard_unit AND cr.rule_id IS NULL))
UNION ALL
SELECT ''silver_lims_houston'' source_table,s.source_row_number source_row_number,''uom_conversion'' rule_name,
      CASE WHEN CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL THEN ''Quantity type is unresolved for test method: ''||COALESCE(TO_VARCHAR(s.test_type),''(missing)'')
           WHEN u.canonical_code IS NULL THEN ''Unit is unrecognised: ''||COALESCE(TO_VARCHAR(s.result_unit),''(missing)'')
           ELSE ''Unit is recognised but no conversion path exists from ''||u.canonical_code||'' to ''||qt.standard_unit END reason,
      ''houston'' site_code,''quarantined'' review_status,OBJECT_CONSTRUCT_KEEP_NULL(s.*) source_data
    FROM OGFS_DEMO.SILVER.silver_lims_houston s
    LEFT JOIN OGFS_DEMO.BRONZE.lims_houston_samples b ON b.source_row_number=s.source_row_number
    LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
      ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
    LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
    LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
      ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
    WHERE s.result_value IS NOT NULL AND (CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL OR u.canonical_code IS NULL OR qt.standard_unit IS NULL OR (u.canonical_code<>qt.standard_unit AND cr.rule_id IS NULL))
UNION ALL
SELECT ''silver_lims_curitiba'' source_table,s.source_row_number source_row_number,''uom_conversion'' rule_name,
      CASE WHEN CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL THEN ''Quantity type is unresolved for test method: ''||COALESCE(TO_VARCHAR(s.test_type),''(missing)'')
           WHEN u.canonical_code IS NULL THEN ''Unit is unrecognised: ''||COALESCE(TO_VARCHAR(s.result_unit),''(missing)'')
           ELSE ''Unit is recognised but no conversion path exists from ''||u.canonical_code||'' to ''||qt.standard_unit END reason,
      ''curitiba'' site_code,''quarantined'' review_status,OBJECT_CONSTRUCT_KEEP_NULL(s.*) source_data
    FROM OGFS_DEMO.SILVER.silver_lims_curitiba s
    LEFT JOIN OGFS_DEMO.BRONZE.lims_curitiba_amostras b ON b.source_row_number=s.source_row_number
    LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
      ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
    LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
    LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
      ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
    WHERE s.result_value IS NOT NULL AND (CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL OR u.canonical_code IS NULL OR qt.standard_unit IS NULL OR (u.canonical_code<>qt.standard_unit AND cr.rule_id IS NULL))
UNION ALL
SELECT ''silver_lims_buenos_aires'' source_table,s.source_row_number source_row_number,''uom_conversion'' rule_name,
      CASE WHEN CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL THEN ''Quantity type is unresolved for test method: ''||COALESCE(TO_VARCHAR(s.test_type),''(missing)'')
           WHEN u.canonical_code IS NULL THEN ''Unit is unrecognised: ''||COALESCE(TO_VARCHAR(s.result_unit),''(missing)'')
           ELSE ''Unit is recognised but no conversion path exists from ''||u.canonical_code||'' to ''||qt.standard_unit END reason,
      ''buenos_aires'' site_code,''quarantined'' review_status,OBJECT_CONSTRUCT_KEEP_NULL(s.*) source_data
    FROM OGFS_DEMO.SILVER.silver_lims_buenos_aires s
    LEFT JOIN OGFS_DEMO.BRONZE.lab_muestras_ba b ON b.source_row_number=s.source_row_number
    LEFT JOIN OGFS_DEMO.SILVER.unit_registry u
      ON u.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND LOWER(TRIM(u.accepted_alias))=LOWER(TRIM(s.result_unit))
    LEFT JOIN OGFS_DEMO.SILVER.quantity_types qt ON qt.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END
    LEFT JOIN OGFS_DEMO.SILVER.unit_conversion_rules cr
      ON cr.quantity_type=CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END AND cr.from_unit=u.canonical_code AND cr.to_unit=qt.standard_unit
    WHERE s.result_value IS NOT NULL AND (CASE
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%APIGRAVITY%'' THEN ''specific_gravity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%DENSITY%'' THEN ''density''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%VISC%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''KV100'',''CCS'',''VI'') THEN ''viscosity''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%FLASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%POURPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%CLOUDPOINT%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ANILINEPOINT%'' THEN ''temperature''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULFUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%SULPHUR%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WEARMETALS%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ICP%'' THEN ''sulfur_trace''
    WHEN REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%WATER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ASH%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%ACIDNUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') LIKE ''%BASENUMBER%'' OR REGEXP_REPLACE(UPPER(TRIM(b.test_type)), ''[^A-Z0-9]'', '''') IN (''TAN'',''TBN'') THEN ''concentration''
    ELSE NULL
  END IS NULL OR u.canonical_code IS NULL OR qt.standard_unit IS NULL OR (u.canonical_code<>qt.standard_unit AND cr.rule_id IS NULL)))';
  EXECUTE IMMEDIATE '-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.SILVER.unrecognized_units AS
SELECT source_data:result_unit::VARCHAR recorded_unit,reason,site_code,COUNT(*) occurrence_count
FROM OGFS_DEMO.SILVER.quarantine_records
 WHERE (rule_name=''uom_conversion'' AND reason LIKE ''Unit is unrecognised:%'')
    OR (rule_name=''uom_vocabulary'' AND reason LIKE ''Unit cannot be resolved in unit_registry:%'')
GROUP BY recorded_unit,reason,site_code';
  RETURN 'ok';
END;
$$;
CREATE OR REPLACE TASK OGFS_DEMO.SILVER.silver_pipeline_task
  WAREHOUSE = OGFS_DEMO_WH AFTER OGFS_DEMO.BRONZE.bronze_pipeline_task
  USER_TASK_TIMEOUT_MS = 3600000
  SUSPEND_TASK_AFTER_NUM_FAILURES = 2
AS CALL OGFS_DEMO.SILVER.run_silver_pipeline();
