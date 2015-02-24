@isTest
public class LAB_CreateDataHelperTest{
    
    static testmethod void testConstructorStandardController() {
        LAB_Mo_Tester_1__c sample = new LAB_Mo_Tester_1__c();
        ApexPages.StandardController sc = new ApexPages.StandardController(sample);
        LAB_CreateDataHelper helper = new LAB_CreateDataHelper(sc);
        System.assertNotEquals(null, helper.moTester1);
    }

    static testmethod void testConstructorSetController() {
        List<LAB_Mo_Tester_1__c> mos = new List<LAB_Mo_Tester_1__c>();
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(mos);
        LAB_CreateDataHelper helper = new LAB_CreateDataHelper(ssc);
        System.assertNotEquals(null, helper); //pretty meaningless
    }

    static testmethod void testCreateMoTester1() {
        LAB_CreateDataHelper helper = new LAB_CreateDataHelper();
        helper.createMoTester1();
        Integer counter = [Select Count() from LAB_Mo_Tester_1__c LIMIT 100];
        System.assert(counter == 1, counter);
    }
    
    static testmethod void testCreateManyMoTester1() {
        LAB_CreateDataHelper helper = new LAB_CreateDataHelper();
        helper.createManyMoTester1();
        Integer counter = [Select Count() from LAB_Mo_Tester_1__c LIMIT 100];
        System.assert(counter == 50, counter);
        
        helper.deleteAll();
        counter = [Select Count() from LAB_Mo_Tester_1__c LIMIT 100];
        System.assert(counter == 0, counter);
    }    
    
    static testmethod void testCreate3MT1WithChildrenAndGrandChildren() {
        LAB_CreateDataHelper helper = new LAB_CreateDataHelper();
        helper.create3MT1WithChildrenAndGrandChildren();
        Integer counter = [Select Count() from LAB_Mo_Tester_1__c LIMIT 100];
        System.assert(counter == 3, counter);
        
        List<LAB_Mo_Tester_1__c> mt1 = [Select Id, MT1_Rollup1_Total_GC1_Count__c From LAB_Mo_Tester_1__c LIMIT 100];
        System.assert(mt1.size() == 3, 'Wrong number returned');
        for (LAB_Mo_Tester_1__c current : mt1) {
            System.assert(current.MT1_Rollup1_Total_GC1_Count__c == 9, 'Wrong number of grandchildren ' + current.MT1_Rollup1_Total_GC1_Count__c);
        }
        
    }
    
}