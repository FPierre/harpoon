class Crawler
  def initialize(websites, categories)
    @mechanize  = Mechanize.new
    @websites   = websites
    @categories = categories

    @selected_articles = Hash.new({})
  end

  def get_articles
    @websites.each do |website|
      page  = @mechanize.get(website[1]['url'])
      links = page.root.css(website[1]['dom_selector'])

      links.each do |link|
        @categories.each do |category, tags|
          tags.each do |tag|
            if match_tag(normalize(link.text), tag)
              @selected_articles[category.to_sym] = Hash.new if @selected_articles[category.to_sym]

              if website[1]['prefix']
                url = "#{website[1]['prefix']}#{link['href']}"
              else
                url = link['href']
              end

              @selected_articles[category.to_sym].merge!({ text: link.text, url: url, tag: tag, website: website })
              break
            end
          end
        end
      end
    end

    ap @selected_articles
    return @selected_articles
  end

  private

  def normalize(string_in)
    string_in.strip.parameterize
  end

  def match_tag(text, tag)
    # Regexp.quote is important
    # http://stackoverflow.com/a/150598
    text =~ /#{Regexp.quote(tag)}/
  end
end
