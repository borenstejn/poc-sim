class MyController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        # Rails 6:
        # render template: "posts/show.html.erb",
        #        pdf: "Post ID: #{@post.id}"

        # Rails 7:
        render pdf: [2, "@post.name"].join('-'),
               template: "posts/show.html.erb",
               formats: [:html],
               disposition: :inline,
               layout: 'pdf'
      end
    end
  end

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

  private

  def get_html
    ActionController::Base.new.render_to_string(
      template: 'v1/profile/reportes.html.erb',
      orientation: 'Landscape',
      page_size: 'Letter',
      background: true
    )
  end
end
