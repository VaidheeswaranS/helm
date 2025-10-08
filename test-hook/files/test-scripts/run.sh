#!/bin/sh

echo "Installing the curl command"
apk update && apk add --no-cache curl

echo "Executing the curl request to {{ .Release.Name }}"
curl http://{{ include "test-hook.fullname" . }}:{{ .Values.service.port }}
