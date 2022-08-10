#provider "gcorelabs" { token = var.ga_token }
#terraform {
#  required_providers {
#    gcore = {
#      source = "G-Core/gcorelabs"
#      version = "0.3.48"
#    }
#  }
#}
terraform {
  required_providers {
    gcorelabs = {
      source = "G-Core/gcorelabs"
      version = "0.3.48"
    }
  }
}

provider gcore {
  permanent_api_token = "2360$b9311e3ae51b846586d01dce5174f1a537a728f5b04e41d36834530c6e57005039b66b3d8c734bacc2e46785dd2481fd46111778b7362c7d85bcc76f63ed49e1"
}
