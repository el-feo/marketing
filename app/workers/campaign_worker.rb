class CampaignWorker
  include Sidekiq::Worker

  def perform(leads_array, campaign)
    require 'mandrill'
    @m = Mandrill::API.new(ENV["MANDRILL_API_KEY"])
    @campaign = campaign
    leads_array.each do |lead|
      @user = Lead.find(lead)
      if @user.campaign != campaign
        email_lead
        @user.update_attributes(campaign: campaign)
        sleep(30)
      end
    end
  end

  def email_lead
    template_name = @campaign
    template_content = [{}]
    message = {
     :subject=> "Production's About to Change",
     :from_name=> "Jeb Coleman",
     :from_email=> "jeb@productionsense.com",
     :to=>[{:email=> @user.email}]
    }
    sending = @m.messages.send_template template_name, template_content, message
    puts sending
  end
end
