resource "aws_s3_bucket" "compare" {
  #checkov:skip=CKV_AWS_18:
  #checkov:skip=CKV_AWS_19:
  #checkov:skip=CKV_AWS_52:
  #checkov:skip=CKV_AWS_21:
  bucket = "compare-data-${data.aws_caller_identity.current.account_id}"
}

data "aws_caller_identity" "current" {}
