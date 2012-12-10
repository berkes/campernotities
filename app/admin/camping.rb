ActiveAdmin.register Camping do

  form do |f|
    f.inputs "Camping" do
      f.input :name
      f.input :image
      f.input :description
    end

    f.actions
  end

  controller do
    def create
      @camping = Camping.new(params[:camping])
      @camping.author = current_admin_user
      create!
    end
  end

  show do |camping|
    attributes_table do
      row :name
      row :description
      row :image do
        image_tag(camping.image.url)
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
