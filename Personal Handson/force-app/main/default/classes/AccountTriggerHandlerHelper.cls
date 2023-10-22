public class AccountTriggerHandlerHelper {
    public void createRelatedContacts(List<Account> accList){
        List<Contact> contactList = new List<Contact>();
        
        for(Account acc : accList){
            Contact cont = new Contact();
            cont.FirstName = acc.Name;
            cont.LastName = ' contact';
            cont.AccountId = acc.Id;
            contactList.add(cont);
        }
        
        if(!contactList.isEmpty()){
            insert contactList;
        }
    }

    public void updateRelatedContacts(Map<Id, Account> accMap){
        List<Contact> contactList = new List<Contact>();

        for(Contact cont : [SELECT Id, Level__c FROM Contact WHERE AccountId IN : accMap.keySet()]){
            cont.Level__c = 'Primary';
            contactList.add(cont);
        }
       
        if(!contactList.isEmpty()){
            try{
                update contactList;
            }catch(DmlException dml){
                System.debug('Error::' +dml.getMessage()+ ' ' +dml.getStackTraceString());
            }
        }
    }
}