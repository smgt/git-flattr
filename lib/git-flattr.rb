require 'version'
require 'flattr'
require 'launchy'

def error message
  puts "Error: #{message}"
  exit 1
end

class Git
  class <<self
    def command cmd, opts = []
      opts = [opts].flatten.map {|s| escape(s) }.join(' ')
      git_cmd = "git #{cmd} #{opts} 2>&1"
      result = `#{git_cmd}`.chomp
      if $?.to_i == 0
        return result
      else
        return false
      end
    end

    def escape(s)
      escaped = s.to_s.gsub('\'', '\'\\\'\'')
      %Q{"#{escaped}"}
    end

    def config name
      command('config', ['--get', name])
    end

    def set_config name, value
      command('config', ['--global', '--add', name, value])
    end

    def current_repo_github?
      origin = config 'remote.origin.url'
      github_repo? origin
    end

    def commit sha
      #git log -1 --format=%H 53bebbe
      command("log", ["-1", "--format=%H", sha])
    end

    def github_url
      origin = config 'remote.origin.url'
      if github_repo? origin
        return @github_url
      end
    end

    def github_repo? url

      if url.match %r{^https://[\w-]+@github\.com}
        match = url.match(%r{^https://[\w-]+@github\.com/([\w-]+)/([\w-.]+)\.git$})
      elsif url.match %r{^git@github\.com:}
        match = url.match(%r{^git@github\.com:([\w-]+)/([\w-.]+)\.git$})
      elsif url.match %r{^git://github\.com/}
        match = url.match(%r{^git://github\.com/([\w-]+)/([\w-.]+)\.git$})
      elsif url.match %r{^https://github\.com/}
        match = url.match(%r{^https://github\.com/([\w-]+)/([\w-.]+)\.git$})
      end

      if !match.nil?
        @github_url = "https://github.com/#{match[1]}/#{match[2]}"
        return true
      else
        @github_url = nil
        return false
      end
    end

    def valid?

      git_opts = {
        :dir    => "#{Dir.pwd}/.git",
        :config => "#{Dir.pwd}/.git/config"
      }

      unless File.exists?(git_opts[:dir])
        error "Don't seem to be a git repository"
      end

      unless File.exists?(git_opts[:config])
        error "Git .config file not found"
      end

      unless Git.current_repo_github?
        error "Not a GitHub repository"
      end
    end
  end
end

module Auth
  class <<self
    def is_authed?
      Git.config('flattr.token') != ""
    end

    def do!
      begin
        Launchy.open("https://git-flattr.herokuapp.com/")
        token = ask("Token: ")
      rescue Exception => e
        puts e.message
        puts "Seems like you are missing a Flattr access token."
        puts "Browse to http://git-flattr.herokuapp.com and follow the instructions"
        token = ask("Token: ")
      end
      if token.nil?
        error "Invalid access token"
      end

      Git.set_config "flattr.token", token.chomp
    end
  end
end
