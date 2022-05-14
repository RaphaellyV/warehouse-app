require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir do menu' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    #Assert
    expect(current_path).to eq suppliers_path
  end

  it 'com sucesso' do
    #Arrange
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12.345.678/001-22', 
                     full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
    Supplier.create!(corporate_name: 'Stark Industries', brand_name: 'Stark', registration_number: '91.234.567/001-22', 
                      full_address: 'Torre da Indústria, 1', city: 'Teresina', state: 'PI', email: 'iron@stark.com.br')
    #Act
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    
    #Assert
    expect(page).to have_content 'Fornecedores'
    expect(page).to have_content 'ACME'
    expect(page).to have_content 'Bauru - SP'
    expect(page).to have_content 'Stark'
    expect(page).to have_content 'Teresina - PI'
  end

  it 'e não existem fornecedores ' do
    #Arrange
    
    #Act
    visit root_path
    click_on 'Fornecedores'
    #Assert
    expect(page).to have_content 'Não existem fornecedores cadastrados.'
  end
end