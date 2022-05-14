require 'rails_helper'

describe 'Usuário deleta remove um galpão' do
  it 'com sucesso' do
    #Arrange
    w = Warehouse.create!(name:'Cuiaba', code: 'CGB', area: 10000, zip_code: '56000-000', 
                          city: 'Cuiabá', address: 'Avenida dos Jacarés, 1000', description: 'Galpão no centro do país.')
    #Act
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso.'
    expect(page).not_to have_content 'Cuiaba'
    expect(page).not_to have_content 'CGB'
  end

  it 'e não apaga outros galpões' do
    #Arrange
    first_warehouse = Warehouse.create!(name:'Cuiaba', code: 'CGB', area: 10000, zip_code: '56000-000', 
                                        city: 'Cuiabá', address: 'Avenida dos Jacarés, 1000', description: 'Galpão no centro do país.')
    first_warehouse = Warehouse.create!(name:'Belo Horizonte', code: 'BHZ', area: 20000, zip_code: '46000-000', 
                                        city: 'Belo Horizonte', address: 'Avenida Tiradentes, 20', description: 'Galpão para cargas mineiras.')
    #Act
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso.'
    expect(page).to have_content 'Belo Horizonte'
    expect(page).not_to have_content 'Cuiaba'
  end
end