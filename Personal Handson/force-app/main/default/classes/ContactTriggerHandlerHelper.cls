public with sharing class ContactTriggerHandlerHelper {
    public void updateDuplicateContacts(List<Contact> contactList){
        if(!contactList.isEmpty()){
            Map<String, Contact> emailMap = new Map<String, Contact>();

            for(Contact cont : contactList){
                if(cont.Email != null){
                    emailMap.put(cont.Email, cont);
                }
            }

            Set<String> existingEmailSet = new Set<String>();
            for(Contact con : [SELECT Id, Email FROM Contact WHERE Email IN : emailMap.keySet()]){
                existingEmailSet.add(String.valueOf(con.Email));
            }

            for(Contact con : contactList){
                if(existingEmailSet.contains(String.valueOf(con.Email))){
                    con.Duplicate_Contact__c = true;
                }
            }
        }
    }
}