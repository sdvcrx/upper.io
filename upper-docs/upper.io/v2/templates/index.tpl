<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <link href="//fonts.googleapis.com/css?family=Raleway:500,700|Source+Serif+Pro:400,700|Source+Code+Pro:400,600" rel="stylesheet" type="text/css" />

    <link href="//demo.upper.io/static/example.css" rel="stylesheet" type="text/css" />
    <link href="//demo.upper.io/static/codemirror.css" rel="stylesheet" type="text/css" />

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

    <script src="//demo.upper.io/static/playground-full.js"></script>
    <script src="//demo.upper.io/static/snippets.js"></script>

    <link href="{{ asset "/css/style.css" }}" rel="stylesheet" />
    <link href="{{ asset "/css/syntax.css" }}" rel="stylesheet">
    <link href="{{ asset "/css/play.css" }}" rel="stylesheet">
    <title>
      {{ if .IsHome }}
        {{ setting "page/head/title" }}
      {{ else }}
        {{ if .Title }}
          {{ .Title }} {{ if setting "page/head/title" }} &middot; {{ setting "page/head/title" }} {{ end }}
        {{ else }}
          {{ setting "page/head/title" }}
        {{ end }}
      {{ end }}
    </title>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{ asset "/apple-touch-icon-precomposed.png" }}">
    <link rel="shortcut icon" href="{{ asset "/favicon.ico"}}">

    <!-- Code highlighting -->
    <link rel="stylesheet" href="//menteslibres.net/static/highlightjs/styles/default.css?v0000">
    <script src="//menteslibres.net/static/highlightjs/highlight.pack.js?v0000"></script>
    <script>hljs.initHighlightingOnLoad();</script>

    <script>
    goPlaygroundOptions({
      'shareRedirect': 'https://demo.upper.io/p/',
      'shareURL': 'https://demo.upper.io/share',
      'compileURL': 'https://demo.upper.io/compile',
      'fmtURL': 'https://demo.upper.io/fmt',
      'shareOpenNewWindow': true
    });
    </script>

    <script src="{{asset "/js/main.js"}}"></script>
  </head>

  <body>
    <header class="main-header">
      <nav class="nav--main">
        <div class="nav--sections">
          {{ if .BreadCrumb }}
            <ul class="breadcrumb">
              {{ range .BreadCrumb }}
                <li><a href="{{ asset .link }}">{{ .text }}</a></li>
              {{ end }}
            </ul>
          {{ end }}
        </div>
        <div class="nav--adapters">
          <span class="nav__trigger--adapters" id="adapters-menu-trigger">tools</span>
          <ul id="adapters-menu">
            <li>{{ anchor "/postgresql" "PostgreSQL" }}</li>
            <li>{{ anchor "/mysql" "MySQL" }}</li>
            <li>{{ anchor "/sqlite" "SQLite" }}</li>
            <li>{{ anchor "/ql" "QL" }}</li>
            <li>{{ anchor "/mongo" "MongoDB" }}</li>
            <li>{{ anchor "/lib/sqlbuilder" "SQL Builder" }}</li>
            <li><a href="/db.v1">db.v1</a></li>
          </ul>
        </div>
      </nav>
      {{ if not (.URLMatch "^/.+") }}
        <div class="hero">
          <div class="container">
            <img class="hero__background" src="{{ asset "/images/city.svg" }}" />
            <div class="hero__info">
              <img class="hero__gopher" src="{{ asset "/images/gopher.svg" }}" />
              <h1 class="hero__title">
                <a href="{{ asset "/" }}">
                  <img src="{{ asset "/images/logo.svg" }}" />
                  <span>upper.io/db</span>
                </a>
              </h1>
              <p class="hero__description">It's not an ORM, just a productive data access layer for Go</p>
            </div>
            <div class="github">
              <a class="github__icon" target="_blank" href="https://github.com/upper/db">Check out the code at Github</a>
            </div>
            <p class="pressly text-center hidden-extra-small">Proudly sponsored by
              <a href="https://www.pressly.com" target="_blank"><img width="150" class="vertical-middle logo-pressly" src="{{ asset "images/pressly-logo.svg?1" }}" /></a>
            </p>
          </div>
        </div>
      {{ end }}
    </header>
    <main>

        {{ if (.URLMatch "^/.+") }}
          {{ if .Content }}
            <nav class="sections__nav">
              <div class="nav__trigger--sections__nav" id="sections-menu-trigger">Index</div>
              <div class="sections__nav__block" id="sections-menu">
                <h2 class="sections__nav__title">
                  {{ range .GetTitlesFromLevel 0 }}
                    <a href="{{ .url }}">{{ .text }}</a>
                  {{ end }}
                </h2>
                <ul>
                {{ range .GetTitlesFromLevel 1 }}
                  <li><a href="{{ .url }}">{{ .text }}</a></li>
                {{ end }}
                </ul>
              </div>
            </nav>
            <article>
          {{ end }}
        {{ end }}

        <div class="container">
          {{ if eq .CurrentPage.URL "/" }}
            <div class="features grid-3">
              <div class="feature">
                <h2 class="feature__title">{{ anchor "/getting-started" "Get started" }}</h2>
                <p class="feature__description">
                  If you're new you can {{ anchor "/getting-started" "start here"}}
                  to read an intro and <b>learn the basics</b>.
                </p>
                <a href="{{ asset "/examples" }}" class="hidden">
                  <img class="feature__icon" src="{{ asset "images/figure-01.svg" }}" />
                </a>
              </div>
              <div class="feature">
                <h2 class="feature__title">{{ anchor "/examples" "Play" }}</h2>
                <p class="feature__description">
                  Learn {{ anchor "/examples" "common patterns" }}
                  and practise with <b>live examples</b>.
                </p>
                <a href="{{ asset "/examples" }}" class="hidden">
                  <img class="feature__icon" src="{{ asset "images/figure-02.svg" }}" />
                </a>
              </div>
              <div class="feature">
                <h2 class="feature__title">{{ anchor "/contribute" "Contribute" }}</h2>
                <p class="feature__description">
                  Get your hands dirty and {{ anchor "/contribute" "contribute" }}
                  with <b>code</b>, <b>examples</b> and <b>documentation</b>.
                </p>
                <a href="{{ asset "/examples" }}" class="hidden">
                  <img class="feature__icon" src="{{ asset "images/figure-03.svg" }}" />
                </a>
              </div>
            </div>
						<h2>Key features</h2>
            <ul>
              <li>Maps query results into Go structs</li>
              <li>Lets you use plain SQL when you need to</li>
              <li>Provides an (optional) set-oriented syntax that works the same on SQL and NoSQL databases</li>
              <li>Easy syntax for transactions</li>
              <li>That's all!</li>
            </ul>
            <h2>Try it!</h2>
            The box below is a <b>live demo</b>, you can modify and run
            read-only queries directly from your browser! Give it a try.
            <textarea class="go-playground-snippet" data-expanded="1" data-title="Live example: Retrieve a list of books">{{ include "webroot/examples/find-map-all-books/main.go" }}</textarea>
          {{ else }}

            {{ if .Content }}
              {{ .ContentHeader }}
              {{ .Content }}
              {{ .ContentFooter }}
            {{end}}

            {{ if setting "page/body/copyright" }}
              <p>{{ setting "page/body/copyright" | htmltext }}</p>
            {{ end }}

          {{ end }}
        </div>
    </main>
    <script src="{{ asset "/js/app.js" }}"></script>
    {{ if setting "page/body/scripts/footer" }}
      <script type="text/javascript">
        {{ setting "page/body/scripts/footer" | jstext }}
      </script>
    {{ end }}
  </body>
</html>
