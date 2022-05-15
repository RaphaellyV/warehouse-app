require 'rails_helper'

RSpec.describe Supplier, type: :model do
  context 'presence' do
    it 'false when corporate_name is empty' do
      #Arrange
      supplier = Supplier.new(corporate_name: '', brand_name: 'ACME', registration_number: '12.345.678/0001-22', 
        full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
      #Act
      result = supplier.valid?
      #Assert
      expect(result).to eq false
    end

    it 'false when brand name is empty' do
      #Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA', brand_name: '', registration_number: '12.345.678/0001-22', 
        full_address: 'Avenida das Palmas, 100', city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
      #Act
      result = supplier.valid?
      #Assert
      expect(result).to eq false
    end
  end
end
