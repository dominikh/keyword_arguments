# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{keyword_arguments}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominik Honnef"]
  s.cert_chain = ["/home/dominikh/.rubyforge/gem-public_cert.pem"]
  s.date = %q{2009-07-25}
  s.description = %q{named_arguments comes with a bunch of convenient methods for making "named arguments" (hashes as method arguments) in Ruby less painfull}
  s.email = %q{dominikho@gmx.net}
  s.extra_rdoc_files = ["README.markdown", "CHANGELOG", "LICENSE", "lib/keyword_arguments.rb"]
  s.files = ["Rakefile", "README.markdown", "CHANGELOG", "LICENSE", "test/test_module.rb", "Manifest", "lib/keyword_arguments.rb", "keyword_arguments.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://keywordargs.rubyforge.org/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Keyword_arguments", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0")
  s.rubyforge_project = %q{keywordargs}
  s.rubygems_version = %q{1.3.1}
  s.signing_key = %q{/home/dominikh/.rubyforge/gem-private_key.pem}
  s.summary = %q{named_arguments comes with a bunch of convenient methods for making "named arguments" (hashes as method arguments) in Ruby less painfull}
  s.test_files = ["test/test_module.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
