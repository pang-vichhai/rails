require "rails_helper"

RSpec.describe CommentingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/commentings").to route_to("commentings#index")
    end

    it "routes to #show" do
      expect(get: "/commentings/1").to route_to("commentings#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/commentings").to route_to("commentings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/commentings/1").to route_to("commentings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/commentings/1").to route_to("commentings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/commentings/1").to route_to("commentings#destroy", id: "1")
    end
  end
end
