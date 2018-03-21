public class AnimalLocator {

    public static string getAnimalNamebyId(Integer num) {
        String animalName;
        
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+num);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {

            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animalDetails = (Map<String,Object>) results.get('animal');
            animalName = (String)animalDetails.get('name');
        }

        system.debug(animalName);
        return animalName;
        
    }
}