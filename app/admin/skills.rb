ActiveAdmin.register Skill do 
  filter :title 
  index :download_links => false do
      
      column :title
    
    default_actions  
  end
  
  show do
    
  end
  
end  