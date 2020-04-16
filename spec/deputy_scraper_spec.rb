require_relative '../lib/deputy_scraper'

describe "the creation of an array of hashes method" do
  it "creates an array of hashes with names and email addresses of deputies" do
    expect(list_info_depute(["Jean","Paul","Nicolas"],["Maurice", "Robert", "Jacques"], ["jojo@kiki.com","kiki@jojo.fr","123@allezlesbleus.com"])).not_to be_nil
  end
end