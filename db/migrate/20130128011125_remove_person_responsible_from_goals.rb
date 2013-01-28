class RemovePersonResponsibleFromGoals < ActiveRecord::Migration
  def up
    remove_column :goals, :person_responsible
  end

  def down
    add_column :goals, :person_responsible, :string
  end
end
