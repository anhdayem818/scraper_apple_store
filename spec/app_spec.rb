require 'spec_helper'

describe ScraperAppStore::App do

  it 'has a version number' do
    expect(ScraperAppStore::VERSION).not_to be nil
  end

  it 'if package invalid' do 
    app = ScraperAppStore::App.new(id: '553834731')
    expect(app.instance_variable_get('@page').body).to_not eq(nil)
  end 

  it 'info' do 
    app = ScraperAppStore::App.new(id: '553834731')
    expect(app.info).to_not eq(nil)
  end 

  it 'init' do
    list = ScraperAppStore::List.new(ScraperAppStore::Collection[:NEW_FREE_IOS])
    expect(list).to_not eq(nil)
  end

  it 'apps list' do
    list = ScraperAppStore::List.new(ScraperAppStore::Collection[:NEW_FREE_IOS], "", 200).apps
    expect(list).to_not eq(nil)
  end
end
