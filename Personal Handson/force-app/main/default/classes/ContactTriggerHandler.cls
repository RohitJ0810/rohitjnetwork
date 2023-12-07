public with sharing class ContactTriggerHandler {
    ContactTriggerHandlerHelper helper = new ContactTriggerHandlerHelper();
    
    public void beforeInsert(List<Contact> contactList){
        helper.updateDuplicateContacts(contactList);
    }

    public void afterUpdate(List<Contact> oldContactList, List<Contact> newContactList, Map<Id, Contact> newContactMap, Map<Id, Contact> oldContactMap){
        Set<Id> accIds = new Set<Id>();
        if(!newContactList.isEmpty()){
            for(Contact con : newContactList){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }
        
        // Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Description FROM Account WHERE Id IN : accIds]);

        // List<Account> updatedAccList = new List<Account>();
        // for(Contact con : newContactList){
        //     System.debug(con.Description);
        //     Account acc = accMap.get(con.AccountId);
        //     System.debug(acc);
        //     acc.Description = con.Description;

        //     updatedAccList.add(acc);
        // }

        // try {
        //     if(!updatedAccList.isEmpty()){
        //         update updatedAccList;
        //     }
        // } catch (Exception ex) {
        //     System.debug(ex.getMessage());
        // }

        if(!accIds.isEmpty()){
            helper.updateContactCountToAccount(accIds);
        }
    }

    public void afterInsert(List<Contact> contactList, Map<Id, Contact> contactMap){
        Set<Id> accIds = new Set<Id>();
        if(!contactList.isEmpty()){
            for(Contact con : contactList){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }

        if(!accIds.isEmpty()){
            helper.updateContactCountToAccount(accIds);
        }
    }

    public void afterDelete(List<Contact> oldContactList, Map<Id, Contact> oldContactMap){
        Set<Id> accIds = new Set<Id>();
        if(!oldContactList.isEmpty()){
            for(Contact con : oldContactList){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }

        if(!accIds.isEmpty()){
            helper.updateContactCountToAccount(accIds);
        }
    }
}