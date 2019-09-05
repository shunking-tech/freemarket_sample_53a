# require_relative "../validators/user_validator.rb"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_with UserValidator,
  attributes: ["nickname",
               "email",
               "password",
               "first_name",
               "first_name_kana",
               "last_name",
               "last_name_kana",
               "birth_date",
               "phone_number",
               "city",
               "house_address",
               "building_name",
               "zipcode"]
end
