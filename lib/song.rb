class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name (name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name (name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name (name)
      return self.find_by_name (name)
    else self.create_by_name (name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    song = Song.new
    filename_array = filename.chomp(".mp3").split(" - ")
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end

  def self.create_from_filename (filename)
    song = self.create
    filename_array = filename.chomp(".mp3").split(" - ")
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
  end

  def self.destroy_all
    self.all.clear
  end

end
