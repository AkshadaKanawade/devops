terraform {
  backend "s3" {
    region = "us-east-2"
    bucket = "nashik-bucket1"
    key    = "terraform.tfstate"
  }
}
