# AWS EC2 Instance Using Terraformn Documentation

This document provides detailed descriptions of the variables used in the Terraform configuration for provisioning AWS resources. Each variable is explained with its purpose, type, default values, and how to use them in your configuration.

## Table of Contents

- [Provider Configuration](#provider-configuration)
- [EC2 Instance Configuration](#ec2-instance-configuration)
- [SSH Connection](#ssh-connection)
- [Security Considerations](#security-considerations)
- [Usage Instructions](#usage-instructions)

## Provider Configuration

### `region`

- **Description**: Specifies the AWS region where resources will be deployed.
- **Type**: `string`
- **Default**: `"eu-west-3"` (Europe Paris)
- **Usage**:
  ```hcl
  region = "eu-west-3"

### `access_key`
- **Description**: The AWS access key used for API authentication.
- **Type**: `string`
- **Usage**:
  ```hcl
  access_key = "your-access-key"

### `secret_key`
- **Description**: The AWS secret key corresponding to your access key.
- **Type**: `string`
- **Usage**:
  ```hcl
  secret_key = "your-secret-key"

## EC2 Instance Configuration

### `ami`
- **Description**: The ID of the Amazon Machine Image (AMI) to be used for the instance.
- **Type**: `string`
- **Usage**:
  ```hcl
  ami = "ami-00ac45f3035ff009e"

### `instance_type`
- **Description**: The type of instance to launch, e.g., `t2.micro`, which affects compute capacity and cost.
- **Type**: `string`
- **Default**: `"t2.micro"`
- **Usage**:
  ```hcl
  instance_type = "t2.micro"

### `key_name`
- **Description**: The name of the key pair to use for the instance, which allows SSH access.
- **Type**: `string`
- **Usage**:
  ```hcl
  key_name = "key_name"

## SSH Connection
### `private_key_path`
- **Description**: File path to the private key used for SSH connections.
- **Type**: `string`
- **Default**: `"${path.module}/cloud-esgi.pem"`
- **Usage**:
  ```hcl
  private_key = file("${path.module}/file_name.pem")

## Security Considerations
Ensure that all sensitive information such as AWS keys and private SSH keys are managed securely. Utilize tools like AWS Secrets Manager, AWS SSM Parameter Store, or Vault for storing sensitive data.
Properly configure security groups associated with your instances to restrict inbound and outbound traffic to only necessary ports and IP ranges.

## Usage Instructions

### Initialization
- **Description**: Run `terraform init` to initialize the Terraform configuration and download necessary providers.
- **Command**:
  ```bash
  terraform init
  
### Planning
- **Description**: Execute `terraform plan` to see the changes that will be applied to your infrastructure. This command compares the current infrastructure state with the state described in your Terraform files to generate an execution plan.
- **Command**:
  ```bash
  terraform plan

### Applying
- **Description**: Run `terraform apply` to apply the changes defined in your Terraform files. This command will execute the plan that was confirmed during the planning phase, making changes to your infrastructure as specified.
- **Command**:
  ```bash
  terraform apply
