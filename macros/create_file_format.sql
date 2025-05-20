{% macro create_file_format() %}
  {% set sql %}
    CREATE OR REPLACE FILE FORMAT IF NOT EXISTS {{ target.schema }}.CSV_FORMAT
      TYPE = 'CSV'
      FIELD_DELIMITER = ','
      SKIP_HEADER = 1
      DATE_FORMAT = 'YYYY-MM-DD';
  {% endset %}
  
  {% do run_query(sql) %}
{% endmacro %}