variable "region" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zone_1" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone_2" {
  type    = string
  default = "us-east-1b"
}

variable "cidr_block_1" {
  type    = string
  default = "10.0.100.0/24"
}

variable "cidr_block_2" {
  type    = string
  default = "10.0.101.0/24"
}

variable "redis_node_type" {
  type    = string
  default = "cache.t2.micro"
}

variable "redis_number_cache_clusters" {
  type    = string
  default = "2"
}