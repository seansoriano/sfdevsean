({
   //Fetch the accounts from the Apex controller
  getArticleList: function(component) {
    var action = component.get("c.getFeaturedArticles");

    //Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
        component.set("v.articles", actionResult.getReturnValue());            
    });
    $A.enqueueAction(action);
  }   
})