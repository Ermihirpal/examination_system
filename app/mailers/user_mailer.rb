class UserMailer < ApplicationMailer
  default from: 'mihir.p@preciousinfosystem.com'


  def welcome_email(marks,student)
    @totalmark=marks 
    @student=student
    @url  = 'http://example.com/login'
    mail(to: @student["email"], subject: 'Welcome to Online Exmaination System')
  end
end
