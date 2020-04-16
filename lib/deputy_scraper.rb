require 'nokogiri'
require 'open-uri'

# Gets links of every deputy pages

def get_link_to_all_pages
  base_url = "https://www.nosdeputes.fr"
  link_array = []
  page = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
  page.css('td a').collect do |link|
    link_array.push(base_url + link.attribute('href').value)
  end
  return link_array
end

# Gets deputy's first name

def get_first_name
  first_name_array = []
  page = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
  page.css('span.list_nom').collect do |namen|
    first_name_array.push(namen.text.split(",")[1].strip)
  end
  return first_name_array
end

# Gets deputy's last name

def get_last_name
  last_name_array = []
  page = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
  page.css('span.list_nom').collect do |namen|
    last_name_array.push(namen.text.split(",")[0].strip)
  end
  return last_name_array
end

# Gets email address

def get_email(get_link_to_all_pages)
  email_array = []
  get_link_to_all_pages.each do |link|
    page = Nokogiri::HTML(open(link))
    p page.xpath('//ul[2]/li[1]/ul/li[1]/a').text
    email_array.push(page.xpath('//ul[2]/li[1]/ul/li[1]/a').text)
  end
  return email_array
end

# Creates array of hashes with first_name, last_name and email

def list_info_depute(array1, array2, array3)
  puts info_array =  array1.each_with_index.map{|d, i| {"first_name" => array1[i], "last_name" => array2[i], "email" => array3[i]}}
  puts "Chargement terminé !"
end

def perform
  # get_link_to_all_pages
  # get_first_name
  # get_last_name
  # get_email(get_link_to_all_pages)
  list_info_depute(get_first_name, get_last_name, get_email(get_link_to_all_pages))
end

perform