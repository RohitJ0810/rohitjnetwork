public class AccountTriggerHandler {
    AccountTriggerHandlerHelper helper = new AccountTriggerHandlerHelper();

    public void beforeInsert(List<Account> accList){
        helper.updateShippingAddress(accList);
    }

    public void afterInsert(List<Account> accList, Map<ID, Account> accMap){
        helper.createRelatedContacts(accList);
    }

    public void beforeUpdate(List<Account> oldList, List<Account> newList, Map<Id, Account> oldAccMap, Map<Id, Account> newAccMap){
        helper.updateShippingAddress(newList);
    }

    public void afterUpdate(List<Account> oldaccList,List<Account> accList, Map<Id, Account> oldAccMap, Map<Id, Account> newAccMap){
        Map<Id, Account> accMap = new Map<Id, Account>();
        for(Account acc : accList){
            if(acc.BillingState != oldAccMap.get(acc.Id).BillingState){
                accMap.put(acc.Id, acc);
            }
        }

        helper.updateRelatedContacts(accMap);
        helper.updateRelatedOpportunities(accList);
    }
}