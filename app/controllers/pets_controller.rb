class PetsController < ApplicationController
  def get_extra_params
    extra_params = {}
    if !params[:gender].nil?
       extra_params[:gender] = get_data_arr params[:gender]
    end
    if !params[:castrated].nil?
       extra_params[:castrated] = get_data_arr params[:castrated]
    end
    if !params[:breed_name].nil?
       extra_params[:breed_name] = get_data_arr params[:breed_name]
    end
    extra_params
  end

  def get_data_arr extra_params
    if !extra_params.nil?
      return extra_params.gsub("_"," ").split(",")
    end
    return []
  end

  def index
    query =  params[:query]
    query_return = query

    if params[:query].nil?
      query = "*"
      query_return = ""
    end

    page = 1
    extra_params = get_extra_params

    params[:page].nil? ? page = 1 : page = params[:page].to_i
    pets_data = Pet.search_default query,extra_params,page
    @pets = pets_data[:pet_search]
    @page = pets_data[:page]
    @aggs = pets_data[:aggs]

    @field = {
      query: query_return,
      gender: extra_params[:gender],
      castrated: extra_params[:castrated],
      breed_name: extra_params[:breed_name],
      limit: params[:limit],
      offset: params[:offset]
    }
  end

end
