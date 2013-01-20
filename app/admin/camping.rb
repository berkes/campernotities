ActiveAdmin.register Camping do
  form :html => { :multipart => true } do |f|
    f.inputs "Information" do
      f.input :name
      f.input :description
    end

    f.inputs "Images" do
      f.has_many :images do |img|
        img.input :image, :as => :file, :label => "Image", :hint => img.object.image.nil? ? img.template.content_tag(:span, "No Image Yet") : img.template.image_tag(img.object.image.url(:thumb))
        img.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
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

  member_action :destroy_image, :method => :delete do
    camping = Camping.find(params[:id])
    camping.image = nil
    camping.save!
    redirect_to({:action => :show}, :notice => "Image deleted")
  end
end
