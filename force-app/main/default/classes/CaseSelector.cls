public with sharing class CaseSelector {
    public static List<Case> getCasesByAccountIdAndSubject(Id accountId, String searchTerm) {
        String searchString = '%' + searchTerm + '%';
        if (!Schema.sObjectType.Case.fields.Subject.isAccessible()) {
            throw new AuraHandledException('vous ne pouvez pas faire cette action');
        }
        return [ SELECT Id, Subject, Status, Priority FROM Case WHERE AccountId =:accountId AND Subject LIKE :searchString] ;
    }
}