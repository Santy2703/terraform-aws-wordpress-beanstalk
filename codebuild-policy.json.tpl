{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CodeBuild",
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateReportGroup",
                "codebuild:CreateReport",
                "codebuild:UpdateReport",
                "codebuild:BatchPutTestCases"
            ],
            "Resource": [
                "arn:aws:codebuild:${region}:${account_id}:report-group/${stack}-${environment}-${application}-*"
            ]
        },
        {
            "Sid": "SecretsManager",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:DescribeSecret",
                "secretsmanager:GetSecretValue",
                "secretsmanager:ListSecretVersionIds"
            ],
            "Resource": "arn:aws:secretsmanager:${region}:${account_id}:secret:${stack}-${environment}-${application}*"
        },
        {
            "Sid": "Logs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:PutLogEvents",
                "logs:CreateLogStream"
            ],
            "Resource": [
                "arn:aws:logs:${region}:${account_id}:log-group:/${stack}/${environment}/${application}/codebuild",
                "arn:aws:logs:${region}:${account_id}:log-group:/${stack}/${environment}/${application}/codebuild:*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:CreateNetworkInterface",
                "ec2:DescribeDhcpOptions",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeSubnets",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeVpcs"
            ],
            "Resource": "*"
        },
        {
            "Sid": "ssmroparameters",
            "Effect": "Allow",
            "Action": [
              "ssm:GetParameter",
              "ssm:GetParameters"
             ],
            "Resource": "arn:aws:ssm:${region}:${account_id}:parameter/${stack}/${environment}/${application}*"
        },
        {
            "Sid": "ssmrwparameter",
            "Effect": "Allow",
            "Action": [
              "ssm:PutParameter"
             ],
            "Resource": "arn:aws:ssm:${region}:${account_id}:parameter/${stack}/${environment}/${application}/build"
        },
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:CreateNetworkInterfacePermission",
            "Resource": "arn:aws:ec2:${region}:${account_id}:network-interface/*",
            "Condition": {
              "StringLike": {
                "ec2:Subnet": [ "arn:aws:ec2:${region}:${account_id}:subnet/*" ],
                "ec2:AuthorizedService": "codebuild.amazonaws.com"
              }
            }
        },
        {
            "Sid": "kmsaccess",
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt",
                "kms:Encrypt",
                "kms:RevokeGrant",
                "kms:ReEncryptTo",
                "kms:GenerateDataKey",
                "kms:DescribeKey",
                "kms:CreateGrant",
                "kms:ReEncryptFrom",
                "kms:ListGrants"
            ],
            "Resource": "${kms_key_id}"
        },
        {
            "Sid": "S3",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:PutObject",
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::${stack}${environment}-codepipeline/*",
                "arn:aws:s3:::${stack}${environment}-codepipeline",
                "arn:aws:s3:::${stack}${environment}-log/*",
                "arn:aws:s3:::${stack}${environment}-log",
                "arn:aws:s3:::*"
            ]
        }
    ]
}
