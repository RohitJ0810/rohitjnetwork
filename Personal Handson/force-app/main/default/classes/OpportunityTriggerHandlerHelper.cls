public with sharing class OpportunityTriggerHandlerHelper {
    public void updateOppCountToAccount(Set<Id> accIds){
        List<Account> accList = new List<Account>();

        for(AggregateResult ar : [SELECT COUNT(Id) oppCount, AccountId FROM Opportunity GROUP BY AccountId]){
            Account acc = new Account();
            acc.Id = (Id)ar.get('AccountId');
            acc.Opportunity_Count__c = (Decimal)ar.get('oppCount');
            accList.add(acc);
        }

        if(!accList.isEmpty()){
            try {
                update accList;
            } catch (Exception e) {
                System.debug('Error::' +e.getMessage());
            }
        }
    }
}