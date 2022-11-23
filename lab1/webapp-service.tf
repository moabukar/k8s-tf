resource "kubernetes_service" "webapp-service" {
  metadata {
    name = "webapp-service"
  }
  spec {
    session_affinity = "ClientIP"
    port {
      port     = 8080
      node_port = 30080
    }

    type = "NodePort"
  }
}