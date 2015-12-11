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
end
