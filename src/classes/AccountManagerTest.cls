@isTest
private class AccountManagerTest {
    
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://na1.salesforce.com/services/apexrest/LightningSean/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account Acc = AccountManager.getAccount();
        
        // Verify results
        System.assert(Acc != null);
        System.assertEquals('Test record', Acc.Name);
    }
    
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account AccountTest = new Account(Name='Test record');
        insert AccountTest;
        
        Contact con = new Contact(LastName = 'Contact Record', AccountId = accountTest.Id);
        insert con;
        
        
        return AccountTest.Id;
    }      

}