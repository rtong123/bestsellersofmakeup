class Makeup::CLI

  def call
    opening_question
  end

  def opening_question
    puts "Welcome to Ulta"
    puts "Would you like to take a look at Allure's Best of Beauty?"
    puts "1 -- See Allure's Best of Beauty"
    puts "2 -- Exit"
    input = gets.strip
    case(input)
    when "1"
      list_product_categories
    when "2"
      puts "Thank you for visiting, see you again soon!"
      exit
    else
      puts "Please try again."
      opening_question
    end
  end

  def list_product_categories
    puts "Which category would you like to see? Type the number of the category that you'd like to see or 3 to exit out."
    puts "1) Makeup -- Press a number if you'd like more information"
    puts "2) Skincare -- Press a number if you'd like more information"
    puts "3) Exit"
    input = gets.strip
    case(input)
    when "1"
      show_makeup_info
    when "2"
      show_skincare_info
    when "3"
      puts "Goodbye."
      exit
    else
      puts "Please try again."
      list_product_categories
    end
  end

  def show_makeup_info
    Makeup::Scraper.scrape_top_makeup.each.with_index(1) do |item, i|
      puts "#{i}. Name: #{item.name}
      Description: #{item.description}
      Price: #{item.price} "
    end
    display_makeup_url
  end


  def display_makeup_url
    input = gets.strip
    collection_of_makeup = Makeup::Scraper.scrape_top_makeup
      if input.to_i <= collection_of_makeup.length
        puts "Url: https://www.ulta.com/#{collection_of_makeup[input.to_i-1].url}"
      elsif
        show_makeup_info
      end
    end

    def show_skincare_info
      Makeup::Scraper.scrape_top_skincare.each.with_index(1) do |item, i|
        puts "#{i}. Name: #{item.name}
        Description: #{item.description}
        Price: #{item.price} "
      end
      display_skincare_url
    end

    def display_skincare_url
      input = gets.strip
      collection_of_skincare = Makeup::Scraper.scrape_top_skincare
        if input.to_i <= collection_of_skincare.length
          puts "Url: https://www.ulta.com/#{collection_of_skincare[input.to_i-1].url}"
        elsif
          show_skincare_info
        end
    end


  end
