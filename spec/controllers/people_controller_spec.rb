require 'spec_helper'
describe Admin::PeopleController do 
  render_views  
  before :each do
    @admin_user = AdminUser.create!(:email => "admin@example.com", :password => "password", 
     :password_confirmation => "password", :terms_of_service => '1')
    sign_in  @admin_user
  end
  
  describe "get'new'" do
    it "should render the new page" do
      get :new
      response.should be_success 
    end 
    it "should have the right title" do
       get :new
       #response.should have_selector('h2#page_title', 'New Person') 
       #puts page 
       response.body.should have_selector('title', :content => 'New Person')
     end
  end 
  
  describe "Post 'create'" do
    describe 'failure' do
      before(:each) do
      @attr = {:email => "", :first_name => "", :last_name => "", :image => "/lusty"}
      end
     it "should render the new page" do
        post :create, :person => @attr
        response.should render_template('new') 
     end      
     it "should not increment the number of people" do
       lambda{post :create, :person => @attr}.should_not change(Person, :count)
     end
    end
    
    describe "pass" do
      before :each do 
        @admin_user = AdminUser.first
        sign_in  @admin_user
        @attr = {:email => "kmarkandan@shaw.ca", :first_name => "Kartik", 
          :last_name => "Markandan", :image => ""}
      end
      it "should render the show page" do
          post :create, :person => @attr
          #@p = Person.create!(@attr)   
           assigns[:person].should_not be_nil
           assigns[:person].should be_kind_of(Person)
         response.should redirect_to(admin_person_path(assigns[:person]))  
       end  
       it "should increase person count by one" do
             lambda{post :create, :person => @attr}.should change(Person, :count)
        end
       
     end
  end
  
  describe "Get 'show'" do
    before :each do 
      @attr = {:email => "kmarkandan@shaw.ca", :first_name => "Kartik", 
        :last_name => "Markandan", :image => ""}
        @person = Person.create(@attr)
    end
    
    it "should be successful" do
      get :show, :id => @person
      response.should be_success
    end  
    it "should show the person's name and email with an image" do
      get :show, :id => @person                   
   
      response.body.should have_content(@person.email)
      response.body.should have_content(@person.first_name)
      response.body.should have_content(@person.last_name)
    end 
    describe "failure" do
      it "should not be successful if there is no person" do
        lambda {get :show}.should raise_error
      end
      it "should not be successful if there does not exist an id" do
        lambda {get :show, :id => "2"}.should raise_error
      end
    end
  end  
  
  describe "'Edit'"  do
     before :each do 
      @attr = {:email => "kmarkandan@shaw.ca", :first_name => "Kartik", 
        :last_name => "Markandan", :image => ""}
       # @person = Person.create(@attr)
     end
   it "should not be successful if there is no id" do
     lambda{get :edit}.should raise_error 
   end
    it "should not be successful if there is no person" do
       lambda{get :edit, :id => "1"}.should raise_error 
     end 
     it "should be editable if the person is valid" do 
       @person = Person.create(@attr)
       get :edit, :id => @person
       response.body.should have_selector("input", :value => @person.first_name)
       response.body.should have_selector("input", :value => @person.last_name)
       response.body.should have_selector("input", :value => @person.email)
     end
 
  
    it "should not increment the Person count" do  
      @person = Person.create(@attr)
      @person.first_name = "Kartika"
      lambda{put :update, :id => @person}.should change(Person, :count).by(0)
    end
   end 
      
   describe "post 'update'" do
      before :each do 
       @attr = {:email => "kmarkandan@shaw.ca", :first_name => "Kartik", 
         :last_name => "Markandan", :image => ""}
        # @person = Person.create(@attr)
      end
    describe "success"  do
     it "should display the show page" do  
       @person = Person.create(@attr)  
       Person.count.should == 1
       @attr = {:email => "kmarkandan@shaw.ca", 
         :first_name => "Kartika", :last_name => "Markandam", :image => ""}
        put :update, :id => @person, :person => @attr 
        @person.reload
        @person.first_name.should == "Kartika" 
        assigns[:person].first_name.should == "Kartika"
        assigns[:person].email.should == "kmarkandan@shaw.ca"
        response.should render_template(@person) 
      end 
     end
     describe "failure" do                                            
      it "should display the edit page" do
         @person = Person.create(@attr)
         @attr = {:email => "kmarkandan@shaw.ca", 
            :first_name => "", :last_name => "Markandam", :image => ""}
         put :update, :id => @person, :person => @attr
         response.should render_template('edit')
         response.body.should have_content("First name cannot be blank")          
      end
      
    end
  end
  
  describe "Delete" do 
    
    before :each do 
         @attr = {:email => "kmarkandan@shaw.ca", :first_name => "Kartik", 
           :last_name => "Markandan", :image => ""}
          @person = Person.create(@attr)
    end
    describe "success" do
      it "should display the index page " do
        delete :destroy, :id => @person
        response.should redirect_to(admin_people_path)
      end    
      
      it "should decrease the person count by 1" do
         lambda {delete :destroy, :id => @person}.should change(Person, :count).by(-1) 
      end
        
        
     end   
  end
  
  describe "Index" do
     before :each do 
         @attr = {:email => "kmarkandan@shaw.ca", :first_name => "Kartik", 
           :last_name => "Markandan", :image => ""}
           @attr2 = {:email => "kmarkand@shaw.ca", :first_name => "Kartika", 
              :last_name => "Markandana", :image => ""}  
              
          @person = Person.create(@attr)
          @person2 = Person.create(@attr2)
    end
    describe "success " do
     it "should render the index page properly" do
       get :index
       response.body.should have_content(@person.email)
       response.body.should have_content(@person2.email)
       response.body.should have_link("View") 
       response.body.should have_link("Edit")
       response.body.should have_link("Delete")
     end     
    end
  end
end