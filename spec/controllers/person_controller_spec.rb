require 'spec_helper'

describe PeopleController do 
  render_views  
  describe "get'new'" do
    it "should render the new page" do
      get :new
      response.should be_success
    end
    it "should assign person" do
      get :new
      assigns(:person).should be_new_record
      assigns(:person).kind_of?(Person).should be_true
    end 
  end
  describe "post 'create'" do  
    before :each do
      @attr =  {:first_name => "Kartik", :last_name => "Markandan", :email => "kmarkandan@shaw.ca"}
    end  
    it "should create a new person if the person is valid" do
      lambda{post :create, :person => @attr}.should change(Person, :count).by(1)
    end
    it "should redirect to the user show page" do
      post :create, :person => @attr
      response.should redirect_to(person_path(assigns(:person)))
    end
 end 
end
