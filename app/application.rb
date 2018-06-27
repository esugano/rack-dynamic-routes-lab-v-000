require 'pry'

class Application
  @@items = []

  def call(env)
    resp =Rack::Response.new
    req = Rack::Request.new(env)

    #if /items/<ITEM NAME> route
    if req.path.match("/items/")
      #get item name
      item_name = req.path.split("/items/").last
      #see if item exists
      item_find = Item.all.find{|i| i.name == item_name}

      #if items exists, return its price
      if item_find != nil
       resp.write item_find.price
      #else return 400
      else
        resp.status = 400
        resp.write "Item not found"
      end
      
    #all other paths that are not /items/<ITEM NAME> are 404 pages
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish

  end #ends #calls
end #ends class
