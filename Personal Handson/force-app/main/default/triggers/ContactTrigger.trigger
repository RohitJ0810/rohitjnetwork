trigger ContactTrigger on Contact (before insert, before update, after update, after insert, after delete) {
    ContactTriggerHandler handler = new ContactTriggerHandler();

    switch on Trigger.operationType{
        when BEFORE_INSERT{
            handler.beforeInsert(Trigger.new);
        }

        when AFTER_INSERT{
            handler.afterInsert(Trigger.new, Trigger.newMap);
        }

        when BEFORE_UPDATE{
            List<Contact> contList = new List<Contact>();
            for(Contact cont : Trigger.new){
                if(cont.Email != null && cont.Email != Trigger.oldMap.get(cont.Id).Email){
                    contList.add(cont);
                }
            }

            handler.beforeInsert(contList);
        }

        when AFTER_UPDATE{
            handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }

        when AFTER_DELETE{
            handler.afterDelete(Trigger.old, Trigger.oldMap);
        }
    }
}