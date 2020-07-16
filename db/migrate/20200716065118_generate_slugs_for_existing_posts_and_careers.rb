class GenerateSlugsForExistingPostsAndCareers < ActiveRecord::Migration[6.0]
  def change
    Post.find_each(&:save)
    Carere.find_each(&:save)
  end
end
