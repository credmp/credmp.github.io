+++
date = '2025-01-07T21:22:03+01:00'
draft = true
title = 'Build an API with reitit in Clojure'
tags = ['clojure', 'web']
categories = ['programming']
series = ["Development Log"]
+++

In {{< backlink "a-new-theme" "my previous post">}} I highlighted that I set myself the goal of creating a self hosted comic book collection tool. Before that, in {{< backlink "choose-your-tools" "a post about tooling">}}, I reiterated my ❤️ for {{< backlink "clojure" "Clojure">}} as a language. So, this is the start of a series of articles detailing how the development is going, and also as an introduction to the various parts of the tech stack. 

Clojure is special to me in that there are hardly any big frameworks in the ecosystem. Clojure is more like Lego, there are countless building blocks of various shapes and sizes. It is up to you as the developer to stick the blocks together to get something usefull. You might guess that I also ❤️ Lego.


{{< admonition type="tip" >}}
On youtube you will find various series that detail the creation of Clojure apps. Check out:

- 🤯 [Andrey Fadeev](https://www.youtube.com/watch?v=LqVyP_EGKqw&list=PLRGAFpvDgm2ylbXYIjvu3kI426zAP_Lqc)'s playlist for building production apps from scratch
- 🏝️ [Lambda Island](https://www.youtube.com/watch?v=M97jWSKoV3k) has many interesting Clojure videos on different topics
- 🤯 [My BuildFunThings playlists](https://www.youtube.com/@BuildFunThings/playlists), take a look at the live coding sessions

If you would like to be added to this list, send me a message: [@credmp@fosstodon.org](https://fosstodon.org/@credmp)
{{< /admonition >}}

So, today I am starting with the first component of my techstack: [Metosin's Reitit](https://github.com/metosin/reitit).

# What is reitit?

Metosin's Reitit is a highly performant and extensible routing library for Clojure and ClojureScript applications. It provides a declarative way to define routes for web servers. Reitit integrates seamlessly with Ring, enabling middleware and handler chaining, and offers robust features like path parameters, route coercion, and schema validation. 

It is easy to get started with, but is flexible enough to provide everything we need in any type of API. In this post I am going to show you the essentials to get a workflow up and running.

{{< admonition type="tip" >}}
The reitit documentation is extensive and very valuable, [read it here](https://cljdoc.org/d/metosin/reitit/0.7.2/doc/introduction).
{{< /admonition >}}

# A very simple API

There are many ways to start building an API, and pretty much everything is ok. I like to start from the `handler` and then work my way down all the way to the `http` server.

## A handler

A handler is the code that, well, handles the request. Let's create a *Hello World* handler, its only task is to return a map which has a `:status` key and a `:body` key. 

The `:status` represents the HTTP status code that should be returned, in this case `200` - all is good. The `:body` will be a string for now. In a later post it will become JSON, but to get started a string is fine.

```clojure
(defn handler [request]
  (println "Handling" request)
  {:status 200
   :body "hello world!"})
```

That was quite easy, right? The `handler` is a function, so it can be called in the repl. As you would expect, it returns a map with the data.

```clojure
(handler {})
;; => {:status 200, :body "hello world!"}
```

In the application the `handler` has to be connected to a URL endpoint, a so-called `route`.

## The router

The `router` connects `routes` to `handlers`. The `routes` are defined using `vectors` (`[]`). The `handler` that was defined earlier is a greeting, an endpoint for such a thing might be `/hello` (or `/greet`, but it is always `/greet`...). The endpoint becomes a `route` when it is combined with a method to get there. 

In HTTP there are several methods: `POST`, `GET`, `PUT`, `DELETE`, and a bunch more. These methods are the way HTTP tells the server to create, read, update and delete something on the server. 

In this case the `handler` is only asked to return some information, so a `GET` method is the right choice here.

```clojure
(ns blogpost
  (:require
   ;; add these
   [reitit.ring :as ring]
   [reitit.core :as r]))
   
(def router (ring/router
             ["/hello" {:get #'handler}]
             ))
```

{{< admonition type="note" >}}
I am using `#'handler` here, which is the same as `(var handler)` to refer to the `var` named `handler`. It is used to reference the var itself instead of its value. 

During development this means that the var's value can be updated and the result will immediately be available in the web server, with no need to restart the server. This helps greatly in the development experience.
{{< /admonition >}}

With the `router` created it can be queried to ensure everything is as expected. This is a good way to check what kind of `middleware` or `interceptors` are applied to the routes. Currently there is none of that magic going on, but later-on it might be necessary to confirm that the configuration is correct.

An interesting fact, when a route is created or a `get`, reitit will also create an `options` route. This is to satisfy browsers and frontend tooling that will request some metadata (`options`) before calling a potentially expensive, in time, method.

```clojure
;; return all routes in the router
(r/routes router)
;; => [["/hello" {:get {:handler #'core/handler}}]]

;; retrieve the path within the router
(r/match-by-path router "/hello")
;; => {:template "/hello",
;;     :data {:get {:handler #'core/handler}},
;;     :result
;;     {:get
;;      {:data {:handler #'core/handler},
;;       :handler #'core/handler,
;;       :path "/hello",
;;       :method :get,
;;       :middleware []},
;;      :head nil,
;;      :post nil,
;;      :put nil,
;;      :delete nil,
;;      :connect nil,
;;      :options
;;      {:data
;;       {:no-doc true,
;;        :handler #function[reitit.ring/fn--14482/fn--14491]},
;;       :handler #function[reitit.ring/fn--14482/fn--14491],
;;       :path "/hello",
;;       :method :options,
;;       :middleware []},
;;      :trace nil,
;;      :patch nil},
;;     :path-params {},
;;     :path "/hello"}
```

With a `router` defined, the ring handler can be constructed. It is confusing that there are multiple handlers now, so lets refer to the ring handler as the `app` (or application handler), basically a fully wired up application that can process requests. 

## The application handler

Constructing the `app` makes it possible to take a request map, the thing the webserver will receive from a client, and route it to the `handler`. The `handler` will then process the request and will return a result. The `app` will return the result to the client. 

For now the `ring-handler` can be constructed with the `router` that was created earlier and the `ring/create-default-handler`. The default handler ensures more correct error responses are created. It differentiates `:not-found` (no route matched), `:method-not-allowed` (no method matched) and `:not-acceptable` (handler returned nil).

```clojure
(def app 
  (ring/ring-handler 
    router 
    (ring/create-default-handler)))
```

The `ring/ring-handler` returns a function. That function can be called with a request map to test it out. Passing a request to the `app` for an endpoint that does not exist should return a `404`, HTTP's way of saying "I have no idea what you want from me".

```clojure
(app {:request-method :get, :uri "/clojure"})
;; => {:status 404, :body "", :headers {}}
```

But calling the route that was defined ealier should yield a very welcoming message.

```clojure
(app {:request-method :get, :uri "/hello"})
;; => {:status 200, :body "hello world!"}
```

It works as expected! The final step is to actually connect it to a webserver.

# Making it available as a service

The `Jetty` server is a battle tested http server. It is very easy to use through the `ring` adapter. By calling `run-jetty`, and passing in our `app` (again as a var reference for easy development), the endpoint will finally become available online (on our system).

There are 2 important parameters that are passed to jetty; `:port` and `:join?`. The `port` tells jetty on which port the server should bind, anything about `1024` is good here. 

`:join?` tells jetty to run in its own thread and allows the repl to accept other commands. If it was not passed the repl would have to be restarted to stop the `server`. The result of `run-jetty` is stored in `server`.

```clojure
;; add a require
[ring.adapter.jetty :as jetty]

(def server 
  (jetty/run-jetty #'app 
                   {:port 3000, :join? false}))
```

Using a tool such as `curl` it is now possible to query the API. You can also use the browser of course!

```
$ curl -v localhost:3000/hello
* Host localhost:3000 was resolved.
* IPv6: ::1
* IPv4: 127.0.0.1
*   Trying [::1]:3000...
* Connected to localhost (::1) port 3000
> GET /hello HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/8.7.1
> Accept: */*
>
* Request completely sent off
< HTTP/1.1 200 OK
< Date: Tue, 07 Jan 2025 21:26:36 GMT
< Transfer-Encoding: chunked
< Server: Jetty(11.0.24)
<
* Connection #0 to host localhost left intact
hello world!%
```

From the result (which is verbose due to `-v`) it is clear that the `Jetty` server is responding (note the `Jetty(11.0.24)` line in the headers). Also, there is the very welcoming hello world message at the bottom.

In the repl it is possible to make changes to the `handler`. After evaluation the API should immediately return the updated message.

To stop the webserver either close the repl, or call `.stop` on the `server` var.

```clojure
(.stop server)
```

This is a first small step to a new API. Reitit has many things to offer, I would recommend checking out the docs and the examples.
