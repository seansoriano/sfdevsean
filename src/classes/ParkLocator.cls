public class ParkLocator {

    public static list<String> country(String country) {
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
        
        return parkService.byCountry(country);
    }
}