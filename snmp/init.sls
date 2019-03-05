{% from "snmp/map.jinja" import snmp with context %}

snmp:
  pkg.installed:
    - name: {{ snmp.pkg }}
  service.running:
    - name: {{ snmp.service }}
    {% if grains["fqdn"][0:8] == "svc-esb-" %}
    - enable: True
    {% else %}
    - enable: False
    {% endif %}
    - require:
      - pkg: {{ snmp.pkg }}

{% if grains['os_family'] == 'Debian' %}
include:
  - snmp.default
{% endif %}
