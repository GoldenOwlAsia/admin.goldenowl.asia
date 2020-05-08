# == Schema Information
#
# Table name: career_forms
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  feedback   :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  portfolio  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe CareerForm, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
