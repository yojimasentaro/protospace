class PrototypeImage < ActiveRecord::Base
  belongs_to     :prototype
  enum role: %i(main sub)
  mount_uploader :content, PrototypeImageUploader
end
