class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email, :null => false
      t.string   :first_name
      t.string   :last_name
      t.date     :date_of_birth
      t.integer  :gender
      t.string   :image_path
      t.string   :video_path
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.integer  :hookup_with
      t.string   :facebook_id
      t.integer  :status, :default => Status::FRESH
      t.timestamps
    end
  end
end
