resource "cloudflare_split_tunnel" "default_include" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_device_settings_policy.default.id
  mode       = "exclude"
  tunnels {
    address     = "10.68.69.3"
    description = "ERFI1"
  }
  tunnels {
    address     = "10.68.73.3"
    description = "arch-0"
  }
  tunnels {
    address     = "10.68.73.2"
    description = "pve"
  }
  # tunnels {
  #   address     = "10.68.0.0/16"
  #   description = "Home"
  # }
  # tunnels {
  #   address     = "10.0.0.0/8"
  #   description = "Local"
  # }
  # tunnels {
  #   address     = "172.18.1.0/24"
  #   description = "docker-arch2-httpbun"
  # }
  # tunnels {
  #   address     = "172.21.1.0/24"
  #   description = "docker-arch4-httpbun"
  # }
  # tunnels {
  #   address     = "100.96.0.0/12"
  #   description = "CGNAT"
  # }
}

resource "cloudflare_split_tunnel" "google_include" {
  account_id = var.cloudflare_account_id
  policy_id  = cloudflare_device_settings_policy.google.id
  mode       = "exclude"
  tunnels {
    address     = "10.68.69.3"
    description = "ERFI1"
  }
  tunnels {
    address     = "10.68.73.3"
    description = "arch-0"
  }
  tunnels {
    address     = "10.68.73.2"
    description = "pve"
  }
  # tunnels {
  #   address     = "10.68.0.0/16"
  #   description = "Home"
  # }
  # tunnels {
  #   address     = "10.0.0.0/8"
  #   description = "Local"
  # }
  # tunnels {
  #   address     = "172.18.1.0/24"
  #   description = "docker-arch2-httpbun"
  # }
  # tunnels {
  #   address     = "172.21.1.0/24"
  #   description = "docker-arch4-httpbun"
  # }
  # tunnels {
  #   address     = "100.96.0.0/12"
  #   description = "CGNAT"
  # }
}
