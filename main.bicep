param location string = resourceGroup().location
param deploymentTime string = utcNow()

var random13 = substring(uniqueString(deploymentTime), 0, 13)
var storageName = 'stgmw${random13}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}


output storageAccountName string = storageaccount.name
output displayMessage string = 'Storage Account Name: ${storageaccount.name} - Created at: ${deploymentTime}'

