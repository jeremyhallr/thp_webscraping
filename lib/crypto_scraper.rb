require 'nokogiri'
require 'open-uri'

def page
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end

# Creates and returns an array with every crypto symbol

def crypto_symbol(page)
  crypto_symbol_array = []
  page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]').each {|symbol|
    crypto_symbol_array.push(symbol.text)
    }
  return crypto_symbol_array
end

# Creates and returns an array with the price for every crypto

def crypto_price(page)
  crypto_price_array = []
  page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a[@class="cmc-link"]').each {|price|
    crypto_price_array.push(price.text)
    }
  return crypto_price_array
end

# Creates an array of hashes with crypto symbols and prices

def crypto_recap(array1, array2)
  puts crypto_recap = array1.each_with_index.map{|d, i| {d => array2[i]}}
end

crypto_recap(crypto_symbol(page), crypto_price(page))