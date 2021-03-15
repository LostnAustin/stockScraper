require 'nokogiri'
require 'httparty'
require 'open-uri'
require 'byebug'



def scraper
    url = 'https://www.tradingview.com/markets/stocks-usa/market-movers-oversold'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    stocks = Array.new

   oversold_Listings = parsed_page.css('div.tv-screener-table__symbol-container') 

   total_count = oversold_Listings.count
   

   oversold_Listings.each do |oversold_ticker|
        stock =  { 
            ticker:  oversold_ticker.css('a')[0].attributes["href"].value
        }
        stocks << stock
        byebug  
  
    end
    byebug  
  
end

scraper





 # page = Nokogiri::HTML(URI.open('https://www.tradingview.com/markets/stocks-usa/market-movers-oversold'))

# table = page&.css('.tv-data-table');
# rows = table.search('tr');
# stock_arr = []

# rows.each do |row|
#   stock_content = row.search('td').map { |td| td.text.strip }
#   stock_content[0]&.gsub!("\n\t\t\t\t\t\t\t\t\t", " ")
#   stock_arr << Stock.new(stock_content) if stock_content.length.positive?



#oversoldList = parsed_page.css('div.tv-screener-table__symbol-container')
# oversoldList.css('a.tv-screener__symbol.href')
# first.css('a')[0].attributes["href"].value