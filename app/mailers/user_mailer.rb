class UserMailer < ApplicationMailer
	def send_csv_report
		attachments['Report.csv'] = params[:content]
		email = 'suraj21071998@gmail.com'
    mail(to: email, subject: 'Report of imported csv')
  end
end