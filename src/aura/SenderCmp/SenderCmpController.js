({
    send : function(component, event, helper) {
        var text = event.source.get("v.label");
        $A.get("e.c:SenderEvt").setParams({
            text: text
       }).fire();
    }
})