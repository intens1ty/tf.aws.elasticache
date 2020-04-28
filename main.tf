provider "aws" {
  region                  = "${var.region}"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.cidr_block_1}"
  availability_zone = "${var.availability_zone_1}"

}

resource "aws_subnet" "subnet2" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.cidr_block_2}"
  availability_zone = "${var.availability_zone_2}"

}

resource "aws_elasticache_subnet_group" "subnetgroup" {
  name       = "subnetgroup"
  subnet_ids = ["${aws_subnet.subnet1.id}", "${aws_subnet.subnet2.id}"]
}

resource "aws_security_group" "securitygroup" {
  name        = "securitygroup"
  description = "Allow 6379"
  vpc_id      = "${var.vpc_id}"

  ingress {
    description = "Allow 6379"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

}

resource "aws_elasticache_replication_group" "elasticache" {

  replication_group_id          = "tf-rep-group-2"
  replication_group_description = "description"
  engine_version       		      = "5.0.6"
  node_type                     = "${var.redis_node_type}"

  automatic_failover_enabled     = true
  availability_zones            = ["${var.availability_zone_1}", "${var.availability_zone_2}"] 
  number_cache_clusters         = "${var.redis_number_cache_clusters}"
  port                          = 6379
  subnet_group_name    		      = "subnetgroup"

  parameter_group_name          = "parametergroup"
  security_group_ids   		      = ["${aws_security_group.securitygroup.id}"]  
  
  lifecycle {
    ignore_changes 		= ["number_cache_clusters"]
  }
}



