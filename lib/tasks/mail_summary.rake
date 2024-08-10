namespace :article_summary do
  desc '公開済み、昨日公開した記事数とタイトルのメールを送信する'
  task article: :environment do
    ArticleMailer.report_summary.deliver_now
  end
end
