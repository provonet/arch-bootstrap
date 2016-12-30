# Configuration file for locale-gen
#
# lists of locales that are to be generated by the locale-gen command.
#
# Each line is of the form:
#
#     <locale> <charset>
#
#  where <locale> is one of the locales given in /usr/share/i18n/locales
#  and <charset> is one of the character sets listed in /usr/share/i18n/charmaps
#
#  Examples:
#  en_US ISO-8859-1
#  en_US.UTF-8 UTF-8
#  de_DE ISO-8859-1
#  de_DE@euro ISO-8859-15
#
#  The locale-gen command will generate all the locales,
#  placing them in /usr/lib/locale.
#
#  A list of supported locales is included in this file.
#  Uncomment the ones you need.
#
{% for entry in languages.locales -%}
{{ entry.locale }} {{ entry.charset }} 
{% endfor -%}
