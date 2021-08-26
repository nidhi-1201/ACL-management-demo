class CreateJoinTablePermissionRole < ActiveRecord::Migration[6.1]
  def change
    create_join_table :permissions, :roles do |t|
      t.index [:permission_id, :role_id]
      t.index [:role_id, :permission_id]
    end
  end
end
