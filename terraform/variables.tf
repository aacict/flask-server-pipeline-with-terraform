# Application name
variable "app_name" {
  default = "flask-server-via-terra"
}

# Env name for the app
variable "env_name" {
  default = "flask-server-dev"
}

# EBS platform
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2 v4.2.3 running Docker" #we can choose the solution stack name from https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platform-history-docker.html
}

variable "ghcr_pat" {
  type        = string
  description = "github repo PAT"
}
