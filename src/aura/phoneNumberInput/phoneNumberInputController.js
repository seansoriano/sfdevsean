({
    send : function(component, event, helper) {
        var phone = event.source.get("v.value");
        $A.get("e.c:PhoneNumberEvent").setParams({
            phone: phone
       }).fire();
    },
  
    showSpinner : function (component, event, helper) {
        var spinner = component.find("spinner");
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : true });
        evt.fire();    
    },
     hideSpinner : function (component, event, helper) {
        var spinner = component.find("spinner");
        var evt = spinner.get("e.toggle");
        evt.setParams({ isVisible : false });
        evt.fire();    
    }
})