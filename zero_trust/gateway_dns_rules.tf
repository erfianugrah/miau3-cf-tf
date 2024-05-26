resource "cloudflare_teams_rule" "allow_ig_dns" {
  account_id  = var.cloudflare_account_id
  name        = "Allow IG DNS"
  description = ""
  precedence  = 1500
  action      = "block"
  filters     = ["dns"]
  enabled     = false
  traffic     = "dns.fqdn == \"www.instagram.com\""
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}

resource "cloudflare_teams_rule" "block_all_dns" {
  account_id  = var.cloudflare_account_id
  name        = "Allow All DNS"
  description = ""
  precedence  = 2000
  action      = "block"
  filters     = ["dns"]
  enabled     = false
  traffic     = "any(dns.domains[*] matches \".*\")"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}


resource "cloudflare_teams_rule" "block_sec_categories_dns" {
  account_id  = var.cloudflare_account_id
  name        = "Security Categories"
  description = ""
  precedence  = 3000
  action      = "block"
  filters     = ["dns"]
  enabled     = false
  traffic     = "any(dns.security_category[*] in {68 80 83 176 175 117 169 177 131 134 151 153})"
  rule_settings {
    block_page_enabled                 = false
    ip_categories                      = false
    insecure_disable_dnssec_validation = false
    biso_admin_controls {
      disable_copy_paste = false
      disable_download   = false
      disable_keyboard   = false
      disable_printing   = false
      disable_upload     = false
    }
  }
}
