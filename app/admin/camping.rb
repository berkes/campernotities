ActiveAdmin.register Camping do
  form :html => { :multipart => true } do |f|
    f.semantic_errors :images

    f.inputs "Information" do
      f.input :name
      f.input :description
    end

    f.inputs "Images" do
      f.has_many :images do |img|
        img.input :image, :as => :file, :label => "Image", :hint => img.object.image.nil? ? img.template.content_tag(:span, "No Image Yet") : img.template.image_tag(img.object.image.url(:thumb))
      end
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
        render :partial => "images/thumb", :collection => camping.images
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
