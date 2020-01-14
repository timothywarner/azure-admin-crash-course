# AZ-103 Crash Course Day 1 Labs

* Managing Azure subscriptions
  - Subscriptions blade
  - Azure Cost Management

* Managing Azure Resources
  - Management scopes
  - Resource groups
  - Taxonomic tags
  - Azure Policy [understand net effect]
  - RBAC access [sub-admin groups]

* Managing Azure Storage
  - Create storage account (use CLI)
    + replication options
    + soft delete & snapshotting
    + View VHD lease state with ASE
    + services (especially file)
  - Azure Storage Explorer
  - RBAC & SAS access [do stored access policy]
  - Cloud share in Cloud Shell
  - Azure File Sync
  - Azure Key Vault / managed storage account

* Deploying Azure VMs
  - Create Windows and Linux VMs
  - Prepare on-prem VHDs (gen 1/gen 2)
  - Add and initialize disks
  - ARM templates
  - Management operations
    + BACKUP + REPLICATION / Vault
    + Diagnostics
    + Extensions
  - Compare with App Services / App Service Plans


az keyvault storage add --vault-name TimKV -n twcloudstorage --active-key-name key1 --auto-regenerate-key --regeneration-period P90D --resource-id "/subscriptions/2fbf906e-1101-4bc0-b64f-adc44e462fff/resourceGroups/INSTRUCTOR/providers/Microsoft.Storage/storageAccounts/twcloudstorage"
