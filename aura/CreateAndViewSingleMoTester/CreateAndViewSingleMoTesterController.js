({
    createAndViewSingleRecord: function(component, event, helper) {
        
        console.log("createSingleRecord");
        
        var action = component.get("c.getNewMoTester1Id"); // static method on the apex class
        
        action.setCallback(this, function(a) {
            console.log(a.getReturnValue());
            //do the event
            var navEvt = $A.get("e.force:navigateToSObject");
            navEvt.setParams({
              "recordId": a.getReturnValue(),
              "slideDevName": "detail"
            });
            navEvt.fire();            
            
        });
        
        $A.enqueueAction(action);
    }
})