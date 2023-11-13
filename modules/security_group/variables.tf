variable "ingress_from_port" {
  description = "The starting port for ingress rules"
  type        = number
}

variable "ingress_to_port" {
  description = "The ending port for ingress rules"
  type        = number
}

variable "ingress_protocol" {
  description = "The protocol for ingress rules (e.g., tcp, udp, icmp)"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "A list of allowed CIDR blocks for ingress traffic"
  type        = list(string)
}

variable "egress_from_port" {
  description = "The starting port for egress rules"
  type        = number
}

variable "egress_to_port" {
  description = "The ending port for egress rules"
  type        = number
}

variable "egress_protocol" {
  description = "The protocol for egress rules (e.g., tcp, udp, icmp)"
  type        = string
}

variable "allowed_egress_cidr_blocks" {
  description = "A list of allowed CIDR blocks for egress traffic"
  type        = list(string)
}
