class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :prototype_images
  accepts_nested_attributes_for :prototype_images, alow_destroy: true, reject_if: :all_blank
  validates  :catch_copy, :concept, :title,  presence: true
end
