class NoticeMailer < ApplicationMailer
  default from: ENV["SMTP_USER_NAME"]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.notice.subject
  # default from: ENV["SMTP_USER_NAME"]という記述で、メールのfrom(送信元)を設定しています。
  # helloメソッドの中ではto(送信先)を設定しています。
  # テストのために実際に送信できるメールアドレスを設定してください。
  # 実際のサービスで使う場合は、引数にモデルや文字列でメールアドレスなどを渡して個別にメールを送れるようにすると良いでしょう。
  #
  def notice
    @greeting = "Hi"
     mail to: "wkojiro@easydrive.co.jp"
#    mail to: "to@example.org"

  # メールアドレスやパスワードなどは重要な情報のため、シェル変数を用いて起動を行ってください。
  # 下記はRailsコンソールを立ち上げる時の例です。
  # SMTP_USER_NAME=xxxxx@gmail.com SMTP_USER_PASSWORD=xxxxxxxxx rails c
  # Railsコンソール上で下記のコードを実行してください。NoticeMailer#helloで指定したメールアドレスへメールが届いていれば成功です。



  end
end
