trigger ContactTrigger on Contact (before insert, before update) {
    ContactTriggerHandler handler = new ContactTriggerHandler();

    switch on Trigger.operationType{
        when BEFORE_INSERT{
            handler.checkForDuplicates(Trigger.new);
        }

        when BEFORE_UPDATE{
            List<Contact> contList = new List<Contact>();
            for(Contact cont : Trigger.new){
                if(cont.Email != null && cont.Email != Trigger.oldMap.get(cont.Id).Email){
                    contList.add(cont);
                }
            }

            handler.checkForDuplicates(contList);
        }
    }
}