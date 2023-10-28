**"AWS-EKS-cluster-prophius-project using Terraform Modules"** 

This guide analyse the process of setting up an AWS Elastic Kubernetes Service (EKS) cluster using Terraform. 

**Prerequisites**

Before you begin, ensure that you have the following prerequisites:

  Terraform installed on your local machine.
  AWS CLI installed and configured with appropriate IAM permissions.

  **Assumptions and considerations**

  Familiarity with Linux, Git and GitHub, infrastructure-as-code and DevOps has been assumed
  Availability: For High availability and fault tolerance, instances have been replicated on different availability zones (us-east-2a, 
  us-east-2b) within the same region.
  Security: Principle of Least Privilege was considered when assigning policy to IAM role for the cluster.
  Security: Public access to the MySQL database has been disabled

**Step 1: Create the terraform codes for the infrastructure**

i First, create the prophius-project directory where all folders and subfolders for your files are stored.ii Create providers and s3 backend for state files. 
iii Create all the modules; VPC, EKS, IAM, key-pair security_groups and their corresponding main.tf, output.tf and variables.tf file using terraform documentations
iv Configuration of EKS cluster, DB and ECR.
Visit terraform docs https://developer.hashicorp.com/terraform/docs for all modules and TF files. 

**Step 2: Set AWS Credentials**

Ensure that you have configured your AWS CLI with the necessary credentials and AWS region:

``aws configure``

**Step 3: Initialize the Working Directory**

Run the following command in the working directory to initialize Terraform:

``terraform init``

This command downloads all the necessary providers and initializes the Terraform backend. I have added a snapshot of the init here: https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/backend_provider_init.PNG

**Step 4: Create a Terraform Plan**

Generate a Terraform execution plan to preview the changes:

``terraform plan``
I have added my terraform plan here: https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/terraform-plan

The terraform plan command provides an overview of the resources that Terraform will create or modify.

**Step 5: Apply the Terraform Plan**

Apply the Terraform plan to create the EKS cluster on AWS:

``terraform apply``

Terraform will create various AWS resources, including the VPC, Route Table, Subnets, IAM Role, Internet Gateway, Security Group, elastic container registry (ecr), database, Worker Nodes, and the EKS Cluster itself.
I have added my plan here: https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/Infra-deployment.PNG

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

https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/working-nodes.PNG

You should see a list of worker nodes in your cluster, indicating that your EKS cluster is up and runningin AWS Console.

That's it! You've successfully created an AWS EKS cluster using Terraform.

The following snapshots indicate the various resources deployed on AWS by the iac configuration:
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/container-registry.PNG
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/EKS-master.PNG
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/eks-worker-instances.PNG
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/mysql-database.PNG
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/mysql-database.PNG
https://github.com/Hakeemog/iac-eks-prophius-project/commit/9571e78194320eb95307bf124bf3101b94774471

The terraform state of the infrastructure is stored here:
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/s3-backend.PNG

The link to the infrastructure architetural diagram is below:
https://github.com/Hakeemog/iac-eks-prophius-project/blob/staging/Architecture.png 








