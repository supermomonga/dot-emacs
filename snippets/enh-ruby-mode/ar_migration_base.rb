# -*- mode: snippet; require-final-newline: nil -*-
# name: ar_migration_base
# key: migration_base
# --
class ${1:MigrationName} < ActiveRecord::Migration
  $0
end
