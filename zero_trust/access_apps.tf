resource "cloudflare_access_application" "warp_login" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_access_policy.allow_erfi.id,
    cloudflare_access_policy.warp_auth_token.id
  ]
  allowed_idps = [
    cloudflare_access_identity_provider.google_workspace.id,
    cloudflare_access_identity_provider.otp.id
  ]
  auto_redirect_to_identity = false
  domain                    = "miau3.cloudflareaccess.com/warp"
  name                      = "Warp Login App"
  session_duration          = "24h"
  type                      = "warp"
}

resource "cloudflare_access_application" "app_launcher" {
  account_id = var.cloudflare_account_id
  policies = [
    cloudflare_access_policy.allow_erfi.id
  ]
  allowed_idps = [
    cloudflare_access_identity_provider.google_workspace.id,
    cloudflare_access_identity_provider.otp.id
  ]
  auto_redirect_to_identity = false
  domain                    = "miau3.cloudflareaccess.com"
  name                      = "App Launcher"
  session_duration          = "24h"
  type                      = "app_launcher"
}
