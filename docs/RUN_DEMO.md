🚀 How to run this demo in your own Azure environment
=====================================================

This guide explains how to fork this repository and run the full demo with **Azure, Terraform, Infracost and CI pipelines**.
The demo does **not deploy infrastructure** by default. It only generates Terraform plans and cost estimates.

* * *

✅ Prerequisites
---------------

Before you start, you need:
*   an Azure subscription
    
*   a GitHub account
    
*   (optional) an Azure DevOps organization
    
*   installed locally (optional, for testing):
    *   Terraform
        
    *   Azure CLI
        
    *   Git
        
You will also need a free **Infracost account**.

* * *

🔑 Step 1 – Create an Infracost API key
---------------------------------------

1.  Go to infracost.io and sign up (free tier is enough)
    
2.  Generate an API key
    
3.  Save it — you will need it for CI
    

* * *

☁️ Step 2 – Prepare Azure credentials
-------------------------------------

Terraform needs credentials even to run `terraform plan`.
Login locally:

`az login`

Create a Service Principal:

`az ad sp create-for-rbac \   --name infracost-demo-sp \   --role Contributor \   --scopes /subscriptions/<SUBSCRIPTION_ID>`

You will get output like:

`{   "appId": "...",   "password": "...",   "tenant": "...",   "subscription": "..." }`

Save these values.

* * *

🔐 Step 3 – Configure GitHub secrets
------------------------------------

Fork this repository.
In your fork go to:
`Settings → Secrets and variables → Actions`
Add the following secrets:

`INFRACOST_API_KEY ARM_CLIENT_ID ARM_CLIENT_SECRET ARM_TENANT_ID ARM_SUBSCRIPTION_ID`

Values come from:
*   Infracost dashboard
    
*   Service principal output
    
Terraform Azure provider automatically uses these environment variables.

* * *

▶️ Step 4 – Test locally (optional but recommended)
---------------------------------------------------

From repo root:

`cd infra/scenarios/cheap terraform init terraform plan`

Repeat for:

`infra/scenarios/expensive infra/scenarios/autoscaling`

Then test Infracost:

`infracost breakdown --config-file=infracost.yml`

You should see cost estimates for all scenarios.

* * *

🔀 Step 5 – Trigger GitHub Actions pipeline
-------------------------------------------

1.  Create a new branch:
    

`git checkout -b demo/test-cost-change`

2.  Change something, for example:
    
*   App Service SKU
    
*   enable/disable autoscaling
    
*   enable monitoring
    
3.  Commit and push:
    

`git commit -am "test: modify infrastructure cost profile" git push -u origin demo/test-cost-change`

4.  Open a Pull Request in GitHub.
    

* * *

💰 Step 6 – Review cost comment
-------------------------------

After the pipeline finishes, the pull request will automatically receive a comment like:
*   monthly cost per scenario
    
*   cost difference vs main branch
    
*   summary of the change
    
This is the core FinOps feedback loop.

* * *

🏢 Step 7 – Run Azure DevOps pipeline (optional)
------------------------------------------------

If you want to run the Azure DevOps version:
1.  Create a new Azure DevOps project
    
2.  Import this repository
    
3.  Create a new pipeline using:
    

`ado-pipelines/infracost-ado.yml`

4.  Add pipeline variables (marked secret):
    

`INFRACOST_API_KEY ARM_CLIENT_ID ARM_CLIENT_SECRET ARM_TENANT_ID ARM_SUBSCRIPTION_ID`

5.  Create a pull request — the pipeline will run and show cost output in logs.
    

* * *

🧠 What this demo shows in practice
-----------------------------------

*   how to design Terraform projects for cost visibility
    
*   how to integrate FinOps into pull request workflows
    
*   how architectural decisions change cloud cost
    
*   how the same platform pattern works in GitHub and Azure DevOps
    

* * *

⚠️ Important notes
------------------

*   This project only runs `terraform plan`, not `apply`.
    
*   No Azure resources are deployed unless you explicitly run `terraform apply`.
    
*   Always test in a non-production subscription.