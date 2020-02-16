require 'pry'
class Application

@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/testing/)
    resp.write("Route not found")
    resp.status = 404

    elsif req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_name}
      return item.price
      binding.pry
    elsif req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name != item_name}
        resp.write("Item not found")
        resp.status = 400
    end

    resp.finish
  end
end
