resource "hcloud_load_balancer" "web_lb" {
  name               = "web_lb"
  load_balancer_type = "lb11"
  location           = var.location
  labels = {
    type = "web"
  }

  dynamic "target" {
    for_each = hcloud_server.web
    content {
      type      = "server"
      server_id = target.value["id"]
    }
  }

  algorithm {
    type = "round_robin"
  }
}

resource "hcloud_load_balancer_service" "web_lb_service" {
  load_balancer_id = hcloud_load_balancer.web_lb.id
  protocol         = var.http_protocol
  listen_port      = var.http_port
  destination_port = var.http_port

  health_check {
    protocol = var.http_protocol
    port     = var.http_port
    interval = "10"
    timeout  = "10"
    http {
      path         = "/"
      status_codes = ["2??", "3??"]
    }
  }
}

resource "hcloud_load_balancer_network" "web_network" {
  load_balancer_id        = hcloud_load_balancer.web_lb.id
  subnet_id               = hcloud_network_subnet.hc_private_subnet.id
  enable_public_interface = "true"
}
