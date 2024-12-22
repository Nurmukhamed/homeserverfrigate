source "null" "test" {
  communicator = "none"
}

locals {
  storage = templatefile("${abspath(path.root)}/storage.pkrtpl", {
    device     = var.vm_disk_device,
    swap       = var.vm_disk_use_swap,
    partitions = var.vm_disk_partitions,
    lvm        = var.vm_disk_lvm,
  })
}

build {
  name    = "storage"
  sources = ["source.null.test"]
  provisioner "shell-local" {
    inline = [
      "echo '${local.storage}' > ${abspath(path.root)}/storage",
    ]
  }
}


