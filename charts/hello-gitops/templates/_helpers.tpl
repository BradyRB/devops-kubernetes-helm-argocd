{{- define "hello-gitops.name" -}}
{{- .Chart.Name -}}
{{- end -}}
{{- define "hello-gitops.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "hello-gitops.labels" -}}
app.kubernetes.io/name: {{ include "hello-gitops.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}
{{- define "hello-gitops.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hello-gitops.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
