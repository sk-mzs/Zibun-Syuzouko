class StaticPagesController < ApplicationController
  def top

		random_post_id = Post.pluck(:id).sample
		@random_post = Post.find_by(id: random_post_id)

  end
end
