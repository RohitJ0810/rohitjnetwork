public with sharing class OpportunityTriggerHandler {
    OpportunityTriggerHandlerHelper helper = new OpportunityTriggerHandlerHelper();
    
   public void invokeUpdateOppCountToAccount(Set<Id> accIds){
        helper.updateOppCountToAccount(accIds);
   }
}