# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  description      :string
#  industry         :string
#  instrument       :string
#  project_name     :string
#  required_funding :integer
#  return           :float
#  years            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  entrepreneur_id  :integer
#
class Transaction < ApplicationRecord

  def entrepreneur
    id = self.id
    matching_entrepreneur = Entrepreneur.where({ :entrepreneur_id => id })
    the_entrepreneur = matching_entrepreneur.at(0)
    return the_entrepreneur
  end

end
