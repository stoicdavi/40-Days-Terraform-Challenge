resource "aws_iam_policy" "my_policy" {
  name        = "iampolicy_ravi"
  description = "Allow read-only access to the EC2 console, i.e., this policy must allow users to view all instances, AMIs, and snapshots in the Amazon EC2 console"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:List*",
          "ec2:Get*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

