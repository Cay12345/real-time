ActiveAdmin.register User do
  permit_params :email, :username, :password, :password_confirmation

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.submit
  end
end
