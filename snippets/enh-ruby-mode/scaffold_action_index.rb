# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_action_index
# key: scaffold_action_index
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
def index
  @`(plural-table-name)` = `(model-class-name)`.all$0
end
