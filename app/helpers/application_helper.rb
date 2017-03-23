module ApplicationHelper

  def ajust_age age
    if(age < 12)
      str_month = 'mes'
      if age > 1
        str_month = "meses"
      end
      return " #{age} "+str_month
    end

    age_year = (age / 12)
    str_year = "ano"
    if age_year > 1
      str_year = "anos"
    end
    return "#{age_year} "+str_year
  end

end
