ActiveAdmin.register Camping do
  form :partial => "form"

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

  member_action :destroy_image, :method => :delete do
    camping = Camping.find(params[:id])
    camping.image.destroy
    redirect_to({:action => :show}, :notice => "Image deleted")
  end
end
