class CampaignWorker
  include Sidekiq::Worker

  def perform(leads_array)
    require 'mandrill'
    @m = Mandrill::API.new(ENV["MANDRILL_API_KEY"])
    leads_array.each do |lead|
      @user = Lead.find(lead)
      email_lead
      sleep(30)
    end
  end

  def email_lead
    template_name = "Beta Announcement"
    message = {
     :subject=> "Production's About to Change",
     :from_name=> "Jeb Coleman",
     :from_email=> "jeb@productionsense.com",
     :to=>[{:email=> @user.email}]
    }
    sending = @m.messages.send_template template_name,, message
    puts sending
  end
end
