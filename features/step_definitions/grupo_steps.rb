Dado("que estou logado no Whatsapp") do                                         
    visit 'http://web.whatsapp.com'
    @logado = find('.iHhHL')
    expect(@logado.text).to eql "Mantenha seu telefone conectado"
end                                                                             
                                                                                
Quando("crio um novo grupo") do                                                 
    find('._3auIg div[title="Menu"]').click
    sleep 0.5
    find('._3auIg div[title="Novo grupo"]').click
    
    # buscar usuário
    find('input._16RnB').set "Renata"
    page.find('._1vDUw._1lIXT .RLfQR').click

    find('div[class="_3hV1n"]').click
    # setar nome do grupo
    # find('._2AafV ._3F6QL.bsmJe').set "Grupo teste"
    # find('.ogWqZ._31WRs').set "Grupo teste"
    find('._2S1VP.copyable-text.selectable-text').set "Grupo teste" 
    sleep 0.1
    find('div[class="_3hV1n"]').click

    @grupoCriado = page.find('.f1UZe', text: 'Grupo criado')
    expect(@grupoCriado.text).to eql 'Grupo criado'

end                                                                             
                                                                                
Então("posso conversar com as pessoas incluídas nesse grupo") do
    sleep 0.5
    find('._2S1VP.copyable-text.selectable-text').set "mensagem para grupo...."
    sleep 0.1
    find('._35EW6').click
end

Quando("seleciono o grupo") do                                                  
    find('._3j7s9 span[title="Grupo teste"]').hover
    find('div[class=ZR5SB]').click
    sleep 0.5

    find('div[title="Sair do grupo"]').click
    find('._1WZqU.PNlAR').click
    sleep 0.5
    @saiu = page.find('.f1UZe', text: 'Saiu do grupo')
    expect(@saiu.text).to eql 'Saiu do grupo'
    sleep 0.5

end                                                                             
                                                                                
Quando("clico em excluir grupo") do                                             
    find('._3j7s9 span[title="Grupo teste"]').hover
    find('div[class=ZR5SB]').click
    sleep 0.5

    find('div[title="Apagar grupo"]').click
    find('._1WZqU.PNlAR').click
    sleep 0.5

end                                                                             
                                                                                
Então("o grupo é excluido com sucesso") do                                      
    @deletarGrupo = page.find('.f1UZe', text: 'Grupo apagado')
    expect(@deletarGrupo.text).to eql 'Grupo apagado'
end                                                                             
                                                                                