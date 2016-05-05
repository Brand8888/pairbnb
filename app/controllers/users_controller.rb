class UsersController < Clearance::UsersController

    private
    def user_from_params
      user_params = params[:user] || Hash.new

      email = user_params.delete(:email)
      password = user_params.delete(:password)
      first_name = user_params.delete(:first_name)
      last_name = user_params.delete(:last_name)
      gender = user_params.delete(:gender)
      birthday = [user_params.delete("birthday(1i)"),user_params.delete("birthday(2i)"),user_params.delete("birthday(3i)")].join(".")
      contact_number = user_params.delete(:contact_number)
      country = user_params.delete(:country)

      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.email = email
        user.password = password
        user.first_name = first_name
        user.last_name = last_name
        user.gender = gender
        user.birthday = birthday
        user.contact_number = contact_number
        user.country = country
      end
    end

    def permit_params
        params.require(:user).permit(:first_name, :last_name, :gender, "birthday(1i)","birthday(2i)","birthday(3i)", :contact_number, :country, :email, :password)
    end
end
