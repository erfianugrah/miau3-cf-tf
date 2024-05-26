resource "cloudflare_access_service_token" "warp_auth_token" {
  account_id = var.cloudflare_account_id
  name       = "warp_auth_token"
  duration   = "forever"
}
