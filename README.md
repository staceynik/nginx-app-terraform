 # Installing Njinx with Terraform

Installing a Droplet in the Digital Ocean Cloud with Njinx

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) (install the latest version)
- [DigitalOcean Account](https://www.digitalocean.com/) (sign up if you don't have one)

## Instructions

1. Clone the repository:

https://github.com/staceynik/nginx-app-terraform

2. Change into the project directory:

```cd nginx-app-terraform```

3. Create the `secrets.auto.tfvars` file with your DigitalOcean token. For example:

```do_token = "your_secret_token"```

4. Run the `terraform init` command to initialize Terraform:

```terraform init```

5. Run the `terraform apply` command to create a Droplet with Nginx installed on DigitalOcean:

```terraform apply```

6. After executing the `terraform apply` command, Terraform will provide you with information about the created Droplet, including its IP address.

7. Open your web browser and visit the Droplet's IP address to see the default Nginx page.

## Destroying Infrastructure

To remove the created Droplet and associated resources, run the command:

```terraform destroy```

**WARNING:** This command will permanently delete the created Droplet and associated resources. Please be cautious when using this command.
