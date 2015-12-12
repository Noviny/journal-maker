# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  avatar          :text
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :books
  has_many :shelves
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :length => { :minimum => 2 }
end
