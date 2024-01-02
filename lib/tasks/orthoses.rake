require 'orthoses'

namespace :rbs do
  desc "build RBS to sig/orthoses"
  task :build do
    Orthoses::Builder.new do
      use Orthoses::CreateFileByName,
        depth: 1,
        to: "sig/orthoses",
        rmtree: true,
        header: "# !!! GENERATED CODE !!!"
      use Orthoses::Filter do |name, _content|
        path, _lineno = Object.const_source_location(name)
        return false unless path
        %r{app/models}.match?(path)
      end
      # use YourCustom::Middleware
      use Orthoses::Mixin
      use Orthoses::Constant
      use Orthoses::Walk,
        root: "Foo"
      run -> {
        Rails.application.eager_load!
      }
    end.call
  end
end
