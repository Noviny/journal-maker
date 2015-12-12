# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  subheading  :string
#  status      :string
#  private     :boolean
#

class Book < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :shelves
end
