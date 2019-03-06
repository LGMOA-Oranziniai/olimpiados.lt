class MigrationSponsors < ActiveRecord::Base
  self.table_name = :sponsors
end

class AddPositionToSponsor < ActiveRecord::Migration[5.2]
  def change
    add_column :sponsors, :position, :integer, :default => 1

    reversible do |dir|
      dir.up do
        MigrationSponsors.update_all("position=id")
      end

      dir.down do
      end
    end
  end
end
