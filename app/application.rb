require 'pry'

class Application

  def call(env)
    resp =Rack::Response.new
    req = Rack::Request.new(env)
    #if /items/<ITEM NAME> route
    if req.path=="/items"
      #get item name
      item_name = req.path.split("/items/").last
      #see if item exists
      item_find = Item.all.find{|i| i.name == item_name}
      #if items exists, return its price
      if req.path.match("/items/#{item_name}")
                  binding.pry
      #if item doesn't exists, return a 400 page
      # else
      #   resp.status = 400
      #   resp.write "Item not found"
      end
    #all other paths that are not /items/<ITEM NAME> are 404 pages
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish

  end #ends #calls
end #ends class
