public class ApexQueueable implements Queueable{
    
    public void execute(QueueableContext context) {
        Account a = new Account(Name='acme');
        insert a;

        // Chain this job to next job by submitting the next job
        System.enqueueJob(new ApexQueueable2(a));
    }

}