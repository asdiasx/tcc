class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[destroy]

  def index
    @notifications = Notification.all
  end

  def destroy
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_url, notice: "Notification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
