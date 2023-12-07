public with sharing class AccountController {
    @AuraEnabled(cacheable=true) 
    public static List<Account> getAccountList(){
        return [SELECT Id, Name, Industry FROM Account LIMIT 5];
    }

    @future
    public static void retrieveAccountData() {
        System.debug('Inside account future method...');
        List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 100];
    }
}