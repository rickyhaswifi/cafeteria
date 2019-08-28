=begin
√ the user chooses from a list of main dishes
√ the user chooses 2 side dish items
√ computer repeats users order
- computer totals lunch items and displays total

 

Bonus Objectives:
- the user can choose as many "add-on" items as they want before getting total
- the user can clear their choices and start over
- the user has a wallet total they start with and their choices cannot exceed what they can pay for
- the program is in a loop to keep asking the user to make new orders until they type 'quit' at any time
- main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
- descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
- display to the user not only their total but the total fat content/calories / carbs / etc...
=end

# def sum(num1, num2)
#     num1 + num2
#   end


# class Student_wallet
#     def initialize        
#     end
# end

########################## NOTES for TA
# Pain points in this project are classes, displaying hashes in a nice format, nesting hashes inside of other hashes
# I also didn't know how to use my _spec.rb, did the full install but no longer used it after that. 
# being able to type quit at anytime was also returning errors.
########################## - Ricky

class Cafeteria
    def initialize
        cafeteria_line
        wallet = @wallet
        tray = @tray
        main_menu = @main_menu
        sides_menu = @sides_menu
    end
    
    @wallet = 10.00
    @tray = []

    @main_menu = [ 
        {name: 'Goober Burger', price: 3.00, calories:1200, carbs: 97},
        {name: 'Bisson Ribs', price: 3.50, calories:2200, carbs: 175},
        {name: 'Elk Meatloaf', price: 4.00, calories:2650, carbs: 350}
    ]
    @sides_menu = [ 
        {name: 'Macaronni', price: 2.00, calories:800, carbs: 175},
        {name: 'Toast', price: 0.75, calories:200, carbs: 90},
        {name: 'Fries', price: 1.00, calories:650, carbs: 250}
    ]
    
    
    
    def cafeteria_line
        puts
        puts '*Thinks to self, what should I have for lunch today?'
        puts '...'
        puts 'Mom gave me $10.00 so lets see what I can get'
        puts '...'
        puts 'Scan your ID card to enter the cafeteria, enter your name'
        @student_name = gets.strip
        puts
        chef
    end
    
    def chef
        puts "Hey lil #{@student_name} My name is Chef, what would you like today?"
        puts '---       Cafeteria options     ---'
        puts "---Lunch funds $#{@wallet}---"
        puts '1) Goober Burgers - $3.00'
        puts '2) Bisson Ribs - $3.50'
        puts '3) Elk Meatloaf - $4.00'
        puts '4) Side Dishes Menu'
        puts '5) Waste food & get new food'
        puts '6) Check out & go to table'
        puts
        # puts '---input \'quit\' at any time to leave---'
        main_course
    end
    
    def main_course
        # tray = @tray
        # main_menu = @main_menu
        main_choice = gets.to_i
    
        if main_choice == 1
            puts "Chef placed a Goober Burger on your plate"
            tray_item = main_menu[0].clone
            tray.push(tray_item)
            sides
        elsif main_choice == 2
            puts "Chef placed a Bisson Ribs on your plate"
            tray_item = main_menu[1].clone
            tray.push(tray_item)
            sides
        elsif main_choice == 3
            puts "Chef placed a Elk Meatloaf on your plate"
            tray_item = main_menu[2].clone
            tray.push(tray_item)
            sides
        elsif main_choice == 4
            sides
        elsif main_choice == 5
            puts
            @tray.clear
            puts 'You threw your food in the trash & got back in line'
            chef
        elsif main_choice == 6
            checkout
        # elsif main_choice == 'quit'
        #     exit
        else   
            puts 'Sorry we will have that tomorrow' 
         chef   
        end         
    end
    
    def sides
        puts
        puts '---       Cafeteria options     ---'
        puts "---Lunch funds $#{@wallet.to_f}---"
        puts
        puts '1) Macarroni - $2.00'
        puts '2) Toast - $0.75'
        puts '3) Fries - $1.00'
        puts '4) Waste food & get new food'
        puts '5) Check out & go to table'
        puts
        # puts '---input \'quit\' at any time to leave---'
        side_course
    end
    
    
    def side_course
        tray = @tray
        sides_menu = @sides_menu
        side_choice = gets.to_i
     
        if side_choice == 1
            puts "Chef placed a Macarroni scoop on your plate"
            tray_item = sides_menu[0].clone
            tray.push(tray_item)
            checkout
        elsif side_choice == 2
            puts "Chef placed Toast on your plate"
            tray_item = sides_menu[1].clone
            tray.push(tray_item)
            checkout
        elsif side_choice == 3
            puts "Chef placed some Fries on your plate"
            tray_item = sides_menu[2].clone
            tray.push(tray_item)
            check out
        elsif side_choice == 4
            puts
            @tray.clear
            puts 'You threw your food in the trash & got back in line'
            chef
    #     elsif main_choice.to_s == 'quit'
    #   exit
        else   
            puts 'Sorry we will have that tomorrow' 
         chef   
        end         
    end
    
    
    def tray_items
        tray = @tray
        calories = @tray.inject(0) { |sum, hash| sum + hash[:calories].to_f}
        carbs = @tray.inject(0) { |sum, hash| sum + hash[:carbs].to_f}
        puts '  Your tray currently has  '
        @tray.each_with_index do |name, price, i|
            puts "#{i}): #{name} $#{price}"
            puts "Nutrition calores: #{calories} & carbs: #{carbs}"
            end
       end 
    
    def checkout
        total = @tray.inject(0) { |sum, hash| sum + hash[:price].to_f}
        @wallet = @wallet - total
        puts "Your total is $#{@wallet}"
        tray_items
        puts 'Ready to eat? [y/n]'
        eat_choice = gets.strip
        if eat_choice == 'y'
            table
        elsif eat_choice == 'n'
            chef
        else
            chef
        end            
    end

    def table
        puts "This #{tray} is delicous"
            exit
    end

end

Cafeteria.new