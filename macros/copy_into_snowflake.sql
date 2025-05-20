{% macro copy_csv(model_name, stage_name, file_path) %}

COPY INTO {{ model_name }} FROM {{ stage_name }}
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1 DATE_FORMAT = 'YYYY-MM-DD')
PATTERN = '{{ file_path }}'

{% endmacro %}

