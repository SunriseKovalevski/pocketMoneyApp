public with sharing class TransactionPageController {

    public class UserData {
        public Id uId;
        public String uName;
        public String uEmail;
        public String uAddress;
        public String uPhone;
        public Decimal uBalance;

    }

    @AuraEnabled
    public static UserData getUser() {
        UserData uData = new UserData();
        uData.uId = UserInfo.getUserId();
        List<User> uL = [SELECT Id, Name, Email, Address, Phone, Balance__c FROM User WHERE Id =:uData.uId LIMIT 1];
        uData.uName = ul[0].Name;
        uData.uEmail = ul[0].Email;
        uData.uAddress = ul[0].Address.getState();
        uData.uPhone = ul[0].Phone;
        uData.uBalance = ul[0].Balance__c;
        return uData;
    }

    @AuraEnabled
    public static List <Transaction__c> getTransactions(){
        
        String uId = UserInfo.getUserId();
        List <Transaction__c> tList = [SELECT Id, Name, TransactionDate__c, 
                                            Transfer__c, Value__c
                                            FROM Transaction__c 
                                            WHERE CreatedById =: uId
                                            ORDER BY TransactionDate__c DESC LIMIT 50];
        
        Decimal sumBalance = 0;
        for (Transaction__c item : tList) {
            if (item.Transfer__c) {
                sumBalance += item.Value__c;
            } else {
                sumBalance -= item.Value__c;
            }
        }

        uId = UserInfo.getUserId();
        User u = [SELECT Id, Name, Email, Address, Phone, Balance__c FROM User WHERE Id =:uId LIMIT 1];
        u.Balance__c = sumBalance;
        update u;

        System.debug(' Transaction__c  tList  ===>>>  ' + JSON.serializePretty(tList));
        return tList; //JSON.serializePretty(tList);
    }

    @AuraEnabled
    public static String getId(){
        return UserInfo.getUserId();
    }


    @AuraEnabled
    public static Transaction__c deleteTransaction (Transaction__c t) {
        delete t;
        return t;
    }

    public TransactionPageController() {

    }


}