terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Add a user to the organization
resource "github_membership" "membership_for_user_x" {
  username = "ctcampbell-test1"
  role     = "member"
}

resource "github_membership" "membership_for_user_y" {
  username = "ctcampbell-test2"
  role     = "member"
}

resource "github_repository" "terraform-configurations" {
  name = "terraform-configurations"
  visibility = "private"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "test_repository_1" {
  name = "test-repository-1"
  # allow_rebase_merge = true
  visibility = "private"
}