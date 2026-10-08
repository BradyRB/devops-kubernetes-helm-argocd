# Kubernetes + Helm + Argo CD | GitOps

Repositorio publico de demostracion para la asignacion DevOps (INTEC).

## Helm Chart
- `charts/hello-gitops/Chart.yaml`: metadatos.
- `charts/hello-gitops/values.yaml`: replicas, imagen y pagina.
- `charts/hello-gitops/templates/`: Deployment, Service y ConfigMap.

## Ciclo de prueba
1. Instalar chart local con `helm install hello-gitops-demo ./charts/hello-gitops -n gitops-demo --create-namespace`.
2. Verificar y desinstalar la release de prueba con `helm uninstall hello-gitops-demo -n gitops-demo`.
3. Crear Application de Argo CD apuntando a `charts/hello-gitops` en este repositorio.
4. Cambiar `replicaCount: 2` a `replicaCount: 3` y publicar commit + push en `main`.
5. Validar `Synced / Healthy` y las 3 replicas.
6. Hacer `git revert` del commit de cambio, `git push` y comprobar que vuelve a 2 replicas.

Los manifiestos del directorio `templates` son renderizados por Helm; Argo CD controla la sincronizacion de la aplicacion.
