class TestsController < ApplicationController
  def index
    @tests = Test.all
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
