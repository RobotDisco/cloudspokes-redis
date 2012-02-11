require 'rake'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format progress"
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList['spec/*_spec.rb']
end

namespace :vmc do
    desc "update cloud foundry deployment"
    task :update => [:bundle, :spec, :features] do
        sh "vmc update #{VMC_APP_NAME}"
    end
end

