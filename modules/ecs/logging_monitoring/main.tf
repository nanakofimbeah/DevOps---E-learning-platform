resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/my-ecs-app"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_alarm" {
  alarm_name          = "ecs-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "SampleCount"
  threshold           = var.cpu_threshold
  alarm_description   = "ECS CPU Utilization Alarm"
 alarm_actions             = ["${aws_sns_topic.ecs_alerts.arn}"]

  dimensions = {
    ClusterName = aws_ecs_cluster.my_cluster.name
  }


}

resource "aws_sns_topic" "ecs_alerts" {
  name = "ecs-alerts"
}

resource "aws_sns_topic_subscription" "ecs_alert_subscription" {
  topic_arn = aws_sns_topic.ecs_alerts.arn
  protocol = "email"
  endpoint = "your@email.com"
}
