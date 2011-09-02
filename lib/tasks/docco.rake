desc "Generate docco documentation"
task :docco do
  extensions = ENV['EXT'] || "coffee"
  pattern = "app/assets/**/*.{#{extensions}}"
  `docco #{Dir[pattern].join ' '}`
end