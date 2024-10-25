# DBT Macros

DBT macros can be compared closely to the Python functions. Macros are SQL files which contain a reusable piece of snippet written using Jinja2. These are used for multiple reasons including the
1. Reusable SQL snippet like CASE statements.
2. Overwrite in-built dbt-macro functionalities.
3. Assign config values for dbt models.


##### Example:

```sqlite-psql
{% macro generate_schema_name(custom_schema_name, node) %}
    {{ custom_schema_name }}
{% endmacro %}
```

The in-built generate_schema_name macro works on appending the custom_schema with the schema mentioned in the profiles.yml. In order to make the dbt models take only the custom schema passed, we are overwriting the same macro in our macros/ folder.

### Note: 
It is advised to include the macro mentioned in the example before proceeding to avoid creating unexpected schema names.