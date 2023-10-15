trigger AccountTrigger on Account (after insert) {
	AccountTriggerHandler handler = new AccountTriggerHandler();
    
    switch on Trigger.operationType{
        when AFTER_INSERT{
            handler.afterInsert(Trigger.New, Trigger.newMap);
        }
    }
}