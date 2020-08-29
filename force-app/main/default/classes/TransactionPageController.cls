public with sharing class TransactionPageController {
    public class Transaction {
        public String transName;
        public Date transDate;
        public Decimal value;
        public Boolean transfer;
    }

    public class UserData {
        public Id uId;
        public String uName;
        public String uEmail;
        public String uAddress;
        public String uPhone;
    }

    public static UserData getUser() {
        UserData uData = new UserData();
        uData.uId = UserInfo.getUserId();
        List<User> uL = [SELECT Id, Name, Email, Address, Phone FROM User WHERE Id =:uData.uId LIMIT 1];
        uData.uName = ul[0].Name;
        uData.uEmail = ul[0].Email;
        uData.uAddress = ul[0].Address;
        uData.uPhone = ul[0].Phone;
        return uData;
    }

    @AuraEnabled
    public static List<String> getTransactions(){
        return ;
    }

    public TransactionPageController() {

    }

}
