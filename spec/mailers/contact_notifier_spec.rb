require "spec_helper"

describe ContactNotifier do
  describe "message" do
    let(:mail) { ContactNotifier.message }

    it "renders the headers" do
      mail.subject.should eq("Message")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
