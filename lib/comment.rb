class Comment

    attr_reader :created_date, :commenter, :post
    attr_accessor :content, :hidden

    @@all=[]

    def initialize commenter, post, content
        @commenter=commenter #every comment must have 1 and only 1 commenter (member)
        @post=post #every comment must have 1 and only 1 post
        @content=content
        @hidden=false
        @created_date=Time.now 
        @@all << self 
    end

    def output
        puts "----> Commenter: #{self.commenter.name}: #{self.content}, Date: #{self.created_date.strftime("%Y-%m-%d")} "
    end

    def self.all
        @@all
    end
    
end