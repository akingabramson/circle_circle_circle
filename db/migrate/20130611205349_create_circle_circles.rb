class CreateCircleCircles < ActiveRecord::Migration
  def change
    create_table :circle_circles do |t|
      t.string :name

      t.timestamps
    end
  end
end
