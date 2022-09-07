class ChangeDatatype < ActiveRecord::Migration[7.0]
  def change
    def change
      change_column :foods, :measurement_unit, :string
    end
  end
end
