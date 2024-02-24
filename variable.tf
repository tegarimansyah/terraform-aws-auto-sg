variable "name" {
  description = "The name of the security group"
}

variable "description" {
  description = "A description of the security group"
}

variable "vpc_id" {
  description = "The ID of the VPC to associate with the security group"
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group"
  type = list(object({
    description = optional(string)
    port        = optional(number)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string, "tcp")
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
    security_groups = optional(list(string))
  }))
  default = []
}

variable "egress_rules" {
  description = "A list of egress rules for the security group"
  type = list(object({
    description = optional(string)
    port        = optional(number)
    from_port   = optional(number)
    to_port     = optional(number)
    protocol    = optional(string, "-1")
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
    security_groups = optional(list(string), [])
  }))
  default = []
}
