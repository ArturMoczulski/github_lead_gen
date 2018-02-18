require 'octokit'
require 'dotenv/load'

module GithubLeadGen
    class Scraper
        def initialize(username, password)
            @client = Octokit::Client.new \
                login: username,
                password: password
        end
        
        def emails(handle)
            emails = []
            
            repositories(handle).each do |repo|
                emails = emails + repository_emails(repo)
            end
            
            emails.uniq
        end
        
        def repositories(handle)
            @client.repositories @client.user(handle)[:id]
        end
        
        def repository_emails(repository)
            emails = []
            
            begin
                @client.commits(repository[:id], 'master').each do |commit|
                    emails.push commit[:commit][:author][:email]
                end
            rescue Octokit::Conflict, Octokit::NotFound
            end
            
            emails.uniq
        end
    end
end