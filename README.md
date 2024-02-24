# Auto Generate Multiple AWS Security Group Rules with Less Code

With this module, you can simply create a security group with multiple ingress and egress. You can choose for simplicity or flexibility.

```terraform
module "ec2_security_group" {
  source      = "./modules/security_group"

  name        = "ec2-sg"
  description = "A security group for ec2"
  vpc_id      = local.default_vpc_id

  ingress_rules = [
    { port = 80 }, # from all source
    { port = 443 }, # from all source
    { 
        port = 3000,
        security_groups = ["sg-xxxxxxxx"] # from specific security group
    }, 
    { 
        port = 22,
        cidr_blocks = var.my_ip
    },

  ]
  
  egress_rules = [
    { port = 0 } # all port all target
  ]
}
```

Or you can also loop from list

```terraform
locals {
    open_ports = [80, 443, 22]
}

...
    ingress_rules = [
        for port in local.open_ports : {
            port = port
        }
    ]
...
```