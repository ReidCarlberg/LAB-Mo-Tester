({
    navHome : function (apiName) {
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        homeEvent.setParams({
            "scope": apiName
        });
        homeEvent.fire();
    }
})