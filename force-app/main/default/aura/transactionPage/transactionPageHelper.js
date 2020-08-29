({
    getTransactions : function (component) {
        var action = component.get('c.getTransactions');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.transactionList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    helperMethod : function() {
        
    }
})
