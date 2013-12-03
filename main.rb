require 'haml'

def render_file(filename)
  contents = File.read(filename)
  engine = Haml::Engine.new(contents, :escape_attrs => false)
  engine.render(Object.new)
end

puts render_file('haml/index.haml')
