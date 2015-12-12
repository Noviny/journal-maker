# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  heading     :string
#  url         :string
#  description :text
#  image       :string
#  excerpt     :text
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ActiveRecord::Base
  has_and_belongs_to_many :books
  belongs_to :author
  belongs_to :source
end
