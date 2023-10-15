public class AccountTriggerHandler {
    AccountTriggerHandlerHelper helper = new AccountTriggerHandlerHelper();
    public void afterInsert(List<Account> accList, Map<ID, Account> accMap){
        helper.createRelatedContacts(accList);
    }
}