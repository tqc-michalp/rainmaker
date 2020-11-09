class UsersController < ApplicationController

  def index
    respond_to do |format|
      format.html {    @users = User.all }
      format.xls do
        send_data User.export_as(type: :xls),
                  filename: "#{Time.current.strftime(ENV.fetch('FILE_TIMESTAMP_NOTATION') { '%m-%d-%Y_%H%M' })}.xls",
                  type: :xls
      end
    end
  end
end
