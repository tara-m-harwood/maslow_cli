
require_relative 'environment.rb'

def build_seeds  #temporary while testing
    # members
    alpha = Member.new "Alpha"
    bravo = Member.new "Bravo"
    charlie = Member.new "Charlie"
    delta = Member.new "Delta"
    # posts
    help_wanted = Post.new alpha, "Help Wanted", "Can you help me?"
    bike_for_sale = Post.new bravo, "Bike for Sale", "Only $50!"
    ride_needed = Post.new charlie, "Ride needed", "Can someone give me a ride to the doctor?"
    looking_for_love = Post.new alpha, "ISO true <3", "Sweep me off my feet!"
    # comments
    Comment.new alpha, ride_needed, "I can drive you."
    Comment.new charlie, bike_for_sale, "Interested!"
    Comment.new delta, bike_for_sale, "Would you take $40?"
    Comment.new delta, help_wanted, "I'm great at helping!"
end   

def display_menu #prob better to have a menu class to take care of menu ops?  consider on refactor
    puts "****"
    puts "Hi! Welcome to Maslowe's Bridge, Retro Chic Edition!  Here is what you can do!"    
    puts "1. Create a new member" # / post / comment"
    puts "2. List all members" # / posts/ comments"
    puts "3. Verify a member"
    puts "4. Create a new post"
    puts "5. List all posts"
    puts "6. List all posts with comments"
    puts "7. Create a new comment"
    puts "Type exit to quit"
end

### member methods

def prompt_member #displays the prompt and gets the input
    puts "Enter the name of the member"
    gets.strip
end

def prompt_post #displays the prompt and gets the input
    puts "Enter the name of the post"
    gets.strip
end

def make_member #creates a new member and then outputs a formatted string 
    new_member = Member.new(prompt_member)
    new_member.output
end

def verify_member # changes the member status from verified to unverified. should this be a class method? conside at refactor
    member = Member.find_member_by_name(prompt_member)
    if member
         member.verify
         member.output
    else
         puts "Sorry, I couldn't find a member with that name"  #not very DRY, def fix on refactor
    end    
end   

## post methods

def make_post  #
    member = Member.find_member_by_name(prompt_member) #asks for a member name, then check if the member exists
    if member
        title = (print 'Title: '; gets.rstrip)
        description = (print 'Description: '; gets.rstrip)  
        new_post = Post.new member, title, description
        new_post.output
    else
        puts "Sorry, I couldn't find a member with that name"
    end     
end

def display_posts_with_comments  # can I be forgived for these eaches?  Or is there a better way?
    Post.all.each do |post|
        post.output
        Comment.all.each do |comment|
            if comment.post == post
                comment.output
            end
        end
        puts " \n"        
    end 
end

## comment methods

def make_comment  #
    member = Member.find_member_by_name(prompt_member) #asks for a member name, then check if the member exists
    if !member
        member = Member.find_post_by_title title
    else
        puts "Member found"
        post = Post.find_post_by_title(prompt_post)
        if !post
            puts "Sorry I can't find a post with that title"
        else    
            puts "Post found"
            content = (print 'Enter your comment: '; gets.rstrip)  
            new_comment = Comment.new member, post, content
            new_comment.output
        end    
    end     
end


## runner

def runner # maybe write a menu class and a menu handler, bc this is going to get old fast!
  build_seeds
  # binding.pry
  menu_choice = ''   
  until menu_choice == 'exit'
    display_menu
    menu_choice = gets.chomp
    case menu_choice
    when '1'
        make_member
    when '2'
        Member.output_all
    when '3'
        verify_member
    when '4'
        make_post
    when '5'
        Post.output_all
    when '6'
        display_posts_with_comments
    when '7'
        make_comment                             
    when ! 'exit'
        puts "*** try again! ***"        
    end
  end
  puts 'Goodbye!'
end 