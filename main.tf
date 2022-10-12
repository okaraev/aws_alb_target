provider "aws" {
    region = var.region
}

resource "aws_lb_listener_rule" "lb_listener_rule" {
    listener_arn = var.lb_listener_arn

    action {
        type = "forward"
        target_group_arn = aws_lb_target_group.lb_tg.arn
    }

    condition {
        host_header {
            values = [var.lb_target_host_header]
        }
    }

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_lb_target_group" "lb_tg" {
    name_prefix = var.lb_target_name
    port = var.lb_target_port
    protocol = var.lb_target_protocol
    vpc_id = var.vpc_id
    deregistration_delay = 120

    health_check {
        healthy_threshold = var.lb_target_healthcheck_healthy_threshold
        unhealthy_threshold = var.lb_target_healthcheck_unhealthy_threshold
        timeout = var.lb_target_healthcheck_timeout
        path = var.lb_target_healthcheck_path
        protocol = local.alb_target_protocol
        port = local.alb_target_port
        interval = var.lb_target_healthcheck_interval
        matcher = var.lb_target_healthcheck_matcher
    }
}

resource "aws_lb_target_group_attachment" "instance_as_target" {
    target_group_arn = aws_lb_target_group.lb_tg.arn
    target_id = var.lb_target_instance_id
}