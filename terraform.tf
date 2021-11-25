terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.66.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}
resource "aws_sns_topic" "name" {
  name = "nike"
}
resource "aws_sns_topic_subscription" "notification-topic" {
  topic_arn = aws_sns_topic.name.arn
  protocol = "email"
  endpoint = "${var.sns-email}"
}

//


resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform-example-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sns_topic.name.topic_arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "production"
  }
}
resource "aws_sqs_queue" "nikeQueue" {

    name= "s3-event-nike-sqs"
    policy = <<POLICY
    {
      "Version:"  
    }

}


