-- Foundation Studio · Snowflake execution SQL
-- foundation:stage 2
CREATE OR REPLACE TABLE OGFS_DEMO.GOLD.kpi_scope AS
SELECT column1::VARCHAR kpi_name,column2::BOOLEAN included,column3::VARCHAR skip_reason,
       PARSE_JSON(BASE64_DECODE_STRING(column4))::VARIANT site_policy,column5::VARCHAR policy_summary
FROM VALUES ('Cross-Lab Data Standardization Rate',TRUE,NULL,'W10=',''),
('Cross-Lab Reproducibility Index',TRUE,NULL,'W10=',''),
('Cross-Site Result Correlation',TRUE,NULL,'W10=',''),
('Duplicate Test Rate Across Labs',TRUE,NULL,'W10=',''),
('Inter-Site Result Deviation',TRUE,NULL,'W10=',''),
('Site-Pair Agreement by Method',TRUE,NULL,'W10=',''),
('Test Method Standardization Rate',TRUE,NULL,'W10=',''),
('Unmatched Sample Rate',TRUE,NULL,'W10=',''),
('Backlog Aging Index',TRUE,NULL,'W10=',''),
('First-Time-Right Rate',TRUE,NULL,'W3sic2l0ZUlkIjoiY3VyaXRpYmEiLCJzaXRlTmFtZSI6IkN1cml0aWJhIiwiZmllbGRzIjpbInNwZWNfbG93ZXJfbGltaXQiLCJzcGVjX3VwcGVyX2xpbWl0Il0sInJlYXNvbiI6IkV4Y2x1ZGVkIGJlY2F1c2Ugc3BlY19sb3dlcl9saW1pdCBhbmQgc3BlY191cHBlcl9saW1pdCBhcmUgbm90IGNhcHR1cmVkIGF0IHNvdXJjZS4ifV0=','Excludes Curitiba from this KPI calculation.'),
('Instrument Throughput',TRUE,NULL,'W10=',''),
('LIMS Data Completeness',TRUE,NULL,'W3sic2l0ZUlkIjoiY3VyaXRpYmEiLCJzaXRlTmFtZSI6IkN1cml0aWJhIiwiZmllbGRzIjpbImFuYWx5c3RfaWQiLCJwcm9qZWN0X3JlZmVyZW5jZSIsInNwZWNfbG93ZXJfbGltaXQiLCJzcGVjX3VwcGVyX2xpbWl0IiwiYXBwcm92YWxfZGF0ZSIsInN0b3JhZ2VfbG9jYXRpb24iXSwicmVhc29uIjoiTm90IGNhcHR1cmVkIGF0IHNvdXJjZTsgY291bnRlZCBhcyA2IGNvbXBsZXRlbmVzcyBnYXBzLiJ9LHsic2l0ZUlkIjoiYnVlbm9zX2FpcmVzIiwic2l0ZU5hbWUiOiJCdWVub3MgQWlyZXMiLCJmaWVsZHMiOlsiY29tbWVudHMiXSwicmVhc29uIjoiTm90IGNhcHR1cmVkIGF0IHNvdXJjZTsgY291bnRlZCBhcyAxIGNvbXBsZXRlbmVzcyBnYXAuIn1d','Curitiba, Buenos Aires source gaps are included in the completeness denominator.'),
('Lab Capacity Utilization',TRUE,NULL,'W10=',''),
('Retest Rate',TRUE,NULL,'W10=',''),
('Sample Turnaround Time',TRUE,NULL,'W10=','');
