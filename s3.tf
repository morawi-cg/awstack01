resource "aws_s3_bucket" "awstack_scripts_s3" {
  bucket = "awstack01_scripts_s3"
  acl    = "private"

  tags {
    Name        = "awstack01_scripts_s3"
    Environment = "Dev"
  }
}
