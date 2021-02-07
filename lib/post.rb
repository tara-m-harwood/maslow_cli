class Post

    attr_reader :created_date, :author
    attr_accessor :title, :description, :category, :hidden

    @@all=[]

    def initialize author, title, description, category="uncategorized"
        @author=author #every post can have only 1 author
        @title=title
        @description=description
        @category=category
        @hidden=false         
        @created_date=Time.now
        @@all << self 
    end

    def output
        puts "Author: #{self.author.name}, Title: #{self.title}, Description: #{self.description}, Date: #{self.created_date.strftime("%Y-%m-%d")} "
    end

    def self.all
        @@all
    end
    
    def self.find_post_by_title title
        all.find { |post| post.title==title }
    end
    
    def self.output_all
        all.each { |post| post.output } 
    end

end