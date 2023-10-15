public class CaseTriggerHandler {
    CaseTriggerHandlerHelper helper = new CaseTriggerHandlerHelper();
    public void beforeInsert(List<Case> caseList){
        if(!caseList.isEmpty()){
            helper.updateCaseFields(caseList);
        }
    }
}