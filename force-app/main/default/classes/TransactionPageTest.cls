@isTest
private class TransactionPageTest {
    
    @isTest
    static void testGetTransactions() {
        String uId = UserInfo.getUserId();
        List<Transaction__c> tList = [SELECT Id, Name, TransactionDate__c, 
                                        Transfer__c, Value__c
                                        FROM Transaction__c 
                                        WHERE CreatedById =:uId
                                        ORDER BY TransactionDate__c DESC LIMIT 50];
        List<Transaction__c> tListTest = TransactionPageController.getTransactions();
        System.assertEquals(tList, tListTest);
    }
    @isTest
    static void testGetUser() {
        TransactionPageController.UserData uData = new TransactionPageController.UserData();
        uData.uId = UserInfo.getUserId();
        List<User> uL = [SELECT Id, Name, Email, Address, Phone, Balance__c FROM User WHERE Id =:uData.uId LIMIT 1];
        uData.uName = uL[0].Name;
        uData.uEmail = uL[0].Email;
        uData.uAddress = uL[0].Address.getState();
        uData.uPhone = uL[0].Phone;
        uData.uBalance = uL[0].Balance__c;
        TransactionPageController.UserData udTest = TransactionPageController.getUser();
        System.assertEquals(uData.uId, udTest.uId);
    }
}