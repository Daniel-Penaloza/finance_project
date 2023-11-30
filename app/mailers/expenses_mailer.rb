class ExpensesMailer < ApplicationMailer
  def send_mail(file_name, date)
    attachments["#{file_name}"] = File.read("tmp/#{file_name}")
    mail(
      to: 'danielpenalozatj@gmail.com',
      subject: "Monthly Expenses #{date}")
  end
end
