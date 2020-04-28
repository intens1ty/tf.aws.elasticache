resource "aws_elasticache_parameter_group" "parametergroup" {
  name   = "parametergroup"
  family = "redis5.0"

  parameter {
    name  = "active-defrag-cycle-max"
    value = "12"
  }
}