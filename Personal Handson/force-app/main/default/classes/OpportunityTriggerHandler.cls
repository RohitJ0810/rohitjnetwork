public with sharing class OpportunityTriggerHandler {
    OpportunityTriggerHandlerHelper helper = new OpportunityTriggerHandlerHelper();
    
   public void invokeUpdateOppCountToAccount(Set<Id> accIds){
        helper.updateOppCountToAccount(accIds);
   }

   public void invokeCreateTask(List<Opportunity> opptList){
        helper.createTask(opptList);
   }

   public void preventDeletion(List<Opportunity> opptList){
     System.debug('Inside preventDeletion');
        helper.preventOpptDeletion(opptList);
   }
}