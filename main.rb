require 'haml'

class ImporterScope
  def initialize(filename)
    @filename = filename
  end

  def import(path)
    dirname = File.dirname(@filename)
    render_file("#{dirname}/#{path}.haml")
  end
end

def render_file(filename)
  contents = File.read(filename)
  engine = Haml::Engine.new(contents,:escape_attrs => false
)
  scope = ImporterScope.new(filename)
  engine.render(scope)
end

puts render_file('haml/index.haml')
