trigger LeadTrigger on Lead (before insert, before update, before delete, after insert, after update, after undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            System.debug('Before isInsert Trigger.old::' +Trigger.old);
            System.debug('Before isInsert Trigger.new::' +Trigger.new);
            System.debug('Before isInsert Trigger.oldMap::' +Trigger.oldMap);
            System.debug('Before isInsert Trigger.newMap::' +Trigger.newMap);
        }
        if(Trigger.isUpdate){
            System.debug('Before isUpdate Trigger.old::' +Trigger.old);
            System.debug('Before isUpdate Trigger.new::' +Trigger.new);
            System.debug('Before isUpdate Trigger.oldMap::' +Trigger.oldMap);
            System.debug('Before isUpdate Trigger.newMap::' +Trigger.newMap);
        }
        if(Trigger.isDelete){
            System.debug('Before isDelete Trigger.old::' +Trigger.old);
            System.debug('Before isDelete Trigger.new::' +Trigger.new);
            System.debug('Before isDelete Trigger.oldMap::' +Trigger.oldMap);
            System.debug('Before isDelete Trigger.newMap::' +Trigger.newMap);
        }
    }
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            System.debug('After isInsert Trigger.old::' +Trigger.old);
            System.debug('After isInsert Trigger.new::' +Trigger.new);
            System.debug('After isInsert Trigger.oldMap::' +Trigger.oldMap);
            System.debug('After isInsert Trigger.newMap::' +Trigger.newMap);
        }
        if(Trigger.isUpdate){
            System.debug('After isUpdate Trigger.old::' +Trigger.old);
            System.debug('After isUpdate Trigger.new::' +Trigger.new);
            System.debug('After isUpdate Trigger.oldMap::' +Trigger.oldMap);
            System.debug('After isUpdate Trigger.newMap::' +Trigger.newMap);
        }
        if(Trigger.isDelete){
            System.debug('After isDelete Trigger.old::' +Trigger.old);
            System.debug('After isDelete Trigger.new::' +Trigger.new);
            System.debug('After isDelete Trigger.oldMap::' +Trigger.oldMap);
            System.debug('After isDelete Trigger.newMap::' +Trigger.newMap);
        }
    }
}