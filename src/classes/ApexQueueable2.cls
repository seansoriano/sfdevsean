public class ApexQueueable2 implements Queueable{
    public Account acc = new Account();
    
    public ApexQueueable2(Account acc) {
        this.acc = acc;
    }
    
    public void execute(QueueableContext context) {
        acc.Name = 'acme2';
        update acc;

        // Chain this job to next job by submitting the next job
        //System.enqueueJob(new SecondJob());
    }

}