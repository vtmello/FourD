public class BloqueiaIntegracaoController {

    public static void BloqueiaIntegracao(List<Opportunity> oppLst) {
        Set<Id> opportunityIds = new Set<Id>();
        for (Opportunity opp : oppLst) {
            opportunityIds.add(opp.Id);
        }

        List<OpportunityContactRole> oppContacts = [
            SELECT Id, Contact.Email, Contact.FirstName, Contact.LastName
            FROM OpportunityContactRole
            WHERE OpportunityId IN :opportunityIds AND Role = 'Responsável Financeiro'
        ];

        Set<Id> oppIdsWithRole = new Set<Id>();
        for (OpportunityContactRole oppContact : oppContacts) {
            oppIdsWithRole.add(oppContact.OpportunityId);
        }

        for (Opportunity opp : oppLst) {
            if (!oppIdsWithRole.contains(opp.Id)) {
                opp.addError('É necessário ter o papel financeiro alinhado na oportunidade.');
            }
        }
    }
}