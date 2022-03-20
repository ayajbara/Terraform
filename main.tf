provider "aws" {
  region = "eu-west-1"
}


module "resources" {
  source = "./resources"
}