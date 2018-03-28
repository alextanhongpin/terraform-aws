# Terraform AWS S3

Creates a new S3 bucket with the default settings.

## IAM

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:HeadBucket",
                "s3:ListObjects"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            // Be specific with the ACL that you provide to your s3 bucket. Do not set to all
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::your_bucket_name/*",
            ]
        }
    ]
}
```

## Configuration

The following environment variables are required, and should be placed in the `main.tfvars` file.

```bash
access_key="YOUR_ACCESS_KEY"
secret_key="YOUR_SECRET_KEY"
bucket="YOUR_BUCKET"
```

## Init

Initialize Terraform

```bash
$ terraform init
```

## Plan

```bash
$ terraform plan
```


## Apply

```bash
$ make apply
```

Output:

```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + aws_s3_bucket.app
      id:                                                                                                    <computed>
      acceleration_status:                                                                                   <computed>
      acl:                                                                                                   "private"
      arn:                                                                                                   <computed>
      bucket:                                                                                                "app-stage"
      bucket_domain_name:                                                                                    <computed>
      force_destroy:                                                                                         "false"
      hosted_zone_id:                                                                                        <computed>
      region:                                                                                                <computed>
      request_payer:                                                                                         <computed>
      server_side_encryption_configuration.#:                                                                "1"
      server_side_encryption_configuration.0.rule.#:                                                         "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "1"
      server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "AES256"
      tags.%:                                                                                                "2"
      tags.Application:                                                                                      "app-stage"
      tags.Environment:                                                                                      "Development"
      versioning.#:                                                                                          "1"
      versioning.0.enabled:                                                                                  "true"
      versioning.0.mfa_delete:                                                                               "false"
      website_domain:                                                                                        <computed>
      website_endpoint:                                                                                      <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.app: Creating...
  acceleration_status:                                                                                   "" => "<computed>"
  acl:                                                                                                   "" => "private"
  arn:                                                                                                   "" => "<computed>"
  bucket:                                                                                                "" => "app-stage"
  bucket_domain_name:                                                                                    "" => "<computed>"
  force_destroy:                                                                                         "" => "false"
  hosted_zone_id:                                                                                        "" => "<computed>"
  region:                                                                                                "" => "<computed>"
  request_payer:                                                                                         "" => "<computed>"
  server_side_encryption_configuration.#:                                                                "" => "1"
  server_side_encryption_configuration.0.rule.#:                                                         "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.#:               "" => "1"
  server_side_encryption_configuration.0.rule.0.apply_server_side_encryption_by_default.0.sse_algorithm: "" => "AES256"
  tags.%:                                                                                                "" => "2"
  tags.Application:                                                                                      "" => "app-stage"
  tags.Environment:                                                                                      "" => "Development"
  versioning.#:                                                                                          "" => "1"
  versioning.0.enabled:                                                                                  "" => "true"
  versioning.0.mfa_delete:                                                                               "" => "false"
  website_domain:                                                                                        "" => "<computed>"
  website_endpoint:                                                                                      "" => "<computed>"
aws_s3_bucket.app: Creation complete after 8s (ID: app-stage)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```