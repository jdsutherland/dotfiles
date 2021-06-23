# === EDITOR ===
Pry.editor = 'nvim'

# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil
Pry.commands.alias_command 'r', 'reload-code' rescue nil
Pry.commands.alias_command 'w', 'whereami' rescue nil
Pry.commands.alias_command 'bt', 'pry-backtrace' rescue nil
Pry.commands.alias_command 'll', 'ls -l' rescue nil
Pry.commands.alias_command 'fin', 'finish' rescue nil

Pry.config.color = true
# Pry.config.theme = "solarized"

# === CUSTOM PROMPT ===
# This prompt shows the ruby version (useful for RVM)
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]


Pry.config.ls.separator = "\n"
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# == PLUGINS ===
# amazing_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for amazing_print
begin
  require 'rubygems'
  require 'amazing_print'
  Gem.path.each do |gemset|
    $:.concat(Dir.glob("#{gemset}/gems/pry-*/lib"))
  end if defined?(Bundler)
  $:.uniq!
  # The following line enables amazing_print for all pry output,
  # and it also enables paging
  Pry.config.print = proc {|output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)}

  # If you want amazing_print without automatic pagination, use the line below
  # Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "gem install amazing_print  # <-- highly recommended"
end
