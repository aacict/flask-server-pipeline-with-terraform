# We are going to see the endpoint that leads to our flask server
# output "beanstalk_url" {
#   value       = aws_elastic_beanstalk_environment.flask_env.endpoint_url
#   description = "URL of the deployed Elastic Beanstalk environment"
# }

output "appPublicIp" {
  value       = aws_instance.flask_server.public_ip
  description = "URL of the ec2 instance public ip"
}
