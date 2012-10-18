require "erb"

Submodule = Struct.new(:name, :url) do
  def path
    "bundle/#{name}"
  end
end

submodules = Array.new

submodules << Submodule.new("ack", "git://github.com/mileszs/ack.vim.git")
submodules << Submodule.new("base16", "git://github.com/chriskempson/base16-vim.git")
submodules << Submodule.new("coffee-script", "git://github.com/kchmck/vim-coffee-script.git")
submodules << Submodule.new("commentary", "git://github.com/tpope/vim-commentary.git")
submodules << Submodule.new("ctrlp", "git://github.com/kien/ctrlp.vim.git")
submodules << Submodule.new("cucumber", "git://github.com/tpope/vim-cucumber.git")
submodules << Submodule.new("easymotion", "git://github.com/Lokaltog/vim-easymotion.git")
submodules << Submodule.new("endwise", "git://github.com/tpope/vim-endwise.git")
submodules << Submodule.new("eunuch", "git://github.com/tpope/vim-eunuch.git")
submodules << Submodule.new("fugitive", "git://github.com/tpope/vim-fugitive.git")
submodules << Submodule.new("gundo", "git://github.com/sjl/gundo.vim.git")
submodules << Submodule.new("haml", "git://github.com/tpope/vim-haml.git")
submodules << Submodule.new("html5", "git://github.com/othree/html5.vim.git")
submodules << Submodule.new("jade", "git://github.com/digitaltoad/vim-jade.git")
submodules << Submodule.new("javascript", "git://github.com/pangloss/vim-javascript.git")
submodules << Submodule.new("json", "git://github.com/leshill/vim-json.git")
submodules << Submodule.new("latex-suite", "git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex")
submodules << Submodule.new("markdown", "git://github.com/tpope/vim-markdown.git")
submodules << Submodule.new("mirah", "git://github.com/Neurogami/mirah-vim.git")
submodules << Submodule.new("moonscript", "git://github.com/leafo/moonscript-vim.git")
submodules << Submodule.new("mustache", "git://github.com/juvenn/mustache.vim.git")
submodules << Submodule.new("nerdtree", "git://github.com/scrooloose/nerdtree.git")
submodules << Submodule.new("powerline", "git://github.com/Lokaltog/vim-powerline.git")
submodules << Submodule.new("rails", "git://github.com/tpope/vim-rails.git")
submodules << Submodule.new("rake", "git://github.com/tpope/vim-rake.git")
submodules << Submodule.new("repeat", "git://github.com/tpope/vim-repeat.git")
submodules << Submodule.new("rspec", "git://github.com/taq/vim-rspec.git")
submodules << Submodule.new("ruby", "git://github.com/vim-ruby/vim-ruby.git")
submodules << Submodule.new("ruby-minitest", "git://github.com/sunaku/vim-ruby-minitest.git")
submodules << Submodule.new("sparkup", "git://github.com/kogakure/vim-sparkup.git")
submodules << Submodule.new("speeddating", "git://github.com/tpope/vim-speeddating.git")
submodules << Submodule.new("strftimedammit", "git://github.com/sjl/strftimedammit.vim")
submodules << Submodule.new("surround", "git://github.com/tpope/vim-surround.git")
submodules << Submodule.new("syntastic", "git://github.com/scrooloose/syntastic.git")
submodules << Submodule.new("textobj-entire", "git://github.com/kana/vim-textobj-entire.git")
submodules << Submodule.new("textobj-indent", "git://github.com/kana/vim-textobj-indent.git")
submodules << Submodule.new("textobj-lastpat", "git://github.com/kana/vim-textobj-lastpat.git")
submodules << Submodule.new("textobj-rubyblock", "git://github.com/nelstrom/vim-textobj-rubyblock.git")
submodules << Submodule.new("textobj-user", "git://github.com/kana/vim-textobj-user.git")
submodules << Submodule.new("threesome", "git://github.com/sjl/threesome.vim.git")
submodules << Submodule.new("unimpaired", "git://github.com/tpope/vim-unimpaired.git")

submodules.each do |sub|
  `git submodule add #{sub.url} #{sub.path}`
end
#gitmodules = ERB.new(File.read("./gitmodules.erb"))
#hgsub = ERB.new(File.read("./hgsub.erb"))
#File.write "./.gitmodules", gitmodules.result(binding)
#File.write "./.hgsub", gitmodules.result(binding)
