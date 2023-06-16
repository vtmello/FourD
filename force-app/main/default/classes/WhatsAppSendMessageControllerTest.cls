@IsTest
public class WhatsAppSendMessageControllerTest {
    @IsTest
    static void testEnviarMensagemWhatsApp() {
        // Criação do objeto WhatsAppSendMessageController
        WhatsAppSendMessageController controller = new WhatsAppSendMessageController();
        controller.leadPhoneNumber = '1234567890'; // Número de telefone de teste

        Test.startTest();
        controller.enviarMensagemWhatsApp();
        Test.stopTest();

        // Verificar se a variável leadPhoneNumber foi limpa
        System.assertEquals('', controller.leadPhoneNumber);

        // Verificar se a mensagem de informação foi adicionada
        List<ApexPages.Message> messages = ApexPages.getMessages();
        System.assertEquals(1, messages.size());
        System.assertEquals(ApexPages.Severity.INFO, messages[0].getSeverity());
        System.assertEquals('A mensagem foi enviada via WhatsApp.', messages[0].getSummary());
    }
}
