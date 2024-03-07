ActiveAdmin.register Student do

  actions :index, :edit, :update, :create, :destroy
  
  permit_params :name,:address,:phone_number,:email,:password_digest

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :phone_number
    column :email
   
    column :created_at 
    actions
  end

  filter :name
  filter :address
  filter :phone_number
  filter :email

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :phone_number
      f.input :email
      f.input :created_at
    
    end
    f.actions
  end
  
end
