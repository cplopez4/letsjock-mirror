var sports = <%= @sports.any? ? @sports.to_json.html_safe : "{}" %>;