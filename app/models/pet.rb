class Pet < ApplicationRecord
  scope :include_base, -> {
    joins(:breed).select("pets.*,breeds.name as breed_name")
  }

  def age
    (Time.now.year * 12 + Time.now.month) - (born_at.year * 12 + born_at.month)
  end

  validates :name, presence: true
  validates :gender, presence: true
  validates :breed_id, presence: true
  validates :castrated, presence: true
  validates :born_at, presence: true
  validates :client_name, presence: true
  validates :phone, presence: true
  validates :last_visit, presence: true

  searchkick
  belongs_to :breed
  enum gender: [ :masculino, :feminino ]
  enum castrated: { sim: true, nao: false }
  PER_PAGE = 15

  def self.name_facets
    {
      "breed_name" => "Raça",
      "gender" => "Genero",
      "castrated" => "Castrado",
    }
  end

  def search_data
    attributes.merge(
      name: self.name,
      breed_id: self.breed_id,
      breed_name: self.breed.name,
      gender: self.gender,
      castrated: self.castrated,
      born_at: self.born_at,
      client_name: self.client_name,
      phone: self.phone,
      last_visit: self.last_visit,
      created_at: self.created_at
    )
  end

  def self.search_default query, custom, page
    condition = {
      operator: "and",
      page: page,
      per_page: PER_PAGE,
      order: { created_at: :desc}
    }

    if !custom.nil?
      params = {}
      custom.each_with_index do |field,index|
        if(field[1].kind_of?(String))
          field[1] = [field[1]]
        end
        params[field[0].to_sym] = {:all => field[1]}
      end
      if(params.length > 0 )
        condition[:where] = params
      end
      condition[:aggs] = {
        :breed_name => {where: params} ,
        :castrated => {where: params},
        :gender => {where: params},
      }
    end

    pets = Pet.search(query,condition)
    pets_ids = pets.hits.map{|id| id["_id"]}
    pet_hash = {}
    pet_hash[:pet_search] =  Pet.include_base.where("pets.id in (:id)",id: pets_ids)
    pet_hash[:aggs] = pets.aggs
    pet_hash[:page] = pets
    return pet_hash
  end



end
