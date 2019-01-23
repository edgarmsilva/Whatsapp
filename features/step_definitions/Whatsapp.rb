Dado("que estou logado no Whatsapp Web") do
    visit 'https://web.whatsapp.com'
    @logado = find('.iHhHL')
    expect(@logado.text).to eql "Mantenha seu telefone conectado"

end
  
Quando("crio uma nova conversa") do
    find('div[title="Nova conversa"]').click
    find('.jN-F5[title="Buscar contatos"]').set "Renata"
    find('._1vDUw._2sNbV ._3j7s9').click
    # find('span[class="matched-text"]').click
    
end

Então("posso conversar com a pessoa") do
    # find('._1Plpp ._3F6QL._2WovP').set "teste, este texto foi enviado através da automação :D "
    find('._2S1VP.copyable-text.selectable-text').set "teste...."
    find('._35EW6').click
    # find('._3auIg div[title="Menu"]').click
    # sleep 0.5
    # find('._3auIg div[title="Sair"]').click
end

Quando("seleciono uma conversa já existente") do
    find('._3j7s9 span[title="Renata"]').click
end

Quando("enviei mensagem para uma pessoa") do
@text = "mensagem a ser apagada11...."

    find('._3j7s9 span[title="Renata"]').click
    find('._2S1VP.copyable-text.selectable-text').set @text
    find('._35EW6').click
end

Quando("clico em apagar conversa") do
  
    page.find('div[class=_9tCEa] span[dir=ltr]', text: @text).hover
    sleep 0.5
    find('div[class=_3kN0h]').click
    find('div[title="Apagar mensagem"]').click
    titles = page.all('div[class=_1S3yi]')
    titles[2].click
    find('._1WZqU.PNlAR').click
    sleep 0.5
end

Então("a mensagem é apagada do Whatsapp") do
    @deleted = page.find('.f1UZe', text: '1 mensagem apagada')
    expect(@deleted.text).to eql "1 mensagem apagada"
end

# $('._2DNgV._1i1U7._1UyGF')