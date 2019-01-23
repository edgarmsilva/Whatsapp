# selecionar o usuário
# ('._1wjpf[title="Renata"]')

# nova conversa
# ('.rAUz7 #Layer_1')

# buscar contatos:
# ('.jN-F5[title="Buscar contatos"]')

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
    find('._3auIg div[title="Menu"]').click
    sleep 0.5
    find('._3auIg div[title="Sair"]').click
end

Quando("seleciono uma conversa já existente") do
    find('._3j7s9 span[title="Renata"]').click
end

Quando("enviei mensagem para uma pessoa") do
    find('._3j7s9 span[title="Renata"]').click
    find('._2S1VP.copyable-text.selectable-text').set "mensagem a ser apagada...."
    find('._35EW6').click
end

Quando("clico em apagar conversa") do
    find('._2DNgV._1i1U7._1UyGF span[data-icon="down-context"]').click
    find('._2DNgV._1i1U7._1UyGF ._3kN0h').hover
    find('div[title="Apagar mensagem"]').click
    page.find('div', text: 'Apagar para todos').click
    find('._1WZqU.PNlAR[role="button"]').click
end

Então("a mensagem é apagada do Whatsapp") do
    @deleted = page.find('div', text: 'Você apagou esta mensagem')
    expect(@deleted.text).to eql "Você apagou esta mensagem"
    sleep 20
end