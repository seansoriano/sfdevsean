@isTest
private class AnimalLocatorTest {
    
    @isTest static void testAnimalLocator() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String animalName = AnimalLocator.getAnimalNamebyId(1);
        system.assertEquals(animalName, 'bear');
    }
}