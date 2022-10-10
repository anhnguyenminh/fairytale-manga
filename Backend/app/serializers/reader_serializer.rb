class ReaderSerializer < ActiveModel::Serializer
  attributes :email, :name, :age, :phonenumber, :ban, :score,:gender, :show_gender

  def show_gender
    if object.gender == false
      return "male"
    else
      return "female"
    end
  end
end
