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

        for(Contact cont : [SELECT Id, Level__c, AccountId, MailingState FROM Contact WHERE AccountId IN : accMap.keySet()]){
            cont.Level__c = 'Primary';
            cont.MailingState = accMap.get(cont.AccountId).BillingState;
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

    public void updateShippingAddress(List<Account> accList){
        for(Account acc : accList){
            System.debug(acc.BillingStreet);
            acc.ShippingStreet = acc.BillingStreet != null ? acc.BillingStreet : '';
            System.debug(acc.ShippingStreet);
            acc.ShippingCity = acc.BillingCity != null ? acc.BillingCity : '';
            acc.ShippingState = acc.BillingState != null ? acc.BillingState : '';
            acc.ShippingCountry = acc.BillingCountry != null ? acc.BillingCountry : '';
        }
    }

    public void updateRelatedOpportunities(List<Account> accList){
        Set<Id> accIds = new Set<Id>();
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                accIds.add(acc.Id);
            }
        }

        if(!accIds.isEmpty()){
            List<Opportunity> opps = new List<Opportunity>();

            List<Opportunity> oppList = [SELECT Id, Name, CreatedDate, StageName
                                         FROM Opportunity
                                         WHERE AccountId IN : accIds
                                         AND CreatedDate < LAST_N_DAYS:30
                                         AND StageName != 'Closed Won'];

            for(Opportunity opp : oppList){
                opp.StageName = 'Closed Lost';
                opps.add(opp);
            }

            if(!opps.isEmpty()){
                update opps;
            }
        }
    }
}