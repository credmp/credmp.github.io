+++
title = "Enhance testability with selmer"
author = ["Arjen Wiersma"]
date = 2024-10-08T19:42:00+02:00
tags = ["clojure", "development"]
draft = false
+++

This is my first article in a series called **Rock Solid Software**. In it I explore different dimensions of software that does not simply break. You can write good software in any programming language, although some are more suited to a disciplined practice then others, Clojure is definitely in the _relaxed_ space of discipline here.

Today I am exploring the use of Selmer templates in Clojure. If you have explored [Biff](https://www.biffweb.com) at all you will know that all the UI logic works by sending `Hiccup` through a handler, which will turn into HTML through `rum` (specifically the `wrap-render-rum` middleware). If you provide a vector as a result for an endpoint, it will be converted to HTML.

```clojure
;; You provide this...
[:h1 "test"]
;; => [:h1 "test"]

;; It will then be converted to HTML
(rum/render-static-markup
  [:h1 "test"])
;; => "<h1>test</h1>"
```

This is absolutely great for rapid prototyping, however it becomes quite tedious if you want to test it. The idea of testing a function is to provide it some _inputs_ and to validate if the _outputs_ match the expectation. Verifying if HTML matches an expectation, or a vector of hiccup for that matter, is quite difficult.

To increase testability I added [selmer](https://github.com/yogthos/Selmer) to my project. This separates presentation from data by having selmer render templates with a map of data. Selmer is based on Django templates, which means that it has a rich set of features, such as `extending` base templates, defining `blocks` and providing control structures such as `if` and `for` loops. A very simple template looks like this:

```html
{% extends "_layout.html" %}

{% block content %}
<article>
Hallo <b>{{name}}</b> from simple template
</article>
{% endblock %}
```

As the template extends `_layout.html`, lets take a look at that as well. I have stripped it down to the bare minimum here, but you might expect scripts, css, nav bars and many other things in the base template. The important thing here is that the `block` has the name of _content_, and our snippet above also has a `block` called _content_, the above `article` will be put inside the `main` below.

```html
<!doctype html>
<html class="no-js" lang="">
  <head>
    <title>{{title}}</title>
  </head>
  <body>
    <main id="main">
      {% block content %}
      {% endblock %}
    </main>
  </body>
</html>
```

All that is left is to provide a `middleware` that will handle the selmer return type from an endpoint. In this case a map with a `:template` and `:content` key. If both keys are inside the response, the given template will be rendered using the content map.

```clojure
(defn wrap-render-selmer [handler]
  (fn [ctx]
    (let [response (handler ctx)]
      (if (and (map? response) (every? response [:template :content]))
        (let [res (selmer/render-file (:template response) (:content response))]
          {:status 200
           :headers {"content-type" "text/html"}
           :body res})
        response))))
```

My new authentication function has become quite simple, provide a login page using the `auth/login.html` template. Of course it requires a whole bunch of different attributes in order to render the whole page, but another wrapper adds all the required metadata known to the application already, such as `css` and `script` files, application settings and even theme information. All the endpoint has to take into account is its own required information.

```clojure
(defn login [{:keys [params] :as ctx}]
  (let [err (:error params)]
    (ui/page ctx {:template "auth/login.html"
                  :content (merge {} (when err {:errors [err]}))})))
```

This is all great and all, but it has nothing to do with testability, right? Well, a map is easier tested then an unstructured vector, right? In other languages, such as Rust, you can get compile time validation of templates, which is great! Sadly selmer does not have that, however we can just simply render a template file and see if there are any missing values.

The below snippet takes the "missing" value and replaces it with a placeholder. So, given a template and an endpoint function we can easily check if all required entries are provided in the map. The below function renders the template, provides a `csrf` token which is not available inside testing, and verifies that the template does not have any missing values.

```clojure
(defn missing-value-fn [tag _context-map]
  (str "<Missing value: " (or (:tag-value tag) (:tag-name tag)) ">"))

(selmer.util/set-missing-value-formatter! missing-value-fn)

;; Ensure all the page's required fields are present.
(deftest selmer-validation
  (let [s (sut/page {} {:template "_layout.html" :content {}})
        ;; CSRF is not set during testing...
        res (selmer.parser/render-file (:template s) (assoc (:content s) :csrf "csrf"))]
    (is (not (str/blank? res)))
    (is (not (str/includes? res "<Missing value:")))))
```

Another step into building rock solid software.
