import { LightningElement, track, wire, api } from 'lwc';
import findCasesBySubject from '@salesforce/apex/AccountCasesController.findCasesBySubject';
import { refreshApex } from '@salesforce/apex';




const COLUMNS = [
    { label: 'Sujet', fieldName: 'Subject', type: 'text' },
    { label: 'Statut', fieldName: 'Status', type: 'text' },
    { label: 'Priorité', fieldName: 'Priority', type: 'text' },
];

export default class AccountCaseSearchComponent extends LightningElement {
    @api recordId;
    @track cases;
    @track error;
    foundCases;
    searchTerm = '';
    columns = COLUMNS;

    updateSearchTerm(event) {
        this.searchTerm = event.target.value;
    }

    @wire(findCasesBySubject, { accountId: '$recordId', subjectSearchTerm: '$searchTerm'})
    wiredfindCasesBySubject(value){
        this.foundCases = value;
        const { error, data } = value; 
        if (data) {
            console.log('ok', data);
            this.cases = data;
            this.error = undefined;
        }
        if(error){
            console.error('err', error);
            this.error = error;
            this.cases = undefined;
        }
    };


    handleSearch() {
        return refreshApex(this.foundCases);
    }
}