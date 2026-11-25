output "container_names" {
  value = docker_container.nginx[*].name
}
output "ports" {
  value = docker_container.nginx[*].ports[0].external
}