class HookUp < ActiveRecord::Migration
  def change
    create_table :hook_ups do |t|
      t.integer  :hooker, :null => false
      t.integer  :hookie, :null => false
      t.date     :pinged_at
      t.date     :responded_at
      t.boolean  :hooked
      t.timestamps
    end
  end
end
