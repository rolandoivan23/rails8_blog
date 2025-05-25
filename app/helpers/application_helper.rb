module ApplicationHelper
  def get_related_posts
    Post.related.joins(:hero_image_attachment).includes(:hero_image_attachment).last(3)
  end
end
