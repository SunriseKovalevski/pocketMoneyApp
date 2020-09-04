({
    init : function(component, event, helper) {

        component.set('v.mycolumns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Value', fieldName: 'Value__c', type: 'text'},
          //  {label: 'Transaction Date', fieldName: 'TransactionDate__c', type: 'date'},
            {label: 'Transfer', fieldName: 'Transfer__c', type: 'boolean'}
           
        ]);

        

        helper.getTransactions(component);
    },
    myAction : function(component, event, helper) {

    }
})