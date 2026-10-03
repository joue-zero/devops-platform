{{/*
  app.fullname: generates a consistent name like "app-devops-platform"
  Used in every template so naming is consistent across all objects.
*/}}
{{- define "app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
  app.labels: standard labels applied to every Kubernetes object.
  Labels are how Kubernetes connects objects — a Service finds
  its pods by matching these labels.
*/}}
{{- define "app.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
  app.selectorLabels: subset of labels used by Service to select pods.
  Must match exactly between Deployment.spec.selector and Service.spec.selector.
*/}}
{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
