({
    answer : function(component, event, helper) {
        var phone = event.getParam("phone");
        component.set("v.number", phone);
    }
})