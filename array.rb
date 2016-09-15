[{"poster_path"=>"/54rpZVaJ2PJ9SrqFAYqxY2YAdRB.jpg", "adult"=>false, "overview"=>"Solomon and Tummler are two teenagers killing time in Xenia, Ohio, a small town that has never recovered from the tornado that ravaged the community in the 1970s.", "release_date"=>"1997-10-17", "genre_ids"=>[18], "id"=>18415, "original_title"=>"Gummo", "original_language"=>"en", "title"=>"Gummo", "backdrop_path"=>"/9xh2m3nBZqtTaDdzVzLU7jCN5Q4.jpg", "popularity"=>1.439517, "vote_count"=>52, "video"=>false, "vote_average"=>6.55}, {"poster_path"=>"/xSJSNdSdFsFyK2oajIY6ykJmERZ.jpg", "adult"=>false, "overview"=>"\"Good Morning Everyone!\" revolves around a family involved in the punk music scene.  Aki (Kumiko Aso) is a former guitarist for a punk band. She becd gave birth to a daughter named Hatsuki (Ayaka Miyoshi). The mother and daughter live together happily, but they do have different personalities. A man named Yagu (Yo Oizumi]) then enters their life. He is an ex-member of the punk band that Aki played with. Yagu has feelings for Aki.", "release_date"=>"2012-12-15", "genre_ids"=>[18, 10751, 10402], "id"=>350786, "original_title"=>"グッモーエビアン！", "original_language"=>"ja", "title"=>"G'mor Evian!", "backdrop_path"=>"/1fdZWX9MzkD6yHDXNSAZcb1mlTp.jpg", "popularity"=>1.002056, "vote_count"=>0, "video"=>false, "vote_average"=>0}]

#===========================================================
1. You get an array of hashes from your search, and store that in @results
2. Your app errors because it's trying to do:
  @results.first.title
3. It works if we do:
  @results.first["title"]
4. but that's not the rails way, and we want to do the rails way
5. We want to process our array of hashes, to become an array of objects
6. We want to define a class that can do this:

class Search
 attr_accessor :title

 def initialize(film)
   @film_hash = film
 end

 def process_film
   @title = @film_hash["title"]
 end
end

7. And then when we get our array of hashes, we iterate over that array of hashes, and for each hash, pass it into a new Search object, and then we have something like this:

  @results = [#<Search:0x007fd01384fd60 @title = "batman">,#<Search:0x007fd01384fd60 @title = "batman returns">]

so we can do @results.each { |result| result.title } and get "batman" and  "batman returns"

8. What we've done here is create a P.O.R.O* to translate our search result into the format our rails app expects (an object which can take .title)

*PORO = plain old ruby object
