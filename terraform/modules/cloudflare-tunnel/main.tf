
locals {
  token = "8O9T9J6P0IRXnaL8k7UpiofSIWMdWX6YikzGz4nJ"
}

resource "cloudflare_argo_tunnel" "example" {
  account_id = "d41d8cd98f00b204e9800998ecf8427e"
  name       = "my-tunnel"
  secret     = local.token
}
