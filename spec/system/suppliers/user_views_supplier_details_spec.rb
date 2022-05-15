require 'rails_helper'

describe 'Usuário vê detalhes do fornecedor' do
  it 'a partir da tela inicial' do
    #Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12.345.678/0001-22', 
                     full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    #Assert
    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'Documento: 12.345.678/0001-22'
    expect(page).to have_content 'Endereço: Avenida das Palmas, 100 - Bauru - SP'
    expect(page).to have_content 'E-mail: contato@acme.com.br'
  end

  it 'e volta para a tela inicial' do
    #Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12.345.678/0001-22', 
                     full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'
    #Assert
    expect(current_path).to eq root_path
  end
end