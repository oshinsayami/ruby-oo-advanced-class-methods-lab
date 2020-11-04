class Song
  attr_accessor :name, :artist_name
  @@all = []

  

  def self.create
    c = self.new
    c.save
    c
    
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(song)
    c=self.new
    c.name = song
    c
  end

  def self.create_by_name(song)
    c = self.new
    c.name = song
    c.save
    c
  end
  
  def self.find_by_name(name)
    @@all.detect{|s| s.name == name}
  end 

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      return result
    else
      self.create_by_name(name)
    end
    

  end

  def self.alphabetical
    sorted_song = self.all.sort_by {|song| song.name}
    sorted_song
  end

  def self.new_from_filename(filename)
    song_array= filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song= self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  def self.create_from_filename(filename)
    result= self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
  end

  def self.destroy_all
    self.all.clear
  end


end
