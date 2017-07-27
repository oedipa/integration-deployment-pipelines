#create a micro for the deployment
#if I had more time I'd do this with ECs and figure it out for the first time..ECS would let me
#scale horizontally via setting up a cluster
#https://aws.amazon.com/blogs/compute/automatic-scaling-with-amazon-ecs/
resource "aws_instance" "flaskapp" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
    security_groups = ["${aws_security_group.flaskapp.id}"]
    key_name = "flask-deploy"
    tags {
        created_by = "Karen Windus"
        terraform = "true"
        purpose = "Coding CI/CD"
        // Takes the instance_name input variable and adds
        //  the count.index to the name., e.g.
        Name = "${var.instance_name}-${count.index}"
    }
}