# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string
#  topic       :string
#  style       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  domain      :string
#

class Source < ActiveRecord::Base
  has_many :articles
  accepts_nested_attributes_for :articles
end
