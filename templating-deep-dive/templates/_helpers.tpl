# Always use chart name is the first name for Named Template
# here the chart name is "templating-deep-dive"

{{/*
If "customName" in Values.yaml is not set, use the default name
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}

{{- define "templating-deep-dive.fullName" -}}
{{- $defaultName := printf "%s-%s" .Release.Name .Chart.Name }}
{{- .Values.customName | default $defaultName | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "templating-deep-dive.selectorLables" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
{{- end -}}