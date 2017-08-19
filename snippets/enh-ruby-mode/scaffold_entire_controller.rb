# -*- mode: snippet; require-final-newline: nil -*-
# name: scaffold_entire_controller
# key: scaffold_entire_controller
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
def index
  @`(plural-table-name)` = `(model-class-name)`.all
end

def show
end

def new
  @`(singular-table-name)` = `(model-class-name)`.new
end

def edit
end

def create
  @`(singular-table-name)` = `(model-class-name)`.new(`(singular-table-name)`_params)

  if @`(singular-table-name)`.save
    redirect_to @`(singular-table-name)`, notice: t('`(model-class-name)` was successfully destroyed.')
  else
    render :new
  end
end

def update
  if @`(singular-table-name)`.update(`(singular-table-name)`_params)
    redirect_to @`(singular-table-name)`, notice: t('`(model-class-name)` was successfully updated.')
  else
    render :edit
  end
end

def destroy
  @`(singular-table-name)`.destroy
  redirect_to `(plural-table-name)`_url, notice: t('`(model-class-name)` was successfully destroyed.')
end

private
def set_`(singular-table-name)`
  @`(singular-table-name)` = `(model-class-name)`.find(params[:${1:id}])
end

def `(singular-table-name)`_params
  params.require(:`(singular-table-name)`).permit($0)
end
