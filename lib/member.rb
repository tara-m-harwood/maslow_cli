
class Member

    attr_reader :created_date
    attr_accessor :name, :social_media_url, :status

    @@all =[]

    def initialize name
        @name=name
        @created_date=Time.now
        @social_media_url=social_media_url
        @status="unverified"
        @@all << self 
    end

    # instance methods -- 'self' here refers to the instance that called the method; implied param

    def output
        puts "Username: #{self.name}, Created: #{self.created_date.strftime("%Y-%m-%d")}, Status: #{self.status} "
    end
    
    def verify
        @status = "verified"
    end    

    # class methods -- 'self' here refers to the entire class -- method defs always start with 'self', but use the 'all' array in the method code

    def self.all
        @@all
    end

    def self.output_all
        all.each { |member| member.output }
    end
    
    def self.find_member_by_name name
        found_member = all.find { |member| member.name==name }
    end    
    
end
