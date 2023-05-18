/* Description :-  Test class for Account's Contact Flow */
@isTest
public class Account_Contact_Test {
	@isTest
    public static void accountCreationTest()
    {
        Account acc=new Account();
        acc.name='Test';
        acc.Type='Customer - Channel';
        acc.Activation__c=true;
        acc.Account_Activation_Summary__c='Summary';
        acc.Phone='9437714466';
        acc.Company_Email__c='abc1998@gmail.com';
        insert acc;
        
        List<Contact> con=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(con.size()>0);
    }
    @isTest
    public static void accountUpdationTest()
    {
        Account acc=new Account();
        acc.name='Test Account 2';
        acc.Type='Customer - Channel';
        acc.Account_Activation_Summary__c='Account Activation Summary';
        acc.Phone='9776699224';
        acc.Company_Email__c='bcd1997@gmail.com';
        insert acc;
        List<Contact> con=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(con.size()==0);
        acc.Activation__c=true;
        acc.Account_Activation_Summary__c='Summary';
        update acc;
        List<Contact> cont=[Select id,AccountId from Contact where AccountId=:acc.id];
        //system.debug ('cont'+cont);
        System.assert(cont.size()>0);
    }

}