
module "vpc" {
  source = "github.com/will-goodman/aws-terraform-modules//vpc?ref=wg_vpc_no_nat"

  vpc_name = var.vpc_name

  vpc_cidr                  = var.vpc_cidr
  availability_zones        = var.availability_zones
  public_cidr_range         = var.public_cidr_range
  second_public_cidr_range  = var.second_public_cidr_range
  private_cidr_range        = var.private_cidr_range
  second_private_cidr_range = var.second_private_cidr_range
}

# module "s3" {
#   source = "github.com/will-goodman/aws-terraform-modules//s3?ref=wg_s3"

#   bucket_prefix = var.bucket_prefix
#   bucket_policy = data.aws_iam_policy_document.ec2_bucket_access.json

#   force_destroy = var.force_destroy
#   versioning    = var.versioning
#   region        = var.region
# }

# data "aws_iam_policy_document" "ec2_bucket_access" {
#   statement {
#     actions = [
#       "s3:ListBucket"
#     ]
#     effect    = "Allow"
#     resources = [module.s3.arn]
#     principals = {
#       "type": "AWS"
#       "identifiers": [aws_iam_role.server.arn]
#     }
#   }
#   statement {
#     actions = [
#       "s3:ListBucket",
#       "s3:GetObject",
#       "s3:GetBucketLocation",
#       "s3:PutObject",
#       "s3:PutObjectAcl",
#       "s3:DeleteObject"
#     ]
#     effect    = "Allow"
#     resources = ["${module.s3.arn}/*"]
#     principals = {
#       "type" = "AWS"
#       "identifiers" = [aws_iam_role.server.arn]
#     }
#   }
# }

# resource "aws_instance" "server" {
#   ami           = "${data.aws_ami.ubuntu.id}"
#   instance_type = "t2.micro"

#   vpc_security_group_ids = [aws_security_group.server.id]
#   subnet_id              = element(module.vpc.public_subnets, 0)

#   tags = {
#     Name = "MinecraftServer"
#   }
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_security_group" "server" {
#   name        = "minecraft-server-internet"
#   description = "Allow Minecraft clients to connect to the server and the administrator to SSH"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = [var.ssh_ip_address]
#   }

#   ingress {
#     from_port   = 25565
#     to_port     = 25565
#     protocol    = "tcp"
#     cidr_blocks = [var.public_cidr_range, var.second_public_cidr_range]
#   }

#   ingress {
#     from_port   = 25565
#     to_port     = 25565
#     protocol    = "udp"
#     cidr_blocks = [var.public_cidr_range, var.second_public_cidr_range]
#   }

# }

# resource "aws_iam_instance_profile" "server" {
#   name = "minecraft_server"
#   role = aws_iam_role.server.name
# }

# resource "aws_iam_role" "server" {
#   name = "minecraft_server_role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy_attachment" "server_access_s3" {
#   role       = aws_iam_role.server.name
#   policy_arn = aws_iam_policy.server_access_s3.arn
# }

# resource "aws_iam_policy" "server_access_s3" {
#   name        = "minecraft_server_access_s3"
#   description = "Allows the EC2 Minecraft server access to the S3 bucket where the server files are stored"

#   policy = aws_iam_policy_document.server_access_s3.json
# }

# data "aws_iam_policy_document" "server_access_s3" {
#   statement {
#     actions = [
#       "s3:ListBucket"
#     ]
#     effect    = "Allow"
#     resources = [module.s3.arn]
#   }
#   statement {
#     actions = [
#       "s3:ListBucket",
#       "s3:GetObject",
#       "s3:GetBucketLocation",
#       "s3:PutObject",
#       "s3:PutObjectAcl",
#       "s3:DeleteObject"
#     ]
#     effect    = "Allow"
#     resources = ["${module.s3.arn}/*"]
#   }
# }
