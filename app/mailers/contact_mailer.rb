class ContactMailer < ApplicationMailer
  
  def contact_mail(contact, user)
    @contact = contact #ビューで使うために設定した
    mail to: user.email, bcc: ENV["caisuiz839@gmail.com"], subject: "お問い合わせについて【自動送信】" 
      #mail メールを送信します
      #to: 送信先を指定します　=> お問合せをしたuserの登録メールアドレスに送付します
      #bcc: 必要な場合のみccとbccを設定しましょう。ここには私のメールアドレスが入っています
      #subject: メールのタイトルは○○にします
  end
end
