--Macro to form the file name based on the file name and extra vars passed to the running model

{% macro get_table_name() %}
    {% set table_name = this.name %}
    {% if var('FILTER', 'default') != 'default' %}
        {% set table_name = table_name ~'_' ~ var('FILTER')[0] ~'_'~ var('FILTER')[1]%}
    {% endif %}

    {{ log('Table Name: ' ~table_name , info=true) }}
    {% do return(table_name) %}
{% endmacro %}