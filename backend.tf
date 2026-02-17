terraform {
  backend "s3" {
    bucket       = "connect-backend-state-bucket"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}