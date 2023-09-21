# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/activestorage", to: "activestorage.esm.js"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.8/src/index.js"
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.52.0/dist/index.js"
pin "@floating-ui/dom", to: "https://ga.jspm.io/npm:@floating-ui/dom@1.5.3/dist/floating-ui.dom.mjs"
pin "@floating-ui/core", to: "https://ga.jspm.io/npm:@floating-ui/core@1.5.0/dist/floating-ui.core.mjs"
pin "@floating-ui/utils", to: "https://ga.jspm.io/npm:@floating-ui/utils@0.1.4/dist/floating-ui.utils.mjs"
pin "@floating-ui/utils/dom", to: "https://ga.jspm.io/npm:@floating-ui/utils@0.1.4/dom/dist/floating-ui.utils.dom.mjs"
