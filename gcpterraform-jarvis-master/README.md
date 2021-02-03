# gcpterraform
Automation on Google Cloud Platform (GCP) using Terraform


## Getting Started

Description of the various files in the repository -

```main.tf``` - This file contains the terraform for setting up the infrastructure / configuring devops / analytics.

```variables.tf``` - Declares all the variables used in ```main.tf```.

```terraform.tfvars``` - This is the **input file**. It contains the values of the variables declared in ```variables.tf``` file.

```scripts``` - This folder contains all the **configuration files** and **startup scripts** used by various stacks.

```lamp``` - This folder contains all the **terraform** for **LAMP Stack** including **lamp startup script** ```lamp.sh```.

```mean``` - This folder contains all the **terraform** for **MEAN Stack** including **mean startup script** ```mean.sh```.

```mern``` - This folder contains all the **terraform** for **MERN Stack** including **mern startup script** ```mern.sh```.


## Running the Project

  1)Clone / Download the project.
  
  2)Change the GCP project id in ```main.tf``` to the GCP project id.

  3)Add the ```credentials.json ``` file to the working directory. This the service account key used by Terraform to run.

  4)Change ```storage_bucket_name``` in ```terraform.tfvars``` to a globally unique name.

  5)Change ```sql_database_instance_name``` in ```terraform.tfvars``` to a CloudSQL instance name which is not used in the project for one week.

  
