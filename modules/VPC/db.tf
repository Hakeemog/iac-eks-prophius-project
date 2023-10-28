resource "aws_db_subnet_group" "prophius-db-subnet" {
  name       = "prophius-subnet-group"
  subnet_ids = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
}

resource "aws_db_instance" "prophius" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "prophius_db"
  password             = var.db_instance_password
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.prophius-db-subnet.name
}
