public with sharing class CaseSelector {
    public static List<Case> getCasesByAccountIdAndSubject(Id accountId, String searchTerm) {
        String searchString = '%' + searchTerm + '%';
        if (!Schema.sObjectType.Case.fields.Subject.isAccessible()) {
            throw new IllegalArgumentException('Any exception related text');
        }
        return [ SELECT Id, Subject, Status, Priority FROM Case WHERE AccountId =:accountId AND Subject LIKE :searchString] ;
    }
}