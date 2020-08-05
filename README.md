How to setup infrastructure in Hetzner Cloud with Terraform
==================================================

Hetzner Online GmbH is an Internet hosting company and data center operator based in Germany. It provides hosting, virtual private servers, managed servers and cloud solutions among. 

Prerequisites:
----------------
1. Install & configure terraform
2. Create an account in [Hetzner Cloud](https://www.hetzner.com/cloud)
3. Create a project and [generate API token](https://docs.hetzner.cloud/#overview-getting-started) for access to API (string like *jEheVytlAoFl7F8MqOXASztX*).
4. Generate an SSH key to access created servers. In this example *tf_hetzner* key name is used. You can generate your key with with 
   ~~~bash
   ssh-keygen -f ~/.ssh/<key-name> -t rsa -b 4096 -N ''
   ~~~

Run 
----------------
1. Initialize the terraform working directory:
~~~yaml
  terraform init
~~~
2. Create a plan & check if everything is OK:
~~~yaml
  terraform plan -var='hcloud_token=<YOUR-API-TOKEN>'
~~~
1. Finally create the infrastructure by applying the plan:
~~~yaml
  terraform apply -var='hcloud_token=<YOUR-API-TOKEN>'
~~~
4. If needed, infrastructure could be destroyed later with
~~~yaml
  terraform destroy -var='hcloud_token=<YOUR-API-TOKEN>'
~~~