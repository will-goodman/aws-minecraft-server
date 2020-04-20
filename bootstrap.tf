module "bootstrap" {
  source = "github.com/will-goodman/aws-terraform-modules//bootstrap"

  state_bucket_name = "95qded-terraform-state"
  lock_table_name   = "tf-state-lock-table"

}