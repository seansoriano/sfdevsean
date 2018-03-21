/*** Controller: ***/ 
public class dataTableCon { 
	
	List <Account> accounts; 
	public string accID {get; set;}

	public List<Account> getAccounts() { 
		if(accounts == null) {
			accounts = [select name, owner.name, phone from account]; 
		}
		
		return accounts; 
	} 
	
	public void addRow(){
		accounts.add(new Account());
		
	}

	
	public pageReference saveAccts(){
		upsert accounts;
		return new PageReference('/' + Schema.getGlobalDescribe().get('Account').getDescribe().getKeyPrefix() + '/o');
	}
	
	
	public void delAcc(){
		
		Account acc = [SELECT Id FROM Account WHERE Id =: accID];
		
		
		
		delete(acc);
	}
	
}