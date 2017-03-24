class BoxAssigner
  attr_accessor :boxes, :users

  def initialize(box_list)
    @boxes = box_list
  end

  def assign(users)
    users.each.inject({}) do |assigned, user|
      assigned[user[:name]] = []
      @boxes.each do |box|
        assigned[user[:name]] << box if (user[:received_contents] & box[:contents]).empty?
      end
      assigned
    end
  end
end
