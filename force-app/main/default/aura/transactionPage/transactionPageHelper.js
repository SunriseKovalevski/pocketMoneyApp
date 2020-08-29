({
    getTransactions : function (component) {
        var action1 = component.get('c.getUser');
        action1.setCallback(this, function(response) {
            var state1 = response.getState();
            if (state1 === "SUCCESS") {
                component.set("v.user", response.getReturnValue());
            }
        })
        $A.enqueueAction(action1);
        
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
