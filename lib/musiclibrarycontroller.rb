class MusicLibraryController

  def initialize(path='./db/mp3s')
    @new_music_library = MusicImporter.new(path)
    @new_music_library.import
  end

  def list_songs
    list_of_files = @new_music_library.files.collect { |file| file.split(" - ") }
    alphabetised_list = list_of_files.sort { |a, b| a[1]<=>b[1] }
    list_to_print = alphabetised_list.collect { |song| song.join(" - ") }
    list_to_print.each_with_index do |song, index|
      song = song.chomp(".mp3")
      puts "#{index + 1}. #{song}"
    end
  end

  def list_artists
    list_of_files = @new_music_library.files.collect { |file| file.split(" - ") }
    list_of_artists = list_of_files.collect { |array| array[0] }
    list_of_artists.sort!.uniq 
    list_of_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist}"
    end
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    if input == "exit"
    else
      call
    end
  end

end
