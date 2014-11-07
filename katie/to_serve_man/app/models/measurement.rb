class Measurement < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def initialize(attributes)
  end
end
