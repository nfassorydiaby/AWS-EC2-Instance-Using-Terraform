variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "eu-west-3"
}

variable "access_key" {
  description = "The AWS access key."
  type        = string
}

variable "secret_key" {
  description = "The AWS secret key."
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The Amazon Machine Image ID to use for the instance."
  type        = string
  default     = "ami-00ac45f3035ff009e"
}

variable "key_name" {
  description = "The key name of the AWS Key Pair."
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key file."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources that support tags."
  type        = map(string)
  default     = {
    Name = "vmUbuntu"
  }
}
