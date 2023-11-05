class HogeController < ApplicationController
  def root
    render json: {result: 'root'}
  end

  def hoge
    render json: {
      result: 'ok'
    }
  end

  def hoge_error
    render json: {
      result: 'ok'
    }, status: 500
  end
end
