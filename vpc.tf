// Variables
variable "vpc_flow_log_cloudwatch_log_group_kms_key_id" {}
variable "vpc_flow_log_cloudwatch_log_group_retention_in_days" {}
variable "vpc_flow_log_log_format" {}
module "vpc" {  
source  = "app.terraform.io/Swapna-training/vpc/aws"
  version = "2.39.0"
  cidr = "20.10.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic
  database_subnet_assign_ipv6_address_on_creation = "true"
  elasticache_subnet_assign_ipv6_address_on_creation = "true"
  enable_classiclink = "true"
  enable_classiclink_dns_support = "true"
  flow_log_cloudwatch_log_group_kms_key_id = "${var.vpc_flow_log_cloudwatch_log_group_kms_key_id}"
  flow_log_cloudwatch_log_group_retention_in_days = "${var.vpc_flow_log_cloudwatch_log_group_retention_in_days}"
  flow_log_log_format = "${var.vpc_flow_log_log_format}"
  intra_subnet_assign_ipv6_address_on_creation = "false"
  private_subnet_assign_ipv6_address_on_creation = "false"
  public_subnet_assign_ipv6_address_on_creation = "false"
  redshift_subnet_assign_ipv6_address_on_creation = "false"
  vpn_gateway_az = "us-east-1"
}
