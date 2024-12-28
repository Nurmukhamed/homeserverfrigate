source "null" "test" {
  communicator = "none"
}

locals {
  network = templatefile("${abspath(path.root)}/network.pkrtpl", {
    device  = var.vm_network_device,
    ip      = var.vm_ip_address,
    netmask = var.vm_ip_netmask,
    gateway = var.vm_ip_gateway,
    dns     = var.vm_dns_list,
  })
}

build {
  name    = "network"
  sources = ["source.null.test"]
  provisioner "shell-local" {
    inline = [
      "echo '${local.network}' > ${abspath(path.root)}/network",
    ]
  }
}
