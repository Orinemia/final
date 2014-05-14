require 'spec_helper'

describe BiographyController do

  describe "GET 'bio'" do
    it "returns http success" do
      get 'bio'
      response.should be_success
    end
  end

end
