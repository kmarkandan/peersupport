class PeopleController < ApplicationController   
  def new 
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
