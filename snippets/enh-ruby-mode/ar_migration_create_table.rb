# -*- mode: snippet; require-final-newline: nil -*-
# name: ar_migration_create_table
# key: migration_create_table
# --
def self.up
  create_table :${1:table_name} do |t|
    $0
    t.timestamps
  end
end
def self.down
  drop_table :$1
end
