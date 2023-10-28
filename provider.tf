# configure aws provider
provider "aws" {
  region  = var.region
  #profile = "nacromancer"
}

terraform {
  backend "s3" {
    bucket         	   = "eks-cluster-prophius-project"
    key                = "state/terraform.tfstate"
    region         	   = "us-east-2"
    encrypt        	   = true
    dynamodb_table     = "mycomponents_tf_lockid"
  }
}