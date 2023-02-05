# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true
    validates :image_url, uniqueness: true
    validates :title, uniqueness: { scope: :artist_id,
        message: 'A single artist should not be able to have two pieces with that same title'}

    belongs_to :artist,
        foreign_key: :artist_id,
        primary_key: :id,
        class_name: 'User'
end
