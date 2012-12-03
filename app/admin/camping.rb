ActiveAdmin.register Camping do

  form do |f|
    f.inputs "Camping" do
      f.input :name
      f.input :description
    end

    f.buttons
  end

  controller do
    def create
      @camping = Camping.new(params[:camping])
      @camping.author = current_admin_user
      create!
    end
  end
end
