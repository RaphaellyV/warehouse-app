require 'rails_helper'

describe 'Usuário visita tela inicial' do
    it 'e vê o nome da app' do
        #Arrange

        #Act
        visit(root_path)

        #Assert
        expect(page).to have_content('Galpões & Estoque')
    end

    it 'e vê os galpões cadastrados' do
        #Arrange
        #Cadastrar 2 galpões: Rio e Maceió
        Warehouse.create(name:'Rio', code:'SDU', city:'Rio de Janeiro', area:60_000, address:'Avenida do Porto, 1000', 
                         zip_code:'20000-100', description:'Galpão do Rio.')
        Warehouse.create(name:'Maceió', code:'MCZ', city:'Maceió', area:50_000, address:'Avenida Atlântica, 50', 
            zip_code:'18000-100', description:'Perto do aeroporto.')

        #Act
        visit(root_path)

        #Assert
        #Garantir que eu veja na tela os galpões Rio e Maceió
        expect(page).not_to have_content('Não existem galpões cadastrados.')
        expect(page).to have_content('Rio')
        expect(page).to have_content('Código: SDU')
        expect(page).to have_content('Cidade: Rio de Janeiro')
        expect(page).to have_content('60000 m²')

        expect(page).to have_content('Maceió')
        expect(page).to have_content('Código: MCZ')
        expect(page).to have_content('Cidade: Maceió')
        expect(page).to have_content('50000 m²')
    end

    it 'e não existem galpões cadastrados' do
        #Arrange

        #Act
        visit(root_path)

        #Assert
        expect(page).to have_content('Não existem galpões cadastrados.')
    end
end