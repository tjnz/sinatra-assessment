require_relative "spec_helper"
require_relative "../sinatra_assessment.rb"

def app
  SinatraAssessment
end

describe SinatraAssessment do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
