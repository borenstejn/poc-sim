class MyController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        # Rails 6
        # render template: "posts/index.html.erb",
        #        pdf: "Posts: #{@posts.count}"

        # Rails 7
        # https://github.com/mileszs/wicked_pdf/issues/1005
        render pdf: "Posts: ", # filename
               template: "my/print_pdf",
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end
end
