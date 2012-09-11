ActiveAdmin.register Person do |person|
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
   
  #edit page

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
      
       skill = params[:person][:skills_attributes][:title]  
       #puts skill
       person_hash = params[:person]
       p = person_hash
       p.delete :skills_attributes 
       #puts "deleted p" 
       #puts p
       
       #puts "Person count before: " 
       #puts Person.count
       # saved = false    
       
       @person = Person.new(p)
       if @person.save 
          skill.each do |s|
            unless s.blank? 
              skill_record = Skill.find(s) 
              SkillAssoc.create(:person_id => @person.id, :skill_id => skill_record.id)
            end
          end
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
      skill = params[:person][:skills_attributes][:title]  
       #puts skill
       person_hash = params[:person]
       p = person_hash
       p.delete :skills_attributes
      if @person.update_attributes(p)
        @person.skill_assocs.delete_all 
        skill.each do |s|
          unless s.blank? 
            skill_record = Skill.find(s) 
            SkillAssoc.create(:person_id => @person.id, :skill_id => skill_record.id)
          end
        end 
         redirect_to admin_person_path(@person)
      else
         render 'edit'
      end
      
     end
    
  end  
   
end    
   
