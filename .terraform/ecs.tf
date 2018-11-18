resource "aws_ecs_cluster" "this" {
    name = "nuvola"
}

resource "aws_iam_role" "ecs-td" {
    name               = "nuvola-ecs-td"
    assume_role_policy = <<JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            }
        }
    ]
}
JSON
}

resource "aws_iam_role_policy" "ecs-td" {
    name   = "nuvola-ecs-td"
    role   = "${aws_iam_role.ecs-td.id}"

    policy = <<JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        }
    ]
}
JSON
}
