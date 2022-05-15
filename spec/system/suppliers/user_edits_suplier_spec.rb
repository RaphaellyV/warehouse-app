require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da página de detalhes' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12.345.678/0001-22', 
                                full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    #Assert
    expect(page).to have_content 'Editar Fornecedor'
    expect(page).to have_field('Nome fantasia', with: 'ACME')
    expect(page).to have_field('Razão social', with: 'ACME LTDA')
    expect(page).to have_field('CNPJ', with: '12.345.678/0001-22')
    expect(page).to have_field('Endereço', with:'Avenida das Palmas, 100')
    expect(page).to have_field('Cidade', with: 'Bauru')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('E-mail', with: 'contato@acme.com.br')
  end

  it 'com sucesso' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12.345.678/0001-22', 
                                full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Nome fantasia', with:'ACME & Co'
    fill_in 'Cidade', with:'São José dos Campos'
    fill_in 'Endereço', with:'Avenida dos Navegantes, 500'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Fornecedor atualizado com sucesso.'
    expect(page).to have_content 'ACME & Co'
    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'Documento: 12.345.678/0001-22'
    expect(page).to have_content 'Endereço: Avenida dos Navegantes, 500 - São José dos Campos - SP'
    expect(page).to have_content 'E-mail: contato@acme.com.br'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    upplier = Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME', registration_number: '12.345.678/0001-22', 
                               full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'
    fill_in 'Nome fantasia', with:''
    fill_in 'Cidade', with:''
    fill_in 'Endereço', with:''
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Não foi possível atualizar o fornecedor.'
  end
end