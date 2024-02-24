
locals {
  ingress = [
    for rule in var.ingress_rules :
    {
      from_port   = rule.from_port != null ? rule.from_port : rule.port
      to_port     = rule.to_port != null ? rule.to_port : rule.port
      protocol    = rule.protocol
      cidr_blocks = rule.security_groups == null ? rule.cidr_blocks : []
      security_groups  = rule.security_groups
      description = rule.description
    }
  ]

  egress = [
    for rule in var.egress_rules : {
      from_port   = rule.from_port != null ? rule.from_port : rule.port
      to_port     = rule.to_port != null ? rule.to_port : rule.port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
      security_groups  = rule.security_groups
      description = rule.description
    }
  ]
}