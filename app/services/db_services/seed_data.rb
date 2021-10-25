module DbServices
  class SeedData < BaseService
    require 'faker'
    def initialize; end

    def execute
      seed_bearers
      seed_stocks

      success_response
    rescue StandardError => e
      Rails.logger.error "Failed to seed data: #{e.message}"
      puts "Failed to seed data: #{e.message}"
    end

    private

    def seed_bearers
      puts "Seeding bearers..."
      1.upto(20) do |_nr|
        bearer = Bearer.create(
          name: Faker::Name.name,
          email: Faker::Internet::email,
          age: Faker::Number.between(from: 18, to: 90)
        )
        puts "Created bearer: #{bearer.inspect}"
      end
    end

    def seed_stocks
      puts "Seeding stocks"
      1.upto(40) do |_nr|
        bearer = Bearer.all.shuffle.first
        stock = Stock.new(
          name: Faker::Finance.stock_market,
          ticker: Faker::Finance.ticker,
          last_price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
        )
        stock.bearers << bearer
        stock.save!
        puts "Created stock: #{stock.inspect}"
      rescue StandardError => e
        Rails.logger.error "Failed creating stock:#{ stock.errors.inspect}, #{e.message}"
        puts "Failed creating stock:#{ stock.errors}, #{e.message}"
      end
    end
  end
end