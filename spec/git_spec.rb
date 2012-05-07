$:.push File.expand_path("../../lib", __FILE__)
require "git-flattr"

github_urls = [
  "git@github.com:kallux/5defence.git",
  "https://simon@github.com/kallux/5defence.git",
  "git://github.com/kallux/5defence.git",
  "git@github.com:simon/git-flattr.git",
  "https://simon@github.com/simon/git-flattr.git",
  "git://github.com/simon/git-flattr.git",
  "https://github.com/voxpelli/jquery-alterbyobject.git",
  "git://github.com/voxpelli/jquery-alterbyobject.git",
  "git@github.com:simon/colorful_json.git",
  "https://simon@github.com/simon/colorful_json.git",
  "git://github.com/simon/colorful_json.git",
  "https://github.com/Ask11/backbone.offline.git",
  "git://github.com/Ask11/backbone.offline.git"
]

describe Git, '#github_repo?' do
  it "returns true for all github urls" do
    github_urls.each { |url|
      Git.github_repo?(url).should be_true
    }
  end
end
