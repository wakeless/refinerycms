module Refinery
  module Pages
    module Admin
      module InstanceMethods

        def error_404(exception=nil)
          if (@page = ::Refinery::Page.where(:menu_match => "^/404$").includes(:parts, :slugs).first).present?
            params[:action] = 'error_404'
            # change any links in the copy to the refinery_admin_root_path
            # and any references to "home page" to "Dashboard"
            # TODO
=begin
            part_symbol = Refinery::Pages.config.default_parts.first.to_sym
            @page.content_for(part_symbol) = @page.content_for(part_symbol).to_s.gsub(
                                   /href=(\'|\")\/(\'|\")/, "href='#{refinery_admin_root_path}'"
                                 ).gsub("home page", "Dashboard")
=end

            render :template => "/pages/show",
                   :layout => layout?,
                   :status => 404
          else
            super
          end
        end

      end
    end
  end
end
