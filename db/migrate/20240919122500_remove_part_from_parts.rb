class RemovePartFromParts < ActiveRecord::Migration[7.2]
  def change
    remove_reference :parts, :part, foreign_key: true
  end
end
