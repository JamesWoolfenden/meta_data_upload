resource "aws_iam_user" "upload_to_s3" {
  name = "upload-to-s3"
}

resource "aws_iam_user_policy" "upload_to_s3" {
  name = "uploadtoS3compare"
  user = aws_iam_user.upload_to_s3.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:ListBucket",
          "s3:PutObjectAcl"
        ],
        "Resource" : [
          "arn:aws:s3:::compare-data-${data.aws_caller_identity.current.account_id}",
          "arn:aws:s3:::compare-data-${data.aws_caller_identity.current.account_id}/*"
        ]
      }
    ]
  })
}
