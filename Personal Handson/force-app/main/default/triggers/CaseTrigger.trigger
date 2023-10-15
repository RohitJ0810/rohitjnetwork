trigger CaseTrigger on Case (before insert) {
	CaseTriggerHandler handler = new CaseTriggerHandler();
    
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            handler.beforeInsert(Trigger.new);
        }
    }
}