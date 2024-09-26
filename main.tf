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

data "github_enterprise" "ctcampbellcom" {
  slug = "ctcampbellcom"
}

resource "github_enterprise_organization" "ctcampbellcom-terraform" {
  name = "ctcampbellcom-terraform"
  enterprise_id = data.github_enterprise.ctcampbellcom.id
  admin_logins = ["ctcampbell"]
  billing_email = "ctcampbell@github.com"
}

provider "github" {
  alias = "ctcampbellcom-terraform"
  owner = resource.github_enterprise_organization.ctcampbellcom-terraform.name
}

module "ctcampbellcom-terraform" {
  source    = "./ctcampbellcom-terraform"
  providers = {
    github = github.ctcampbellcom-terraform
  }
}
