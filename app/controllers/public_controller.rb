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
    msg = []
    msg << "Preferred contact method: #{params[:contact_preference]}"
    msg << "Email: #{params[:email]}"
    msg << "Phone: #{params[:phone]}"
    msg << "URL: #{params[:url]}"
    msg << "\n#{params[:message]}"
    unless Mailer.deliver_simple_message(:body => msg.join("\n"),
        :subject => 'Information request from TapiocaCollective.com',
        :from => "\"#{params[:name]}\" <#{params[:email]}>",
        :recipients => 'holla@tapiocacollective.com')
      flash[:error] = 'Sorry, there was an error sending your message. Please double-check your input and try again.'
      render :action => 'contact'
    end
  end

end
