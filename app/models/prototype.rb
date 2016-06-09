class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :likes,            dependent: :destroy
  has_many   :prototype_images, dependent: :destroy
  has_one    :main, class_name: "PtototypeImage"
  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: :all_blank
  validates  :catch_copy, :concept, :title,  presence: true

  SUB_CONTENT_MAX = 2
  def set_sub_contents
    sub_contents = prototype_images.sub
    SUB_CONTENT_MAX.times { |i| sub_contents[i] ||= prototype_images.build(role: "sub") }
    sub_contents
  end

  def like_user(user)
   likes.find_by(user_id: user)
  end

end
