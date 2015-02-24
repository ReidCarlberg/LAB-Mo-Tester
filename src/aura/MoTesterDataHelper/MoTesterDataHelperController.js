({
	showSpinner : function(component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : true });
        evt.fire();		
	},
    
	hideSpinner : function(component, event, helper) {
        var spinner = component.find('spinner');
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : false });
        evt.fire();		
	},
    
	showToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "I <3 Toast!",
            "message": "Toast fired! Toast fired!!"
        });
        toastEvent.fire();
    }    
})