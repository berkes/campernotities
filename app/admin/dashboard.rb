ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "My Campings" do
          table do
            current_admin_user.campings.each do |camping|
              tr do
                td do
                  camping.name
                end
                td do
                  link_to "edit", edit_admin_camping_path(camping)
                end
              end
            end #each
          end #table
        end
      end

      column do
        panel "Info" do
          para "Welcome to ShareShire admin area"
          para "Here you can add, remove or edit your campings"
          para "A more solid access- and permission system is being made. But for now, all who can access these pages are trusted people. So please don't abuse that trust. Thanks."
          para "For questions: ber@webschuur.com. Feel free to ask anything; input on what can, should or might be improved is most welcome!"
        end
      end
    end
  end # content
end
