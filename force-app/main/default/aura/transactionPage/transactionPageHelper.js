({
    getTransactions : function (component) {
        var action1 = component.get('c.getUser');
        action1.setCallback(this, function(response) {
            var state1 = response.getState();
            if (state1 === "SUCCESS") {
                component.set('v.user', response.getReturnValue());
                
            }
        })
        $A.enqueueAction(action1);
        
        var action = component.get('c.getTransactions');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.mydata', response.getReturnValue());
                console.log('HI hello => ' + component.get('v.mydata'));
            }
        });
        $A.enqueueAction(action);

        var action2 = component.get('c.getId');
        action2.setCallback(this, function(response) {
            var state2 = response.getState();
            if (state2 === "SUCCESS") {
                component.set('v.uID', response.getReturnValue());
                console.log('hi hello2 => ' + component.get('v.uID'));
            }
        });
        $A.enqueueAction(action2);
        
    },
    helperMethod : function() {
        
    }
})