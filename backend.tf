
terraform {
  required_version = ">=0.12.20"
  backend "s3" {
    bucket         = "95qded-terraform-state"
    key            = "minecraftserver.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "tf-state-lock-table"
    encrypt        = true
  }
}
