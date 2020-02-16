class Application

@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name}
      resp.write item.price

    elsif req.path.match(/items/)
        item_name = req.path.split("/items/").last
        if @@items.exclude?(item_name)
        resp.write("Item not found")
      end

    elsif req.path.match(/testing/)
      resp.write("Route not found")
      resp.status = 404
    end
    resp.finish

  end

end
