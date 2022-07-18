
@agenda = [
    {name: "Diego", cellphone: "11111111111"},
    {name: "Teste", cellphone: "22222222222"}
]

def allContacts
    @agenda.each do |contact|
        puts "#{contact[:name]} - #{contact[:cellphone]}"
    end
    puts "----------------------"
end

def addContacts
    print "Nome: "
    name = gets.chomp
    print "Telefone: "
    cellphone = gets.chomp

    @agenda << {name: name, cellphone: cellphone}

    puts "Adicionado com sucesso"

end

def seeContacts
    print "Qual contato voce deseja?"
    name = gets.chomp

    @agenda.each do |contact|
        if contact[:name].downcase.include?(name.downcase)
            puts "#{contact[:name]} - #{contact[:cellphone]}"            
        end
        puts "----------------------"
    end
end

def editContact
    print "Qual contato deseja editar?: "
    name = gets.chomp
    
    @agenda.each do |contact|
        if contact[:name].downcase == (name.downcase)
            print "Nome para editar (se quiser manter, aperte enter.): "
            nome_salvo = contact[:name]

            contact[:name] = gets.chomp
            contact[:name] = contact[:name].empty? ? nome_salvo : contact[:name]

            print "Telefone para editar (se quiser manter, aperte enter.): "
            telefone_salvo = contact[:name]

            contact[:cellphone] = gets.chomp
            contact[:cellphone] = contact[:cellphone].empty? ? telefone_salvo : contact[:cellphone]
        end
    end
end

def removeContact
    print "Qaul contato deseja remover?: "
    name = gets.chomp

    @agenda.each do |contact|
        if contact[:name].downcase == (name.downcase)
            indice = @agenda.index(contact)

            @agenda.delete_at(indice)
            break
        end
    end
end 


loop do

puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato
        \n4. Editar Contato\n5.Remover Contato\n0. Sair"
    cod = gets.chomp.to_i

    case 
    when cod == 0
        puts "Até mais"
        break
    when cod == 1
        allContacts
    when cod == 2
        addContacts
    when cod == 3
        seeContacts
    when cod == 4
        editContact
    when cod == 5
        removeContact
    else
        puts "Função não existe. Digite novamente!"
    end


end
