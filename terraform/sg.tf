resource "aws_security_group" "flaskapp" {
    name        = "Flaskapp"
    description = "Flaskapp Application Security Group"
    vpc_id      = "${var.vpc_id}"

    tags {
        "Name" = "Flaskapp"
        "Environment" = "My AWS Free Tier"
        "Department" = "Code Challenge"
        "Created_by" = "Karen Windus"
        "Terraform" = "true"
    }
}