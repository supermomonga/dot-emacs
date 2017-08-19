# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_model_params
# key: scaffold_model_params
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
def `(singular-table-name)`_params
  params.require(:`(singular-table-name)`).permit($0)
end
