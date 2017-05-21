class Product < ApplicationRecord
  belongs_to :user

  has_many :items
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

  before_create :set_code
  
  def generate_code(size = 6)
    charset = %w{ 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

  def set_code
    self.code = generate_code(6)
  end
end
