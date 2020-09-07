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
}