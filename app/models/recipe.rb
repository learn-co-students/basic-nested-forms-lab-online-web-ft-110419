class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients, reject_if: proc {|attr| attr['name'].blank?}
end
