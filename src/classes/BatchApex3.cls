global class BatchApex3 implements Database.Batchable<sObject>{
     public String query;
    
    global Database.querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        List<Account> accns = new List<Account>();
        
        for(sObject s : scope){
            Account a = (Account)s;
            a.RunBatch__c = true;
            accns.add(a);
        }
        
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
}