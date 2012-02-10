require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format progress"
end

namespace :vmc do
    desc "update cloud foundry deployment"
    task :update => [:bundle, :spec, :features] do
        sh "vmc update #{VMC_APP_NAME}"
    end
end

