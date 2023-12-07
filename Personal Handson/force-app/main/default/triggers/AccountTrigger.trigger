trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
	AccountTriggerHandler handler = new AccountTriggerHandler();
    
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            handler.beforeInsert(Trigger.new);
        }
        when AFTER_INSERT{
            handler.afterInsert(Trigger.new, Trigger.newMap);
        }
        when BEFORE_UPDATE{
            handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when AFTER_UPDATE{
            handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when BEFORE_DELETE{
            handler.beforeDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_DELETE{
            handler.afterDelete(Trigger.old, Trigger.oldMap);
        }
        when AFTER_UNDELETE{
            handler.afterUndelete(Trigger.new, Trigger.newMap);
        }
    }
}