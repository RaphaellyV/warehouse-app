require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir da tela inicial' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar fornecedor'
    #Assert
    expect(page).to have_field('Nome fantasia')
    expect(page).to have_field('Razão social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('E-mail')
  end

  it 'com sucesso' do
    #Arrange
    
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar fornecedor'
    fill_in 'Nome fantasia', with: 'ACME'
    fill_in 'Razão social', with: 'ACME LTDA'
    fill_in 'CNPJ', with: '12.345.678/0001-22'
    fill_in 'Endereço', with: 'Avenida das Palmas, 100'
    fill_in 'Cidade', with: 'Bauru'
    fill_in 'Estado', with: 'SP'
    fill_in 'E-mail', with: 'contato@acme.com.br'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Fornecedor cadastrado com sucesso.'
    expect(page).to have_content 'ACME'
    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'Documento: 12.345.678/0001-22'
    expect(page).to have_content 'Endereço: Avenida das Palmas, 100 - Bauru - SP'
    expect(page).to have_content 'E-mail: contato@acme.com.br'
  end

  it 'com dados incompletos' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar fornecedor'
    fill_in 'Nome fantasia', with: ''
    fill_in 'Razão social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Enviar'
   
    #Assert
    expect(page).to have_content 'Fornecedor não cadastrado.'
    expect(page).to have_content 'Nome fantasia não pode ficar em branco'
    expect(page).to have_content 'Razão social não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
  end
end