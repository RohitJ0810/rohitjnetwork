global class AccountBatchScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        AccountBatchClass batch = new AccountBatchClass();
        Database.executeBatch(batch);
    }
}