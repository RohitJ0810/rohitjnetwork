trigger AccountTrigger on Account (after insert, after update) {
	AccountTriggerHandler handler = new AccountTriggerHandler();
    
    switch on Trigger.operationType{
        when AFTER_INSERT{
            handler.afterInsert(Trigger.New, Trigger.newMap);
        }
        when AFTER_UPDATE{
            handler.afterUpdate(Trigger.old, Trigger.New, Trigger.oldMap, Trigger.newMap);
        }
    }
}