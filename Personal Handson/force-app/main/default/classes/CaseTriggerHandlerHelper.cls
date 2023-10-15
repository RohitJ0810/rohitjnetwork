public class CaseTriggerHandlerHelper {
    public void updateCaseFields(List<Case> caseList){
        for(Case c : caseList){
            if(c.Origin == 'Email'){
                c.Status = 'New';
                c.Priority = 'High';
            }
        }
    }
}