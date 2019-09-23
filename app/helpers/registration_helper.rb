module RegistrationHelper

  def has_error(errors)
    errors.present? ? "has-error" : ""
  end

  def years
    years = []
    (Time.current.year-119..Time.current.year).reverse_each do |year|
      years << year
    end
    years
  end

  def months
    (1..12).map do |month|
      month
    end
  end
end
