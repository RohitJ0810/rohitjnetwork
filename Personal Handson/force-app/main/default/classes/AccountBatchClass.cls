public class AccountBatchClass implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Name, Industry FROM Account';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> accList){
        if(!accList.isEmpty()){
            for(Account acc : accList){
                System.debug('Account Industry :::' +acc.Industry);
            }
        }
    }

    public void finish(Database.BatchableContext bc){   
        System.debug('Finish method executed...');
    }
}