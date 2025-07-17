resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "${var.name}-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "${var.name}-igw"
    }
}

resource "aws_subnet" "public" {
    for_each = { for index, az in var.azs : index => az }
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr[each.key]
    availability_zone = each.value
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.name}-public-${each.value}"
    }
}

resource "aws_subnet" "private" {
    for_each = { for index, az in var.azs : index => az }
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr[each.key]
    availability_zone = each.value
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.name}-private-${each.value}"
    }
}