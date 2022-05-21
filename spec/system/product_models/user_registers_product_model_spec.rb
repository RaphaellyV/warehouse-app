require 'rails_helper'

describe 'Usuário cadastra um modelo de produto' do
  it 'com sucesso' do
    #Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletrônicos LTDA', registration_number: '12.345.678/0001-22', 
      full_address: 'Av. Nações Unidas, 1000', city: 'São Paulo', state: 'SP', email: 'sac@samsung.com.br')
    other_supplier = Supplier.create!(brand_name: 'LG', corporate_name: 'LG do Brasil LTDA', registration_number: '34.345.678/0001-22', 
      full_address: 'Av. Ibirapuera, 300', city: 'São Paulo', state: 'SP', email: 'sac@lg.com.br')

    #Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'SKU', with: 'TV40-SAMS-XPTO'
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: 90
    fill_in 'Profundidade', with: 10
    fill_in 'Peso', with: 10_000
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Modelo de Produto cadastrado com sucesso.'
    expect(page).to have_content 'TV 40 polegadas'
    expect(page).to have_content 'SKU: TV40-SAMS-XPTO'
    expect(page).to have_content 'Dimensões: 60cm x 90cm x 10cm'
    expect(page).to have_content 'Peso: 10000g'
    expect(page).to have_content 'Fornecedor: Samsung'
  end

  it 'deve preencher todos os campos' do
    #Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletrônicos LTDA', registration_number: '12.345.678/0001-22', 
      full_address: 'Av. Nações Unidas, 1000', city: 'São Paulo', state: 'SP', email: 'sac@samsung.com.br')

    #Act
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar Novo'
    fill_in 'Nome', with: ''
    fill_in 'SKU', with: ''
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Não foi possível cadastrar o modelo de produto.'
  end
end