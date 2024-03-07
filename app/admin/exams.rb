ActiveAdmin.register Exam do
  actions :index, :edit, :update, :new,:create, :destroy ,:show
  permit_params :subject,:total_marks,:per_que_mark,:time_duration

  index do
    selectable_column
    id_column
    column :subject
    column :total_marks
    column :per_que_mark
    column :time_duration
   
    column :created_at 
    actions
  end

  filter :subject
  filter :total_marks
  filter :per_que_mark
  filter :time_duration
  
  show do
    attributes_table do
      row :subject
      row :total_marks
      row :per_que_mark
      row :time_duration
    end
  end

  
  form do |f|
    f.inputs do
      f.input :subject
      f.input :total_marks
      f.input :per_que_mark
      f.input :time_duration
    end
    f.actions
  end
end
