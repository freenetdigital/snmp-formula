{% from "snmp/map.jinja" import snmp with context %}

include:
  - snmp

trap:
  service.running:
    - name: {{ snmp.servicetrap }}
    {% if grains["fqdn"] is match("svc-esb-*") %}
    - enable: True
    {% else %}
    - enable: False
    {% endif %}
