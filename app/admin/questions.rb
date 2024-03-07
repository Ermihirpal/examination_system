ActiveAdmin.register Question do

  actions :index, :edit, :update, :new, :create, :destroy, :show

  permit_params :que ,:exam_id, options_attributes:[:id, :option_val, :is_correct, :_destroy]
  
  
  index do
    selectable_column
    id_column
    column :que
    column :exam_id
    column :created_at 
    actions
  end

  filter :que
  
  

  show do 
    attributes_table do
      row :que
    
     row 'Options' do |question|
      question.options.any? ?question.options.map { |option| "&bull; #{option.option_val}" }.join('<br>').html_safe : content_tag(:span, 'N.A.')
     end
    end
  end


  form do |f|
    f.inputs do
      
      f.input :que
      f.input :exam_id, label: 'subject', as: :select, collection: Exam.all.collect{|c| [ c.subject, c.id ] }, include_blank: 'select exam category'
      end

      inputs "Options" do
        has_many :options, allow_destroy: true do |c|
          c.input :option_val, :label => "option"
          c.input :is_correct, :label => "Correct?", :as => :boolean 
      end
    end
    f.actions
  end
  
end
