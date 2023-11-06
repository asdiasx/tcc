require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        message: "Message"
      ),
      Notification.create!(
        message: "Message"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Message".to_s), count: 2
  end
end
