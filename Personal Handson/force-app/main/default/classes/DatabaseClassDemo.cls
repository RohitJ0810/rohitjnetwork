public with sharing class DatabaseClassDemo {
    public static void insertContacts(){
        List<Contact> contactList = new List<Contact>();
        Contact c1 = new Contact(FirstName='Rohit', LastName='Jahagirdar');
        Contact c2 = new Contact(FirstName='Monali', LastName='Jahagirdar');
        Contact c3 = new Contact(FirstName='Ridhaan', LastName='Jahagirdar');
        Contact c4 = new Contact();

        contactList.add(c1);
        contactList.add(c2);
        contactList.add(c3);
        contactList.add(c4);

        Database.SaveResult[] saveResult = Database.insert(contactList, false);

        for(Database.SaveResult sr : saveResult){
            if(sr.isSuccess()){
                System.debug('Success');
            }else{
                for(Database.Error er : sr.getErrors()){
                    System.debug('Error occurred::' +er.getMessage() + '::' +er.getStatusCode());
                    System.debug('Error fields are:::'+er.getFields());
                }
            }
        }
    }
}