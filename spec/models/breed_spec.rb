require 'rails_helper'

RSpec.describe Breed, type: :model do
  context "Validar raca" do
    it "raca valida?" do
      breed = Breed.new(
        name: "Westie"
      )
      expect(breed.valid?).to be_truthy
    end

    it "raca invalido?" do
      breed = Breed.new(
        name: nil
      )
      expect(breed.valid?).to be_falsey
    end

    it "raca repetida invalida?" do
      breed = Breed.create(
        name: 'Westie'
      )
      breed = Breed.new(
        name: 'Westie'
      )
      expect(breed.valid?).to be_falsey
    end

  end
end
