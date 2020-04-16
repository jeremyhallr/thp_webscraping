require 'nokogiri'
require 'open-uri'

def page
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
end

# Create array with the link for each city

def get_city_url(page)
  base_url = "http://www.annuaire-des-mairies.com"
  city_link_array = []
  page.css('a.lientxt').collect do |city_link|
    city_link_array.push(base_url + city_link.attribute('href').value[1..-1])
  end
  return city_link_array
end

# Creates an array with the name of each city

def get_city_name(page)
  city_name_array = []
  page.css('a.lientxt').collect do |city_name|
    city_name_array.push(city_name.text)
  end
  return city_name_array
end

# Opens each city link and pushes email into email array

def get_city_mail(get_city_url)
  city_email_array = []
  get_city_url.each { |link|
    page = Nokogiri::HTML(open(link))
    p "#{page.xpath('//table[@class="table table-striped table-mobile mobile-primary round-small"]/tbody/tr[4]/td[2]').first.text} : ok"
    city_email_array.push(page.xpath('//table[@class="table table-striped table-mobile mobile-primary round-small"]/tbody/tr[4]/td[2]').first.text)
  }
  return city_email_array
end

# Creates an array of hashes with city and email address

def list_city_with_email(array1, array2)
  puts city_email_hash = array1.each_with_index.map{|d, i| {d => array2[i]}}
  puts "Chargement terminé !"
end

def perform_test
  # get_city_url(page)
  # get_city_name(page)
  # get_city_mail(get_city_url(page))
  list_city_with_email(get_city_name(page), get_city_mail(get_city_url(page)))
end

perform_test