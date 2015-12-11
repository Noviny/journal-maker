# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :articles
end
