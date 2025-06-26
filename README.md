# octopus-configuration-jumpstart

## About this repo

This repo contains examples for using the [Octopus Deploy Terraform Provider](https://registry.terraform.io/providers/OctopusDeploy/octopusdeploy/latest/docs) to configure and manage a new Octopus Deploy instance.

It contains modules acting as wrappers around common resources, making them easier to use as well as providing sensible defaults for some values.

## How to use this repo

This is a template repository. Use the `Use this template` button on the GitHub UI and choose `Create a new repository`.

In your new repository, set the following secrets and variables:

### Octopus Service Account & Authorization

Create a [Service Account](https://octopus.com/docs/security/users-and-teams/service-accounts) in your Octopus instance.

Suggested `Username`: OctopusConfigurationServiceAccount

Suggested `Display Name`: Octopus Configuration Service Account

This account needs the `System manager` role in order to create and manage spaces, teams, and other server configuration (see **warning** below). The easiest way to do this is to add the account to the built-in `Octopus Managers` group.

**Warning**

This is a very privileged user account due to the nature of the usage. It is important to restrict access to API keys and other authorization methods for this account. If you do not plan to manage certain server configuration through Terraform, you should consider creating a custom role with the least amount of permissions needed by the service account to manage the instance.

**Note**

If you are using a folder per space and separate state files per space, you may also consider different Octopus user accounts per folder. You can see examples of this in the `team-a` and `team-b` examples.

### Backend Authorization

The worflows provided in this repo use OIDC to authorize to Azure and AWS backends.

* [Configuring OpenID Connect in AWS](https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
* [Configuring OpenID Connect in Azure](https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-azure)

### GitHub Secrets

**Common**

* `OCTOPUS_URL` - the URL to your Octopus instance (https://your.octopus.app)
* `OCTOPUS_APIKEY` - an API key of the service account in your Octopus instance with permissions to manage resources (see Octopus Service Account section above). Used by `multistate` example.
* `TFSTATE_KEY` - the key to use for the TF state settings (myoctoinstance.tfstate). Used by `multistate` example.
* `TEAM_A_APIKEY` - an API key of the service account in your Octopus instance with permissions to manage resources (see Octopus Service Account section above). Used by `team-a` example.
* `TEAM_A_STATEKEY` - the key to use for the TF state settings (myoctoinstance.tfstate). Used by `team-a` example.
* `TEAM_B_APIKEY` - an API key of the service account in your Octopus instance with permissions to manage resources (see Octopus Service Account section above). Used by `team-b` example.
* `TEAM_B_STATEKEY` - the key to use for the TF state settings (myoctoinstance.tfstate). Used by `team-b` example.

**If using S3 backend**

* `S3_BUCKET` - the S3 bucket storing the TF state
* `S3_REGION` - the AWS region containing the S3 bucket

**If using Azure backend**

* `ARM_SUBSCRIPTION_ID` - Azure authentication subscription ID
* `ARM_TENANT_ID` - Azure authentication tenant ID
* `ARM_CLIENT_ID` - Azure authentication client ID

* `RESOURCE_GROUP` - the Azure resource group storing the TF state
* `STORAGE_ACCOUNT` - the Azure storage account storing the TF state
* `CONTAINER_NAME` - the name of the storage container storing the TF state

### GitHub Variables

* `BACKEND` - set to `azurerm` if using Azure as a backend, `s3` if using S3 as a backend. **Only set when you are prepared for the workflow to run**

## Examples

### Multispace (/terraform/multispace/)

This folder is an example of managing multiple spaces within one terraform folder / state file.

#### default_space.tf

An example of populating the existing default space in the Octopus instance.

#### managed_space_1.tf

An example of creating a new space and populating it with environments, lifecycles, teams, feeds, and accounts.

#### managed_space_2.tf

Another example of creating a new space and populating it with environments, lifecycles, teams, feeds, and accounts.

#### platform_engineering_team.tf

This team (Platform Engineering) will be added as a Space Manager to each space created in the examples. This is necessary for the service account to be able to create and manage resources in the managed spaces.

The Octopus service account is placed in this team by default. You can add other members as needed.

#### users.tf

Populate this file with requests for users that you want to place into teams.

#### variables.tf

Add variables here for secrets or other variables you want to provide to the Terraform apply during the workflow run. A few examples are provided such as variables for a Username/Password account and an Azure Subscription Account.

### Team A (terraform/team-a/)

This folder is an example of managing a specific team's space within one terraform folder / state file. Along with the Team B example, it shows how you can manage multiple teams with separate workflows, folders, and state files.

#### space.tf

An example of creating a new space and populating it with environments, lifecycles, teams, feeds, and accounts.

#### users.tf

Populate this file with requests for users that you want to place into teams.

#### variables.tf

Add variables here for secrets or other variables you want to provide to the Terraform apply during the workflow run. A few examples are provided such as variables for a Username/Password account and an Azure Subscription Account.

### Team B (/terraform/team-b/)

This folder is an example of managing a specific team's space within one terraform folder / state file. Along with the Team A example, it shows how you can manage multiple teams with separate workflows, folders, and state files.

#### space.tf

An example of creating a new space and populating it with environments, lifecycles, teams, feeds, and accounts.

#### users.tf

Populate this file with requests for users that you want to place into teams.

#### variables.tf

Add variables here for secrets or other variables you want to provide to the Terraform apply during the workflow run. A few examples are provided such as variables for a Username/Password account and an Azure Subscription Account.

### Workflows (/.github/workflows/)

#### multispace-apply.yml

Applies the templates in `/terraform/multispace/`.

Runs on commit to that folder or the workflow itself.

#### multispace-destroy.yml

Destroys the resources created by the templates in `/terraform/multispace`. We recommend removing this workflow once using Octopus in production.

Configured to run manually only.

#### team-a-apply.yml

Applies the templates in `/terraform/team-a/`.

Runs on commit to that folder or the workflow itself.

#### team-a-destroy.yml

Destroys the resources created by the templates in `/terraform/team-a`. We recommend removing this workflow once using Octopus in production.

Configured to run manually only.

#### team-b-apply.yml

Applies the templates in `/terraform/team-b/`.

Runs on commit to that folder or the workflow itself.

#### team-b-destroy.yml

Destroys the resources created by the templates in `/terraform/team-b`. We recommend removing this workflow once using Octopus in production.

Configured to run manually only.

### Destroying resources

## Modules

TBD

## Gotchas

### Space Managers

Each space created in Octopus has a Space Managers team associated with it. This team is not managed by Terraform and we recommend ignoring it and rather create your own team to manage this space (not named Space Managers).

### Default Lifecycle

Each space created in Octopus has a Default Lifecycle. We recommend creating your own lifecycles (as the examples do). The Default Lifecycle is not managed by Terraform and we recommend deleting it from the space after it is created.

## Support

This template is owned and managed by the Octopus Solutions Engineering team. Please file any bug or feature requests with an [issue](https://github.com/OctopusSolutionsEngineering/octopus-configuration-jumpstart/issues).

This template is not officially supported by Octopus. Please do not contact the Octopus support channels regarding octopus-configuration-jumpstart.

If you have found an issue with the [Octopus Deploy Terraform Provider](https://github.com/OctopusDeployLabs/terraform-provider-octopusdeploy), please file an [issue](https://github.com/OctopusDeployLabs/terraform-provider-octopusdeploy/issues) at that repository.
