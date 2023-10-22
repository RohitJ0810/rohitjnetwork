trigger OpportunityTrigger on Opportunity (after insert, after update, after delete) {
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
    Set<Id> accountIds = new Set<Id>();

    switch on Trigger.operationType{
        when AFTER_INSERT{
            for(Opportunity opp : Trigger.new){
                accountIds.add(opp.AccountId);
            }
        }
        when AFTER_UPDATE{
            for(Opportunity opp : Trigger.new){
                if(opp.AccountId!= null && opp.AccountId != Trigger.oldMap.get(opp.Id).AccountId){
                    accountIds.add(opp.AccountId);
                    accountIds.add(Trigger.oldMap.get(opp.Id).AccountId);
                }
            }
        }
        when AFTER_DELETE{
            for(Opportunity opp : Trigger.old){
                accountIds.add(opp.AccountId);
            }
        }
    } 

    if(!accountIds.isEmpty()){
        handler.invokeUpdateOppCountToAccount(accountIds);
    }
}