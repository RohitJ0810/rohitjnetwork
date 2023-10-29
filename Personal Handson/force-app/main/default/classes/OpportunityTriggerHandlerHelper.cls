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

    public void createTask(List<Opportunity> oppList){
        if(!oppList.isEmpty()){
            List<Task> taskList = new List<Task>();
            for(Opportunity opp : oppList){
                Task tsk = new Task();
                tsk.WhatId = opp.Id;
                tsk.Priority = 'High';
                tsk.OwnerId = UserInfo.getUserId();
                taskList.add(tsk);
            }

            if(!taskList.isEmpty()){
                try {
                    insert taskList;
                } catch (Exception e) {
                    System.debug('Error::' +e.getMessage());
                }
            }
        }
    }

    public void preventOpptDeletion(List<Opportunity> opptList){
        System.debug('Inside preventOpptDeletion');
        if(!opptList.isEmpty()){
            for(Opportunity opp : opptList){
                if(opp.StageName == 'Prospecting'){
                    System.debug('Inside Prospecting');
                    opp.addError('Prospecting opportunities cannot be deleted.');
                }
            }
        }
    }
}