class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create (name, artist_name)
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    @@all << self
    song
  end

end
