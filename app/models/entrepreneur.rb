# == Schema Information
#
# Table name: entrepreneurs
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  mobile     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Entrepreneur < ApplicationRecord
end
