ActiveAdmin.register Person do
      menu :label => "Peer Support Workers"
      
     filter :first_name
    
   index :download_links => false do
    
     column :first_name
     column :last_name
     column :email
     column "Image" do |person| 
             image_tag(person.image_url(:thumb).to_s)
         end  
      default_actions
     
  end 
  
  #this is for the new page
  form :partial => "form"
  
  #this is for the show page
  show do   
         attributes_table do
           row :first_name
           row :last_name
           row :email  
           row :image do |person|
            image_tag(person.image_url(:thumb).to_s)
           end
         end  
        # render "show"
      
   end

   sidebar :help, :only => :show do
      "Need help? Email us at help@example.com"
    end
 
  controller do  
    def new    
      @person = Person.new
    end
    def create
       @person = Person.new(params[:person])
       if @person.save
         redirect_to admin_person_path(@person)
       else
         render 'new' 
       end 
    end
    def show
      
      @person = Person.find(params[:id])
    end 
    
    def edit                                
      
       @person = Person.find(params[:id])
    end   
    def update
      @person = Person.find(params[:id])
      if @person.update_attributes(params[:person])
         redirect_to admin_person_path(@person)
      else
         render 'edit'
       end
      
    end
    
  end  
   
end    
   
