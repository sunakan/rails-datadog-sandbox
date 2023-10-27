class HogeController < ApplicationController
  def root
    render json: {result: 'root'}
  end

  def hoge
    render json: {
      result: 'ok'
    }
  end
end
