# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_action_edit_update
# key: scaffold_action_edit_update
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
def edit
end

def update
  if @`(singular-table-name)`.update(`(singular-table-name)`_params)
    redirect_to @`(singular-table-name)`, notice: t('`(model-class-name)` was successfully updated.')
  else
    render :edit
  end
end
