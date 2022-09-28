module "ec2_instance_pu" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion-instance"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.medium"
  key_name               = "kubectl"
  monitoring             = true
  vpc_security_group_ids = [module.service_sg_public.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance_pr" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins-instance"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.medium"
  key_name               = "kubectl"
  monitoring             = true
  vpc_security_group_ids = [module.service_sg_public.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    assignment  = "last"
  }
}

module "ec2_instance_prweb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "app-instance"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.medium"
  key_name               = "kubectl"
  monitoring             = true
  vpc_security_group_ids = [module.service_sg_public.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    assignment  = "last"
  }
}

