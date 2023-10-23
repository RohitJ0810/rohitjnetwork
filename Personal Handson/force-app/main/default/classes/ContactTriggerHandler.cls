public with sharing class ContactTriggerHandler {
    ContactTriggerHandlerHelper helper = new ContactTriggerHandlerHelper();
    
    public void checkForDuplicates(List<Contact> contactList){
        helper.updateDuplicateContacts(contactList);
    }
}