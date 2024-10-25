-- Macro for enabling the model to run

{% macro enable() %}
    {% set dbt_path = model.path.split('/')[:-1]|join(".") %}

    {% set path_to_check = var('MODEL_PATH') %}
    {% if path_to_check == 'ALL' or dbt_path == path_to_check %}
        {{ log('model_path: '~dbt_path, info=true) }}
        {{ log('path_to_check: '~path_to_check, info=true) }}

        {% if not execute %}
            {{ log('Starting ---> '~this.name, info=true) }}
        {% else %}
            {{ log('Running ----> '~this.name, info=true) }}
        {% endif %}
        {% do return(true) %}
    {% else %}
        {% do return(false) %}
    {% endif %}
{% endmacro %}

