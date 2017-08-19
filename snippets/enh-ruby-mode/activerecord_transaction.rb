# -*- mode: snippet; require-final-newline: nil -*-
# name: activerecord_transaction
# key: activerecord_transaction
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
ActiveRecord::Base.transaction do
  $0
end
