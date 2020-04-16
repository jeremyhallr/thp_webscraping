require_relative '../lib/crypto_scraper'

describe "the creation of an array of hashes method" do
  it "creates an array of hashes with symbols and prices of cryptocurrencies" do
    expect(crypto_hash([1,2,3], [4,5,3])).not_to be_nil
  end
end