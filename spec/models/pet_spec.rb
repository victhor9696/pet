require 'rails_helper'

RSpec.describe Pet, type: :model do
  context "Validar pet" do
    it "Pet valido?" do
      pet = Pet.new(
        name: "toto",
        gender:  "masculino",
        breed_id: rand(1..20),
        castrated: "sim",
        born_at: Time.now.strftime("%Y-%m-%d 00:00"),
        client_name: "Tody",
        phone: "18 99604-1211",
        last_visit: Time.now.strftime("%Y-%m-%d 00:00")
      )

      expect(pet.valid?).to be_truthy
    end

    it "Pet invalido?" do
      pet = Pet.new(
        name: nil,
        gender:  "masculino",
        breed_id: rand(1..20),
        castrated: "sim",
        born_at: Time.now.strftime("%Y-%m-%d 00:00"),
        client_name: "Tody",
        phone: "18 99604-1211",
        last_visit: Time.now.strftime("%Y-%m-%d 00:00")
      )

      expect(pet.valid?).to be_falsey
    end

    it "detalhes Pet valido?" do
      pet = Pet.new(
        name: "toto",
        gender:  "masculino",
        breed_id: rand(1..20),
        castrated: "sim",
        born_at: Time.now.strftime("%Y-%m-%d 00:00"),
        client_name: "Tody",
        phone: "18 99604-1211",
        last_visit: Time.now.strftime("%Y-%m-%d 00:00")
      )

      expect(pet.valid?).to be_truthy
    end

    it "detalhes Pet invalido?" do
      pet = Pet.new(
        name: "toto",
        gender:  nil,
        breed_id: nil,
        castrated: nil,
        born_at: Time.now.strftime("%Y-%m-%d 00:00"),
        client_name: "Tody",
        phone: "18 99604-1211",
        last_visit: Time.now.strftime("%Y-%m-%d 00:00")
      )
      expect(pet.valid?).to be_falsey
    end

    it "dados cliente valido?" do
      pet = Pet.new(
        name: "toto",
        gender:  "masculino",
        breed_id: rand(1..20),
        castrated: "sim",
        born_at: Time.now.strftime("%Y-%m-%d 00:00"),
        client_name: "Tody",
        phone: "18 99604-1211",
        last_visit: Time.now.strftime("%Y-%m-%d 00:00")
      )
      expect(pet.valid?).to be_truthy
    end

    it "dados cliente invalido?" do
      pet = Pet.new(
        name: "toto",
        gender:  "masculino",
        breed_id: rand(1..20),
        castrated: "sim",
        born_at: Time.now.strftime("%Y-%m-%d 00:00"),
        client_name: nil,
        phone: nil,
        last_visit: Time.now.strftime("%Y-%m-%d 00:00")
      )
      expect(pet.valid?).to be_falsey
    end
  end
end
