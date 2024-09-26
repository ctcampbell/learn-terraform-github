terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

provider "github" {
  alias = "ctcampbellcom-terraform-pat"
  owner = "ctcampbellcom-terraform-pat"
}

data "github_enterprise" "ctcampbellcom" {
  slug = "ctcampbellcom"
}

resource "github_enterprise_organization" "org_for_testing_pat" {
  name = "ctcampbellcom-terraform-pat"
  enterprise_id = data.github_enterprise.ctcampbellcom.id
  admin_logins = ["ctcampbell"]
  billing_email = "ctcampbell@github.com"
}

module "ctcampbellcom-terraform-pat" {
  source    = "./ctcampbellcom-terraform-pat"
  providers = {
    github = github.ctcampbellcom-terraform-pat
  }
}
