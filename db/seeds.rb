# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'

Job.destroy_all 

response = RestClient.get('https://jobs.github.com/positions.json')
    data = JSON.parse(response)
    data.map do |result|
        Job.create({
            company: result['company'],
            title: result['title'], 
            company_url: result['company_url'],
            location: result['location'],
            logo_url: result['company_logo']
        })
end

