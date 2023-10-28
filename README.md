**"AWS-EKS-cluster-prophius-project using Terraform Modules"** 

This guide analyse the process of setting up an AWS Elastic Kubernetes Service (EKS) cluster using Terraform. 

**Prerequisites**

Before you begin, ensure that you have the following prerequisites:

  Terraform installed on your local machine.
  AWS CLI installed and configured with appropriate IAM permissions.

**Step 1: Create the terraform codes for the infrastructure**

i First, create the prophius-project directory where all folders and subfolders for my files are stored.

ii Create of providers and s3 backend for state files

iii Create all the modules; VPC, EKS, IAM, key-pair security_groups and their corresponding main.tf, output.tf and variables.tf file using terraform hashicorp documentations
iv Configuration of EKS cluster, DB and ECR files

**Step 2: Set AWS Credentials**

Ensure that you have configured your AWS CLI with the necessary credentials and AWS region:

``aws configure``

**Step 3: Initialize the Working Directory**

Run the following command in the working directory to initialize Terraform:

``terraform init``

This command downloads all the necessary providers and initializes the Terraform backend.

**Step 4: Create a Terraform Plan**

Generate a Terraform execution plan to preview the changes:

``terraform plan``

The terraform plan command provides an overview of the resources that Terraform will create or modify.

**Step 5: Apply the Terraform Plan**

Apply the Terraform plan to create the EKS cluster on AWS:

``terraform apply``

Terraform will create various AWS resources, including the VPC, Route Table, Subnets, IAM Role, Internet Gateway, Security Group, Worker Nodes, and the EKS Cluster itself.

**Step 6: Configure Kubectl**

Once the EKS cluster is created, configure kubectl to interact with it. Run the following commands:

``curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.17/2023-05-11/bin/linux/amd64``

``openssl sha1 -sha256 kubectl``

``chmod +x ./kubectl``

``mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH``

``kubectl version --short --client``

These commands download and configure kubectl for use with your EKS cluster.

**Step 7: Update Kubeconfig**

``aws eks update-kubeconfig --name PROPHIUS-AWS-EKS --region us-east-2``

This command updates your kubeconfig file with the necessary credentials to access your EKS cluster.

**Step 8: Verify Cluster**

Verify that your EKS cluster is running and accessible by running:

``kubectl get nodes``

You should see a list of worker nodes in your cluster, indicating that your EKS cluster is up and runningin AWS Console.

That's it! You've successfully created an AWS EKS cluster using Terraform.

















