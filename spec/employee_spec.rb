require 'rails_helper'
require 'orthoses'
require 'orthoses/rails'

RSpec.describe Employee, type: :model do
  before do
    Orthoses::Builder.new do
      use Orthoses::CreateFileByName,
      base_dir: Rails.root.join('sig/rbs_rails/app/services')
      # use Orthoses::Filter do |name, _content|
      #   # binding.pry
      #   !name.to_s.match?(/^Active(Record|Storage|Support)|^Action(Controller|Cable|Dispatch|Mailer|Mailbox|Text)/)
      # end
      use Orthoses::LoadRBS, paths: Dir.glob(Rails.root.join('sig', 'rbs_rails', '**', '*.rbs').to_s)
      use Orthoses::RBSPrototypeRB,
          paths: Dir.glob(Rails.root.join('app', 'services', '**', '*.rb').to_s)
      use Orthoses::ActiveRecord::BelongsTo
      use Orthoses::ActiveRecord::HasMany
      use Orthoses::ActiveRecord::HasOne
      use Orthoses::ActiveRecord::GeneratedAttributeMethods
      use Orthoses::ActiveSupport::ClassAttribute
      use Orthoses::ActiveSupport::MattrAccessor
      use Orthoses::Constant, strict: false
      use Orthoses::Autoload
      run -> {
        Rails.application.eager_load!
      }
    end.call
  end

  it 'sample' do
    1 + 1
  end
end
