# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_action_new_create
# key: scaffold_action_new_create
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
def new
  @`(singular-table-name)` = `(model-class-name)`.new
end

def create
  @`(singular-table-name)` = `(model-class-name)`.new(`(singular-table-name)`_params)$0

  if @`(singular-table-name)`.save
    redirect_to @`(singular-table-name)`, notice: t('`(model-class-name)` was successfully destroyed.')
  else
    render :new
  end
end$0
