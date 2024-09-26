# Configure the GitHub Provider
provider "github" {
  alias = "ctcampbellcom-terraform-pat"
  owner = "ctcampbellcom-terraform-pat"
}

# Add a user to the organization
resource "github_membership" "membership_for_user_x" {
  provider = github.ctcampbellcom-terraform-pat
  username = "ctcampbell-test1"
  role     = "member"
}

resource "github_membership" "membership_for_user_y" {
  provider = github.ctcampbellcom-terraform-pat
  username = "ctcampbell-test2"
  role     = "member"
}

resource "github_repository" "test_repository_1" {
  provider = github.ctcampbellcom-terraform-pat
  name = "test-repository-1"
  # allow_rebase_merge = true
  visibility = "private"
}