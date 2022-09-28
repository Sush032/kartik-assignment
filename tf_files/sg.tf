module "service_sg_public" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "public_server"
  description = "Security group for user-service with custom ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port = 22
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "user-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "service_sg_alb" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "alb_sg"
  description = "Security group for user-service with custom ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "user-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

