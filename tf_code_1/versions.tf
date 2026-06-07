terraform {
  required_version = ">= 1.5.7"

  backend "s3" {
    bucket = "cmtr-t5hlnn4c-backend-bucket-1780864102"
    key    = "tf_code_1.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }
  }
}
