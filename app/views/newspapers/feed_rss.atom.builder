atom_feed do |feed|
  feed.title "Kwak newspapers"
  feed.updated @feednews.maximum(:updated_at)

  @feednews.each do |feedrss|
    feed.entry feedrss , url:feedrss_url  do |entry|
      entry.title feedrss.title
      entry.content feedrss.description
      entry.url feedrss_path(feedrss)
      entry.author do |author|
        author.name feedrss.author
      end
    end
  end
end