({
    init : function(component, event, helper) {

        component.set('v.columns', [
            {label: 'Value', fieldName: 'Value__c', type: 'text'},
            {label: 'Transaction Date', fieldName: 'TransactionDate__c', type: 'date'},
            {label: 'Transfer', fieldName: 'Transfer__c', type: 'date'}
           
        ]);

        

        helper.getTransactions(component);
    },
    myAction : function(component, event, helper) {

    }
})