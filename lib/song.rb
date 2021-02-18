require 'pry'
class Song
    attr_accessor :name, :artist     #sets the artist object to belong to the song

    @@all = []                  #step 1: returns all existing song instances

    def initialize(name)
        @name = name
        @@all << self          # step 2: returns all existing song instances

    end

    def self.all               #step 3: return all existing song instances
        @@all
    end

    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = self.new(split_name[1])
        artist = Artist.find_or_create_by_name(split_name[0])
        song.artist = artist
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


end