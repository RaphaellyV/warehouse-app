class Warehouse < ApplicationRecord
    validates :name, :code, :city, :description, :address, :zip_code, :area, presence: true
    validates :name, :code, uniqueness: true
    validates :zip_code, format: {with: /\A\d{5}-\d{3}\Z/}
end
