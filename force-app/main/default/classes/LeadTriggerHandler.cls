public class LeadTriggerHandler {
    public static void onBeforeInsert(List<Lead> newLeads) {
        validatePostalCode(newLeads);
    }

    public static void onBeforeUpdate(Map<Id, Lead> oldLeadsMap, List<Lead> updatedLeads) {
        validatePostalCode(updatedLeads);
    }

    private static void validatePostalCode(List<Lead> leads) {
        for (Lead lead : leads) {
            if (lead.PostalCode != null) {
                String formattedPostalCode = formatPostalCode(lead.PostalCode);
                if (formattedPostalCode == null) {
                    lead.addError('CEP inválido. O formato correto é XXXXX-XXX ou apenas números.');
                } else {
                    lead.PostalCode = formattedPostalCode;
                }
            }
        }
    }

    private static String formatPostalCode(String postalCode) {
        if (postalCode == null) {
            return null;
        }

        postalCode = postalCode.replaceAll('[^0-9]', '');
        if (postalCode.length() == 8) {
            return postalCode.substring(0, 5) + '-' + postalCode.substring(5);
        }
        
        return null;
    }
}
