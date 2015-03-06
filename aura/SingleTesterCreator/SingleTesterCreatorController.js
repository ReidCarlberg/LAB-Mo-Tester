({
    createSingleRecord: function(component, event, helper) {
        
        console.log("createSingleRecord");
        
        var action = component.get("c.getNewMoTester1Id"); // static method on the apex class
        
        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
        });
        
        $A.enqueueAction(action);
    }
})