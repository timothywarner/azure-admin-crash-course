$webAsg = New-AzApplicationSecurityGroup -ResourceGroupName Contoso -Name webAsg -Location eastus
$sqlAsg = New-AzApplicationSecurityGroup -ResourceGroupName Contoso -Name sqlAsg -Location eastus

$webRule = New-AzNetworkSecurityRuleConfig `
    -Name "AllowHttps" `
    -Access Allow `
    -Protocol Tcp `
    -Direction outbound `
    -Priority 1500 `
    -SourceApplicationSecurityGroupId $webAsg.id `
    -SourcePortRange * `
    -DestinationAddressPrefix VirtualNetwork `
    -DestinationPortRange 443

$sqlRule = New-AzNetworkSecurityRuleConfig `
    -Name "AllowSql" `
    -Access Allow `
    -Protocol Tcp `
    -Direction outbound `
    -Priority 1000 `
    -SourceApplicationSecurityGroupId $sqlAsg.id `
    -SourcePortRange * `
    -DestinationAddressPrefix VirtualNetwork `
    -DestinationPortRange 1433


