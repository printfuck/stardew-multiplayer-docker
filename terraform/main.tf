
variable "hcloud_token" {}

provider "hcloud" {
  token = "${var.hcloud_token}"
}

resource "hcloud_ssh_key" "main" {
 name  = "main_key"
 public_key = "${file("./ssh/key.pub")}"
}


resource "hcloud_server" "game_node" {
  name = "game-node"
  image = "debian-9"
  server_type = "cx11"
  ssh_keys = ["${hcloud_ssh_key.main.id}"]

  provisioner "remote-exec" {
    inline = [
      "uname -a",
    ]

    connection {
      host        = "${self.ipv4_address}"
      type        = "ssh"
      user        = "root"
      private_key = "${file("./ssh/key")}"
    }
  }

  provisioner "local-exec" {
    environment {
      PUBLIC_IP  = "${self.ipv4_address}"
    }

    working_dir = "."
    command     = "ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -u root --private-key ./ssh/key ../playbook.yml -i ${self.ipv4_address},"
  }
}
