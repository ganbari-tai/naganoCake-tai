class Admin::HomesController < ApplicationController
  before_action :authenticate_admin! #管理者以外に触らせたくないページに記述いて
  def top
  end
end
