require 'github_lead_gen/scraper'
require 'dotenv/load'

RSpec.describe GithubLeadGen::Scraper do
    let (:github_credentials) do
        {
            username: ENV['GITHUB_USERNAME'],
            password: ENV['GITHUB_PASSWORD']
        }
    end
    
    let (:scraper) do
        GithubLeadGen::Scraper.new(
            github_credentials[:username],
            github_credentials[:password]
        ) 
    end
    
    context "with a GitHub handle provided" do
        let (:github_handle) { "ArturMoczulski" }
        
        describe "#emails" do
            it "lists emails of all people that contributed to organization's repositories or user's repositories" do
                emails = scraper.emails(github_handle)
                
                expect(emails).to_not be_empty
                expect(emails[0]).to eq("artur.moczulski@gmail.com")
            end
        end
        
        describe "#repositories" do
          it "lists handle's repositories" do
            list = scraper.repositories(github_handle)
            
            expect(list).to_not be_empty
            expect(list[0].class).to be(Sawyer::Resource)
          end
        end
        
        describe "#repository_emails" do
            it "lists emails of comitters from a repository" do
                repos = scraper.repositories(github_handle)
                emails = scraper.repository_emails(repos[0])
                
                expect(emails).to_not be_empty
                expect(emails[0]).to eq("artur.moczulski@gmail.com")
            end
        end
    end
end
