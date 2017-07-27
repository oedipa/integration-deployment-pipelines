resource "aws_security_group_rule" "flaskapp-80-ingress" {
    type = "ingress"
    from_port = 80
    to_port = 80
    cidr_blocks     = ["0.0.0.0/0"]
    protocol = "tcp"
    security_group_id = "${aws_security_group.flaskapp.id}"
}
#you wanted it on port 443
resource "aws_security_group_rule" "flaskapp-443-ingress" {
    type = "ingress"
    from_port = 443
    to_port = 443
    cidr_blocks     = ["0.0.0.0/0"]
    protocol = "tcp"
    security_group_id = "${aws_security_group.flaskapp.id}"
}
#ssh is important!
resource "aws_security_group_rule" "flaskapp-22-ingress" {
    type = "ingress"
    from_port = 22
    to_port = 22
    cidr_blocks     = ["0.0.0.0/0"]
    protocol = "tcp"
    security_group_id = "${aws_security_group.flaskapp.id}"
}

resource "aws_security_group_rule" "flaskapp-0-egress" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.flaskapp.id}"
    # source_security_group_id = "${aws_security_group.default_out.id}"
}