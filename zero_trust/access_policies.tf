resource "cloudflare_access_policy" "allow_erfi" {
  # application_id   = cloudflare_access_application.kvm.id
  account_id = var.cloudflare_account_id
  name       = "Allow Erfi"
  # precedence       = "1"
  decision         = "allow"
  session_duration = "30m"

  include {
    group = [cloudflare_access_group.erfi_corp.id]
  }
}

resource "cloudflare_access_policy" "warp_auth_token" {
  # application_id   = cloudflare_access_application.prometheus.id
  account_id = var.cloudflare_account_id
  name       = "warp_auth_token"
  # precedence       = "2"
  decision         = "non_identity"
  session_duration = "30m"

  include {
    service_token = [cloudflare_access_service_token.warp_auth_token.id]
  }
}

resource "cloudflare_access_policy" "allow_unker" {
  # application_id   = cloudflare_access_application.privatebin.id
  account_id = var.cloudflare_account_id
  name       = "Allow Unker"
  # precedence       = "2"
  decision         = "allow"
  session_duration = "30m"

  include {
    group = [cloudflare_access_group.unker.id]
  }

  # approval_group {
  #   approvals_needed = 1
  #   email_addresses  = [var.cloudflare_email]
  # }
}

resource "cloudflare_access_policy" "allow_cf" {
  # application_id   = cloudflare_access_application.privatebin.id
  account_id = var.cloudflare_account_id
  name       = "Allow Cloudflare"
  # precedence       = "3"
  decision         = "allow"
  session_duration = "30m"

  include {
    email_domain = ["cloudflare.com"]
  }

  # approval_group {
  #   approvals_needed = 1
  #   email_addresses  = [var.cloudflare_email]
  # }
}

resource "cloudflare_access_policy" "allow_lena" {
  # application_id   = cloudflare_access_application.filebrowser.id
  account_id = var.cloudflare_account_id
  name       = "Allow Lena"
  # precedence       = "2"
  decision         = "allow"
  session_duration = "30m"

  include {
    email = var.lena_email
  }
}
