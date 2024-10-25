-- Macro overwriting the default macro to only accept passed schema name

{% macro generate_schema_name(custom_schema_name, node) %}
    {{ custom_schema_name }}
{% endmacro %}