resource "aws_launch_configuration" "launchconfig" {
name_prefix = "launchconfig"
image_id = var.EC2-ami
instance_type = "t2.micro"


}
resource "aws_autoscaling_group" "autoscaling" {
name = "autoscaling"
vpc_zone_identifier =  ["${aws_subnet.public-subnets[0].id}" , "${aws_subnet.public-subnets[1].id}"]
launch_configuration = aws_launch_configuration.launchconfig.name
min_size = 1
max_size = 2
health_check_grace_period = 300
health_check_type = "EC2"
force_delete = true
tag {
key = "Name"
value = "ec2 instance"
propagate_at_launch = true
}
}