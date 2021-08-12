output "gitlab_ip" {
  value       = vsphere_virtual_machine.gitlab.*.default_ip_address
}
output "jenkins_ip" {
  value       = vsphere_virtual_machine.jenkins.*.default_ip_address
}
output "bind9_ip" {
  value       = vsphere_virtual_machine.bind9.*.default_ip_address
}
output "client_ip" {
  value       = vsphere_virtual_machine.client.*.default_ip_address
}
