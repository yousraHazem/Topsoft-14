class AddColumnGaurdianEmailToChild < ActiveRecord::Migration
  def change
    add_column :children , :guardian_email, :string
  end
end
