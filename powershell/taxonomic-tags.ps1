# Resource Groups and Taxonomic Tags

# See existing tags on a resource group
(Get-AzResourceGroup -Name examplegroup).Tags

# See existing tags for a particular resource
(Get-AzResource -ResourceId /subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.Storage/storageAccounts/<storage-name>).Tags

# See existing tags for a named resource
(Get-AzResource -ResourceName examplevnet -ResourceGroupName examplegroup).Tags

# Get resource groups that have a specific tag
(Get-AzResourceGroup -Tag @{ Dept = "Finance" }).ResourceGroupName

# Get resources that have a specific tag
(Get-AzResource -Tag @{ Dept = "Finance" }).Name

# Get resources that have a specific tag name
(Get-AzResource -TagName Dept).Name

# Add tags to RG without existing tags
Set-AzResourceGroup -Name examplegroup -Tag @{ Dept = "IT"; Environment = "Test" }

# Add tags to RG that has existing tags
$tags = (Get-AzResourceGroup -Name examplegroup).Tags
$tags.Add("Status", "Approved")
Set-AzResourceGroup -Tag $tags -Name examplegroup

# Apply tags from an RG to its resources, preserving existing tags
$group = Get-AzResourceGroup "examplegroup"
if ($null -ne $group.Tags) {
    $resources = Get-AzResource -ResourceGroupName $group.ResourceGroupName
    foreach ($r in $resources) {
        $resourcetags = (Get-AzResource -ResourceId $r.ResourceId).Tags
        if ($resourcetags) {
            foreach ($key in $group.Tags.Keys) {
                if (-not($resourcetags.ContainsKey($key))) {
                    $resourcetags.Add($key, $group.Tags[$key])
                }
            }
            Set-AzResource -Tag $resourcetags -ResourceId $r.ResourceId -Force
        }
        else {
            Set-AzResource -Tag $group.Tags -ResourceId $r.ResourceId -Force
        }
    }
}

# Remove all tags
Set-AzResourceGroup -Tag @{ } -Name examplegroup














