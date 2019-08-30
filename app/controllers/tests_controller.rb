class TestsController < ApplicationController
  def index
  end
  
  def create
    Test.create(test_params)
    render :index
  end

  private
  def test_params
    params.require(:test).permit(:image)
  end
end
