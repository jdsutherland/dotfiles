Pry.editor = 'nvim'

Pry.commands.rename_command 'b', 'break' if Pry.commands.valid_command?('break')
Pry.commands.rename_command 'c', 'continue' if Pry.commands.valid_command?('continue')
Pry.commands.rename_command 's', 'step' if Pry.commands.valid_command?('step')
Pry.commands.rename_command 'n', 'next' if Pry.commands.valid_command?('next')
Pry.commands.rename_command 'f', 'finish' if Pry.commands.valid_command?('finish')

Pry.commands.alias_command 'r', 'reload-code' rescue nil
Pry.commands.alias_command 'w', 'whereami' rescue nil
Pry.commands.alias_command 'bt', 'pry-backtrace' rescue nil
Pry.commands.alias_command 'll', 'ls -l' rescue nil
Pry.commands.alias_command 'h', 'help' rescue nil
Pry.commands.alias_command 'vi', 'edit'

Pry.config.color = true

# === CUSTOM PROMPT ===
# This prompt shows the ruby version
Pry.config.prompt = Pry::Prompt.new(
  'custom',
  'my custom prompt',
  [
    proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} ❯ " },
    proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
  ],
)

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
  # AmazingPrint.pry! NOTE: commented out because it doesn't use Pry's paging

  # TODO: doesn't work
  # require 'pry-editline'
  Gem.path.each do |gemset|
    $:.concat(Dir.glob("#{gemset}/gems/pry-*/lib"))
  end if defined?(Bundler)
  $:.uniq!
rescue LoadError => err
  puts err
end

# https://thoughtbot.com/upcase/videos/managing-production-applications {{{
if defined? Rails
  __color_escape_codes = {
    black: "\033[0;30m",
    red: "\033[0;31m",
    green: "\033[0;32m",
    yellow: "\033[0;33m",
    blue: "\033[0;34m",
    purple: "\033[0;35m",
    cyan: "\033[0;36m",
    reset: "\033[0;0m"
  }
  __env_colors = {
    "development" => __color_escape_codes[:white],
    "test"        => __color_escape_codes[:purple],
    "staging"     => __color_escape_codes[:yellow],
    "production"  => __color_escape_codes[:red],
  }
  __color = __env_colors.fetch(Rails.env, __color_escape_codes[:reset])
  __colored_environment_name = "#{__color}#{Rails.env}#{__color_escape_codes[:reset]}"

  Pry.config.prompt = Pry::Prompt.new(
    'custom rails',
    'rails prompt',
    [
      proc { |obj, nest_level, _| "(#{__colored_environment_name}) #{obj}:#{nest_level}> " }
    ],
  )
end
# }}}


# {{{ TODO: try https://github.com/lululau/dot_files/blob/b40a763d99ebe30a633ead2df863bc076b007694/.pryrc
def tt(data)
  data.tt
end

def ttl(data)
  data.ttl
end

class Array
  def tt
    unless defined? Terminal::Table
      $:.concat(["unicode-display_width-1.1.1", "terminal-table-1.7.3"].map { |e| File.expand_path("~/.rvm/gems/ruby-#{RUBY_VERSION}/gems/#{e}/lib") })
      require 'terminal-table'
    end
    puts
    if Array === first
      puts Terminal::Table.new rows: self
    elsif Hash === first
      puts Terminal::Table.new rows: map { |e| e.values }, headings: first.keys
    else
      puts Terminal::Table.new rows: [self]
    end
  end

  def ttl
    map { |e| [e] }.tt
  end
end

class Hash
  def tt
    [self].tt
  end

  def ttl
    to_a.tt
  end
end

class Pry::Command::Ls::LocalVars
  def colorized_assignment_style(lhs, rhs, desired_width = 7)
    colorized_lhs = color(:local_var, lhs)
    color_escape_padding = colorized_lhs.to_s.size - lhs.to_s.size
    pad = desired_width + color_escape_padding
    "%-#{pad}s = %s" % [color(:local_var, colorized_lhs), rhs]
  end
end
# }}}

default_command_set = Pry::CommandSet.new do
  command "copy", "Copy argument to the clip-board" do |str|
     IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  command "sql", "Send sql over AR." do |query|
    if ENV['RAILS_ENV'] || defined?(Rails)
      pp ActiveRecord::Base.connection.select_all(query)
    else
      pp "Pry did not require the environment, try `pconsole`"
    end
  end
  command "caller_method" do |depth|
    depth = depth.to_i || 1
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
      file   = Regexp.last_match[1]
      line   = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      output.puts [file, line, method]
    end
  end
end
Pry.config.commands.import default_command_set

# === CONVENIENCE METHODS ===
# Stolen from https://gist.github.com/807492
# Use Array.toy or Hash.toy to get an array or hash to play with
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

def find_user(email)
  User.find_by_email(email)
end
