# AWS Key Pair
#data "aws_key_pair" "Demo-key"{
#  key_name           = "Demo-key"
#  include_public_key = true
#}

data "aws_key_pair" "Demo-key" {
  key_name           = "Demo-key"
  include_public_key = true

}