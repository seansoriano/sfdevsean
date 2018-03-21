@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the Account from the end of the URL
        String accID = request.requestURI.substringBetween(
          'Accounts/','/contacts');
        system.debug(accId);
        Account result = [SELECt Id, Name,(SELECT Id, Name FROM Contacts) FROM Account WHERE Id =: accId];
        system.debug(result);
        
        return result;
    }

}