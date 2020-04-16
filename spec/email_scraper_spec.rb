require_relative '../lib/email_scraper'

describe "the creation of an array of hashes method" do
  it "creates an array of hashes with names and email addresses of different cities" do
    expect(crypto_hash(["Viroflay","Strasbourg","Nantes"], ["jojo@kiki.com","kiki@jojo.fr","123@allezlesbleus.com"])).not_to be_nil
  end
end