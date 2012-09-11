class PeopleController < ApplicationController   
  def new 
    @person = Person.new
  end 
  def index
    @people = Person.all
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
  
  def doThis        
    puts "Hello there!"
    respond_to do |format|
      format.js{Person.all}
    end
  end
  
end
