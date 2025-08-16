# # So here we are selecting a actual resource from AWS ie. elastic beanstalk for now as I will use this to deploy my container app
# resource "aws_elastic_beanstalk_application" "flask_server_via_terraform" {
#   name        = var.app_name
#   description = "Flask API deployed with Docker"
# }

# resource "aws_elastic_beanstalk_environment" "flask_env" {
#   name                = var.env_name
#   application         = aws_elastic_beanstalk_application.flask_server_via_terraform.name
#   solution_stack_name = var.solution_stack_name

#   // This setting can be changed if we need further loadbalancers or different vpc networkings
#   setting {
#     namespace = "aws:elasticbeanstalk:environment"
#     name      = "EnvironmentType"
#     value     = "SingleInstance"
#   }


# }

