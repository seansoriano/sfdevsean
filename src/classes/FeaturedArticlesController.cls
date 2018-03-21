public class FeaturedArticlesController {

   @AuraEnabled
   public static List<LightningSean__Product_Information__kav> getFeaturedArticles() {
       return [SELECT Id,Title
               FROM LightningSean__Product_Information__kav 
               WHERE PublishStatus = 'Online' 
               AND Language = 'en_US' WITH DATA CATEGORY Document_Type__c BELOW Product__c];
   }    

}