terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
      configuration_aliases = [
        aws.source,
        aws.destination
      ]
    }
  }
}

data "aws_caller_identity" "source" {
  provider = aws.source
}

data "aws_caller_identity" "destination" {
  provider = aws.destination
}

resource "aws_sqs_queue" "source_queue" {
  provider = aws.source
  name     = "source-queue-${data.aws_caller_identity.source.account_id}"
}

resource "aws_sqs_queue" "destination_queue" {
  provider = aws.destination
  name     = "destination-queue-${data.aws_caller_identity.destination.account_id}"
}
