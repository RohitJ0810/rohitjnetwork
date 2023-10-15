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
}