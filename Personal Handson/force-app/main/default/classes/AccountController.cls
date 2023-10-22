public with sharing class AccountController {
    @AuraEnabled(cacheable=true) 
    public static List<Account> getAccountList(){
        return [SELECT Id, Name, Industry FROM Account LIMIT 5];
    }
}