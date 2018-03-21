({

    populateText : function(component){
        var fullName = component.find("saltn").get("v.value")+component.find("fname").get("v.value")+component.find("lname").get("v.value");

		component.set("v.fullName",fullName);
    }
})