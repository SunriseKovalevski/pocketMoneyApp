({
    init : function(component, event, helper) {

        var actions = 
            [{ label: 'Delete', name: 'delete' }];

        component.set('v.mycolumns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Value', fieldName: 'Value__c', type: 'text'},
          //  {label: 'Transaction Date', fieldName: 'TransactionDate__c', type: 'date'},
            {label: 'Transfer', fieldName: 'Transfer__c', type: 'boolean'},
            { type: 'action', typeAttributes: { rowActions: actions } }
           
        ]);

        helper.getTransactions(component);
    },


    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');

        switch (action.name) {
            case 'delete':
                helper.removeBook(component, row);
                break;
        }
    },

    myAction : function(component, event, helper) {

    }
})