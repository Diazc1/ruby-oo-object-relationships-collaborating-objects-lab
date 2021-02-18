class MP3Importer

    attr_reader :path

    def initialize(path)     #accepts a file path to parse mp3 files from
        @path = path
    end

    def files
        Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
    end

    def import
        files.each {|f| Song.new_by_filename(f)}
    end



end