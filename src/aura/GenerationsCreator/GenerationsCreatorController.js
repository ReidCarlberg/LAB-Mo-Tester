({
    insertGenerations: function(component, event, helper) {
        var action = component.get("c.insert3MT1WithChildrenAndGrandChildren"); // name on the apex class
        
        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
        });
        
        $A.enqueueAction(action);
    }})