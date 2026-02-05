require "bundler"

# Charge les gems définies dans le Gemfile (colorize, etc.)
Bundler.require

# Ajoute le dossier lib/ dans le chemin de chargement
$LOAD_PATH.unshift(File.expand_path("lib", __dir__))

require "application"

Application.new.perform
