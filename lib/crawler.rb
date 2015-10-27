class Crawler
  def initialize
    @mechanize = Mechanize.new
  end

  def find_articles
    articles = Array.new

    Website.all.each do |website|
      page  = @mechanize.get website.url
      links = page.root.css website.dom_selector

      links.each do |link|
        Category.all.each do |category|
          category.tags.each do |tag|
            if match_tag(normalize(link.text), tag.name)
              url = website.prefix ? build_url(website.prefix, link['href']) : build_url(link['href'])

              articles << { title: link.text, url: url, website: website, category: category }
              break
            end
          end
        end
      end
    end

    # ap articles

    return articles
  end

  private

  def normalize string_in
    string_in.strip.parameterize
  end

  def match_tag text, tag
    # Regexp.quote is important
    # http://stackoverflow.com/a/150598
    text =~ /#{Regexp.quote(tag)}/
  end

  def build_url *segments
    segments.compact.join ''
  end
end
