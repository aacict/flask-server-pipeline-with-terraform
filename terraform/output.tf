# We are going to see the endpoint that leads to our flask server
output "beanstalk_url" {
  value       = aws_elastic_beanstalk_environment.flask_env.endpoint_url
  description = "URL of the deployed Elastic Beanstalk environment"
}
