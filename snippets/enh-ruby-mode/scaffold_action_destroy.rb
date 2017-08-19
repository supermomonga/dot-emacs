# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_action_destroy
# key: scaffold_action_destroy
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
def destroy
  @`(singular-table-name)`.destroy
  redirect_to `(plural-table-name)`_url, notice: t('`(model-class-name)` was successfully destroyed.')
end
