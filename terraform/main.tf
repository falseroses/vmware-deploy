provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "Samsung SSD"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "MainCluster"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

/*data "vsphere_virtual_machine" "template" {
  name          = "centos-8"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
} */

data "vsphere_content_library" "library" {
  name = "iso"
}

data "vsphere_content_library_item" "item" {
  name       = "centos-8"
  type = "vm-template"
  library_id = data.vsphere_content_library.library.id
}