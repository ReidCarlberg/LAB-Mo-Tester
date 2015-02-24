/*
 * Refactored 2/23/15 to allow for Lightning Components
 */
public with sharing class LAB_CreateDataHelper {
    
    public LAB_Mo_Tester_1__c moTester1 {get; set;}
    
    public LAB_CreateDataHelper() {}
    
    public LAB_CreateDataHelper(ApexPages.StandardController controller) {
        this.moTester1 = (LAB_Mo_Tester_1__c) controller.getRecord(); 
    }
    
    public LAB_CreateDataHelper(ApexPages.StandardSetController setController) {
        //this
    }

    public PageReference createMoTester1() {
        Id myMo = LAB_CreateDataHelper.getNewMoTester1Id();
        return new PageReference('/'+myMo);        
    }    

    @AuraEnabled
    public Static Id getNewMoTester1Id() {
        SmartFactory.FillAllFields = true;
        LAB_Mo_Tester_1__c t = (LAB_Mo_Tester_1__c) SmartFactory.createSObject('LAB_Mo_Tester_1__c');
        insert t;  
        return t.id;                
    }
      
    public PageReference createManyMoTester1() {
        LAB_CreateDataHelper.insertManyMoTester1();
        return new PageReference('/' + LAB_Mo_Tester_1__c.sObjectType.getDescribe().getKeyPrefix());
    }
    
    @AuraEnabled
    public static void insertManyMoTester1() {
        SmartFactory.FillAllFields = true;
        List<SObject> sobjects = SmartFactory.createSObjectList('LAB_Mo_Tester_1__c', false, 50);
        insert sobjects;        
    }
    
    public PageReference deleteAll() {
        LAB_CreateDataHelper.deleteAllMoTester1();
        return new PageReference('/' + LAB_Mo_Tester_1__c.sObjectType.getDescribe().getKeyPrefix());
    }
    
    @AuraEnabled
    public static void deleteAllMoTester1() {
        List<LAB_Mo_Tester_1__c> mos = [Select Id From LAB_MO_Tester_1__c LIMIT 10000];
        delete mos;        
    }
    

    public PageReference create3MT1WithChildrenAndGrandChildren() {
        LAB_CreateDataHelper.insert3MT1WithChildrenAndGrandChildren();
        return new PageReference('/' + LAB_Mo_Tester_1__c.sObjectType.getDescribe().getKeyPrefix());
    }
    
    @AuraEnabled
    public static void insert3MT1WithChildrenAndGrandChildren(){
        //MT1
        SmartFactory.FillAllFields = true;
        List<SObject> mt1 = SmartFactory.createSObjectList('LAB_Mo_Tester_1__c', false, 3);
        insert mt1;
        
        //Children
        List<SObject> mt1c1 = new List<SObject>();
        for (Sobject current : mt1) {
            List<SObject> children = SmartFactory.createSObjectList('LAB_MT1_Child_1__c', false, 3);
            for (SObject currentChild : children) {
                currentChild.put('LAB_Mo_Tester_1__c', current.get('id'));
            }
            mt1c1.addAll(children);
        }
        insert mt1c1;
        
        //Grandchildren
        List<SObject> mt1gc1 = new List<SObject>();
        for (SObject currentChild : mt1c1) {
            List<SObject> grandchildren = SmartFactory.createSObjectList('LAB_MT1_Grandchild_1__c', false, 3);
            for (SObject currentGrandchild : grandchildren) {
                currentGrandchild.put('LAB_MT1_Child_1__c', currentChild.get('Id'));
            }
            mt1gc1.addAll(grandChildren);
        }
        
        insert(mt1gc1);        
    }

}