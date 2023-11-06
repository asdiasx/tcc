class StaticController < ApplicationController
  def about
    @paragraph1 = "This app is a concept for practicing Ruby on Rails development with containers."
    @paragraph2 = "Asynchronous processing has also been implemented using Sidekiq workers."

    respond_to do |format|
      format.html
      format.json
    end
  end
end
