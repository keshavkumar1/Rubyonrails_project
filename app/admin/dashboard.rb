ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

#section "Recent Posts" do
 # 
#end


 
  #content title: proc{ I18n.t("active_admin.dashboard") } do
  #  div class: "blank_slate_container", id: "dashboard_default_message" do
   #   span class: "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
     #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      #end
    #end

    content title: proc{ I18n.t("active_admin.dashboard") } do
      columns do
          column do
            panel "Recent Posts" do
              table_for Post.order("id desc").limit(15) do
                  column :id
                  column "Post Title",:title do |post|
                   link_to post.title,[:admin,post]
                  end
                  column "Author" ,:admin_user
                  column :category ,:sortable=>:category
                  column :created_at
              end
              strong{link_to "Show all Posts", :admin_posts}
            end
          end

          column do
            panel "All Categories" do
              table_for Category.order("id desc").limit(15) do
                  column :id
                  column "Category name",:name do |c|
                   link_to c.name,[:admin,c]
                  end
                  
                  column :created_at
              end
              strong{link_to "Show all Categories", :admin_categories}
            end
          end


        end
      end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  #end # content
end
