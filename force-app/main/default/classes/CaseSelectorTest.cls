@IsTest
private class CaseSelectorTest {
    @TestSetup
    static void setup() {
        Account testAccount = TestDataFactory.createTestAccount();
        TestDataFactory.createTestCase(testAccount.Id, 'subject');
    }

    @IsTest
    static void testGetCasesByAccountIdAndSubject() {
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        Test.startTest();
        List<Case> results = CaseSelector.getCasesByAccountIdAndSubject(testAccount.Id, 'subject');
        Test.stopTest();
        Assert.areNotEqual(0, results.size(), 'Should return at least one case');
    }
}