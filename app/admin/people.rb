ActiveAdmin.register Person do
  
  form :partial => "form"
  
  show do
   
      render "show"
   end

   sidebar :help, :only => :show do
      "Need help? Email us at help@example.com"
    end
 
  controller do  
    def new    
      puts "Hello"
      @person = Person.new
    end
    def create
       @person = Person.new(params[:person])
       if @person.save
         redirect_to @person
       else
         render 'new' 
       end 
    end
    def show
      @person = Person.find(params[:id])
    end
  end  
   
end    
   
