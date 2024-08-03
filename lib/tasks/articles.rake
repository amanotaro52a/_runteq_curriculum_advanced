namespace :articles do
    desc '公開待ちの中で、公開日時が過去になっているものがあれば、ステータスを「公開」に変更されるようにする'
    task update_statuses: :environment do
      Article.where(status: :pending).where('publish_at <= ?', Time.current).find_each do |article|
        article.update(status: :published)
      end
  end
end