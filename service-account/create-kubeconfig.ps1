$ns = "srvc-account"
$API_SERVER_URL = kubectl --kubeconfig='kubeconfig.yaml' config view -o=jsonpath='{.clusters[].cluster.server}'

$SECRET_NAME = "spinkube-service-account"

$CA = kubectl --kubeconfig='kubeconfig.yaml' get secret/$SECRET_NAME -n $ns -o jsonpath='{.data.ca\.crt}'

$TOKEN = kubectl --kubeconfig='kubeconfig.yaml' get secret/$SECRET_NAME -n $ns -o jsonpath='{.data.token}'
$DEC_TOKEN = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($TOKEN))

Add-Content -Path templates/kubeconfig.yaml @"
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: $CA
    server: $API_SERVER_URL
users:
- name: default-user
  user:
    token: $DEC_TOKEN
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: $ns
    user: default-user
current-context: default-context
"@


Write-Host "Finished"
