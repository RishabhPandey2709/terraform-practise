resource "aws_instance" "web-1" {
    ami = lookup(var.amis, var.aws_region)
    #availability_zone = "eu-west-1a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnets[0].id
    associate_public_ip_address = true
    source_dest_check = false


    tags = {
        Name = "Web Server 1"
    }
}