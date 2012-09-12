ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['kmarkandan@shaw.ca'],
  :password       => ENV['emailpass'],
  :domain         => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp