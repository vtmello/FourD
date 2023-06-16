public class WhatsAppSendMessageController {
    public String leadPhoneNumber { get; set; }

    public void enviarMensagemWhatsApp() {
        String mensagem = 'Olá ' + leadPhoneNumber + ', tudo bem? Informamos que já estamos analisando seu cadastro para se tornar um de nossos clientes. Em breve retornaremos o contato.';
        String url = 'https://api.whatsapp.com/send?phone=' + leadPhoneNumber + '&text=' + EncodingUtil.urlEncode(mensagem, 'UTF-8');
        
        // Redirecionar o usuário para a URL do WhatsApp
        PageReference whatsappPage = new PageReference(url);
        whatsappPage.setRedirect(true);
        leadPhoneNumber = '';
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'A mensagem foi enviada via WhatsApp.'));
    }
}
