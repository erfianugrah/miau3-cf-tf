resource "cloudflare_access_identity_provider" "google_workspace" {
  account_id = var.cloudflare_account_id
  name       = "Google Workspace"
  type       = "google-apps"
  config {
    apps_domain      = var.main_domain_name
    client_id        = var.google_workspace_client_id
    client_secret    = var.google_workspace_secret
    # claims           = ["group"]
    email_claim_name = "email"
  }
}

resource "cloudflare_access_identity_provider" "otp" {
  account_id = var.cloudflare_account_id
  name       = "PIN login"
  type       = "onetimepin"
}
