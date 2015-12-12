# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  name       :text
#  book_id    :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chapter < ActiveRecord::Base
  belongs_to :book
  has_and_belongs_to_many :articles
end
