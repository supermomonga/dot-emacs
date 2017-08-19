# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_set_model
# key: scaffold_set_model
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
before_action :set_`(singular-table-name)`, only: [:show, :edit, :update, :destroy]

def set_`(singular-table-name)`
  @`(singular-table-name)` = `(model-class-name)`.find(params[:${1:id}])$0
end
