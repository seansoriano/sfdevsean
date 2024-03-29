@isTest
private class MassLeadConverterControllerTest {

    static testMethod void massLeadTest() {
        // set up account
        Account acc = new Account();
        acc.Name = 'Acme Account Test';
        acc.BillingCountry = 'US';
        acc.ShippingCountry = 'US';
        acc.BillingState = 'IL';
        insert acc;
        
        
        // set up leads
        List<Lead> testLeads = new List<Lead>();
        Lead lead1 = new Lead();
        lead1.Company = 'Test 1 New Company';
        lead1.LastName = 'Martha';
        lead1.LeadSource = 'Not Converted';
        testLeads.add(lead1);
        
        Lead lead2 = new Lead();
        lead2.Company = 'Test 12';
        lead2.LastName = 'Jordan';
        lead2.LeadSource = 'Not Converted';
        testLeads.add(lead2);
        
        Lead lead3 = new Lead();
        lead3.Company = 'Test 3';
        lead3.LastName = 'Paul';
        lead3.LeadSource = 'Not Converted';
        testLeads.add(lead3);    
        
         Lead lead4 = new Lead();
        lead4.Company = 'Test 1';
        lead4.LastName = 'Cathy';
        lead4.LeadSource = 'Not Converted';
        testLeads.add(lead4);    
        
        Lead lead5 = new Lead();
        lead5.Company = 'Test 1';
        lead5.LastName = 'Dereck';
        lead5.LeadSource = 'Not Converted';
        testLeads.add(lead5);   
   
        Lead lead6 = new Lead();
        lead6.Company = 'Test 1';
        lead6.LastName = 'Benjamin';
        lead6.LeadSource = 'Not Converted';
        testLeads.add(lead6);    
        
        Lead lead7 = new Lead();
        lead7.Company = 'Test 1';
        lead7.LastName = 'Franklin';
        lead7.LeadSource = 'Not Converted';
        testLeads.add(lead7);   
        
        insert testLeads;
                            
        // set up extension
        List<Lead> selectedLeads = new List<Lead>();
        selectedLeads.add(lead1);
        selectedLeads.add(lead2);
        ApexPages.Standardsetcontroller con = new ApexPages.Standardsetcontroller(selectedLeads);
		con.setSelected(selectedLeads);
		MassLeadConverterController mlc = new MassLeadConverterController(con);
		
        // try with new account
		mlc.leadTask.ActivityDate = System.today();
		mlc.leadTask.Subject = 'hi';
		mlc.leadTask.Status = 'In Progress';			
		mlc.leadTask.Priority = 'High';
		mlc.oppOption = 'Create an opportunity for each lead';
		mlc.convertLeads();
		
		List<Contact> resultingContacts = [select Id from Contact Where Account.Name = 'Test 1 New Company'];
        System.assertEquals(2, resultingContacts.size()); 
        List<Opportunity> resultingOpp = [select Id from Opportunity Where Opportunity.Name = 'Test 1 New Company'];
        System.assertEquals(2, resultingOpp.size());
   
        
         // re-set up extension
        selectedLeads = new List<Lead>();
        selectedLeads.add(lead3);
        con = new ApexPages.Standardsetcontroller(selectedLeads);
		con.setSelected(selectedLeads);
		mlc = new MassLeadConverterController(con);
		
        // try with existing account and do not create opportunity
        mlc.accOption = 'Add to existing account';
        mlc.con.AccountId = acc.Id;
		mlc.leadTask.ActivityDate = System.today();
		mlc.leadTask.Subject = 'hi';
		mlc.leadTask.Status = 'In Progress';			
		mlc.leadTask.Priority = 'High';
		mlc.oppOption = 'Do not create new opportunity';
		
		mlc.convertLeads();
		
		resultingContacts = [select Id from Contact Where AccountId = :acc.Id];
        System.assertEquals(1, resultingContacts.size()); 
        resultingOpp = [select Id from Opportunity Where Opportunity.Name = 'Acme Account Test'];
        System.assertEquals(0, resultingOpp.size());      
        
         // re-set up extension
        selectedLeads = new List<Lead>();
        selectedLeads.add(lead4);
        selectedLeads.add(lead5);
        con = new ApexPages.Standardsetcontroller(selectedLeads);
		con.setSelected(selectedLeads);
		mlc = new MassLeadConverterController(con);
		
        // try with existing account and only create one opportunity and a task for each lead
        mlc.accOption = 'Add to existing account';
        mlc.con.AccountId = acc.Id;
		mlc.leadTask.ActivityDate = System.today();
		mlc.leadTask.Subject = 'hi';
		mlc.leadTask.Status = 'In Progress';			
		mlc.leadTask.Priority = 'High';
		mlc.oppOption = 'Combine all leads into a single opportunity';
		mlc.taskOption = 'Create a task for each lead';
		mlc.opportunityName = 'acme opp';
		
		mlc.convertLeads();
		
		resultingContacts = [select Id from Contact Where AccountId = :acc.Id];
        System.assertEquals(3, resultingContacts.size()); 
        resultingOpp = [select Id from Opportunity Where Opportunity.Name = 'acme opp'];
        System.assertEquals(1, resultingOpp.size());            

      // re-set up extension
        selectedLeads = new List<Lead>();
        selectedLeads.add(lead6);
        selectedLeads.add(lead7);
        con = new ApexPages.Standardsetcontroller(selectedLeads);
		con.setSelected(selectedLeads);
		mlc = new MassLeadConverterController(con);
		
        // try with existing account and only create one opportunity and a task for each lead
        mlc.accOption = 'Add to existing account';
        mlc.con.AccountId = acc.Id;
		mlc.leadTask.ActivityDate = System.today();
		mlc.leadTask.Subject = 'hi';
		mlc.leadTask.Status = 'In Progress';			
		mlc.leadTask.Priority = 'High';
		mlc.oppOption = 'Create an opportunity for each lead';
		mlc.taskOption = 'Create a task for each lead';
		mlc.opportunityName = 'multiple opps';
		
		mlc.convertLeads();
		
		resultingContacts = [select Id from Contact Where AccountId = :acc.Id];
        System.assertEquals(5, resultingContacts.size()); 
        resultingOpp = [select Id from Opportunity Where Opportunity.Name = 'multiple opps'];
        System.assertEquals(2, resultingOpp.size());          
                
          // re-set up extension
        selectedLeads = new List<Lead>();
        con = new ApexPages.Standardsetcontroller(selectedLeads);
		con.setSelected(selectedLeads);
		mlc = new MassLeadConverterController(con);
        System.assertEquals(false, mlc.isEditable);
        
    }
}