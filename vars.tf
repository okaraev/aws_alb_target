variable "region" {
    description = "AWS Region Name"
    type = string
}

variable "lb_listener_arn" {
    description = "Load Balancer ARN"
    type = string
}

variable "lb_target_host_header" {
    description = "Target Host Header"
    type = string
}

variable "lb_target_name" {
    description = "LB Target Name"
    type = string
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "lb_target_port" {
    description = "Protocol for ALB Target group"
    type = number
}

variable "lb_target_protocol" {
    description = "Protocol for ALB Target group"
    type = string
}

variable "lb_target_healthcheck_healthy_threshold" {
    description = "Healthy threshold for ALB Target group Health Check"
    type = number
    default = 2
}

variable "lb_target_healthcheck_unhealthy_threshold" {
    description = "Unhealthy threshold for ALB Target group Health Check"
    type = number
    default = 2
}

variable "lb_target_healthcheck_timeout" {
    description = "Timeout for ALB Target group Health Check"
    type = number
    default = 3
}

variable "lb_target_healthcheck_port" {
    description = "Port for ALB Target group Health Ckeck"
    type = string
    default = null
}

variable "lb_target_healthcheck_protocol" {
    description = "Protocol for ALB Target group Health Check"
    type = string
    default = null
}

variable "lb_target_healthcheck_path" {
    description = "Path for ALB Target group Health Check"
    type = string
    default = null
}

variable "lb_target_healthcheck_interval" {
    description = "Inverval for ALB Target group Health Check"
    type = number
    default = 5
}

variable "lb_target_healthcheck_matcher" {
    description = "Mather for ALB Target group Health Check"
    type = string
    default = "200"
}

variable "lb_target_instance_id" {
    description = "Instance ID"
    type = string
}

locals {
  alb_target_port = "%{if var.lb_target_healthcheck_port != null}${var.lb_target_healthcheck_port}%{else}${var.lb_target_port}%{endif}"
  alb_target_protocol = "%{if var.lb_target_healthcheck_protocol != null}${var.lb_target_healthcheck_protocol}%{else}${var.lb_target_protocol}%{endif}"
}