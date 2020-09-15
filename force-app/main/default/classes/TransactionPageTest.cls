@isTest
private class TransactionPageTest {

    /* try {
                List<Transaction__c> tList = TransactionPageController.getTransactions();
            } catch (Exception e) {
                System.assertEquals('System.NoAccessException', e.getTypeName());
            } */

    @isTest
    public static void testSetup(){
        Profile p = [SELECT Id FROM Profile WHERE Name ='Poket Money User'];
        List<User> uu = new List<User>();
        while (uu.size() < 5) {
            Blob b = Crypto.GenerateAESKey(128);
            String h = EncodingUtil.ConvertTohex(b);
            String uid = h.SubString(0,8);
            User u = new User(Alias = uid, Email= uid + '@myorg.com', 
                EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
                LocaleSidKey='en_US', ProfileId = p.Id, 
                TimeZoneSidKey='America/New_York', UserName= uid + '@myorg.com');      
            uu.add(u);
        }
        Test.startTest();
        for (User u : uu) {
            System.runAs(u) {
                

                List<Transaction__c> tList = new List<Transaction__c>();
                for (Integer i = 0; i < 50; i++) {
                    Transaction__c tr = new Transaction__c(OwnerId = u.Id, Name = 'test '+ i);
                    tList.add(tr);
                }
                insert tList;

                
            }
        }
        Test.stopTest();
    }
    
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