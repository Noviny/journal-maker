# == Schema Information
#
# Table name: shelves
#
#  id         :integer          not null, primary key
#  name       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shelf < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :books
end
