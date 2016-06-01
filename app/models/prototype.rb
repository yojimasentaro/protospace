class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :prototype_images, dependent: :destroy
  has_one    :main, class_name: "PtototypeImage"
  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: :all_blank
  validates  :catch_copy, :concept, :title,  presence: true
end
