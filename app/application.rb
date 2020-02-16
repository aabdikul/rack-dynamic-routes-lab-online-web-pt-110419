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
      resp.write item.price
    elsif req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @@items.include?(item_name) == false
        resp.write("Item not found")
        resp.status = 400
      end
    end

    resp.finish
  end

end
