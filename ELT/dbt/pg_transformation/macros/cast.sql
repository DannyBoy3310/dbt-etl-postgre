-- Macro to create cast statement

{% macro cast(column_name, data_type) -%}
    cast({{ column_name }} as {{data_type }})
{%- endmacro %}