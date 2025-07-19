# ALB SG - open to internet
resource "aws_security_group" "alb_sg" {
    name = "alb-sg"
    description = "allow http/https traffic to ALB"
    vpc_id = var.vpc_id

    dynamic ingress {
        iterator = port
        for_each = var.alb_ingress_ports
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
        }
    }

    egress  {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        } 


    tags = {
        Name = "alb-sg"
    }
    
}

# backend SG - only ALB can talk to it 
resource "aws_security_group" "backend_sg" {
    name = "backend-sg"
    vpc_id = var.vpc_id

    ingress  {
            description = "allow traffic from ALB to backend"
            from_port = var.backend_port
            to_port = var.backend_port
            protocol = "TCP"
            security_groups = [aws_security_group.alb_sg.id]
        }
    
    egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }

    tags = {
        Name = "backend-sg"
    }
}


# db SG - only backend can talk to it 
resource "aws_security_group" "db_sg" {
    name = "db-sg"
    vpc_id = var.vpc_id

    ingress {
            description = "allow traffic from backend to db"
            from_port = var.db_port
            to_port = var.db_port
            protocol = "TCP"
            security_groups = [aws_security_group.backend_sg.id]
        }
        
    egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    
    tags = {
        Name = "db-sg"
    }
}