class PublicController < ApplicationController
  def index
  end

  def about
    @members = User.all
  end

  def projects
    @projects = Project.featured(100)
  end

  def contact
  end

  def blog
    @posts = [] #Post.all_public
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def send_message
    unless Mailer.deliver_simple_message :subject => 'Information request from TapiocaCollective.com',
        :from => "\"#{params[:name]}\" <#{params[:email]}>",
        :recipients => 'holla@tapiocacollective.com',
        :body => "Preferred contact method: #{params[:contact_preference]}\nPhone: #{params[:phone]}\n\n#{params[:message]}"
      flash[:notice] = 'Sorry, there was an error sending your message. Please double-check your input and try again.'
      render :action => 'contact'
    end
  end

end
