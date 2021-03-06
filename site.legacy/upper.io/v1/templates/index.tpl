<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en-us">

  <head>
    <link href="http://gmpg.org/xfn/11" rel="profile">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">

    <!-- Enable responsiveness on mobile devices-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

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

    <!-- CSS -->
    <link rel="stylesheet" href="{{ asset "/css/poole.css" }}">
    <link rel="stylesheet" href="{{ asset "/css/syntax.css" }}">
    <link rel="stylesheet" href="{{ asset "/css/hyde.css" }}">
    <link rel="stylesheet" href="{{ asset "/css/upper.css" }}">

    <!-- External fonts -->
    <link href="//fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400italic,400,600,700|Abril+Fatface" rel="stylesheet" type="text/css">

    <!-- Icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{ asset "/apple-touch-icon-precomposed.png" }}">
    <link rel="shortcut icon" href="{{ asset "/favicon.ico"}}">

    <!-- Code highlighting -->
    <link rel="stylesheet" href="//menteslibres.net/static/highlightjs/styles/default.css?v0000">
    <script src="//menteslibres.net/static/highlightjs/highlight.pack.js?v0000"></script>
    <script>hljs.initHighlightingOnLoad();</script>

    <!-- Luminos -->
    <link rel="stylesheet" href="{{ asset "/css/luminos.css" }}">
    <script src="{{asset "js/main.js"}}"></script>
  </head>

  <body>

    <!-- sidebar -->
    <div class="sidebar">

      <div class="container">

        {{ if settings "page/body/menu_pull" }}
          <ul class="nav nav-tabs">
          {{ range settings "page/body/menu_pull" }}
            <li><a href="{{ .link }}">{{ .text }}</a></li>
          {{ end }}
          </ul>
        {{ end }}

        <div class="sidebar-about">
          <div class="logo">
            <a href="{{ asset "/" }}">
              <img src="{{ asset "images/icon.svg" }}" width="128" height="128" title="The upper.io icon is based on an original icon by Freepik, licensed under Creative Commons BY 3.0" />
            </a>
          </div>
          <h1>
            <a href="{{ asset "/" }}">
              {{ setting "page/brand" }}
            </a>
          </h1>
          <p class="lead">{{ setting "page/body/title" }}</p>
        </div>

        <nav class="sidebar-nav">
          {{ range settings "page/body/menu" }}
            <a class="sidebar-nav-item" href="{{ .link }}">{{ .text }}</a>
          {{ end }}
        </nav>
      </div>
    </div>

    <div class="content container">

      {{ if not .IsHome }}
        {{ if .BreadCrumb }}
          <ul class="breadcrumb">
            {{ range .BreadCrumb }}
              <li><a href="{{ asset .link }}">{{ .text }}</a></li>
            {{ end }}
          </ul>
        {{ end }}
      {{ end }}

      {{ if .Content }}

        {{ .ContentHeader }}

        {{ .Content }}

        {{ .ContentFooter }}

      {{ else }}

        {{ if .CurrentPage }}
          <h1>{{ .CurrentPage.text }}</h1>
        {{ end }}

        <ul>
          {{ range .SideMenu }}
            <li>
              <a href="{{ asset .link }}">{{ .text }}</a>
            </li>
          {{ end }}
        </ul>

      {{end}}

      {{ if setting "page/body/copyright" }}
        <p>{{ setting "page/body/copyright" | htmltext }}</p>
      {{ end }}

    </div>

  {{ if setting "page/body/scripts/footer" }}
    <script type="text/javascript">
      {{ setting "page/body/scripts/footer" | jstext }}
    </script>
  {{ end }}

  </body>
</html>
