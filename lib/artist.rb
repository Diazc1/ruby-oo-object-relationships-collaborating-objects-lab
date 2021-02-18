class Artist

    attr_accessor :name, :song

    @@all = []              #class variable// #part 1:returns all existing artist instances [.all]


    def initialize(name)    #accepts a name for the artist 
        @name = name        #sets the artist name
        @@all << self       #part 2:returns all existing artist instances [.all]
    end

    def self.all
        @@all               #part 3:returns all existing artist instances [.all]
    end

    def songs
        Song.all.select { |song| song.artist == self}   #list all songs that belong to the artist 
    end

    def add_song(song)
        song.artist = self    #keeps track of artist's songs
    end

    def self.find_or_create_by_name(name)                       #always returns an Artist instance
        self.find(name) ? self.find(name) : self.new(name)      
    end

    def self.find(name)
        self.all.find { |artist| artist.name == name }
    end

    def print_songs
        songs.each { |song| puts song.name }    #list all of the artist's songs
    end



end