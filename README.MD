## Terraform

Terraform is a `IaC` (`Infrastructure as Code`) tools that helps you create your infrastructure foundation. It'll helps you automate your infrastructure no time.

It is use a `DSL` (`Domain Specific Language`) known as `HCL` (`Hashcorp Configuration Language`) to provisioning your Infrastructure.

Majors cloud providers:
- AWS
- GCP
- Azure

Majors on-Premise:
- VMware

So let's get straith to the point

```terraform
output {
    value = "Automate all as possible"
}
```

### Use AWS Provider

#### pre requesitite
- awscli configured with `access key` and `secret key`

### GCP provider

#### pre-requisite
- gcloud
- an Service Account with permission to the CGP`s API
- SA json file

```bash
export GOOGLE_APPLICATION_CREDENTIALS="/home/user/.iac/my-sa.json"
```