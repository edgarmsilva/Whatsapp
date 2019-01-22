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
    find('._1wjpf[title="Renata"]').click
end

Então("posso conversar com a pessoa") do
    find('._39LWd').set "teste, este texto foi enviado através da automaão :D "
    find('._35EW6').click
end


# Quando("seleciono uma conversa já existente") do
#     find('._1wjpf[title="Renata"]').click
# end
