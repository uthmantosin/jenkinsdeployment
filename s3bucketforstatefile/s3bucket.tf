# configured aws provider with proper credentials
provider "aws" {
  region    = "us-east-1"
  profile   = "MENWITHTASTE"
}



resource "aws_s3_bucket" "example" {
  bucket = "menwithtaste-new"

  lifecycle {
    prevent_destroy = true
  }
}



resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}




resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "app-state"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
