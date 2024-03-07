ActiveAdmin.register Option do

  actions :index, :edit, :update, :new, :create, :destroy, :show

  permit_params :option_val ,:is_correct,:question_id
  
  
  index do
    selectable_column
    id_column
    column :option_val
    column :is_correct
    column :exam_id
    column :created_at 
    actions
  end

  filter :option_val
  filter :is_correct
  

  
  form do |f|
    f.inputs do
  
      f.input :option_val
      f.input :is_correct
      f.input :exam_id
      f.input :question_id, label: 'que', as: :select, collection: Question.all.collect{|c| [ c.que, c.id ] }, include_blank: 'select que category'
      end
    
      f.actions
  end
end
