class Crawler
  def initialize(websites, categories)
    @mechanize  = Mechanize.new
    @websites   = websites
    @categories = categories

    @selected_articles = Hash.new({})
  end

  def get_articles
    @websites.each do |website|
      @page = get_page(website[1]['url'])

      # @news = get_page_news(website[1]['dom_selector'])
      # @news = @page.links_with(rel: )
      @links = @page.links
      # ap @links

      @links.each do |link|
        text = normalize(link.text)

        @categories.each do |category, tags|
          tags.each do |tag|
            # puts "#{text} match #{tag}" if match_tag(text, tag)
            # selected_articles["#{tag}"].merge!({ url: link.href, text: text }) if match_tag(text, tag)
            if match_tag(text, tag)
              @selected_articles[category.to_sym] = Hash.new if @selected_articles[category.to_sym]
              @selected_articles[category.to_sym].merge!({ text: link.text, url: link.href, tag: tag, website: website })
              break
            end
          end
        end
      end

      # ap @selected_articles
      return @selected_articles
    end
  end

  private

  def get_page(website_url)
    @mechanize.get(website_url)
  end

  def get_page_news(dom_selector)
    @page.search(dom_selector)
  end

  def normalize(string_in)
    string_in.strip.parameterize
  end

  def match_tag(text, tag)
    # Regexp.quote is important
    # http://stackoverflow.com/a/150598
    text =~ /#{Regexp.quote(tag)}/
  end
end
