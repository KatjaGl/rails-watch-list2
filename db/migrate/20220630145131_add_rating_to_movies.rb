class AddRatingToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :rating, :decimal, default: 0.0
  end
end
