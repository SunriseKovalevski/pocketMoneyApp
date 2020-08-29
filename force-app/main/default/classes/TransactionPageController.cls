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
        User u = new User();
        getUser().uId = UserInfo.getUserId();
        u = Database.query('');
        return getUser();
    }

    @AuraEnabled
    public static List<String> getTransactions(){
        return ;
    }

    public TransactionPageController() {

    }

}
