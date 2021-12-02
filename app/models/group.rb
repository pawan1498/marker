class Group < ApplicationRecord
  has_many :links, dependent: :destroy
  validates :name ,  uniqueness: true

  def group_name()
    name = ["This Group is A+", "The Collective", "Life of Pi", "The Brain Cells", "The Circle", "Image Skeletons", "The Spin Doodles", "Dread Skin", " Geek Syndrome"]
    length = name.size
    return name[rand(0..(length - 1))]
  end
end
