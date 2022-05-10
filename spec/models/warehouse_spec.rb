require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when name is empty' do
        #Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                  area: 1000, description: 'Alguma descrição.')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
      
      it 'false when code is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio', code: '', address: 'Endereço', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                  area: 1000, description: 'Alguma descrição.')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: '', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                  area: 1000, description: 'Alguma descrição.')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when zip_code is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '', city: 'Rio de Janeiro', 
                                  area: 1000, description: 'Alguma descrição.')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when city is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '25000-000', city: '', 
                                  area: 1000, description: 'Alguma descrição.')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when area is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                  area: '', description: 'Alguma descrição.')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when description is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                  area: 1000, description: '')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
    end

    it 'false when code is already in use' do
      #Arrange
      first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                      area: 1000, description: 'Alguma descrição.')
      
      second_warehouse = Warehouse.create(name: 'Niterói', code: 'RIO', address: 'Outro Endereço', zip_code: '23000-000', city: 'Niterói', 
                                       area: 2000, description: 'Outra descrição.')                                

      #Act

      #Assert
      expect(second_warehouse.valid?).to eq false
    end
    
    it 'false when name is already in use' do
      #Arrange
      first_warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '25000-000', city: 'Rio de Janeiro', 
                                      area: 1000, description: 'Alguma descrição.')
      
      second_warehouse = Warehouse.create(name: 'Rio', code: 'NTR', address: 'Outro Endereço', zip_code: '23000-000', city: 'Niterói', 
                                       area: 2000, description: 'Outra descrição.')                                

      #Act

      #Assert
      expect(second_warehouse.valid?).to eq false
    end

    it 'false when zip code is not valid' do
      #Arrange
      warehouse = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço', zip_code: '25000000', city: 'Rio de Janeiro', 
                                      area: 1000, description: 'Alguma descrição.')
      
      #Act
        
      #Assert
      expect(warehouse.valid?).to eq false
    end
  end
end
