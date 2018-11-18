module "proxy" {
    source                     = "../apps/proxy/.terraform"

    region                     = "${var.region}"

    cloudwatch-log-group-name  = "${aws_cloudwatch_log_group.this.name}"

    domain                     = "nuvola.pl"

    vpc-id                     = "${module.vpc.vpc_id}"
    vpc-public-subnets         = "${module.vpc.public_subnets}"
    vpc-private-subnets        = "${module.vpc.private_subnets}"

    ecs-cluster-id             = "${aws_ecs_cluster.this.id}"

    iam-role-ecs-td-arn        = "${aws_iam_role.ecs-td.arn}"

    caller-identity-account-id = "${data.aws_caller_identity.current.account_id}"

    s3-bucket-arn              = "${aws_s3_bucket.this.arn}"
    s3-bucket-id               = "${aws_s3_bucket.this.id}"
    s3-bucket-name             = "${aws_s3_bucket.this.bucket}"
}

module "web" {
    source                                     = "../apps/web/.terraform"

    region                                     = "${var.region}"

    cloudwatch-log-group-name                  = "${aws_cloudwatch_log_group.this.name}"

    vpc-id                                     = "${module.vpc.vpc_id}"
    vpc-private-subnets                        = "${module.vpc.private_subnets}"

    security-group-proxy-id                    = "${module.proxy.security-group-proxy-id}"

    service-discovery-private-dns-namespace-id = "${aws_service_discovery_private_dns_namespace.this.id}"

    ecs-cluster-id                             = "${aws_ecs_cluster.this.id}"
    ecs-cluster-name                           = "${aws_ecs_cluster.this.name}"

    iam-role-ecs-td-arn                        = "${aws_iam_role.ecs-td.arn}"

    s3-bucket-name                             = "${aws_s3_bucket.this.bucket}"
    s3-bucket-prefix                           = "${aws_s3_bucket.this.bucket_prefix}"
    s3-bucket-arn                              = "${aws_s3_bucket.this.arn}"
}
