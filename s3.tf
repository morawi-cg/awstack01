resource "aws_s3_bucket" "awstack_scripts_s3" {
  bucket = "awstackscriptsbucket"
  acl    = "private"

  tags {
    Name        = "awstackscriptsbucket"
    Environment = "Dev"
  }
}
