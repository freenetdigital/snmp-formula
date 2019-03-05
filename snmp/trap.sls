{% from "snmp/map.jinja" import snmp with context %}

include:
  - snmp

trap:
  service.running:
    - name: {{ snmp.servicetrap }}
    {% if grains["fqdn"][0:8] == "svc-esb-" %}
    - enable: True
    {% else %}
    - enable: False
    {% endif %}
