
// Module specific variables

variable "instance_name" {
  default = "flaskapp"
  description = "Used to populate the Name tag."
}

#free tier micro
variable "instance_type" {
  default = "t2.micro"
}

# change this to point at your VPC
variable "vpc_id" {
  default = "vpc-bde28fc4"
}

#change this to point at your subnet
variable "subnet_id" {
  default = "subnet-fd5904b5"
}

#publically available AWS Ubuntu AMI in the East region
variable "ami_id" {
  description = "Default AMI is Ubuntu in us-east-1"
  default = "ami-d15a75c7"
}

# my hack at the horizontal scaling that I would rather handle through ECS...
# but you can add more instances here to fake it and pretend there's an ELB or a container cluster
variable "number_of_instances" {
  description = "number of instances to make"
  default = 1
}

variable "aws_region" {
  default {
    #cheaper is the east
    primary = "us-east-1"
    backup = "us-east-2"
  }
}