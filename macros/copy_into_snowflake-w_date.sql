
{% macro copy_csv_w_date(model_name, stage_name, file_path) %}
{% set columns = adapter.get_columns_in_relation(model_name) %}
{% set column_names = columns | map(attribute='name') | list %}
{% set column_list = column_names | join(', ') %}


{% set select_expressions = [] %}
{% for i in range(1, column_names | length + 1) %}
    {% set column_name = column_names[i - 1] %}
    {% if column_name | lower == 'insert_date' %}
        {% do select_expressions.append('CURRENT_TIMESTAMP') %}
    {% else %}
        {% do select_expressions.append('$' ~ i) %}
    {% endif %}
{% endfor %}
{% set select_expression = select_expressions | join(', ') %}

COPY INTO {{ model_name }} ({{ column_list }}) 
FROM (
    SELECT {{select_expression}}
    FROM {{ stage_name }}
)
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1 DATE_FORMAT = 'YYYY-MM-DD')
PATTERN = '{{ file_path }}'
ON_ERROR = 'CONTINUE'

{% endmacro %}

