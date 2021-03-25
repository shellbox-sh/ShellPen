---
title: '<%= $commandName %>'
permalink: /docs/<%= $pageName %>
layout: single
sidebar:
  nav: 'command_reference'
---

<% if context has sourceCode.sh; then %>

<details>
  <summary>View Source</summary>

{% highlight sh %}
<%= $( context getValue sourceCode.sh | sed "s/{{/{{ '{{' }}/g" ) %>
{% endhighlight %}

</details>
<% fi %>

<% if context has description; then %>
<%= $(command getDescription) %>
<% fi %>

<% if command getParameterNames parameterNames; then -%>
#### Parameters

| | Description |
|-|-------------|
<% for parameterName in "${parameterNames[@]}"; do -%>
| `<%= $parameterName %>` | <%= $(command getParameterDescription "$parameterName" ) %> |
<% done %>
<% fi %>

<% if context getList returnValues returnValues; then %>
#### Return Values

| | Description |
|-|-------------|
<% for returnValue in "${returnValues[@]}"; do -%>
| `<%= $returnValue %>` | <%= $(context getValue "returnValues/$returnValue") %> |
<% done %>
<% fi %>

<% if context getList examples exampleNames; then %>
<% for exampleName in "${exampleNames[@]}"; do %>
<% if ! [[ "$exampleName" = *"spec"* ]]; then %>

<% if [ "$exampleName" = default ]; then %>
<% specExampleName="spec" %>

#### Example

<% else %>
<% specExampleName="$exampleName spec" %>

#### <%= $exampleName %>

<% fi %>

{% endraw %}
{% highlight sh %}
<%= $( context getValue "examples/$exampleName"  | sed "s/{{/{{ '{{' }}/g" ) %>
{% endhighlight %}
{% raw %}

<% if context has "examples/$specExampleName spec"; then %>
<% fi %>

<details>
  <summary>View Spec</summary>

{% endraw %}
{% highlight sh %}
<%= $( context getValue "examples/$specExampleName" | sed "s/{{/{{ '{{' }}/g" ) %>
{% endhighlight %}
{% raw %}

</details>

<% fi %>
<% done %>
<% fi %>