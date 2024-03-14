---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: /home
---

# /featured

- [The Future of AI and Machine Learning](/the-future-of-ai)
- [Journey into the World of Open Source](/open-source-journey)
- [Deep Dive into Web Performance Optimization](/web-performance-optimization)

## /about


Check out my [About](/about) page to learn more.

## /latest

{% for post in site.posts limit:3 %}
- [{{ post.title }}]({{ post.url | prepend: site.baseurl }})
{% endfor %}

[View all posts →](/archive)