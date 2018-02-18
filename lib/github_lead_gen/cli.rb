require "thor"
require "dotenv/load"
require 'io/console'
require 'readline'
require_relative "scraper"

module GithubLeadGen
    class CLI < Thor
        desc "emails [GITHUB_HANDLE]", "Scrape emails of all comitters from this handle's repositories"
        def emails(handle)
            username = Readline.readline("GitHub username: ")
            puts "GitHub password: "
            password = STDIN.noecho(&:gets).chomp
            
            scraper = GithubLeadGen::Scraper.new(
                username,
                password
            )
            
            emails = scraper.emails(handle)
            
            puts emails
        end
    end
end