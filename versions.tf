terraform {
  required_version = ">= 1.5.7"

  backend "s3" {
    bucket = "cmtr-t5hlnn4c-backend-new-bucket-1780896786"
    key    = "tf_code.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.100.0"
    }
  }
}
