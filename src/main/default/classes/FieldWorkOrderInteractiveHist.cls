public with sharing class FieldWorkOrderInteractiveHist {
	
	
	public final WorkOrder theFWO {get;set;}
	public Id thecaseid;
     
	/**
	 * Constructor
	 */
    public FieldWorkOrderInteractiveHist(ApexPages.StandardController controller) {
        try { theFWO = (WorkOrder)controller.getRecord(); 
              thecaseid = theFWO.caseid;
        
        }
        catch (Exception e) {}
    }
    
	/**
	 * Read and return the case interaction history
	 */
	public List<CustomCaseLogic.CaseInteractionHistory> historyList {
		get {
			if (historyList == null) {
				if (theFWO == null || thecaseid == null) { return null; }
				try { 
					historyList = CustomCaseLogic.GetCaseInteractionHistory(thecaseid);
					for (CustomCaseLogic.CaseInteractionHistory record : historyList) {
						record.details = record.details.replace('\n', '<br/>');
					} 
				}
				catch (Exception e) {}
			}
			return historyList;
		}
		private set;
	}
}