@IsTest
private class LeadTriggerHandlerTest {
    @IsTest
    static void testValidPostalCode() {
        Lead lead = new Lead();
        lead.FirstName = 'John';
        lead.LastName = 'Doe';
        lead.PostalCode = '12345-678';
        lead.Company = 'Other';

        Test.startTest();
        insert lead;
        Test.stopTest();

        // Verificar se o CEP foi formatado corretamente
        System.assertEquals('12345-678', lead.PostalCode);
    }

    @IsTest
    static void testInvalidPostalCode() {
        Lead lead = new Lead();
        lead.FirstName = 'John';
        lead.LastName = 'Doe';
        lead.PostalCode = 'ABC123';
        lead.Company = 'Other';

        Test.startTest();
        try {
            insert lead;
            System.assert(false, 'A inserção do lead com CEP inválido deveria ter falhado.');
        } catch (DmlException e) {
            // Verificar se o erro esperado foi lançado
            System.assert(e.getMessage().contains('CEP inválido.'));
        }
        Test.stopTest();
    }
}
