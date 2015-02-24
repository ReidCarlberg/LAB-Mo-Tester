({
    deleteMoTesterOneRecords: function(component, event, helper) {
        console.log("entering deleteMoTesterOneRecords");
        var action;
        try {
            action = component.get("c.deleteAllMoTester1"); // static method on the apex class
        } catch (err) {
            console.log("error: " + err);
        }
        
        action.setCallback(this, function(a) {
            console.log("complete");
            console.log(a.getReturnValue());
        });
        
        $A.enqueueAction(action);
    }
})