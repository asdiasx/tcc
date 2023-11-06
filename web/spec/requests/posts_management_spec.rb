require "rails_helper"

RSpec.describe "Post Management" do
  it "creates a post" do
    post "/posts", params: {
      post: {
        title: "What a great post",
        body: "Some very cool post is here, just come and read it!"
      }
    }
    expect(response).to redirect_to(post_url(Post.last.id))
  end

  it "returns a post" do
    Post.create! title: "Beautiful post", body: "Some knowledge about something"
    get "/posts/1", headers: { "Accept" => "application/json" }
    json = JSON.parse(response.body)

    expect(json["title"]).to eq "Beautiful post"
    expect(json["body"]).to eq "Some knowledge about something"
  end
end
